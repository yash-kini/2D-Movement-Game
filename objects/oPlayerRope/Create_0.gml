/// @description Insert description here
//Defined Values
swing_speed = 2;
grv = .1;
launch_speed = 5;
hp = 4;
climb_speed = 3;

//Calculated Values
hook = instance_nearest(x, y, oHook);
hook_angle = point_direction( x, y, hook.x, hook.y);
min_hook_distance = 100; 
hook_distance = max(point_distance( x, y, hook.x, hook.y), min_hook_distance);


if (hook_angle > 90 && hook_angle < 270) {
	swing_speed*= -1;
}


