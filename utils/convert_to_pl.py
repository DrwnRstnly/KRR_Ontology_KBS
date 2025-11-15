import json
import re
import sys
from typing import Optional, Dict, Any

def format_atom(name: str) -> str:
    if not name:
        return "unknown"
    
    name_map = {
        "Mini P.E.K.K.A.": "mini_p_e_k_k_a",
        "P.E.K.K.A.": "pekka",
        "X-Bow": "x_bow",
        "Inferno Dragon": "inferno_dragon",
        "Inferno Tower": "inferno_tower",
        "Mighty Miner": "mighty_miner"
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
    
    s = str(x).strip()
    m = re.search(r"^([\d,\.]+)", s)
    if not m:
        return None
        
    s = m.group(1).replace(',', '')
    
    if not s:
        return None
    try:
        return int(float(s))
    except (ValueError, TypeError):
        return None

def find_stat_case_insensitive(stats_dict: Optional[Dict[str, Any]], key_to_find: str) -> Optional[str]:
    if not stats_dict:
        return None
    key_to_find_lower = key_to_find.lower()
    for key, value in stats_dict.items():
        if key.lower() == key_to_find_lower:
            return value
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
    missing_data_log = []

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
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
        "% Clash Royale Card Database",
        "% Generated from fandom_arenas_cards.json",
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
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

            card_type = str(card.get("type", "unknown")).lower().replace(' ', '_')
            stats = card.get("level_11_stats")
            attrs = card.get("unit_attributes", {})
            
            prolog_facts.append(f"card({atom}, {card_type}).")
            
            current_card_missing = []

            if card.get("rarity"):
                prolog_facts.append(f"has_rarity({atom}, {card['rarity'].lower()}).")
            else:
                current_card_missing.append("rarity")

            if card.get("elixir"):
                prolog_facts.append(f"elixir_cost({atom}, {int(card['elixir'])}).")
            elif card_type != "tower_troop":
                current_card_missing.append("elixir")
            
            prolog_facts.append(f"in_arena({atom}, {arena_atom}).")

            hp_num = None
            dmg_num = None
            dps_num = None

            if card_type in ["troop", "building", "tower_troop"]:
                hp_val = find_stat_case_insensitive(stats, "Hitpoints")
                if not hp_val:
                    hp_val = find_stat_case_insensitive(stats, f"{card_name} Hitpoints")
                
                hp_num = to_number_maybe(hp_val)
                if hp_num:
                    prolog_facts.append(f"hitpoints({atom}, {hp_num}).")
                else:
                    current_card_missing.append("hitpoints")
            
            dmg_val = None
            dps_val = None
            non_damaging_units = ["elixir_collector", "goblin_hut", "barbarian_hut", "tombstone", "ice_golem", "elixir_golem"]
            non_damaging_spells = ["clone", "mirror", "rage", "freeze", "heal_spirit"]

            if atom in ["inferno_dragon", "inferno_tower", "mighty_miner"]:
                dmg_val = find_stat_case_insensitive(stats, "Damage (Stage 3)")
                dps_val = find_stat_case_insensitive(stats, "Damage per second (Stage 3)")
            else:
                dmg_val = (
                    find_stat_case_insensitive(stats, "Area Damage") or
                    find_stat_case_insensitive(stats, "Damage") or
                    find_stat_case_insensitive(stats, "Spawn Damage") or 
                    find_stat_case_insensitive(stats, "Dash Damage")
                )
                dps_val = find_stat_case_insensitive(stats, "Damage per second")

                if not dmg_val:
                    dmg_val = (
                        find_stat_case_insensitive(stats, f"{card_name} Area Damage") or
                        find_stat_case_insensitive(stats, f"{card_name} Damage")
                    )
                if not dps_val:
                    dps_val = find_stat_case_insensitive(stats, f"{card_name} Damage per second")

            dmg_num = to_number_maybe(dmg_val)
            dps_num = to_number_maybe(dps_val)

            if dmg_num:
                prolog_facts.append(f"damage({atom}, {dmg_num}).")
            elif card_type not in ["spell"] and atom not in non_damaging_units:
                 current_card_missing.append("damage")
            elif card_type == "spell" and atom not in non_damaging_spells:
                 current_card_missing.append("damage")

            if dps_num:
                prolog_facts.append(f"damage_per_second({atom}, {dps_num}).")
            elif card_type == "troop" and atom not in non_damaging_units:
                current_card_missing.append("damage_per_second")
            
            if card.get("transport"):
                prolog_facts.append(f"transport({atom}, {card['transport'].lower()}).")
            elif card_type == "troop":
                 current_card_missing.append("transport")
            
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
            elif card_type in ["troop", "building"]:
                current_card_missing.append("targets")
            
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
            elif card_type == "troop":
                current_card_missing.append("range (melee/ranged)")

            count_str = attrs.get("Count", "").replace('x', '')
            count_val = to_number_maybe(count_str)
            if count_val:
                prolog_facts.append(f"count({atom}, {count_val}).")

            if current_card_missing:
                missing_str = f"WARNING: {atom} is missing: {', '.join(current_card_missing)}"
                prolog_facts.append(f"% !!! {missing_str}")
                missing_data_log.append(missing_str)

            prolog_facts.append("")

    with open("prolog/cards.pl", "w", encoding="utf-8") as f:
        f.write("\n".join(prolog_facts))
        
    print("Successfully created 'cards.pl'.")
    
    if missing_data_log:
        print("\n--- Missing Data Summary ---")
        for log_entry in missing_data_log:
            print(log_entry)
    else:
        print("\nAll essential card data found!")

    print("\n---")
    print("Add the following facts to your 'kb.pl' file:")
    print("\n".join(arena_facts))
    print("---")

if __name__ == "__main__":
    main()