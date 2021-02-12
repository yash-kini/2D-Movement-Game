/// @description Insert description here
key_rope = keyboard_check_pressed(vk_lshift) or keyboard_check_pressed(vk_space); 
key_left = keyboard_check(ord("A")); //if key is held down
key_right = keyboard_check(ord("D")); 
key_up = keyboard_check(ord("W")); //if key is held down
key_down = keyboard_check(ord("S")); 
var move = key_right - key_left;

//Dismount
if (key_rope){
	var inst = instance_create_depth(x, y, 0, oPlayer); 
	with (inst){
		hsp = (other.swing_speed + 1)*other.launch_speed;
		vsp = -abs(power(other.launch_speed,1.5)); 
	}
	instance_destroy();
}
h = grv;
if (hook_angle > 90 && hook_angle < 270) {
	h*=-1; //Gravity Damping
}

//Movement Calculations
swing_speed += h + move/100;
//Collison check
hook_angle += (swing_speed);
x_ = -hook_distance*dcos(hook_angle) + hook.x;
y_ = hook_distance*dsin(hook_angle) + hook.y;
if (place_meeting(x_, y_, oWall)) {
	hook_angle -= swing_speed; // Undo previous hook angle
	swing_speed *= (-.5); // Collison damping
	hook_angle += swing_speed; //Set angle the opposite direction
	x_ = -hook_distance*dcos(hook_angle) + hook.x;
	y_ = hook_distance*dsin(hook_angle) + hook.y;
}

//Climb up/down rope
if(key_up or key_down){
	var moveVert = key_down - key_up
	if (hook_distance + moveVert*climb_speed > min_hook_distance){
		hook_distance +=  moveVert*climb_speed; 
	}
}

//Ground Collision Dismount
if (place_meeting(x_, y_+10, oWall)) {
	var inst = instance_create_depth(x, y, 0, oPlayerStandRope); 
	with (inst){
		hsp = other.x_ - other.x;
		vsp = other.y_ - other.y; 
	}
	instance_destroy();
}


// Move player
x = x_;
y = y_;

