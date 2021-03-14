function scr_pickHook(){
	mx = mouse_x;
	my = mouse_y;

	hook = instance_nearest(mx, my, oHook);
	hook_distance = point_distance(mx, my, hook.x, hook.y);
	if (hook_distance < 400) {
		hook_angle = point_direction( x, y, hook.x, hook.y);
		min_hook_distance = 100; 
		hook_distance = max(point_distance( x, y, hook.x, hook.y), min_hook_distance);
		array[0] = hook;
		array[1] = hook_angle;
		array[2] = hook_distance;
		return array;
	}
}