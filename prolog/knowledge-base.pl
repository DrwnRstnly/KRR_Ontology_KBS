%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clash Royale Knowledge Base
% Derived from: http://example.org/clashroyale#
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% Win condition
win_condition(hog_pressure).

% -------------------------------
% Cards (facts)
% -------------------------------

card(hog_rider, troop).
has_rarity(hog_rider, rare).
in_arena(hog_rider, goblin_stadium).
has_target_type(hog_rider, buildings_only).
has_damage_type(hog_rider, melee).
has_range_type(hog_rider, melee_range).
has_speed_class(hog_rider, fast).
elixir_cost(hog_rider, 4).
hitpoints(hog_rider, 1400).
damage(hog_rider, 264).
attack_speed(hog_rider, 1.6).
comment(hog_rider, "Fast ground troop that targets buildings").

card(fireball, spell).
has_rarity(fireball, rare).
in_arena(fireball, goblin_stadium).
has_damage_type(fireball, spell_damage).
has_range_type(fireball, long_range).
elixir_cost(fireball, 4).
radius(fireball, 2.5).
comment(fireball, "Medium radius spell for finishing troops and towers").

card(cannon, building).
has_rarity(cannon, common).
in_arena(cannon, goblin_stadium).
has_target_type(cannon, ground).
has_damage_type(cannon, ranged).
has_range_type(cannon, medium_range).
elixir_cost(cannon, 3).
lifetime(cannon, 30).
damage(cannon, 100).
hitpoints(cannon, 900).
comment(cannon, "Cheap defensive building").

card(musketeer, troop).
has_rarity(musketeer, rare).
in_arena(musketeer, goblin_stadium).
has_target_type(musketeer, ground_and_air).
has_damage_type(musketeer, ranged).
has_range_type(musketeer, long_range).
has_speed_class(musketeer, medium).
elixir_cost(musketeer, 4).
hitpoints(musketeer, 598).
damage(musketeer, 218).
attack_speed(musketeer, 1.1).
comment(musketeer, "Long range single target support").

card(ice_golem, troop).
has_rarity(ice_golem, rare).
in_arena(ice_golem, goblin_stadium).
has_target_type(ice_golem, buildings_only).
has_damage_type(ice_golem, melee).
has_range_type(ice_golem, melee_range).
has_speed_class(ice_golem, slow).
elixir_cost(ice_golem, 2).
hitpoints(ice_golem, 900).
damage(ice_golem, 27).
comment(ice_golem, "Cheap tank with death slow").

card(skeletons, troop).
has_rarity(skeletons, common).
in_arena(skeletons, training_camp).
has_target_type(skeletons, ground).
has_damage_type(skeletons, melee).
has_range_type(skeletons, melee_range).
has_speed_class(skeletons, fast).
elixir_cost(skeletons, 1).
hitpoints(skeletons, 67).
damage(skeletons, 67).
attack_speed(skeletons, 1.0).
comment(skeletons, "Cycle, kite, and DPS for 1 elixir").

card(ice_spirit, troop).
has_rarity(ice_spirit, common).
in_arena(ice_spirit, training_camp).
has_target_type(ice_spirit, ground_and_air).
has_damage_type(ice_spirit, area_damage).
has_range_type(ice_spirit, short_range).
has_speed_class(ice_spirit, fast).
elixir_cost(ice_spirit, 1).
hitpoints(ice_spirit, 190).
damage(ice_spirit, 90).
comment(ice_spirit, "Cycle and freeze effect").

card(the_log, spell).
has_rarity(the_log, legendary).
in_arena(the_log, goblin_stadium).
has_damage_type(the_log, spell_damage).
has_range_type(the_log, long_range).
elixir_cost(the_log, 2).
radius(the_log, 1.5).
comment(the_log, "Rolls and knocks back ground units").

% -------------------------------
% Relationships
% -------------------------------

synergizes_with(hog_rider, ice_golem).
synergizes_with(hog_rider, fireball).
counters(cannon, hog_rider).
counters(the_log, skeletons).

% symmetric relation
synergizes_with(X, Y) :- synergizes_with(Y, X).

% -------------------------------
% Deck
% -------------------------------

deck(hog_cycle_deck, hog_pressure).
has_card(hog_cycle_deck, hog_rider).
has_card(hog_cycle_deck, fireball).
has_card(hog_cycle_deck, cannon).
has_card(hog_cycle_deck, musketeer).
has_card(hog_cycle_deck, ice_golem).
has_card(hog_cycle_deck, skeletons).
has_card(hog_cycle_deck, ice_spirit).
has_card(hog_cycle_deck, the_log).

% -------------------------------
% Derived rules (reasoning)
% -------------------------------

% win condition card (targets buildings only)
is_wincon_card(Card) :-
    has_target_type(Card, buildings_only).

% ranged troop
is_ranged_troop(Card) :-
    card(Card, troop),
    has_damage_type(Card, ranged).

% cheap cycle card (elixir <= 2)
is_cycle_card(Card) :-
    elixir_cost(Card, Cost),
    Cost =< 2.

% tank (hitpoints > 800)
is_tank(Card) :-
    hitpoints(Card, HP),
    HP > 800.

% fast troop
is_fast_troop(Card) :-
    card(Card, troop),
    has_speed_class(Card, fast).

% classify cards by role
role(Card, tank) :- is_tank(Card), has_speed_class(Card, slow).
role(Card, support) :- is_ranged_troop(Card).
role(Card, wincon) :- is_wincon_card(Card).
role(Card, cycle) :- is_cycle_card(Card).
role(Card, spell) :- card(Card, spell).

% convenience rule to print card info
info(Card) :-
    card(Card, Type),
    write('Card: '), write(Card), nl,
    write('Type: '), write(Type), nl,
    (has_rarity(Card, Rarity) -> format('Rarity: ~w~n',[Rarity]) ; true),
    (elixir_cost(Card, Cost) -> format('Elixir: ~w~n',[Cost]) ; true),
    (hitpoints(Card, HP) -> format('HP: ~w~n',[HP]) ; true),
    (damage(Card, Dmg) -> format('Damage: ~w~n',[Dmg]) ; true),
    (has_speed_class(Card, Spd) -> format('Speed: ~w~n',[Spd]) ; true),
    nl.