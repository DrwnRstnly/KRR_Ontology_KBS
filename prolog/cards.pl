% -------------------------------
% Cards (facts)
% -------------------------------

:- discontiguous card/2.
:- discontiguous has_rarity/2.
:- discontiguous elixir_cost/2.
:- discontiguous in_arena/2.
:- discontiguous damage/2.
:- discontiguous hitpoints/2.
:- discontiguous targets/2.
:- discontiguous melee_or_ranged/2.
:- discontiguous splash/2.
:- discontiguous count/2.
:- discontiguous range_value/2.

card(arrows, spell).
has_rarity(arrows, common).
elixir_cost(arrows, 3).
in_arena(arrows, training_camp).
damage(arrows, 483144).
targets(arrows, air).
targets(arrows, ground).
melee_or_ranged(arrows, ranged).
splash(arrows, true).

card(minions, troop).
has_rarity(minions, common).
elixir_cost(minions, 3).
in_arena(minions, training_camp).
damage(minions, 46).
hitpoints(minions, 90).
targets(minions, air).
targets(minions, ground).
range_value(minions, 2.5).
melee_or_ranged(minions, ranged).
splash(minions, false).
count(minions, 3).

card(archers, troop).
has_rarity(archers, common).
elixir_cost(archers, 3).
in_arena(archers, training_camp).
damage(archers, 39).
hitpoints(archers, 119).
targets(archers, air).
targets(archers, ground).
range_value(archers, 5).
melee_or_ranged(archers, ranged).
splash(archers, false).
count(archers, 2).

card(knight, troop).
has_rarity(knight, common).
elixir_cost(knight, 3).
in_arena(knight, training_camp).
damage(knight, 79).
hitpoints(knight, 690).
targets(knight, ground).
melee_or_ranged(knight, melee).
splash(knight, false).
count(knight, 1).

card(fireball, spell).
has_rarity(fireball, rare).
elixir_cost(fireball, 4).
in_arena(fireball, training_camp).
damage(fireball, 325).
targets(fireball, air).
targets(fireball, ground).
melee_or_ranged(fireball, ranged).
splash(fireball, true).

card(mini_p_e_k_k_a, troop).
has_rarity(mini_p_e_k_k_a, rare).
elixir_cost(mini_p_e_k_k_a, 4).
in_arena(mini_p_e_k_k_a, training_camp).
damage(mini_p_e_k_k_a, 355).
hitpoints(mini_p_e_k_k_a, 677).
targets(mini_p_e_k_k_a, ground).
melee_or_ranged(mini_p_e_k_k_a, melee).
splash(mini_p_e_k_k_a, false).
count(mini_p_e_k_k_a, 1).

card(musketeer, troop).
has_rarity(musketeer, rare).
elixir_cost(musketeer, 4).
in_arena(musketeer, training_camp).
damage(musketeer, 102).
hitpoints(musketeer, 341).
targets(musketeer, air).
targets(musketeer, ground).
range_value(musketeer, 6).
melee_or_ranged(musketeer, ranged).
splash(musketeer, false).
count(musketeer, 1).

card(giant, troop).
has_rarity(giant, rare).
elixir_cost(giant, 5).
in_arena(giant, training_camp).
damage(giant, 119).
hitpoints(giant, 1933).
targets(giant, buildings).
melee_or_ranged(giant, melee).
splash(giant, false).
count(giant, 1).

card(tower_princess, troop).
has_rarity(tower_princess, common).
in_arena(tower_princess, training_camp).
damage(tower_princess, 50).
hitpoints(tower_princess, 1400).
targets(tower_princess, air).
targets(tower_princess, ground).
range_value(tower_princess, 7.5).
melee_or_ranged(tower_princess, ranged).
splash(tower_princess, false).

card(spear_goblins, troop).
has_rarity(spear_goblins, common).
elixir_cost(spear_goblins, 2).
in_arena(spear_goblins, goblin_stadium).
damage(spear_goblins, 32).
hitpoints(spear_goblins, 52).
targets(spear_goblins, air).
targets(spear_goblins, ground).
range_value(spear_goblins, 5).
melee_or_ranged(spear_goblins, ranged).
splash(spear_goblins, false).
count(spear_goblins, 3).

card(goblins, troop).
has_rarity(goblins, common).
elixir_cost(goblins, 2).
in_arena(goblins, goblin_stadium).
damage(goblins, 47).
hitpoints(goblins, 79).
targets(goblins, ground).
melee_or_ranged(goblins, melee).
splash(goblins, false).
count(goblins, 4).

card(goblin_cage, building).
has_rarity(goblin_cage, rare).
elixir_cost(goblin_cage, 4).
in_arena(goblin_cage, goblin_stadium).
melee_or_ranged(goblin_cage, melee).
splash(goblin_cage, false).

card(goblin_hut, building).
has_rarity(goblin_hut, rare).
elixir_cost(goblin_hut, 4).
in_arena(goblin_hut, goblin_stadium).
melee_or_ranged(goblin_hut, melee).
splash(goblin_hut, false).

card(goblins, troop).
has_rarity(goblins, common).
elixir_cost(goblins, 2).
in_arena(goblins, goblin_stadium).
damage(goblins, 47).
hitpoints(goblins, 79).
targets(goblins, ground).
melee_or_ranged(goblins, melee).
splash(goblins, false).
count(goblins, 4).

card(spear_goblins, troop).
has_rarity(spear_goblins, common).
elixir_cost(spear_goblins, 2).
in_arena(spear_goblins, goblin_stadium).
damage(spear_goblins, 32).
hitpoints(spear_goblins, 52).
targets(spear_goblins, air).
targets(spear_goblins, ground).
range_value(spear_goblins, 5).
melee_or_ranged(spear_goblins, ranged).
splash(spear_goblins, false).
count(spear_goblins, 3).

card(goblin_cage, building).
has_rarity(goblin_cage, rare).
elixir_cost(goblin_cage, 4).
in_arena(goblin_cage, goblin_stadium).
melee_or_ranged(goblin_cage, melee).
splash(goblin_cage, false).

card(goblin_hut, building).
has_rarity(goblin_hut, rare).
elixir_cost(goblin_hut, 4).
in_arena(goblin_hut, goblin_stadium).
melee_or_ranged(goblin_hut, melee).
splash(goblin_hut, false).

card(bomber, troop).
has_rarity(bomber, common).
elixir_cost(bomber, 2).
in_arena(bomber, bone_pit).
damage(bomber, 88).
hitpoints(bomber, 119).
targets(bomber, ground).
range_value(bomber, 4.5).
melee_or_ranged(bomber, ranged).
splash(bomber, true).
count(bomber, 1).

card(skeletons, troop).
has_rarity(skeletons, common).
elixir_cost(skeletons, 1).
in_arena(skeletons, bone_pit).
damage(skeletons, 32).
hitpoints(skeletons, 32).
targets(skeletons, ground).
melee_or_ranged(skeletons, melee).
splash(skeletons, false).
count(skeletons, 3).

card(tombstone, building).
has_rarity(tombstone, rare).
elixir_cost(tombstone, 3).
in_arena(tombstone, bone_pit).
melee_or_ranged(tombstone, melee).
splash(tombstone, false).

card(valkyrie, troop).
has_rarity(valkyrie, rare).
elixir_cost(valkyrie, 4).
in_arena(valkyrie, bone_pit).
damage(valkyrie, 125).
hitpoints(valkyrie, 901).
targets(valkyrie, ground).
melee_or_ranged(valkyrie, melee).
splash(valkyrie, true).
count(valkyrie, 1).

card(skeletons, troop).
has_rarity(skeletons, common).
elixir_cost(skeletons, 1).
in_arena(skeletons, bone_pit).
damage(skeletons, 32).
hitpoints(skeletons, 32).
targets(skeletons, ground).
melee_or_ranged(skeletons, melee).
splash(skeletons, false).
count(skeletons, 3).

card(bomber, troop).
has_rarity(bomber, common).
elixir_cost(bomber, 2).
in_arena(bomber, bone_pit).
damage(bomber, 88).
hitpoints(bomber, 119).
targets(bomber, ground).
range_value(bomber, 4.5).
melee_or_ranged(bomber, ranged).
splash(bomber, true).
count(bomber, 1).

