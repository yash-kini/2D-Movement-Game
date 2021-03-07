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
if (layer_exists(City0)){
	layer_y(City0, y - view_h_half);
}
if (layer_exists(City1)){
	layer_x(City1, x/1.1);
	layer_y(City1, y - view_h_half);
}
if (layer_exists(City2)){
	layer_x(City2, x/1.5);
	layer_y(City2,  y - view_h_half);
}
if (layer_exists(City3)){
	layer_x(City3, x/2);
	layer_y(City3,  y/1.01 - view_h_half);
}
if (layer_exists(City4)){
	layer_x(City4, x/4);
	layer_y(City4, y/1.1 - view_h_half + 600);
}