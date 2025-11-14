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

warning_text('no_win_condition', 'Strong Warning: No win condition - Deck has no clear path to tower damage.').

check_for_warning(Deck, WarningText) :-
    \+ (member(Card, Deck), is_wincon_card(Card)),
    warning_text('no_win_condition', WarningText).

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