card(tombstone, building).
has_rarity(tombstone, rare).
elixir_cost(tombstone, 3).
in_arena(tombstone, bone_pit).
melee_or_ranged(tombstone, melee).
splash(tombstone, false).

card(valkyrie, troop).
has_rarity(valkyrie, rare).
elixir_cost(valkyrie, 4).
in_arena(valkyrie, bone_pit).
damage(valkyrie, 125).
hitpoints(valkyrie, 901).
targets(valkyrie, ground).
melee_or_ranged(valkyrie, melee).
splash(valkyrie, true).
count(valkyrie, 1).

card(cannon, building).
has_rarity(cannon, common).
elixir_cost(cannon, 3).
in_arena(cannon, barbarian_bowl).
damage(cannon, 83).
hitpoints(cannon, 322).
targets(cannon, ground).
range_value(cannon, 5.5).
melee_or_ranged(cannon, ranged).
splash(cannon, false).

card(barbarians, troop).
has_rarity(barbarians, common).
elixir_cost(barbarians, 5).
in_arena(barbarians, barbarian_bowl).
damage(barbarians, 75).
hitpoints(barbarians, 262).
targets(barbarians, ground).
melee_or_ranged(barbarians, melee).
splash(barbarians, false).
count(barbarians, 5).

card(mega_minion, troop).
has_rarity(mega_minion, rare).
elixir_cost(mega_minion, 3).
in_arena(mega_minion, barbarian_bowl).
damage(mega_minion, 147).
hitpoints(mega_minion, 395).
targets(mega_minion, air).
targets(mega_minion, ground).
melee_or_ranged(mega_minion, melee).
splash(mega_minion, false).
count(mega_minion, 1).

card(battle_ram, troop).
has_rarity(battle_ram, rare).
elixir_cost(battle_ram, 4).
in_arena(battle_ram, barbarian_bowl).
targets(battle_ram, buildings).
melee_or_ranged(battle_ram, melee).
splash(battle_ram, false).
count(battle_ram, 1).

card(barbarians, troop).
has_rarity(barbarians, common).
elixir_cost(barbarians, 5).
in_arena(barbarians, barbarian_bowl).
damage(barbarians, 75).
hitpoints(barbarians, 262).
targets(barbarians, ground).
melee_or_ranged(barbarians, melee).
splash(barbarians, false).
count(barbarians, 5).

card(cannon, building).
has_rarity(cannon, common).
elixir_cost(cannon, 3).
in_arena(cannon, barbarian_bowl).
damage(cannon, 83).
hitpoints(cannon, 322).
targets(cannon, ground).
range_value(cannon, 5.5).
melee_or_ranged(cannon, ranged).
splash(cannon, false).

card(battle_ram, troop).
has_rarity(battle_ram, rare).
elixir_cost(battle_ram, 4).
in_arena(battle_ram, barbarian_bowl).
targets(battle_ram, buildings).
melee_or_ranged(battle_ram, melee).
splash(battle_ram, false).
count(battle_ram, 1).

card(mega_minion, troop).
has_rarity(mega_minion, rare).
elixir_cost(mega_minion, 3).
in_arena(mega_minion, barbarian_bowl).
damage(mega_minion, 147).
hitpoints(mega_minion, 395).
targets(mega_minion, air).
targets(mega_minion, ground).
melee_or_ranged(mega_minion, melee).
splash(mega_minion, false).
count(mega_minion, 1).

card(electro_spirit, troop).
has_rarity(electro_spirit, common).
elixir_cost(electro_spirit, 1).
in_arena(electro_spirit, spell_valley).
damage(electro_spirit, 399).
hitpoints(electro_spirit, 90).
targets(electro_spirit, air).
targets(electro_spirit, ground).
range_value(electro_spirit, 2.5).
melee_or_ranged(electro_spirit, ranged).
splash(electro_spirit, false).
count(electro_spirit, 1).

card(skeleton_dragons, troop).
has_rarity(skeleton_dragons, common).
elixir_cost(skeleton_dragons, 4).
in_arena(skeleton_dragons, spell_valley).
damage(skeleton_dragons, 63).
hitpoints(skeleton_dragons, 219).
targets(skeleton_dragons, air).
targets(skeleton_dragons, ground).
range_value(skeleton_dragons, 3.5).
melee_or_ranged(skeleton_dragons, ranged).
splash(skeleton_dragons, true).
count(skeleton_dragons, 2).

card(fire_spirit, troop).
has_rarity(fire_spirit, common).
elixir_cost(fire_spirit, 1).
in_arena(fire_spirit, spell_valley).
damage(fire_spirit, 81).
hitpoints(fire_spirit, 90).
targets(fire_spirit, air).
targets(fire_spirit, ground).
range_value(fire_spirit, 2.5).
melee_or_ranged(fire_spirit, ranged).
splash(fire_spirit, true).
count(fire_spirit, 1).

card(bomb_tower, building).
has_rarity(bomb_tower, rare).
elixir_cost(bomb_tower, 4).
in_arena(bomb_tower, spell_valley).
damage(bomb_tower, 105).
hitpoints(bomb_tower, 640).
targets(bomb_tower, ground).
range_value(bomb_tower, 6).
melee_or_ranged(bomb_tower, ranged).
splash(bomb_tower, true).

card(inferno_tower, building).
has_rarity(inferno_tower, rare).
elixir_cost(inferno_tower, 5).
in_arena(inferno_tower, spell_valley).
hitpoints(inferno_tower, 826).
targets(inferno_tower, air).
targets(inferno_tower, ground).
range_value(inferno_tower, 6).
melee_or_ranged(inferno_tower, ranged).
splash(inferno_tower, false).

card(wizard, troop).
has_rarity(wizard, rare).
elixir_cost(wizard, 5).
in_arena(wizard, spell_valley).
damage(wizard, 133).
hitpoints(wizard, 356).
targets(wizard, air).
targets(wizard, ground).
range_value(wizard, 5.5).
melee_or_ranged(wizard, ranged).
splash(wizard, true).
count(wizard, 1).

card(inferno_tower, building).
has_rarity(inferno_tower, rare).
elixir_cost(inferno_tower, 5).
in_arena(inferno_tower, spell_valley).
hitpoints(inferno_tower, 826).
targets(inferno_tower, air).
targets(inferno_tower, ground).
range_value(inferno_tower, 6).
melee_or_ranged(inferno_tower, ranged).
splash(inferno_tower, false).

card(wizard, troop).
has_rarity(wizard, rare).
elixir_cost(wizard, 5).
in_arena(wizard, spell_valley).
damage(wizard, 133).
hitpoints(wizard, 356).
targets(wizard, air).
targets(wizard, ground).
range_value(wizard, 5.5).
melee_or_ranged(wizard, ranged).
splash(wizard, true).
count(wizard, 1).

card(fire_spirit, troop).
has_rarity(fire_spirit, common).
elixir_cost(fire_spirit, 1).
in_arena(fire_spirit, spell_valley).
damage(fire_spirit, 81).
hitpoints(fire_spirit, 90).
targets(fire_spirit, air).
targets(fire_spirit, ground).
range_value(fire_spirit, 2.5).
melee_or_ranged(fire_spirit, ranged).
splash(fire_spirit, true).
count(fire_spirit, 1).

card(electro_spirit, troop).
has_rarity(electro_spirit, common).
elixir_cost(electro_spirit, 1).
in_arena(electro_spirit, spell_valley).
damage(electro_spirit, 399).
hitpoints(electro_spirit, 90).
targets(electro_spirit, air).
targets(electro_spirit, ground).
range_value(electro_spirit, 2.5).
melee_or_ranged(electro_spirit, ranged).
splash(electro_spirit, false).
count(electro_spirit, 1).

card(zap, spell).
has_rarity(zap, common).
elixir_cost(zap, 2).
in_arena(zap, builder_s_workshop).
damage(zap, 75).
targets(zap, air).
targets(zap, ground).
melee_or_ranged(zap, ranged).
splash(zap, true).

