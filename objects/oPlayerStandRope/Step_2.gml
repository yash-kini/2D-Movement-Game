/// @description Is player staning or should they be swinging
key_rope = keyboard_check_pressed(vk_lshift);

//Dismount
if (key_rope){
	instance_destroy(object_index);
	var inst = instance_create_depth(x, y, 0, oPlayer); 
	with (inst) { 
		self.hp = other.hp;
	}

}


var ground = 0; // if touching ground
if (place_meeting(x, y+10, oWall)){ ground = 1; }

if (not ground) {
	instance_destroy(object_index);
	var inst = instance_create_depth(x, y, 0, oPlayerRope); 
	with (inst) {
		self.hp = other.hp;
	}
}
