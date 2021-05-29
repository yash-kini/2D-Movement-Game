/// @description State transitions
key_rope = mouse_check_button_pressed(mb_right) or keyboard_check_pressed(vk_space); 

//Voluntary Dismount
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
	show_debug_message("HOOK swinging: "+string(hook));
	with (inst){
		hsp = other.x_ - other.x;
		vsp = other.y_ - other.y; 
		self.hook = other.hook;
		self.hook_angle = other.hook_angle;
		self.hook_distance = other.hook_distance;
	}
	instance_destroy(object_index);
}