card(mortar, building).
has_rarity(mortar, common).
elixir_cost(mortar, 4).
in_arena(mortar, builder_s_workshop).
damage(mortar, 104).
hitpoints(mortar, 535).
targets(mortar, ground).
range_value(mortar, 3.5).
melee_or_ranged(mortar, ranged).
splash(mortar, true).

card(bats, troop).
has_rarity(bats, common).
elixir_cost(bats, 2).
in_arena(bats, builder_s_workshop).
damage(bats, 32).
hitpoints(bats, 32).
targets(bats, air).
targets(bats, ground).
melee_or_ranged(bats, melee).
splash(bats, false).
count(bats, 5).

card(rocket, spell).
has_rarity(rocket, rare).
elixir_cost(rocket, 6).
in_arena(rocket, builder_s_workshop).
damage(rocket, 701).
targets(rocket, air).
targets(rocket, ground).
melee_or_ranged(rocket, ranged).
splash(rocket, true).

card(flying_machine, troop).
has_rarity(flying_machine, rare).
elixir_cost(flying_machine, 4).
in_arena(flying_machine, builder_s_workshop).
damage(flying_machine, 81).
hitpoints(flying_machine, 290).
targets(flying_machine, air).
targets(flying_machine, ground).
range_value(flying_machine, 6).
melee_or_ranged(flying_machine, ranged).
splash(flying_machine, false).
count(flying_machine, 1).

card(hog_rider, troop).
has_rarity(hog_rider, rare).
elixir_cost(hog_rider, 4).
in_arena(hog_rider, builder_s_workshop).
damage(hog_rider, 150).
hitpoints(hog_rider, 802).
targets(hog_rider, buildings).
melee_or_ranged(hog_rider, melee).
splash(hog_rider, false).
count(hog_rider, 1).

card(zap, spell).
has_rarity(zap, common).
elixir_cost(zap, 2).
in_arena(zap, builder_s_workshop).
damage(zap, 75).
targets(zap, air).
targets(zap, ground).
melee_or_ranged(zap, ranged).
splash(zap, true).

card(bats, troop).
has_rarity(bats, common).
elixir_cost(bats, 2).
in_arena(bats, builder_s_workshop).
damage(bats, 32).
hitpoints(bats, 32).
targets(bats, air).
targets(bats, ground).
melee_or_ranged(bats, melee).
splash(bats, false).
count(bats, 5).

card(hog_rider, troop).
has_rarity(hog_rider, rare).
elixir_cost(hog_rider, 4).
in_arena(hog_rider, builder_s_workshop).
damage(hog_rider, 150).
hitpoints(hog_rider, 802).
targets(hog_rider, buildings).
melee_or_ranged(hog_rider, melee).
splash(hog_rider, false).
count(hog_rider, 1).

card(flying_machine, troop).
has_rarity(flying_machine, rare).
elixir_cost(flying_machine, 4).
in_arena(flying_machine, builder_s_workshop).
damage(flying_machine, 81).
hitpoints(flying_machine, 290).
targets(flying_machine, air).
targets(flying_machine, ground).
range_value(flying_machine, 6).
melee_or_ranged(flying_machine, ranged).
splash(flying_machine, false).
count(flying_machine, 1).

card(goblin_barrel, spell).
has_rarity(goblin_barrel, epic).
elixir_cost(goblin_barrel, 3).
in_arena(goblin_barrel, p_e_k_k_a_s_playhouse).
melee_or_ranged(goblin_barrel, ranged).
splash(goblin_barrel, true).

card(guards, troop).
has_rarity(guards, epic).
elixir_cost(guards, 3).
in_arena(guards, p_e_k_k_a_s_playhouse).
damage(guards, 73).
hitpoints(guards, 51).
targets(guards, ground).
melee_or_ranged(guards, melee).
splash(guards, false).
count(guards, 3).

card(baby_dragon, troop).
has_rarity(baby_dragon, epic).
elixir_cost(baby_dragon, 4).
in_arena(baby_dragon, p_e_k_k_a_s_playhouse).
damage(baby_dragon, 100).
hitpoints(baby_dragon, 720).
targets(baby_dragon, air).
targets(baby_dragon, ground).
range_value(baby_dragon, 3.5).
melee_or_ranged(baby_dragon, ranged).
splash(baby_dragon, true).
count(baby_dragon, 1).

card(skeleton_army, troop).
has_rarity(skeleton_army, epic).
elixir_cost(skeleton_army, 3).
in_arena(skeleton_army, p_e_k_k_a_s_playhouse).
damage(skeleton_army, 51).
hitpoints(skeleton_army, 51).
targets(skeleton_army, ground).
melee_or_ranged(skeleton_army, melee).
splash(skeleton_army, false).
count(skeleton_army, 15).

card(witch, troop).
has_rarity(witch, epic).
elixir_cost(witch, 5).
in_arena(witch, p_e_k_k_a_s_playhouse).
damage(witch, 84).
hitpoints(witch, 524).
targets(witch, air).
targets(witch, ground).
range_value(witch, 5.5).
melee_or_ranged(witch, ranged).
splash(witch, true).
count(witch, 1).

card(p_e_k_k_a, troop).
has_rarity(p_e_k_k_a, epic).
elixir_cost(p_e_k_k_a, 7).
in_arena(p_e_k_k_a, p_e_k_k_a_s_playhouse).
damage(p_e_k_k_a, 510).
hitpoints(p_e_k_k_a, 2350).
targets(p_e_k_k_a, ground).
melee_or_ranged(p_e_k_k_a, melee).
splash(p_e_k_k_a, false).
count(p_e_k_k_a, 1).

card(skeleton_army, troop).
has_rarity(skeleton_army, epic).
elixir_cost(skeleton_army, 3).
in_arena(skeleton_army, p_e_k_k_a_s_playhouse).
damage(skeleton_army, 51).
hitpoints(skeleton_army, 51).
targets(skeleton_army, ground).
melee_or_ranged(skeleton_army, melee).
splash(skeleton_army, false).
count(skeleton_army, 15).

card(witch, troop).
has_rarity(witch, epic).
elixir_cost(witch, 5).
in_arena(witch, p_e_k_k_a_s_playhouse).
damage(witch, 84).
hitpoints(witch, 524).
targets(witch, air).
targets(witch, ground).
range_value(witch, 5.5).
melee_or_ranged(witch, ranged).
splash(witch, true).
count(witch, 1).

card(goblin_barrel, spell).
has_rarity(goblin_barrel, epic).
elixir_cost(goblin_barrel, 3).
in_arena(goblin_barrel, p_e_k_k_a_s_playhouse).
melee_or_ranged(goblin_barrel, ranged).
splash(goblin_barrel, true).

card(guards, troop).
has_rarity(guards, epic).
elixir_cost(guards, 3).
in_arena(guards, p_e_k_k_a_s_playhouse).
damage(guards, 73).
hitpoints(guards, 51).
targets(guards, ground).
melee_or_ranged(guards, melee).
splash(guards, false).
count(guards, 3).

card(royal_recruits, troop).
has_rarity(royal_recruits, common).
elixir_cost(royal_recruits, 7).
in_arena(royal_recruits, royal_arena).
damage(royal_recruits, 52).
hitpoints(royal_recruits, 214).
targets(royal_recruits, ground).
melee_or_ranged(royal_recruits, melee).
splash(royal_recruits, false).
count(royal_recruits, 6).

card(royal_giant, troop).
has_rarity(royal_giant, common).
elixir_cost(royal_giant, 6).
in_arena(royal_giant, royal_arena).
damage(royal_giant, 120).
hitpoints(royal_giant, 1236).
targets(royal_giant, buildings).
range_value(royal_giant, 5).
melee_or_ranged(royal_giant, ranged).
splash(royal_giant, false).
count(royal_giant, 1).

card(royal_hogs, troop).
has_rarity(royal_hogs, rare).
elixir_cost(royal_hogs, 5).
in_arena(royal_hogs, royal_arena).
damage(royal_hogs, 35).
hitpoints(royal_hogs, 395).
targets(royal_hogs, buildings).
melee_or_ranged(royal_hogs, melee).
splash(royal_hogs, false).
count(royal_hogs, 4).

