/// @description Insert description here
// You can write your code in this editor

var cam = view_camera[0];
var x1 = camera_get_view_x(cam);
var y1 = camera_get_view_y(cam);
var x2 = x1 + camera_get_view_width(cam);
var y2 = y1 + camera_get_view_height(cam);
if( point_in_rectangle( x, y, x1, y1, x2, y2)) { 
	randomize()
	spawn_time = random_range(0,5)
	alarm[0] = spawn_time*room_speed
}
