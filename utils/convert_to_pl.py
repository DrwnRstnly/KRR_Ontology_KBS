import json
import re
import sys

def format_atom(name: str) -> str:
    if not name:
        return "unknown"

    name_map = {
        "Mini P.E.K.K.A.": "mini_p_e_k_k_a",
        "P.E.K.K.A.": "pekka",
        "X-Bow": "x_bow"
    }
    if name in name_map:
        return name_map[name]

    s = name.lower()
    s = s.replace(' ', '_').replace('.', '').replace("'", "")
    s = re.sub(r'[^a-z0-9_]', '', s)
    return s

def to_number_maybe(x):
    if x is None:
        return None
    try:
        return int(float(x))
    except (ValueError, TypeError):
        return None

def main():
    try:
        with open("fandom_arenas_cards.json", "r", encoding="utf-8") as f:
            data = json.load(f)
    except FileNotFoundError:
        print("Error: 'fandom_arenas_cards.json' not found.")
        print("Please run scraper.py first.")
        sys.exit(1)

    prolog_facts = []
    arena_facts = []

    prolog_facts.extend([
        ":- discontiguous card/2.",
        ":- discontiguous has_rarity/2.",
        ":- discontiguous elixir_cost/2.",
        ":- discontiguous in_arena/2.",
        ":- discontiguous damage/2.",
        ":- discontiguous hitpoints/2.",
        ":- discontiguous targets/2.",
        ":- discontiguous melee_or_ranged/2.",
        ":- discontiguous splash/2.",
        ":- discontiguous count/2.",
        ":- discontiguous range_value/2.",
        ":- discontiguous transport/2.",
        ":- discontiguous damage_per_second/2.",
        "",
        "",
    ])

    arena_names = {}
    processed_atoms = set()

    for arena_num, arena_data in data.items():
        arena_name = arena_data.get("arena_name", "Unknown Arena")
        arena_atom = format_atom(arena_name)
        arena_names[arena_num] = arena_atom
        arena_facts.append(f"arena({arena_atom}, {arena_num}).")

    for arena_num, arena_data in data.items():
        arena_atom = arena_names.get(arena_num, "unknown_arena")

        for card in arena_data.get("cards", []):
            card_name = card.get("name")
            if not card_name:
                continue

            atom = format_atom(card_name)
            if atom in processed_atoms:
                    continue

            processed_atoms.add(atom)
            
            card_type = str(card.get("type", "unknown")).lower()

            prolog_facts.append(f"card({atom}, {card_type}).")

            if card.get("rarity"):
                prolog_facts.append(f"has_rarity({atom}, {card['rarity'].lower()}).")
            if card.get("elixir"):
                prolog_facts.append(f"elixir_cost({atom}, {int(card['elixir'])}).")

            prolog_facts.append(f"in_arena({atom}, {arena_atom}).")

            if to_number_maybe(card.get("damage")):
                prolog_facts.append(f"damage({atom}, {to_number_maybe(card['damage'])}).")
            if to_number_maybe(card.get("hitpoints")):
                prolog_facts.append(f"hitpoints({atom}, {to_number_maybe(card['hitpoints'])}).")
            if to_number_maybe(card.get("damage_per_second")):
                prolog_facts.append(f"damage_per_second({atom}, {to_number_maybe(card['damage_per_second'])}).")

            if card.get("transport"):
                prolog_facts.append(f"transport({atom}, {card['transport'].lower()}).")

            attrs = card.get("unit_attributes", {})

            targets = attrs.get("Target", "")
            if "Air & Ground" in targets:
                prolog_facts.append(f"targets({atom}, air).")
                prolog_facts.append(f"targets({atom}, ground).")
            elif "Ground" in targets:
                prolog_facts.append(f"targets({atom}, ground).")
            elif "Air" in targets:
                prolog_facts.append(f"targets({atom}, air).")
            elif "Buildings" in targets:
                prolog_facts.append(f"targets({atom}, buildings).")

            has_splash = "Splash Radius" in attrs
            prolog_facts.append(f"splash({atom}, {str(has_splash).lower()}).")

            range_str = attrs.get("Range")
            if range_str:
                if "Melee" in range_str:
                    prolog_facts.append(f"melee_or_ranged({atom}, melee).")
                else:
                    prolog_facts.append(f"melee_or_ranged({atom}, ranged).")
                    range_val = to_number_maybe(range_str)
                    if range_val:
                        prolog_facts.append(f"range_value({atom}, {range_val}).")

            count_str = attrs.get("Count", "").replace('x', '')
            count_val = to_number_maybe(count_str)
            if count_val:
                prolog_facts.append(f"count({atom}, {count_val}).")

            prolog_facts.append("")

    with open("cards.pl", "w", encoding="utf-8") as f:
        f.write("\n".join(prolog_facts))

    print("Successfully created 'cards.pl' with updated Level 11 stats.")
    print("\n---")
    print("Add the following facts to your 'kb.pl' file:")
    print("\n".join(arena_facts))
    print("---")

if __name__ == "__main__":
    main()