card(three_musketeers, troop).
has_rarity(three_musketeers, rare).
elixir_cost(three_musketeers, 9).
in_arena(three_musketeers, royal_arena).
damage(three_musketeers, 102).
hitpoints(three_musketeers, 341).
targets(three_musketeers, air).
targets(three_musketeers, ground).
range_value(three_musketeers, 6).
melee_or_ranged(three_musketeers, ranged).
splash(three_musketeers, false).
count(three_musketeers, 3).

card(dark_prince, troop).
has_rarity(dark_prince, epic).
elixir_cost(dark_prince, 4).
in_arena(dark_prince, royal_arena).
damage(dark_prince, 166).
hitpoints(dark_prince, 750).
targets(dark_prince, ground).
melee_or_ranged(dark_prince, melee).
splash(dark_prince, true).
count(dark_prince, 1).

card(prince, troop).
has_rarity(prince, epic).
elixir_cost(prince, 5).
in_arena(prince, royal_arena).
damage(prince, 244).
hitpoints(prince, 1200).
targets(prince, ground).
melee_or_ranged(prince, melee).
splash(prince, false).
count(prince, 1).

card(balloon, troop).
has_rarity(balloon, epic).
elixir_cost(balloon, 5).
in_arena(balloon, royal_arena).
damage(balloon, 400).
hitpoints(balloon, 1049).
targets(balloon, buildings).
melee_or_ranged(balloon, melee).
splash(balloon, false).
count(balloon, 1).

card(royal_giant, troop).
has_rarity(royal_giant, common).
elixir_cost(royal_giant, 6).
in_arena(royal_giant, royal_arena).
damage(royal_giant, 120).
hitpoints(royal_giant, 1236).
targets(royal_giant, buildings).
range_value(royal_giant, 5).
melee_or_ranged(royal_giant, ranged).
splash(royal_giant, false).
count(royal_giant, 1).

card(royal_recruits, troop).
has_rarity(royal_recruits, common).
elixir_cost(royal_recruits, 7).
in_arena(royal_recruits, royal_arena).
damage(royal_recruits, 52).
hitpoints(royal_recruits, 214).
targets(royal_recruits, ground).
melee_or_ranged(royal_recruits, melee).
splash(royal_recruits, false).
count(royal_recruits, 6).

card(three_musketeers, troop).
has_rarity(three_musketeers, rare).
elixir_cost(three_musketeers, 9).
in_arena(three_musketeers, royal_arena).
damage(three_musketeers, 102).
hitpoints(three_musketeers, 341).
targets(three_musketeers, air).
targets(three_musketeers, ground).
range_value(three_musketeers, 6).
melee_or_ranged(three_musketeers, ranged).
splash(three_musketeers, false).
count(three_musketeers, 3).

card(royal_hogs, troop).
has_rarity(royal_hogs, rare).
elixir_cost(royal_hogs, 5).
in_arena(royal_hogs, royal_arena).
damage(royal_hogs, 35).
hitpoints(royal_hogs, 395).
targets(royal_hogs, buildings).
melee_or_ranged(royal_hogs, melee).
splash(royal_hogs, false).
count(royal_hogs, 4).

card(giant_snowball, spell).
has_rarity(giant_snowball, common).
elixir_cost(giant_snowball, 2).
in_arena(giant_snowball, frozen_peak).
damage(giant_snowball, 70).
targets(giant_snowball, air).
targets(giant_snowball, ground).
melee_or_ranged(giant_snowball, ranged).
splash(giant_snowball, true).

card(ice_spirit, troop).
has_rarity(ice_spirit, common).
elixir_cost(ice_spirit, 1).
in_arena(ice_spirit, frozen_peak).
damage(ice_spirit, 43).
hitpoints(ice_spirit, 90).
targets(ice_spirit, air).
targets(ice_spirit, ground).
range_value(ice_spirit, 2.5).
melee_or_ranged(ice_spirit, ranged).
splash(ice_spirit, true).

card(battle_healer, troop).
has_rarity(battle_healer, rare).
elixir_cost(battle_healer, 4).
in_arena(battle_healer, frozen_peak).
damage(battle_healer, 70).
hitpoints(battle_healer, 811).
targets(battle_healer, ground).
melee_or_ranged(battle_healer, melee).
splash(battle_healer, false).
count(battle_healer, 1).

card(ice_golem, troop).
has_rarity(ice_golem, rare).
elixir_cost(ice_golem, 2).
in_arena(ice_golem, frozen_peak).
damage(ice_golem, 39).
hitpoints(ice_golem, 566).
targets(ice_golem, buildings).
melee_or_ranged(ice_golem, melee).
splash(ice_golem, false).
count(ice_golem, 1).

card(vines, spell).
has_rarity(vines, epic).
elixir_cost(vines, 3).
in_arena(vines, frozen_peak).
targets(vines, air).
targets(vines, ground).
melee_or_ranged(vines, ranged).
splash(vines, true).

card(lightning, spell).
has_rarity(lightning, epic).
elixir_cost(lightning, 6).
in_arena(lightning, frozen_peak).
damage(lightning, 660).
targets(lightning, air).
targets(lightning, ground).
melee_or_ranged(lightning, ranged).
splash(lightning, true).
count(lightning, 3).

card(freeze, spell).
has_rarity(freeze, epic).
elixir_cost(freeze, 4).
in_arena(freeze, frozen_peak).
damage(freeze, 72).
targets(freeze, air).
targets(freeze, ground).
melee_or_ranged(freeze, ranged).
splash(freeze, true).

card(giant_skeleton, troop).
has_rarity(giant_skeleton, epic).
elixir_cost(giant_skeleton, 6).
in_arena(giant_skeleton, frozen_peak).
damage(giant_skeleton, 166).
hitpoints(giant_skeleton, 2260).
targets(giant_skeleton, ground).
melee_or_ranged(giant_skeleton, melee).
splash(giant_skeleton, false).
count(giant_skeleton, 1).

card(cannoneer, troop).
has_rarity(cannoneer, epic).
in_arena(cannoneer, frozen_peak).
damage(cannoneer, 189).
hitpoints(cannoneer, 1740).
targets(cannoneer, air).
targets(cannoneer, ground).
range_value(cannoneer, 7.5).
melee_or_ranged(cannoneer, ranged).
splash(cannoneer, false).

card(ice_spirit, troop).
has_rarity(ice_spirit, common).
elixir_cost(ice_spirit, 1).
in_arena(ice_spirit, frozen_peak).
damage(ice_spirit, 43).
hitpoints(ice_spirit, 90).
targets(ice_spirit, air).
targets(ice_spirit, ground).
range_value(ice_spirit, 2.5).
melee_or_ranged(ice_spirit, ranged).
splash(ice_spirit, true).

card(giant_snowball, spell).
has_rarity(giant_snowball, common).
elixir_cost(giant_snowball, 2).
in_arena(giant_snowball, frozen_peak).
damage(giant_snowball, 70).
targets(giant_snowball, air).
targets(giant_snowball, ground).
melee_or_ranged(giant_snowball, ranged).
splash(giant_snowball, true).

card(freeze, spell).
has_rarity(freeze, epic).
elixir_cost(freeze, 4).
in_arena(freeze, frozen_peak).
damage(freeze, 72).
targets(freeze, air).
targets(freeze, ground).
melee_or_ranged(freeze, ranged).
splash(freeze, true).

card(lightning, spell).
has_rarity(lightning, epic).
elixir_cost(lightning, 6).
in_arena(lightning, frozen_peak).
damage(lightning, 660).
targets(lightning, air).
targets(lightning, ground).
melee_or_ranged(lightning, ranged).
splash(lightning, true).
count(lightning, 3).

card(berserker, troop).
has_rarity(berserker, common).
elixir_cost(berserker, 2).
in_arena(berserker, jungle_arena).
damage(berserker, 40).
hitpoints(berserker, 350).
targets(berserker, ground).
melee_or_ranged(berserker, melee).
splash(berserker, false).
count(berserker, 1).

card(skeleton_barrel, troop).
has_rarity(skeleton_barrel, common).
elixir_cost(skeleton_barrel, 3).
in_arena(skeleton_barrel, jungle_arena).
targets(skeleton_barrel, buildings).
melee_or_ranged(skeleton_barrel, melee).
splash(skeleton_barrel, false).

