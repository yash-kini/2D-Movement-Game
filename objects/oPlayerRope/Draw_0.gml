/// @description Draw rope & change swing sprite
// You can write your code in this editor
draw_set_color(c_orange);
if (swing_speed < 0 ) {
	draw_sprite(sPlayerSwingB, 0, x, y);

}else {
	draw_sprite(sPlayerSwingF, 0, x, y);
}
draw_line(x, y, hook.x, hook.y);