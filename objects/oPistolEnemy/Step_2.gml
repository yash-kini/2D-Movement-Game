/// @description Insert description here
// You can write your code in this editor
if (instance_exists(enemy)) {
	x = enemy.x+16;
	y = enemy.y+16;

	mx = oPlayer.x;
	my = oPlayer.y;

	dir = point_direction(x,y,mx,my);
	image_angle = dir; 

	if (shoot) {
		var inst = instance_create_depth(x, y, 0, oBullet); 
		shoot = 0;
		alarm_set(0,trigger_pause);
		with (inst){
			speed = other.bullet_speed;
			direction = other.dir; 
			person_type = oEnemy;
			person = other.enemy; 
		}
	}
}
else {
	instance_destroy();
}