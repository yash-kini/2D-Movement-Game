/// @description Insert description here
// You can write your code in this editor

left_click = mouse_check_button(mb_left);
x = oPlayer.x+16;
y = oPlayer.y+16;

mx = mouse_x;
my = mouse_y;

dir = point_direction(x,y,mx,my);
image_angle = dir; 

if (left_click) {
	var inst = instance_create_depth(x, y, 0, oBullet); 
	with (inst){
		speed = other.bullet_speed;
		direction = other.dir; 
		person = other;
		person_type = oPlayer;
	}
}