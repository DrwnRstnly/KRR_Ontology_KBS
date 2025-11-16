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
        return float(s)
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


def ttl_literal_number(value):
    if value is None:
        return None
    if float(value).is_integer():
        return str(int(value))
    return str(value)


def ttl_bool(value):
    return "true" if value else "false"


TTL_HEADER = """@prefix : <http://example.org/clashroyale#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

#################################################################
# Ontology header
#################################################################

:ClashRoyaleOntology a owl:Ontology ;
  rdfs:label "Clash Royale Ontology" ;
  rdfs:comment "Generated automatically from fandom_arenas_cards.json" .

#################################################################
# Core classes
#################################################################

:Card a owl:Class ; rdfs:label "Card" .
:Troop a owl:Class ; rdfs:subClassOf :Card ; rdfs:label "Troop" .
:Building a owl:Class ; rdfs:subClassOf :Card ; rdfs:label "Building" .
:Spell a owl:Class ; rdfs:subClassOf :Card ; rdfs:label "Spell" .
:TowerTroop a owl:Class ; rdfs:subClassOf :Card ;  rdfs:label "TowerTroop" .

:Rarity a owl:Class ; rdfs:label "Rarity" .
:Arena a owl:Class ; rdfs:label "Arena" .
:TargetType a owl:Class ; rdfs:label "TargetType" .
:DamageType a owl:Class ; rdfs:label "DamageType" .

#################################################################
# Object properties
#################################################################

:hasRarity a owl:ObjectProperty .
:inArena a owl:ObjectProperty .
:hasTargetType a owl:ObjectProperty .
:hasDamageType a owl:ObjectProperty .

#################################################################
# Datatype properties
#################################################################

:elixirCost a owl:DatatypeProperty .
:hitpoints a owl:DatatypeProperty .
:damage a owl:DatatypeProperty .
:dps a owl:DatatypeProperty .
:radius a owl:DatatypeProperty .
:range a owl:DatatypeProperty .
:count a owl:DatatypeProperty .
:hasSplash a owl:DatatypeProperty .

#################################################################
# Enumerations
#################################################################

:Common a :Rarity .
:Rare a :Rarity .
:Epic a :Rarity .
:Legendary a :Rarity .
:Champion a :Rarity .

:Ground a :TargetType .
:Air a :TargetType .
:GroundAndAir a :TargetType .
:BuildingsOnly a :TargetType .

:SpellDamage a :DamageType .
:AreaDamage a :DamageType .
:Melee a :DamageType .
:Ranged a :DamageType .

#################################################################
# Arenas
#################################################################
"""


def build_card_ttl(card, arena_atom):
    name = card["name"]
    atom = format_atom(name)
    label = name.replace('"', '\\"')

    card_type = card.get("type", "Card")
    class_name = card_type.strip().replace(" ", "")

    rarity = card.get("rarity")

    stats = card.get("level_11_stats") or {}
    attrs = card.get("unit_attributes") or {}

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

    damage = to_number_maybe(dmg_val)
    dps = to_number_maybe(dps_val)
    hp = to_number_maybe(find_stat_case_insensitive(stats, "Hitpoints"))

    target_raw = attrs.get("Target", "")
    if "Air & Ground" in target_raw:
        target_type = "GroundAndAir"
    elif "Ground" in target_raw:
        target_type = "Ground"
    elif "Air" in target_raw:
        target_type = "Air"
    elif "Build" in target_raw:
        target_type = "BuildingsOnly"
    else:
        target_type = None

    if card_type.lower() == "spell":
        damage_type = "SpellDamage"
    elif "Area Damage" in stats:
        damage_type = "AreaDamage"
    else:
        damage_type = None

    has_splash = "Splash Radius" in attrs or damage_type == "AreaDamage"

    radius = to_number_maybe(attrs.get("Radius"))

    lines = []
    lines.append(f":{atom} a :{class_name} ;")
    lines.append(f'  rdfs:label "{label}" ;')

    if rarity:
        lines.append(f"  :hasRarity :{rarity} ;")

    lines.append(f"  :inArena :{arena_atom} ;")

    if target_type:
        lines.append(f"  :hasTargetType :{target_type} ;")

    if damage_type:
        lines.append(f"  :hasDamageType :{damage_type} ;")

    elixir = to_number_maybe(card.get("elixir"))
    if elixir is not None:
        lines.append(f"  :elixirCost {ttl_literal_number(elixir)} ;")

    if hp is not None:
        lines.append(f"  :hitpoints {ttl_literal_number(hp)} ;")

    if damage is not None:
        lines.append(f"  :damage {ttl_literal_number(damage)} ;")

    if dps is not None:
        lines.append(f"  :dps {ttl_literal_number(dps)} ;")

    if radius is not None:
        lines.append(f"  :radius {ttl_literal_number(radius)} ;")

    lines.append(f"  :hasSplash {ttl_bool(has_splash)} .")

    return "\n".join(lines)


def main():
    with open("fandom_arenas_cards.json", "r", encoding="utf8") as f:
        data = json.load(f)

    ttl_output = [TTL_HEADER]

    ttl_output.append("#################################################################")
    ttl_output.append("# Arena Individuals")
    ttl_output.append("#################################################################")
    ttl_output.append("")

    arena_names = {}
    for arena_num, arena_data in data.items():
        arena_atom = format_atom(arena_data["arena_name"])
        arena_names[arena_num] = arena_atom
        ttl_output.append(f":{arena_atom} a :Arena ;")
        ttl_output.append(f'  rdfs:label "{arena_data["arena_name"]}" .\n')

    ttl_output.append("#################################################################")
    ttl_output.append("# Card Individuals")
    ttl_output.append("#################################################################")
    ttl_output.append("")

    seen = set()

    for arena_num, arena_data in data.items():
        arena_atom = arena_names[arena_num]
        for card in arena_data["cards"]:
            atom = format_atom(card["name"])
            if atom in seen:
                continue
            seen.add(atom)
            ttl_output.append(build_card_ttl(card, arena_atom))
            ttl_output.append("")

    with open("ontology/clashroyale-ontology.ttl", "w", encoding="utf8") as f:
        f.write("\n".join(ttl_output))

    print("Generated clashroyale.ttl successfully.")


if __name__ == "__main__":
    main()