card(goblin_gang, troop).
has_rarity(goblin_gang, common).
elixir_cost(goblin_gang, 3).
in_arena(goblin_gang, jungle_arena).
targets(goblin_gang, ground).
melee_or_ranged(goblin_gang, melee).
splash(goblin_gang, false).
count(goblin_gang, 3).

card(barbarian_hut, building).
has_rarity(barbarian_hut, rare).
elixir_cost(barbarian_hut, 6).
in_arena(barbarian_hut, jungle_arena).
melee_or_ranged(barbarian_hut, melee).
splash(barbarian_hut, false).

card(dart_goblin, troop).
has_rarity(dart_goblin, rare).
elixir_cost(dart_goblin, 3).
in_arena(dart_goblin, jungle_arena).
damage(dart_goblin, 67).
hitpoints(dart_goblin, 123).
targets(dart_goblin, air).
targets(dart_goblin, ground).
range_value(dart_goblin, 6.5).
melee_or_ranged(dart_goblin, ranged).
splash(dart_goblin, false).
count(dart_goblin, 1).

card(barbarian_barrel, spell).
has_rarity(barbarian_barrel, epic).
elixir_cost(barbarian_barrel, 2).
in_arena(barbarian_barrel, jungle_arena).
targets(barbarian_barrel, ground).
range_value(barbarian_barrel, 4.5).
melee_or_ranged(barbarian_barrel, ranged).
splash(barbarian_barrel, true).

card(poison, spell).
has_rarity(poison, epic).
elixir_cost(poison, 4).
in_arena(poison, jungle_arena).
targets(poison, air).
targets(poison, ground).
melee_or_ranged(poison, ranged).
splash(poison, true).

card(rune_giant, troop).
has_rarity(rune_giant, epic).
elixir_cost(rune_giant, 4).
in_arena(rune_giant, jungle_arena).
damage(rune_giant, 75).
hitpoints(rune_giant, 1664).
targets(rune_giant, buildings).
melee_or_ranged(rune_giant, melee).
splash(rune_giant, false).
count(rune_giant, 1).

card(goblin_giant, troop).
has_rarity(goblin_giant, epic).
elixir_cost(goblin_giant, 6).
in_arena(goblin_giant, jungle_arena).
targets(goblin_giant, buildings).
melee_or_ranged(goblin_giant, melee).
splash(goblin_giant, false).
count(goblin_giant, 1).

card(dart_goblin, troop).
has_rarity(dart_goblin, rare).
elixir_cost(dart_goblin, 3).
in_arena(dart_goblin, jungle_arena).
damage(dart_goblin, 67).
hitpoints(dart_goblin, 123).
targets(dart_goblin, air).
targets(dart_goblin, ground).
range_value(dart_goblin, 6.5).
melee_or_ranged(dart_goblin, ranged).
splash(dart_goblin, false).
count(dart_goblin, 1).

card(barbarian_hut, building).
has_rarity(barbarian_hut, rare).
elixir_cost(barbarian_hut, 6).
in_arena(barbarian_hut, jungle_arena).
melee_or_ranged(barbarian_hut, melee).
splash(barbarian_hut, false).

card(goblin_giant, troop).
has_rarity(goblin_giant, epic).
elixir_cost(goblin_giant, 6).
in_arena(goblin_giant, jungle_arena).
targets(goblin_giant, buildings).
melee_or_ranged(goblin_giant, melee).
splash(goblin_giant, false).
count(goblin_giant, 1).

card(poison, spell).
has_rarity(poison, epic).
elixir_cost(poison, 4).
in_arena(poison, jungle_arena).
targets(poison, air).
targets(poison, ground).
melee_or_ranged(poison, ranged).
splash(poison, true).

card(tesla, building).
has_rarity(tesla, common).
elixir_cost(tesla, 4).
in_arena(tesla, hog_mountain).
damage(tesla, 86).
hitpoints(tesla, 450).
targets(tesla, air).
targets(tesla, ground).
range_value(tesla, 5.5).
melee_or_ranged(tesla, ranged).
splash(tesla, false).

card(elite_barbarians, troop).
has_rarity(elite_barbarians, common).
elixir_cost(elite_barbarians, 6).
in_arena(elite_barbarians, hog_mountain).
damage(elite_barbarians, 150).
hitpoints(elite_barbarians, 524).
targets(elite_barbarians, ground).
melee_or_ranged(elite_barbarians, melee).
splash(elite_barbarians, false).
count(elite_barbarians, 2).

card(minion_horde, troop).
has_rarity(minion_horde, common).
elixir_cost(minion_horde, 5).
in_arena(minion_horde, hog_mountain).
damage(minion_horde, 46).
hitpoints(minion_horde, 90).
targets(minion_horde, air).
targets(minion_horde, ground).
range_value(minion_horde, 2.5).
melee_or_ranged(minion_horde, ranged).
splash(minion_horde, false).
count(minion_horde, 6).

card(furnace, troop).
has_rarity(furnace, rare).
elixir_cost(furnace, 4).
in_arena(furnace, hog_mountain).
targets(furnace, air).
targets(furnace, ground).
range_value(furnace, 6).
melee_or_ranged(furnace, ranged).
splash(furnace, true).

card(zappies, troop).
has_rarity(zappies, rare).
elixir_cost(zappies, 4).
in_arena(zappies, hog_mountain).
damage(zappies, 55).
hitpoints(zappies, 250).
targets(zappies, air).
targets(zappies, ground).
range_value(zappies, 4.5).
melee_or_ranged(zappies, ranged).
splash(zappies, false).
count(zappies, 3).

card(x_bow, building).
has_rarity(x_bow, epic).
elixir_cost(x_bow, 6).
in_arena(x_bow, hog_mountain).
damage(x_bow, 28).
hitpoints(x_bow, 1000).
targets(x_bow, ground).
range_value(x_bow, 11.5).
melee_or_ranged(x_bow, ranged).
splash(x_bow, false).

card(hunter, troop).
has_rarity(hunter, epic).
elixir_cost(hunter, 4).
in_arena(hunter, hog_mountain).
damage(hunter, 5210520).
hitpoints(hunter, 553).
targets(hunter, air).
targets(hunter, ground).
range_value(hunter, 4).
melee_or_ranged(hunter, ranged).
splash(hunter, false).
count(hunter, 1).

card(golem, troop).
has_rarity(golem, epic).
elixir_cost(golem, 8).
in_arena(golem, hog_mountain).
targets(golem, buildings).
melee_or_ranged(golem, melee).
splash(golem, true).
count(golem, 1).

card(elite_barbarians, troop).
has_rarity(elite_barbarians, common).
elixir_cost(elite_barbarians, 6).
in_arena(elite_barbarians, hog_mountain).
damage(elite_barbarians, 150).
hitpoints(elite_barbarians, 524).
targets(elite_barbarians, ground).
melee_or_ranged(elite_barbarians, melee).
splash(elite_barbarians, false).
count(elite_barbarians, 2).

card(minion_horde, troop).
has_rarity(minion_horde, common).
elixir_cost(minion_horde, 5).
in_arena(minion_horde, hog_mountain).
damage(minion_horde, 46).
hitpoints(minion_horde, 90).
targets(minion_horde, air).
targets(minion_horde, ground).
range_value(minion_horde, 2.5).
melee_or_ranged(minion_horde, ranged).
splash(minion_horde, false).
count(minion_horde, 6).

card(golem, troop).
has_rarity(golem, epic).
elixir_cost(golem, 8).
in_arena(golem, hog_mountain).
targets(golem, buildings).
melee_or_ranged(golem, melee).
splash(golem, true).
count(golem, 1).

card(hunter, troop).
has_rarity(hunter, epic).
elixir_cost(hunter, 4).
in_arena(hunter, hog_mountain).
damage(hunter, 5210520).
hitpoints(hunter, 553).
targets(hunter, air).
targets(hunter, ground).
range_value(hunter, 4).
melee_or_ranged(hunter, ranged).
splash(hunter, false).
count(hunter, 1).

