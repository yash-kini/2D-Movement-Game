/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y, oWall)) {
	instance_destroy();
}
if (person_type = oPlayer) {
	if (place_meeting(x, y, oEnemy)){
		show_debug_message("enemy hit");
		e = instance_position( x, y, oEnemy );
		if (instance_exists(e)){
			e.hp -= 1;
		}
		instance_destroy();
	}
} 
if (person_type = oEnemy) { 
	if (place_meeting(x, y, oPlayer)) {

		p = instance_position( x, y, oPlayer);
		if (instance_exists(p)) {
			p.hp -= 1;
			show_debug_message(string(p.hp));
		}
		instance_destroy();

	}
}