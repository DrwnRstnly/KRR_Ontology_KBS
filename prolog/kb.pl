:- consult('cards.pl').

% -------------------------------
% Class hierarchy
% -------------------------------

class(card).
class(troop).
class(building).
class(spell).
class(deck).
class(rarity).
class(arena).
class(target_type).
class(damage_type).
class(range_type).
class(speed_class).
class(ability).
class(win_condition).

subclass(troop, card).
subclass(building, card).
subclass(spell, card).

% -------------------------------
% Enumerations / individuals
% -------------------------------

% Rarity
rarity(common).
rarity(rare).
rarity(epic).
rarity(legendary).
rarity(champion).

% Target type
target_type(ground).
target_type(air).
target_type(ground_and_air).
target_type(buildings_only).

% Damage type
damage_type(melee).
damage_type(ranged).
damage_type(area_damage).
damage_type(spell_damage).

% Range type
range_type(melee_range).
range_type(short_range).
range_type(medium_range).
range_type(long_range).

% Speed class
speed_class(slow).
speed_class(medium).
speed_class(fast).

% Arena
arena(training_camp, 0).
arena(goblin_stadium, 1).

% -------------------------------
% Relationships
% -------------------------------

synergizes_with(hog_rider, ice_golem).
synergizes_with(hog_rider, fireball).
synergizes_with(X, Y) :- synergizes_with(Y, X).

counters(cannon, hog_rider).
counters(the_log, skeletons).