card(the_log, spell).
has_rarity(the_log, legendary).
elixir_cost(the_log, 2).
in_arena(the_log, electro_valley).
damage(the_log, 220).
targets(the_log, ground).
range_value(the_log, 10.1).
melee_or_ranged(the_log, ranged).
splash(the_log, true).

card(mega_knight, troop).
has_rarity(mega_knight, legendary).
elixir_cost(mega_knight, 7).
in_arena(mega_knight, electro_valley).
damage(mega_knight, 222).
hitpoints(mega_knight, 3307).
targets(mega_knight, ground).
melee_or_ranged(mega_knight, melee).
splash(mega_knight, true).
count(mega_knight, 1).

card(ram_rider, troop).
has_rarity(ram_rider, legendary).
elixir_cost(ram_rider, 5).
in_arena(ram_rider, electro_valley).
hitpoints(ram_rider, 1405).
targets(ram_rider, buildings).
melee_or_ranged(ram_rider, melee).
splash(ram_rider, false).
count(ram_rider, 1).

card(electro_wizard, troop).
has_rarity(electro_wizard, legendary).
elixir_cost(electro_wizard, 4).
in_arena(electro_wizard, electro_valley).
damage(electro_wizard, 952190).
hitpoints(electro_wizard, 591).
targets(electro_wizard, air).
targets(electro_wizard, ground).
range_value(electro_wizard, 5).
melee_or_ranged(electro_wizard, ranged).
splash(electro_wizard, false).

card(inferno_dragon, troop).
has_rarity(inferno_dragon, legendary).
elixir_cost(inferno_dragon, 4).
in_arena(inferno_dragon, electro_valley).
hitpoints(inferno_dragon, 1072).
targets(inferno_dragon, air).
targets(inferno_dragon, ground).
range_value(inferno_dragon, 3.5).
melee_or_ranged(inferno_dragon, ranged).
splash(inferno_dragon, false).
count(inferno_dragon, 1).

card(sparky, troop).
has_rarity(sparky, legendary).
elixir_cost(sparky, 6).
in_arena(sparky, electro_valley).
damage(sparky, 1102).
hitpoints(sparky, 1202).
targets(sparky, ground).
range_value(sparky, 5).
melee_or_ranged(sparky, ranged).
splash(sparky, true).
count(sparky, 1).

card(miner, troop).
has_rarity(miner, legendary).
elixir_cost(miner, 3).
in_arena(miner, electro_valley).
damage(miner, 161).
hitpoints(miner, 1002).
targets(miner, ground).
melee_or_ranged(miner, melee).
splash(miner, false).
count(miner, 1).

card(princess, troop).
has_rarity(princess, legendary).
elixir_cost(princess, 3).
in_arena(princess, electro_valley).
damage(princess, 139).
hitpoints(princess, 216).
targets(princess, air).
targets(princess, ground).
range_value(princess, 9).
melee_or_ranged(princess, ranged).
splash(princess, true).
count(princess, 1).

card(dagger_duchess, troop).
has_rarity(dagger_duchess, legendary).
in_arena(dagger_duchess, electro_valley).
damage(dagger_duchess, 96).
hitpoints(dagger_duchess, 2298).
targets(dagger_duchess, air).
targets(dagger_duchess, ground).
range_value(dagger_duchess, 7.5).
melee_or_ranged(dagger_duchess, ranged).
splash(dagger_duchess, false).

card(firecracker, troop).
has_rarity(firecracker, common).
elixir_cost(firecracker, 3).
in_arena(firecracker, spooky_town).
damage(firecracker, 255125).
hitpoints(firecracker, 119).
targets(firecracker, air).
targets(firecracker, ground).
range_value(firecracker, 6).
melee_or_ranged(firecracker, ranged).
splash(firecracker, true).
count(firecracker, 1).

card(earthquake, spell).
has_rarity(earthquake, rare).
elixir_cost(earthquake, 3).
in_arena(earthquake, spooky_town).
damage(earthquake, 393117).
targets(earthquake, ground).
melee_or_ranged(earthquake, ranged).
splash(earthquake, true).

card(goblin_demolisher, troop).
has_rarity(goblin_demolisher, rare).
elixir_cost(goblin_demolisher, 4).
in_arena(goblin_demolisher, spooky_town).
damage(goblin_demolisher, 88).
hitpoints(goblin_demolisher, 614).
targets(goblin_demolisher, ground).
range_value(goblin_demolisher, 5).
melee_or_ranged(goblin_demolisher, ranged).
splash(goblin_demolisher, true).
count(goblin_demolisher, 1).

card(electro_dragon, troop).
has_rarity(electro_dragon, epic).
elixir_cost(electro_dragon, 5).
in_arena(electro_dragon, spooky_town).
damage(electro_dragon, 1203).
hitpoints(electro_dragon, 593).
targets(electro_dragon, air).
targets(electro_dragon, ground).
range_value(electro_dragon, 3.5).
melee_or_ranged(electro_dragon, ranged).
splash(electro_dragon, false).
count(electro_dragon, 1).

card(wall_breakers, troop).
has_rarity(wall_breakers, epic).
elixir_cost(wall_breakers, 2).
in_arena(wall_breakers, spooky_town).
damage(wall_breakers, 244).
hitpoints(wall_breakers, 206).
targets(wall_breakers, buildings).
melee_or_ranged(wall_breakers, melee).
splash(wall_breakers, true).
count(wall_breakers, 2).

card(graveyard, spell).
has_rarity(graveyard, legendary).
elixir_cost(graveyard, 5).
in_arena(graveyard, spooky_town).
melee_or_ranged(graveyard, ranged).
splash(graveyard, true).

card(phoenix, troop).
has_rarity(phoenix, legendary).
elixir_cost(phoenix, 4).
in_arena(phoenix, spooky_town).
damage(phoenix, 180).
hitpoints(phoenix, 871).
targets(phoenix, air).
targets(phoenix, ground).
melee_or_ranged(phoenix, melee).
splash(phoenix, true).
count(phoenix, 1).

card(royal_ghost, troop).
has_rarity(royal_ghost, legendary).
elixir_cost(royal_ghost, 3).
in_arena(royal_ghost, spooky_town).
damage(royal_ghost, 216).
hitpoints(royal_ghost, 1002).
targets(royal_ghost, ground).
melee_or_ranged(royal_ghost, melee).
splash(royal_ghost, true).
count(royal_ghost, 1).

card(ice_wizard, troop).
has_rarity(ice_wizard, legendary).
elixir_cost(ice_wizard, 3).
in_arena(ice_wizard, spooky_town).
damage(ice_wizard, 74).
hitpoints(ice_wizard, 570).
targets(ice_wizard, air).
targets(ice_wizard, ground).
range_value(ice_wizard, 5.5).
melee_or_ranged(ice_wizard, ranged).
splash(ice_wizard, true).
count(ice_wizard, 1).

card(wall_breakers, troop).
has_rarity(wall_breakers, epic).
elixir_cost(wall_breakers, 2).
in_arena(wall_breakers, spooky_town).
damage(wall_breakers, 244).
hitpoints(wall_breakers, 206).
targets(wall_breakers, buildings).
melee_or_ranged(wall_breakers, melee).
splash(wall_breakers, true).
count(wall_breakers, 2).

card(electro_dragon, troop).
has_rarity(electro_dragon, epic).
elixir_cost(electro_dragon, 5).
in_arena(electro_dragon, spooky_town).
damage(electro_dragon, 1203).
hitpoints(electro_dragon, 593).
targets(electro_dragon, air).
targets(electro_dragon, ground).
range_value(electro_dragon, 3.5).
melee_or_ranged(electro_dragon, ranged).
splash(electro_dragon, false).
count(electro_dragon, 1).

card(firecracker, troop).
has_rarity(firecracker, common).
elixir_cost(firecracker, 3).
in_arena(firecracker, spooky_town).
damage(firecracker, 255125).
hitpoints(firecracker, 119).
targets(firecracker, air).
targets(firecracker, ground).
range_value(firecracker, 6).
melee_or_ranged(firecracker, ranged).
splash(firecracker, true).
count(firecracker, 1).

