/// @description Update Camera

//Update Destination
if (instance_exists(follow)) {
	// If player is approaching boundaries of screen move camera
	if (abs(xTo - follow.x) > xBoundary) {
			xTo = follow.x + (sign(xTo - follow.x) * xBoundary);
	}
	if (abs(yTo - follow.y) > yBoundary) {
		yTo = follow.y + (sign(yTo - follow.y) * yBoundary);
	}


}

//Update Object Position
x += (xTo - x) / 25; // 25 will smooth the camera movement. 
y += (yTo - y) / 25;

//Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

//Parallax Backgrounds
if (layer_exists(City1)){
	layer_x(City1, x/1.1);
}
if (layer_exists(City2)){
	layer_x(City2, x/1.5);
}
if (layer_exists(City3)){
	layer_x(City3, x/2);
}
if (layer_exists(City4)){
	layer_x(City4, x/4);
}