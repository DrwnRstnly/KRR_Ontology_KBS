#!/usr/bin/env python3
"""
Clash Royale Fandom scraper: Arenas -> Cards -> Card details.

Outputs:
- fandom_arenas_cards.json   grouped by arena_number
- fandom_cards_flat.csv      one row per card with basics

Requires: requests, beautifulsoup4, lxml, pandas, tqdm
Install:  pip install requests beautifulsoup4 lxml pandas tqdm
"""

from __future__ import annotations
import re
import time
import json
import csv
import math
from dataclasses import dataclass, asdict
from typing import Dict, List, Optional, Any
from urllib.parse import urljoin

import requests
from bs4 import BeautifulSoup, Tag
import pandas as pd
from tqdm import tqdm

BASE = "https://clashroyale.fandom.com"
ARENAS_URL = f"{BASE}/wiki/Arenas"

HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
                  "(KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
    "Accept-Language": "en-US,en;q=0.9"
}

REQUEST_GAP_SEC = 0.75   # be polite
TIMEOUT = 25
RETRY = 2


@dataclass
class CardBasics:
    name: str
    href: str
    arena_number: Optional[int]
    arena_name: Optional[str]
    rarity: Optional[str]


@dataclass
class CardDetails:
    name: str
    url: str
    elixir: Optional[float]
    rarity: Optional[str]
    type: Optional[str]
    arena_text: Optional[str]
    unit_attributes: Dict[str, Any]
    level_stats: List[Dict[str, Any]]


def get_soup(url: str) -> BeautifulSoup:
    for attempt in range(1, RETRY + 1):
        resp = requests.get(url, headers=HEADERS, timeout=TIMEOUT)
        if resp.status_code == 200:
            return BeautifulSoup(resp.text, "lxml")
        time.sleep(1.5 * attempt)
    resp.raise_for_status()  # type: ignore


def normalize_space(s: str) -> str:
    return re.sub(r"\s+", " ", s).strip()


def parse_arenas_index() -> Dict[int, Dict[str, Any]]:
    """
    Parse Arenas page and return mapping:
    arena_number -> { 'arena_name': str, 'cards': [CardBasics, ...] }
    """
    soup = get_soup(ARENAS_URL)
    time.sleep(REQUEST_GAP_SEC)

    arenas: Dict[int, Dict[str, Any]] = {}
    # Strategy:
    # - Each arena block appears inside a TD that also contains one or more
    #   <span class="cr-display-card" data-card-name=... data-card-arena="N">
    # - We read the text content before the icons to get arena name like
    #   "Goblin Stadium (Arena 1)" or "Training Camp (Tutorial)"
    for td in soup.select("table.wikitable td"):
        # Extract a line that looks like the arena label
        text = normalize_space(td.get_text(separator="\n", strip=True))
        # Find "Something (Arena N)" or "Training Camp"
        arena_name = None
        arena_number = None

        m_name = re.search(r"^([^\n]+?)\s*(?:\(|$)", text)
        if m_name:
            arena_name = m_name.group(1).strip()

        m_num = re.search(r"Arena\s*(\d+)", text)
        if m_num:
            arena_number = int(m_num.group(1))
        elif "Training Camp" in text:
            arena_number = 0

        icons = td.select("span.cr-display-card a[href]")
        if not icons:
            continue

        # If the TD has no parsable arena number, fallback to the first child span attribute
        if arena_number is None:
            span = td.select_one("span.cr-display-card")
            if span and span.has_attr("data-card-arena"):
                try:
                    arena_number = int(span["data-card-arena"])
                except Exception:
                    pass

        if arena_number is None:
            # skip ambiguous chunk
            continue

        if arena_number not in arenas:
            arenas[arena_number] = {"arena_name": arena_name, "cards": []}

        for a in icons:
            span = a.find_parent("span", class_="cr-display-card")
            if not span:
                continue
            name = span.get("data-card-name") or normalize_space(a.get("title") or a.get_text())
            rarity = span.get("data-card-rarity")
            href = urljoin(BASE, a.get("href"))
            arenas[arena_number]["cards"].append(
                CardBasics(
                    name=name,
                    href=href,
                    arena_number=arena_number,
                    arena_name=arena_name,
                    rarity=rarity,
                )
            )
    return arenas


def text_after_heading(soup: BeautifulSoup, heading: str) -> Optional[str]:
    """
    Card pages often render as:
      <h3>Elixir Cost</h3>
      3 [img]
    We find h2/h3 whose text equals heading (case-insensitive),
    then collect the immediate following text node or element text.
    """
    node = soup.find(lambda t: t.name in ("h2", "h3") and normalize_space(t.get_text()).lower() == heading.lower())
    if not node:
        return None
    # walk siblings until nonempty text
    for sib in node.next_siblings:
        if isinstance(sib, Tag):
            txt = normalize_space(sib.get_text(" ", strip=True))
            if txt:
                # Often includes word like "Image: Elixir" at end
                txt = re.sub(r"\bImage:.*$", "", txt).strip()
                return txt
        else:
            txt = normalize_space(str(sib))
            if txt:
                return txt
    return None


