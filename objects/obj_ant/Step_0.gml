/// @description Insert description here

var keyleft = keyboard_check(vk_left);
var keyright = keyboard_check(vk_right);

var move = keyleft - keyright;


hsp = spd * move;

// Choosing the player walk/idle skin.
if (move != 0) {
	image_xscale = move;
	x -= hsp; 
	sprite_index = ant_walk;
} else {
	sprite_index = ant_idle;
	
}
