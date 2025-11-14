%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rules Engine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------
% Derived rules (reasoning)
% -------------------------------

is_wincon_card(Card) :-
    targets(Card, buildings).

is_wincon_card(Card) :-
    member(Card, [x_bow, mortar, goblin_drill, rocket, graveyard, goblin_barrel, miner]).

can_hit_air(Card) :-
    targets(Card, air).

is_spell(Card) :-
    card(Card, spell).

is_unit(Card) :-
    card(Card, troop).
is_unit(Card) :-
    card(Card, building).

is_ranged_troop(Card) :-
    card(Card, troop),
    has_damage_type(Card, ranged).

is_cycle_card(Card) :-
    elixir_cost(Card, Cost),
    Cost =< 2.

is_tank(Card) :-
    hitpoints(Card, HP),
    HP > 800.

is_fast_troop(Card) :-
    card(Card, troop),
    has_speed_class(Card, fast).

get_elixir_costs(Deck, Costs) :-
    findall(Cost, (member(Card, Deck), elixir_cost(Card, Cost)), Costs).

calculate_avg_elixir(Deck, Avg) :-
    get_elixir_costs(Deck, Costs),
    sum_list(Costs, Sum),
    ( length(Costs, 8) ->
          Avg is Sum / 8.0
    ; Avg = 0
    ).

is_anti_tank(Card) :-
    member(Card, [mighty_miner, sparky, pekka, inferno_dragon, prince, hunter, three_musketeers, inferno_tower, mini_p_e_k_k_a, elite_barbarians, skeleton_army, goblins, goblin_gang, guards, minion_horde]).

role(Card, tank) :- is_tank(Card), has_speed_class(Card, slow).
role(Card, support) :- is_ranged_troop(Card).
role(Card, wincon) :- is_wincon_card(Card).
role(Card, cycle) :- is_cycle_card(Card).
role(Card, spell) :- card(Card, spell).

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deck Analysis Logic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

warning_info(no_win_condition, strong, 'No win condition - Deck has no clear path to tower damage.').
warning_info(no_air_defense, strong, 'No air defense - Vulnerable to air-heavy decks (Lava Hound, Balloon, etc.).').
warning_info(no_spell, strong, 'No spell - Cannot deal spell damage or respond to swarms effectively.').
warning_info(no_ground_units, strong, 'No ground units - Deck contains only spells and cannot defend.').
warning_info(too_many_win_cons, strong, '> 2 win conditions - Deck lacks support/defense due to too many win cons.').
warning_info(too_many_spells, strong, '> 4 spells - Not enough troops to defend or push.').
warning_info(too_expensive, strong, 'Elixir average >= 4.8 - Too slow to cycle, vulnerable to fast decks.').
warning_info(no_anti_tank, strong, 'No anti-tank option - Cannot defend against heavy tanks (e.g., P.E.K.K.A, Golem).').

format_warning(strong, Text, FinalString) :-
    format(string(FinalString), 'Strong Warning: ~w', [Text]).

format_warning(weak, Text, FinalString) :-
    format(string(FinalString), 'Weak Warning: ~w', [Text]).


check_for_warning(Deck, FinalWarningString) :-
    \+ (member(Card, Deck), is_wincon_card(Card)),
    warning_info(no_win_condition, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    \+ (member(Card, Deck), can_hit_air(Card)),
    warning_info(no_air_defense, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    \+ (member(Card, Deck), is_spell(Card)),
    warning_info(no_spell, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    \+ (member(Card, Deck), is_unit(Card)),
    warning_info(no_ground_units, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    findall(Card, (member(Card, Deck), is_wincon_card(Card)), WinCons),
    length(WinCons, Count),
    Count > 2,
    warning_info(too_many_win_cons, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    findall(Card, (member(Card, Deck), is_spell(Card)), Spells),
    length(Spells, Count),
    Count > 4,
    warning_info(too_many_spells, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    calculate_avg_elixir(Deck, Avg),
    Avg >= 4.8,
    warning_info(too_expensive, Type, Text),
    format_warning(Type, Text, FinalWarningString).

check_for_warning(Deck, FinalWarningString) :-
    \+ (member(Card, Deck), is_anti_tank(Card)),
    warning_info(no_anti_tank, Type, Text),
    format_warning(Type, Text, FinalWarningString).


find_warnings(Deck, Warnings) :-
    findall(Warning, check_for_warning(Deck, Warning), Warnings).

display_warnings(Warnings) :-
    ( Warnings = [] ->
        % Case 1: The list was empty from the start.
        write('Deck analysis complete. No warnings found!'), nl
    ;
        % Case 2: The list has warnings, so print them.
        print_warning_list(Warnings)
    ).

print_warning_list([]). % Base case: Do nothing.

print_warning_list([Head | Tail]) :-
    write('- '), write(Head), nl,
    print_warning_list(Tail).

analyze_deck(Deck) :-
    length(Deck, 8),
    write('Analyzing deck: '), write(Deck), nl,
    write('---'), nl,
    find_warnings(Deck, Warnings),
    display_warnings(Warnings),
    write('---'), nl.

analyze_deck(Deck) :-
    \+ length(Deck, 8),
    write('Error: Deck must contain exactly 8 cards.'), nl.