def parse_unit_attributes_table(soup: BeautifulSoup) -> Dict[str, Any]:
    """
    Try strict by id, then fallback by header detection.
    Returns a dict of header -> value for the first data row.
    """
    table = soup.find("table", id="unit-attributes-table")
    if not table:
        # fallback: any wikitable with these key headers
        for cand in soup.select("table.wikitable"):
            headers = [normalize_space(th.get_text()) for th in cand.select("tr th")]
            if {"Cost", "Hit Speed", "Range", "Target"}.issubset(set(headers)):
                table = cand
                break
    if not table:
        return {}

    rows = table.select("tr")
    if len(rows) < 2:
        return {}

    headers = [normalize_space(th.get_text()) for th in rows[0].select("th")]
    # some tables repeat headers as images with alt text, handled above
    first = rows[1].select("td")
    if not first:
        return {}

    values = []
    for td in first:
        txt = normalize_space(td.get_text(" ", strip=True))
        txt = re.sub(r"\s*\(.*?\)\s*$", "", txt)  # trim trailing parentheses like "(120)"
        values.append(txt)

    # Align lengths
    out: Dict[str, Any] = {}
    for i, h in enumerate(headers):
        if i < len(values):
            out[h] = values[i]
    return out


def parse_level_stats_table(soup: BeautifulSoup) -> List[Dict[str, Any]]:
    table = soup.find("table", id="unit-statistics-table")
    if not table:
        # fallback: look for a table with "Level" in first th
        for cand in soup.select("table.wikitable"):
            ths = cand.select("tr th")
            if ths and normalize_space(ths[0].get_text()).lower() == "level":
                table = cand
                break
    if not table:
        return []

    rows = table.select("tr")
    if len(rows) < 2:
        return []

    headers = [normalize_space(th.get_text()) for th in rows[0].select("th")]
    data: List[Dict[str, Any]] = []
    for r in rows[1:]:
        tds = [normalize_space(td.get_text()) for td in r.select("td")]
        if not tds:
            continue
        row = {}
        for i, h in enumerate(headers):
            if i < len(tds):
                row[h] = tds[i]
        data.append(row)
    return data


def to_number_maybe(x: Optional[str]) -> Optional[float]:
    if x is None:
        return None
    s = x.strip()
    s = re.sub(r"[^\d\.\-]", "", s)  # drop non numeric
    if not s:
        return None
    try:
        if s.isdigit():
            return float(int(s))
        return float(s)
    except Exception:
        return None


def parse_card_page(url: str) -> CardDetails:
    soup = get_soup(url)
    time.sleep(REQUEST_GAP_SEC)

    # name from H1 or title
    h1 = soup.find("h1")
    name = normalize_space(h1.get_text()) if h1 else normalize_space(soup.title.get_text() if soup.title else url)

    elixir_txt = text_after_heading(soup, "Elixir Cost")
    rarity_txt = text_after_heading(soup, "Rarity")
    type_txt = text_after_heading(soup, "Type")
    arena_txt = text_after_heading(soup, "Arena")

    unit_attrs = parse_unit_attributes_table(soup)
    level_stats = parse_level_stats_table(soup)

    # If unit_attrs includes Cost, Rarity, Type those should align with headings
    elixir_val = to_number_maybe(elixir_txt or unit_attrs.get("Cost"))

    return CardDetails(
        name=name,
        url=url,
        elixir=elixir_val,
        rarity=rarity_txt or unit_attrs.get("Rarity"),
        type=type_txt or unit_attrs.get("Type"),
        arena_text=arena_txt,
        unit_attributes=unit_attrs,
        level_stats=level_stats,
    )


def main():
    arenas = parse_arenas_index()

    # Visit each card page and enrich
    results = {}
    flat_rows = []
    for arena_num in sorted(arenas.keys()):
        arena_name = arenas[arena_num]["arena_name"]
        cards: List[CardBasics] = arenas[arena_num]["cards"]
        enriched: List[Dict[str, Any]] = []

        for cb in tqdm(cards, desc=f"Arena {arena_num}"):
            try:
                details = parse_card_page(cb.href)
            except Exception as e:
                # Keep the basics if page fails
                details = CardDetails(
                    name=cb.name,
                    url=cb.href,
                    elixir=None,
                    rarity=cb.rarity,
                    type=None,
                    arena_text=None,
                    unit_attributes={},
                    level_stats=[],
                )
            enriched.append(asdict(details))
            flat_rows.append({
                "arena_number": arena_num,
                "arena_name": arena_name,
                "card_name": details.name,
                "url": details.url,
                "elixir": details.elixir,
                "rarity": details.rarity,
                "type": details.type,
                "arena_text_on_card": details.arena_text,
            })
        results[arena_num] = {
            "arena_name": arena_name,
            "cards": enriched,
        }

    # Write JSON
    with open("fandom_arenas_cards.json", "w", encoding="utf-8") as f:
        json.dump(results, f, ensure_ascii=False, indent=2)

    # Write CSV
    pd.DataFrame(flat_rows).to_csv("fandom_cards_flat.csv", index=False, encoding="utf-8")
    print("Saved fandom_arenas_cards.json and fandom_cards_flat.csv")


if __name__ == "__main__":
    main()