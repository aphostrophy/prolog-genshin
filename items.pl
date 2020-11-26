/* FILE items.pl */
/* Storing items and its details */

/* FACTS */

item('health potion').
item('panas spesial 2 mekdi').
item('sadikin').
item('go milk').
item('crisbar').
item('waster greatsword').
item('debate club').
item('prototype aminus').
item('wolf greatsword').
item('hunter bow').
item('seasoned hunter bow').
item('messenger').
item('favonius warbow').
item('skyward harp').
item('apprentice notes').
item('pocket grimoire').
item('emerald orb').
item('mappa mare').
item('skyward atlas').
item('wooden armor').
item('iron armor').
item('steel armor').
item('golden armor').
item('diamond armor').

type(consumable, 'health potion').
type(consumable, 'panas spesial 2 mekdi').
type(consumable, 'sadikin').
type(consumable, 'go milk').
type(consumable, 'attack potion S').
type(consumable, 'attack potion M').
type(consumable, 'attack potion L').
type(consumable, 'defense potion S').
type(consumable, 'defense potion M').
type(consumable, 'defense potion L').
type(claymore, 'waster greatsword').
type(claymore, 'old merc pal').
type(claymore, 'debate club').
type(claymore, 'prototype aminus').
type(claymore, 'wolf greatsword').
type(bow,'hunter bow').
type(bow,'seasoned hunter bow').
type(bow,'messenger').
type(bow,'favonius warbow').
type(bow,'skyward harp').
type(catalyst,'apprentice notes').
type(catalyst,'pocket grimoire').
type(catalyst,'emerald orb').
type(catalyst,'mappa mare').
type(catalyst,'skyward atlas').
type(armor,'wooden armor').
type(armor,'iron armor').
type(armor,'steel armor').
type(armor,'golden armor').
type(armor,'diamond armor').

weapon(bow).
weapon(catalyst).
weapon(claymore).

cover(armor).

/*harga shop*/
price('health potion', 100).
price('panas spesial 2 mekdi',150).
price('sadikin',200).
price('go milk',250).
price('crisbar',300).
price('gacha',1000).

/*item rare*/
ultraRareItem('wolf greatsword').
ultraRareItem('skyward harp').
ultraRareItem('skyward atlas').
ultraRareItem('diamond armor').
rareItem('prototype aminus').
rareItem('favonius warbow').
rareItem('mappa mare').
rareItem('golden armor').

/* Type consumable */
consumable_type('health potion', heal).
consumable_type('panas spesial 2 mekdi', heal).
consumable_type('sadikin', heal).
consumable_type('go milk', heal).
consumable_type('crisbar', heal).

consumable_type('attack potion S', att).
consumable_type('attack potion M', att).
consumable_type('attack potion L', att).

consumable_type('defense potion S', def).
consumable_type('defense potion M', def).
consumable_type('defense potion L', def).

/* Properti buat consumable. Health, Attack, atau Defense nambah sebesar Arrity kedua */
property('health potion', Health) :- Health is 75.
property('panas spesial 2 mekdi', Health) :- Health is 150.
property('sadikin', Health) :- Health is 250.
property('go milk', Health) :- Health is 320.
property('crisbar', Health) :- Health is 450.

property('attack potion S', Attack) :- Attack is 50.
property('attack potion M', Attack) :- Attack is 100.
property('attack potion L', Attack) :- Attack is 200.

property('defense potion S', Defense) :- Defense is 25.
property('defense potion M', Defense) :- Defense is 50.
property('defense potion L', Defense) :- Defense is 100.

/* Properti buat claymore, bow, catalyst. Attack nambah sebesar Arrity kedua */
property('waster greatsword', Attack) :- Attack is 30.
property('old merc pal', Attack) :- Attack is 70.
property('debate club', Attack) :- Attack is 120.
property('prototype aminus', Attack) :- Attack is 180.
property('wolf greatsword', Attack) :- Attack is 250.

property('hunter bow', Attack) :- Attack is 40.
property('seasoned hunter bow', Attack) :- Attack is 90.
property('messenger', Attack) :- Attack is 150.
property('favonius warbow', Attack) :- Attack is 230.
property('skyward harp', Attack) :- Attack is 300.

property('apprentice notes', Attack) :- Attack is 50.
property('pocket grimoire', Attack) :- Attack is 110.
property('emerald orb', Attack) :- Attack is 175.
property('mappa mare', Attack) :- Attack is 320.
property('skyward atlas', Attack) :- Attack is 410.

/* Properti buat armor. Defense dan Health nambah sebesar Arrity kedua dan ketiga */
property('wooden armor', Defense, Health) :-
    Defense is 50,
    Health is 20.
property('iron armor', Defense, Health) :-
    Defense is 120,
    Health is 60.
property('steel armor', Defense, Health) :-
    Defense is 200,
    Health is 100.
property('golden armor', Defense, Health) :-
    Defense is 290,
    Health is 150.
property('diamond armor', Defense, Health) :-
    Defense is 400,
    Health is 200.