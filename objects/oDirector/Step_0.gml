/// @description Insert description here
// You can write your code in this editor
enemy = oEnemy; 
var i; 
for (i = 0; i < instance_number(oEnemy); i += 1) {
	e = instance_find(oEnemy, i);
	if (instance_exists(e) || e.hp <= 0) {
		enemy[i] = instance_find(oEnemy, i);
	}
}

scr_pickCover(enemy);