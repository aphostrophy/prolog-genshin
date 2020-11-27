
/*Nanti disatuin semua ke main biar ada game state (battle,shop,inventory,travelling,dll). */

shop:- game_state(shopactive),!,writeShopUsedMessage,fail.
shop:-
    map_entity(X,Y,'P'),
    map_entity(X,Y,'S'),
    retract(game_state(travelling)),
    assertz(game_state(shopactive)),!,
    write('==============================================='),nl,
    write('                  S   H   O   P                '),nl,
    write('==============================================='),nl,nl,
    write('Welcome! what do you want to do?'),nl,
    write('1. Gacha (1000 gold)'),nl,
    write('2. Buy health Potion (100 gold)'),nl,
    write('3. Buy panas spesial 2 mekdi (150 gold)'),nl,
    write('4. Buy sadikin (200 gold)'),nl,
    write('5. Buy go milk (250 gold)'),nl,
    write('6. Buy crisbar (300 gold)'),nl,
    write('7. Sell item(s)'),nl,nl,
    write('================================================'),nl.
shop:- !,writeNotShopTile.

% GACHA 
listIdx([X], 0, X).
listIdx([H|_], 0, H).
listIdx([_|T], I, E) :- 
    I2 is I-1, 
    listIdx(T, I2, E).

listitem(['waster greatsword','waster greatsword','waster greatsword','waster greatsword','waster greatsword',
           'old merc pal', 'old merc pal','old merc pal','old merc pal',
           'debate club','debate club','debate club',
           'prototype aminus','prototype aminus',
           'wolf greatsword',
           'hunter bow','hunter bow','hunter bow','hunter bow','hunter bow',
           'seasoned hunter bow','seasoned hunter bow','seasoned hunter bow','seasoned hunter bow',
           'messenger','messenger','messenger',
           'favonius warbow','favonius warbow',
           'skyward harp',
           'apprentice notes','apprentice notes','apprentice notes','apprentice notes','apprentice notes',
           'pocket grimoire','pocket grimoire','pocket grimoire','pocket grimoire',
           'emerald orb','emerald orb','emerald orb',
           'mappa mare','mappa mare',
           'skyward atlas',
           'wooden armor','wooden armor','wooden armor','wooden armor','wooden armor',
           'iron armor','iron armor','iron armor','iron armor',
           'steel armor','steel armor','steel armor',
           'golden armor','golden armor',
           'diamond armor']).

gacha:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
gacha:- current_gold(G),price('gacha',P),G<P,writeNotEnoughGold,fail.
gacha:-
    listitem(L),
    game_state(shopactive),
    current_gold(G),
    price('gacha',P),
    G >= P,
    retract(current_gold(G)),
    G2 is G-P,
    assertz(current_gold(G2)),
    random(0,59,X),
    listIdx(L,X,E),
    addToInventory([E|1]),
    writeGacha(E),!.

writeGacha(E):-
    \+(ultraRareItem(E)),
    \+(rareItem(E)),
    type(C,E),
    format('You got ~w [type : ~w].~n',[E,C]).

writeGacha(E):-
    ultraRareItem(E),
    type(C,E),
    format('Congratulation! you got ~w [type : ~w] (ULTRA RARE).~n',[E,C]).

writeGacha(E):-
    rareItem(E),
    type(C,E),
    format('Congratulation! you got ~w [type : ~w] (RARE).~n',[E,C]).
    
% POTION

healthpotion:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
healthpotion:- current_gold(G),price('health potion',P),G<P,writeNotEnoughGold,fail.
healthpotion:-
    game_state(shopactive),
    current_gold(G),
    price('health potion',P),
    G >= P,
    retract(current_gold(G)),
    G2 is G-P,
    assertz(current_gold(G2)),
    addToInventory(['health potion'|1]),
    write('Thanks for buying!'),nl.

panas:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
panas:- current_gold(G),price('panas',P),G<P,writeNotEnoughGold,fail.
panas:-
    game_state(shopactive),
    current_gold(G),
    price('panas spesial 2 mekdi', P),
    G >= P,
    retract(current_gold(G)),
    G2 is G-P,
    assertz(current_gold(G2)),
    addToInventory(['panas 2 spesial mekdi'|1]),
    write('Thanks for buying!'),nl.

sadikin:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
sadikin:- current_gold(G),price('sadikin',P),G<P,writeNotEnoughGold,fail.
sadikin:-
    game_state(shopactive),
    current_gold(G),
    price('sadikin', P),
    G >= P,
    retract(current_gold(G)),
    G2 is G-P,
    assertz(current_gold(G2)),
    addToInventory(['sadikin'|1]),
    write('Thanks for buying!'),nl.

gomilk:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
gomilk:- current_gold(G),price('go milk',P),G<P,writeNotEnoughGold,fail.
gomilk:-
    game_state(shopactive),
    current_gold(G),
    price('go milk',P),
    G >= P,
    retract(current_gold(G)),
    G2 is G-P,
    assertz(current_gold(G2)),
    addToInventory(['go milk'|1]),
    write('Thanks for buying!'),nl.

crisbar :- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
crisbar:- current_gold(G),price('crisbar',P),G<P,writeNotEnoughGold,fail.
crisbar:-
    game_state(shopactive),
    current_gold(G),
    price('crisbar',P),
    G >= P,
    retract(current_gold(G)),
    G2 is G-P,
    assertz(current_gold(G2)),
    addToInventory(['crisbar'|1]),
    write('Thanks for buying!'),nl.

exitShop:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.

exitShop:-
    retract(game_state(shopactive)),
    assertz(game_state(travelling)),
    write('Farewell Traveller'),nl.

writeShopIsNotOpenMessage :-
    write('Please open the shop first'),nl.
writeNotShopTile :-
    write('You are not in the shop, use \"map\" to find the shop!'),nl.
writeNotEnoughGold :-
    write('Not enough gold! go clear the quests to get some gold!'),nl.
writeShopUsedMessage :-
    write('You have already opened shop'), nl.

hehe:-
    write('EHE TE NANDAYO?'),nl.

sell:- \+game_state(shopactive),!,writeShopIsNotOpenMessage,fail.
sell :-
    game_state(shopactive),
    inventory,
    write('Type the item\'s name you wish to sell: '), read(Name),
    write('Type the amount of that item: '), read(Amount),
    handle_sell(Name,Amount).


