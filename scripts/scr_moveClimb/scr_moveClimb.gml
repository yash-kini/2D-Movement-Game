/// @description Insert description here
function scr_moveClimb(argument0, argument1) {
	// argument0: x positon of object to move towards

	x_pos = argument0
	enemy = argument1;

	//Calculate Movement
	x_= enemy.x;
	y_ = enemy.y; 
	var ground; //if touching ground

	var move = sign(x_pos - x_);
	if (abs(x_pos - x_) < 4){
		var move = 0;
	}
	enemy.vsp += enemy.grv;

	if (place_meeting(x_, y_+10, oWall)){
		ground = 1; 
		enemy.hsp = move * enemy.walksp;
	}
	else {
		ground = 0
	}

	//Horizontal Collision
	if (place_meeting(x_+enemy.hsp, y_, oWall)) {
		while (!place_meeting(x_+sign(enemy.hsp), y_, oWall)) {
			x_ += sign(enemy.hsp);
		}
		//Step
		if (!place_meeting(x_+sign(enemy.hsp), y_ +enemy.stp, oWall)){
			y_ += enemy.stp; 
			x_ += (-enemy.dir)*enemy.mag/2;
		}
		enemy.hsp = 0;
	}

	//Vault
	if (!enemy.anim) {
		if (place_meeting(x_+(-enemy.dir)*enemy.mag, y_ , oWall)){
			if (!place_meeting(x_+(-enemy.dir)*enemy.mag, y_ +enemy.vault, oWall) && (ground)){
					alarm_set(0, 30);
					enemy.sprite_index = sEnemyV; 
					enemy.anim = 1; 
				}
		}
	}

	//Vertical Collision
	if (place_meeting(x_, y_+enemy.vsp, oWall)) {
		while (!place_meeting(x_, y_+sign(enemy.vsp), oWall)) {
			y_ += sign(enemy.vsp);
		}
		enemy.vsp = 0;
	}

	//Animation
	if (!enemy.anim) {
		if (enemy.hsp != 0) enemy.dir = sign(enemy.hsp);
		enemy.image_xscale = enemy.dir; 
		if (enemy.hsp == 0 && enemy.vsp == 0) {
			enemy.sprite_index = sEnemy;
			//Cover
			if (place_meeting(enemy.x+enemy.mag*(-enemy.dir), enemy.y+enemy.stp, oWall)) {
				enemy.sprite_index = sEnemyC;
			}
	
		}
			if (enemy.hsp != 0) {
				enemy.sprite_index = sEnemyR; 
			}

			if (enemy.vsp != 0) {
				enemy.sprite_index = sPlayerA; 
				if (enemy.vsp > 0) {
					enemy.image_index = 1;
				} 
				else {
					enemy.image_index = 0;
				}
			}
			//Apply Movement
				enemy.x += enemy.hsp;
				enemy.y += enemy.vsp;
	}





}