card(rascals, troop).
has_rarity(rascals, common).
elixir_cost(rascals, 5).
in_arena(rascals, rascal_s_hideout).
targets(rascals, ground).
melee_or_ranged(rascals, melee).
splash(rascals, false).
count(rascals, 1).

card(rascals, troop).
has_rarity(rascals, common).
elixir_cost(rascals, 5).
in_arena(rascals, rascal_s_hideout).
targets(rascals, ground).
melee_or_ranged(rascals, melee).
splash(rascals, false).
count(rascals, 1).

card(heal_spirit, troop).
has_rarity(heal_spirit, rare).
elixir_cost(heal_spirit, 1).
in_arena(heal_spirit, rascal_s_hideout).
damage(heal_spirit, 52).
hitpoints(heal_spirit, 108).
targets(heal_spirit, air).
targets(heal_spirit, ground).
range_value(heal_spirit, 2.5).
melee_or_ranged(heal_spirit, ranged).
splash(heal_spirit, true).

card(suspicious_bush, troop).
has_rarity(suspicious_bush, rare).
elixir_cost(suspicious_bush, 2).
in_arena(suspicious_bush, rascal_s_hideout).
targets(suspicious_bush, buildings).
melee_or_ranged(suspicious_bush, melee).
splash(suspicious_bush, false).
count(suspicious_bush, 1).

card(electro_giant, troop).
has_rarity(electro_giant, epic).
elixir_cost(electro_giant, 7).
in_arena(electro_giant, rascal_s_hideout).
damage(electro_giant, 102).
hitpoints(electro_giant, 2409).
targets(electro_giant, buildings).
melee_or_ranged(electro_giant, melee).
splash(electro_giant, false).
count(electro_giant, 1).

card(bowler, troop).
has_rarity(bowler, epic).
elixir_cost(bowler, 5).
in_arena(bowler, rascal_s_hideout).
damage(bowler, 180).
hitpoints(bowler, 1300).
targets(bowler, ground).
range_value(bowler, 4).
melee_or_ranged(bowler, ranged).
splash(bowler, true).

card(magic_archer, troop).
has_rarity(magic_archer, legendary).
elixir_cost(magic_archer, 4).
in_arena(magic_archer, rascal_s_hideout).
damage(magic_archer, 110).
hitpoints(magic_archer, 438).
targets(magic_archer, air).
targets(magic_archer, ground).
range_value(magic_archer, 7).
melee_or_ranged(magic_archer, ranged).
splash(magic_archer, true).
count(magic_archer, 1).

card(bandit, troop).
has_rarity(bandit, legendary).
elixir_cost(bandit, 3).
in_arena(bandit, rascal_s_hideout).
damage(bandit, 161).
hitpoints(bandit, 750).
targets(bandit, ground).
melee_or_ranged(bandit, melee).
splash(bandit, false).
count(bandit, 1).

card(lava_hound, troop).
has_rarity(lava_hound, legendary).
elixir_cost(lava_hound, 7).
in_arena(lava_hound, rascal_s_hideout).
targets(lava_hound, buildings).
range_value(lava_hound, 3.5).
melee_or_ranged(lava_hound, ranged).
splash(lava_hound, false).
count(lava_hound, 1).

card(royal_chef, troop).
has_rarity(royal_chef, legendary).
in_arena(royal_chef, rascal_s_hideout).
damage(royal_chef, 90).
hitpoints(royal_chef, 2244).
targets(royal_chef, air).
targets(royal_chef, ground).
range_value(royal_chef, 7.5).
melee_or_ranged(royal_chef, ranged).
splash(royal_chef, false).

card(bowler, troop).
has_rarity(bowler, epic).
elixir_cost(bowler, 5).
in_arena(bowler, rascal_s_hideout).
damage(bowler, 180).
hitpoints(bowler, 1300).
targets(bowler, ground).
range_value(bowler, 4).
melee_or_ranged(bowler, ranged).
splash(bowler, true).

card(electro_giant, troop).
has_rarity(electro_giant, epic).
elixir_cost(electro_giant, 7).
in_arena(electro_giant, rascal_s_hideout).
damage(electro_giant, 102).
hitpoints(electro_giant, 2409).
targets(electro_giant, buildings).
melee_or_ranged(electro_giant, melee).
splash(electro_giant, false).
count(electro_giant, 1).

card(royal_delivery, spell).
has_rarity(royal_delivery, common).
elixir_cost(royal_delivery, 3). 
in_arena(royal_delivery, serenity_peak).
targets(royal_delivery, air).
targets(royal_delivery, ground).
melee_or_ranged(royal_delivery, ranged).
splash(royal_delivery, true).

card(elixir_golem, troop).
has_rarity(elixir_golem, rare).
elixir_cost(elixir_golem, 3).
in_arena(elixir_golem, serenity_peak).
targets(elixir_golem, buildings).
melee_or_ranged(elixir_golem, melee).
splash(elixir_golem, false).
count(elixir_golem, 1).

card(goblin_curse, spell).
has_rarity(goblin_curse, epic).
elixir_cost(goblin_curse, 2).
in_arena(goblin_curse, serenity_peak).
targets(goblin_curse, air).
targets(goblin_curse, ground).
melee_or_ranged(goblin_curse, ranged).
splash(goblin_curse, true).

card(rage, spell).
has_rarity(rage, epic).
elixir_cost(rage, 2).
in_arena(rage, serenity_peak).
damage(rage, 106).
targets(rage, buildings).
melee_or_ranged(rage, ranged).
splash(rage, true).

card(goblin_drill, building).
has_rarity(goblin_drill, epic).
elixir_cost(goblin_drill, 4).
in_arena(goblin_drill, serenity_peak).
melee_or_ranged(goblin_drill, melee).
splash(goblin_drill, false).

card(executioner, troop).
has_rarity(executioner, epic).
elixir_cost(executioner, 5).
in_arena(executioner, serenity_peak).
damage(executioner, 1052210).
hitpoints(executioner, 800).
targets(executioner, air).
targets(executioner, ground).
range_value(executioner, 4.5).
melee_or_ranged(executioner, ranged).
splash(executioner, true).
count(executioner, 1).

card(night_witch, troop).
has_rarity(night_witch, legendary).
elixir_cost(night_witch, 4).
in_arena(night_witch, serenity_peak).
targets(night_witch, ground).
melee_or_ranged(night_witch, melee).
splash(night_witch, false).
count(night_witch, 1).

card(lumberjack, troop).
has_rarity(lumberjack, legendary).
elixir_cost(lumberjack, 4).
in_arena(lumberjack, serenity_peak).
hitpoints(lumberjack, 1060).
targets(lumberjack, ground).
melee_or_ranged(lumberjack, melee).
splash(lumberjack, false).

card(goblin_drill, building).
has_rarity(goblin_drill, epic).
elixir_cost(goblin_drill, 4).
in_arena(goblin_drill, serenity_peak).
melee_or_ranged(goblin_drill, melee).
splash(goblin_drill, false).

card(executioner, troop).
has_rarity(executioner, epic).
elixir_cost(executioner, 5).
in_arena(executioner, serenity_peak).
damage(executioner, 1052210).
hitpoints(executioner, 800).
targets(executioner, air).
targets(executioner, ground).
range_value(executioner, 4.5).
melee_or_ranged(executioner, ranged).
splash(executioner, true).
count(executioner, 1).

card(goblin_curse, spell).
has_rarity(goblin_curse, epic).
elixir_cost(goblin_curse, 2).
in_arena(goblin_curse, serenity_peak).
targets(goblin_curse, air).
targets(goblin_curse, ground).
melee_or_ranged(goblin_curse, ranged).
splash(goblin_curse, true).

card(rage, spell).
has_rarity(rage, epic).
elixir_cost(rage, 2).
in_arena(rage, serenity_peak).
damage(rage, 106).
targets(rage, buildings).
melee_or_ranged(rage, ranged).
splash(rage, true).

card(royal_delivery, spell).
has_rarity(royal_delivery, common).
elixir_cost(royal_delivery, 3).
in_arena(royal_delivery, serenity_peak).
targets(royal_delivery, air).
targets(royal_delivery, ground).
melee_or_ranged(royal_delivery, ranged).
splash(royal_delivery, true).

