/// @description Throw rope
key_rope = keyboard_check_pressed(vk_lshift);
if (key_rope){
	instance_destroy(object_index);
	var inst = instance_create_depth(x, y, 0, oPlayerStandRope); 
	with (inst) {
		self.hp = other.hp;
	}
}