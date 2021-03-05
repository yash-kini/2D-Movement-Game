/// @description Insert description here
key_rope = keyboard_check_pressed(vk_lshift) or keyboard_check_pressed(vk_space); 

//Dismount
if (key_rope){
	var inst = instance_create_depth(x, y, 0, oPlayer); 
	with (inst){
		hsp = (other.swing_speed + 1)*other.launch_speed;
		vsp = -abs(power(other.launch_speed,1.5)); 
	}
	instance_destroy(object_index);
}
//Ground Collision Dismount
else if (place_meeting(x_, y_+10, oWall)) {
	var inst = instance_create_depth(x, y, 0, oPlayerStandRope); 
	with (inst){
		hsp = other.x_ - other.x;
		vsp = other.y_ - other.y; 
	}
	instance_destroy(object_index);
}
