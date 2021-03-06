/// @description Setup Camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;

//Wiggle room before the camera starts to move
xBoundary = 0;
yBoundary = 0;

xTo = xstart;
yTo = ystart;

//Parallax Backgrounds
City0 = layer_get_id("City0");
City1 = layer_get_id("City1");
City2 = layer_get_id("City2");
City3 = layer_get_id("City3");
City4 = layer_get_id("City4");