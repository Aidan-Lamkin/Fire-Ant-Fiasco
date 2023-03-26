/// @description Insert description here
// You can write your code in this editor


var jumping = keyboard_check_pressed(vk_space);

//mvment
if(grounded){
	curr_jumps = 0
}

vsp += grv

if(place_meeting(x,y+vsp, obj_ground)) {
	while(!place_meeting(x,y+sign(vsp),obj_ground)){
		y+=sign(vsp)
	}
	vsp = 0
	grounded = true
}else{
	grounded = false
	alarm[0] = 0.1*room_speed
}

if ((curr_jumps < max_jumps) && jumping) {
	if(curr_jumps == 1){
		vsp = 0
	}
	curr_jumps += 1
	
	vsp -= (jspd);
	if (place_meeting(x, y + vsp, obj_ground)) {
		// I am going to hit a block with my feet/head on the next frame.
		while (!place_meeting(x, y + sign(vsp), obj_ground)) {
			y += sign(vsp);
		}
		vsp = 0;
		grounded = true;
	} else {
		grounded = false;
		alarm[0] = 0.1*room_speed
	}
	
	
	
	if(dir > 0){
		sprite_index = bug_idle
	} else {
		sprite_index = bug_idle_left
	}
}


if(keyboard_check(vk_left) or keyboard_check(ord("A"))){
	if(grounded){
		sprite_index = bug_walk_left
	}
	dir = -1
	x -= hsp
}else if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
	if(grounded){
		sprite_index = bug_walk_right
	}
	dir = 1
	x += hsp
}else{
	if(dir > 0){
		sprite_index = bug_idle
	} else {
		sprite_index = bug_idle_left
	}
	
}
y += vsp
