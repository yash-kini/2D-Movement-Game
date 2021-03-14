/// @description Is player staning or should they be swinging
key_rope = mouse_check_button_pressed(mb_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate new hook_distance, and hook_angle
hook_distance = point_distance(hook.x, hook.y, x, y);
hook_angle = point_direction( x, y, hook.x, hook.y);



//Dismount
if (key_rope){
	instance_destroy(object_index);
	var inst = instance_create_depth(x, y, 0, oPlayer); 
	with (inst) { 
		self.hp = other.hp;
	}
}
//Jump
else if (key_jump) {
	instance_destroy(object_index);
	var inst = instance_create_depth(x, y, 0, oPlayerRope); 
	show_debug_message("HOOK standing: "+string(hook));
	with (inst) {
		self.hp = other.hp;
		self.hook = other.hook;
		self.hook_angle = other.hook_angle;
		self.hook_distance = other.hook_distance - 50; //shorten rope if player jumps
	}
}
else {
	var ground = 0; // if touching ground
	if (place_meeting(x, y+10, oWall)){ ground = 1; }

	if (not ground) {
		instance_destroy(object_index);
		var inst = instance_create_depth(x, y, 0, oPlayerRope); 
		show_debug_message("HOOK standing: "+string(hook));
		with (inst) {
			self.hp = other.hp;
			self.hook = other.hook;
			self.hook_angle = other.hook_angle;
			self.hook_distance = other.hook_distance;

		}
	}
}

