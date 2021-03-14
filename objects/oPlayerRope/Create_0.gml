/// @description Insert description here
//Defined Values
swing_speed = 2;
grv = .1;
launch_speed = 5;
hp = 4;
climb_speed = 3;

//needs to be set by previous state
hook = -1; // Id of hook attached to, 
hook_angle = -1 // angle of line rope from player to hook
hook_distance = 0 // distance from player to hook
show_debug_message("HOOK swinging: "+string(hook));
min_hook_distance = 100;

if (hook_angle > 90 && hook_angle < 270) {
	swing_speed*= -1;
}


 