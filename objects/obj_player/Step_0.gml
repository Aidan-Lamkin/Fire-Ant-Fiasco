/// @description Insert description here
// You can write your code in this editor


var jumping = keyboard_check_pressed(vk_space);
var keyup = keyboard_check(ord("W"));
var keydown = keyboard_check(ord("S"));
var vmove = keydown - keyup; 



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
}

if(!place_meeting(x+hsp,y-5,obj_ground)) {
	if(keyboard_check(vk_left) or keyboard_check(ord("A"))){
		if(grounded){
			if(holding_sword){
				sprite_index = bug_walk_left_sword;
			} else {
				sprite_index = bug_walk_left
			}
			
		}
		dir = -1
		hsp = dir * spd
	}else if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
		if(grounded){
			if(holding_sword){
				 
				sprite_index = bug_walk_right_sword;
				
				
			} else {
				sprite_index = bug_walk_right
			}
		}
		dir = 1
		hsp = dir*spd
	}else{
		if(dir > 0){
			if (holding_sword){
				sprite_index = idle_sword_right
				
			} else {
			  sprite_index = bug_idle
				
			}

		} else {
			if (holding_sword){
				sprite_index = idle_sword_left
				
			} else {
			  sprite_index = bug_idle_left
				
			}
			
			
		}
		hsp = 0
	}
}else if (dir > 0){
	if(keyboard_check(vk_left) or keyboard_check(ord("A"))){
		if(grounded){
			sprite_index = bug_walk_left
		}
		dir = -1
		hsp = dir * spd
	}else{
		if(holding_sword){
			sprite_index = idle_sword_left;
			hsp = 0;
		} else {
			sprite_index = bug_idle
			hsp = 0
		}
		
		
	}
} else {
	if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
		if(grounded){
			sprite_index = bug_walk_right
		}
		dir = 1
		hsp = dir*spd
	}else{
		if(holding_sword){
				sprite_index = idle_sword_right;
				hsp = 0
		} else {
			sprite_index = bug_idle_left
		hsp = 0
		}
		
		
	}
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
	}
	
	
	
	if(dir > 0){
		sprite_index = bug_idle
	} else {
		sprite_index = bug_idle_left
	}
}

// Climbing logic.
if (place_meeting(x, y+1, obj_ladder)) {
	if (vmove < 0 || 
	(vmove == 0 && climbing) || 
	(vmove > 0 && place_meeting(x, y+sprite_height, obj_ladder))) {
		climbing = true;
	} else {
		climbing = false;
	}
} else {
	climbing = false;
}

if (climbing) {
	vsp = vmove * spd;
	sprite_index = bug_idle;
}

if(holding_sword){
	attack = 4; 
}





y += vsp
x += hsp