card(night_witch, troop).
has_rarity(night_witch, legendary).
elixir_cost(night_witch, 4).
in_arena(night_witch, serenity_peak).
targets(night_witch, ground).
melee_or_ranged(night_witch, melee).
splash(night_witch, false).
count(night_witch, 1).

card(mother_witch, troop).
has_rarity(mother_witch, legendary).
elixir_cost(mother_witch, 4).
in_arena(mother_witch, miner_s_mine).
targets(mother_witch, air).
targets(mother_witch, ground).
range_value(mother_witch, 5.5).
melee_or_ranged(mother_witch, ranged).
splash(mother_witch, false).
count(mother_witch, 1).

card(elixir_golem, troop).
has_rarity(elixir_golem, rare).
elixir_cost(elixir_golem, 3).
in_arena(elixir_golem, serenity_peak).
targets(elixir_golem, buildings).
melee_or_ranged(elixir_golem, melee).
splash(elixir_golem, false).
count(elixir_golem, 1).

card(elixir_collector, building).
has_rarity(elixir_collector, rare).
elixir_cost(elixir_collector, 6).
in_arena(elixir_collector, miner_s_mine).
hitpoints(elixir_collector, 505).
melee_or_ranged(elixir_collector, melee).
splash(elixir_collector, false).

card(elixir_collector, building).
has_rarity(elixir_collector, rare).
elixir_cost(elixir_collector, 6).
in_arena(elixir_collector, miner_s_mine).
hitpoints(elixir_collector, 505).
melee_or_ranged(elixir_collector, melee).
splash(elixir_collector, false).

card(void, spell).
has_rarity(void, epic).
elixir_cost(void, 3).
in_arena(void, miner_s_mine).
targets(void, air).
targets(void, ground).
melee_or_ranged(void, ranged).
splash(void, true).

card(clone, spell).
has_rarity(clone, epic).
elixir_cost(clone, 3).
in_arena(clone, miner_s_mine).
melee_or_ranged(clone, ranged).
splash(clone, true).

card(tornado, spell).
has_rarity(tornado, epic).
elixir_cost(tornado, 3).
in_arena(tornado, miner_s_mine).
damage(tornado, 52).
targets(tornado, air).
targets(tornado, ground).
melee_or_ranged(tornado, ranged).
splash(tornado, true).

card(mirror, spell).
has_rarity(mirror, epic).
elixir_cost(mirror, 1).
in_arena(mirror, miner_s_mine).
melee_or_ranged(mirror, ranged).
splash(mirror, true).

card(cannon_cart, troop).
has_rarity(cannon_cart, epic).
elixir_cost(cannon_cart, 5).
in_arena(cannon_cart, miner_s_mine).
damage(cannon_cart, 132).
hitpoints(cannon_cart, 1131).
targets(cannon_cart, ground).
range_value(cannon_cart, 5.5).
melee_or_ranged(cannon_cart, ranged).
splash(cannon_cart, false).
count(cannon_cart, 1).

card(spirit_empress, troop).
has_rarity(spirit_empress, legendary).
elixir_cost(spirit_empress, 663).
in_arena(spirit_empress, miner_s_mine).
damage(spirit_empress, 249).
melee_or_ranged(spirit_empress, melee).
splash(spirit_empress, false).

card(goblin_machine, troop).
has_rarity(goblin_machine, legendary).
elixir_cost(goblin_machine, 5).
in_arena(goblin_machine, miner_s_mine).
damage(goblin_machine, 175).
hitpoints(goblin_machine, 1780).
targets(goblin_machine, ground).
melee_or_ranged(goblin_machine, melee).
splash(goblin_machine, false).
count(goblin_machine, 1).

card(mother_witch, troop).
has_rarity(mother_witch, legendary).
elixir_cost(mother_witch, 4).
in_arena(mother_witch, miner_s_mine).
targets(mother_witch, air).
targets(mother_witch, ground).
range_value(mother_witch, 5.5).
melee_or_ranged(mother_witch, ranged).
splash(mother_witch, false).
count(mother_witch, 1).

card(fisherman, troop).
has_rarity(fisherman, legendary).
elixir_cost(fisherman, 3).
in_arena(fisherman, miner_s_mine).
damage(fisherman, 161).
hitpoints(fisherman, 720).
targets(fisherman, ground).
melee_or_ranged(fisherman, melee).
splash(fisherman, false).

card(clone, spell).
has_rarity(clone, epic).
elixir_cost(clone, 3).
in_arena(clone, miner_s_mine).
melee_or_ranged(clone, ranged).
splash(clone, true).

card(mirror, spell).
has_rarity(mirror, epic).
elixir_cost(mirror, 1).
in_arena(mirror, miner_s_mine).
melee_or_ranged(mirror, ranged).
splash(mirror, true).

card(tornado, spell).
has_rarity(tornado, epic).
elixir_cost(tornado, 3).
in_arena(tornado, miner_s_mine).
damage(tornado, 52).
targets(tornado, air).
targets(tornado, ground).
melee_or_ranged(tornado, ranged).
splash(tornado, true).

card(void, spell).
has_rarity(void, epic).
elixir_cost(void, 3).
in_arena(void, miner_s_mine).
targets(void, air).
targets(void, ground).
melee_or_ranged(void, ranged).
splash(void, true).

card(golden_knight, troop).
has_rarity(golden_knight, champion).
elixir_cost(golden_knight, 4).
in_arena(golden_knight, executioner_s_kitchen).
damage(golden_knight, 161).
hitpoints(golden_knight, 1799).
targets(golden_knight, ground).
melee_or_ranged(golden_knight, melee).
splash(golden_knight, false).
count(golden_knight, 1).

card(skeleton_king, troop).
has_rarity(skeleton_king, champion).
elixir_cost(skeleton_king, 4).
in_arena(skeleton_king, executioner_s_kitchen).
targets(skeleton_king, ground).
melee_or_ranged(skeleton_king, melee).
splash(skeleton_king, true).
count(skeleton_king, 1).

card(boss_bandit, troop).
has_rarity(boss_bandit, champion).
elixir_cost(boss_bandit, 6).
in_arena(boss_bandit, royal_crypt).
damage(boss_bandit, 268).
hitpoints(boss_bandit, 2624).
targets(boss_bandit, ground).
melee_or_ranged(boss_bandit, melee).
splash(boss_bandit, false).
count(boss_bandit, 1).

card(archer_queen, troop).
has_rarity(archer_queen, champion).
elixir_cost(archer_queen, 5).
in_arena(archer_queen, royal_crypt).
damage(archer_queen, 225).
hitpoints(archer_queen, 1000).
targets(archer_queen, air).
targets(archer_queen, ground).
range_value(archer_queen, 5).
melee_or_ranged(archer_queen, ranged).
splash(archer_queen, false).
count(archer_queen, 1).

card(mighty_miner, troop).
has_rarity(mighty_miner, champion).
elixir_cost(mighty_miner, 4).
in_arena(mighty_miner, royal_crypt).
hitpoints(mighty_miner, 2250).
targets(mighty_miner, ground).
melee_or_ranged(mighty_miner, melee).
splash(mighty_miner, false).
count(mighty_miner, 1).

card(goblinstein, troop).
has_rarity(goblinstein, champion).
elixir_cost(goblinstein, 5).
in_arena(goblinstein, silent_sanctuary).
targets(goblinstein, air).
targets(goblinstein, ground).
range_value(goblinstein, 5.5).
melee_or_ranged(goblinstein, ranged).
splash(goblinstein, false).
count(goblinstein, 1).

card(little_prince, troop).
has_rarity(little_prince, champion).
elixir_cost(little_prince, 3).
in_arena(little_prince, silent_sanctuary).
targets(little_prince, air).
targets(little_prince, ground).
range_value(little_prince, 5.5).
melee_or_ranged(little_prince, ranged).
splash(little_prince, false).
count(little_prince, 1).

card(monk, troop).
has_rarity(monk, champion).
elixir_cost(monk, 5).
in_arena(monk, silent_sanctuary).
damage(monk, 140).
hitpoints(monk, 2150).
targets(monk, ground).
melee_or_ranged(monk, melee).
splash(monk, false).
count(monk, 1).