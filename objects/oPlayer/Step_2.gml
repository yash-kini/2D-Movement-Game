/// @description Throw rope
key_rope = mouse_check_button_pressed(mb_right);
if (key_rope){
	pickHookArr = scr_pickHook();
	if (array_length(pickHookArr) != 0) {
		instance_destroy(object_index);
		var inst = instance_create_depth(x, y, 0, oPlayerStandRope); 
		hook = pickHookArr[0];
		hook_angle = pickHookArr[1];
		hook_distance = pickHookArr[2];
		with (inst) {
			self.hp = other.hp;
			self.hook = other.hook;
			self.hook_distance = other.hook_distance;
			self.hook_angle = other.hook_angle;
		}
	}
}