/* File : enemy.pl */
/* Place to store Enemy Facts */

/* ID and Name */
enemy_type(0, 'Slime').
enemy_type(1, 'Goblin').
enemy_type(2, 'Wolf').
enemy_type(3, 'Dragon').

/* Enemy Base Stats */
enemy_health(0, 50).
enemy_health(1, 100).
enemy_health(2, 200).
enemy_health(3, 10000).

enemy_attack(0, 10).
enemy_attack(1, 25).
enemy_attack(2, 40).
enemy_attack(3, 1000).

enemy_defense(0, 20).
enemy_defense(1, 10).
enemy_defense(2, 30).
enemy_defense(3, 1000).

enemy_special(0, 30).
enemy_special(1, 50).
enemy_special(2, 75).
enemy_special(3, 2000).

/* Enemy Stats by Level */