/// @description Insert description here
// You can write your code in this editor


var jumping = keyboard_check_pressed(vk_space);
var keyup = keyboard_check(ord("W"));
var keydown = keyboard_check(ord("S"));
var keyleft = keyboard_check(ord("A"));
var keyright = keyboard_check(ord("D"));
var vmove = keydown - keyup; 
var hmove = keyright - keyleft;

hsp = spd * hmove;

if(hp <=0){
	instance_destroy(self,false)
	game_restart()
}

//mvment
if(grounded){
	curr_jumps = 0;
}

vsp += grv;

if(has_speed){
	spd = 10;
}


if(keyboard_check(vk_left) or keyboard_check(ord("A"))){
	if(grounded){
		
		sprite_index = bug_walk_left
		
			
	}
	dir = -1
}else if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
	if(grounded){
		
		sprite_index = bug_walk_right
		
	}
	dir = 1
}else{
	if(dir > 0){
	
		sprite_index = bug_idle
				
		

	} else {
		
		sprite_index = bug_idle_left
				
		
			
			
	}
}

/*else if (dir > 0){
	if(keyboard_check(vk_left) or keyboard_check(ord("A"))){
		if(grounded){
			sprite_index = bug_walk_left
		}
		dir = -1
	}else{
		if(!striking){
			if(holding_sword){
				sprite_index = idle_sword_left;
			} else {
				sprite_index = bug_idle_left
			}
		}
		
	}

} else {
	if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
		if(grounded){
			sprite_index = bug_walk_right
		}
		dir = 1
	}else{
		if(!striking){
			if(holding_sword){
				sprite_index = idle_sword_right;
			} else {
				sprite_index = bug_idle
			}
		}
		
	}
}
*/

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
	
	
	if(!striking){
		if(dir > 0){
			sprite_index = bug_idle
		} else {
			sprite_index = bug_idle_left
		}
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

if (climbing && !striking) {
	vsp = vmove * spd;
	sprite_index = bug_idle;
}

if(holding_sword){
	attack = 4; 
}

if(keyboard_check_pressed(ord("K")) && can_strike){
	striking = true;
	can_strike = false
	alarm[0] = 0.25*room_speed
	
	if(dir > 0){
		instance_create_layer(x+(sprite_width/2)-20, y+20, "Instances", obj_melee_attack)
	}else{
		instance_create_layer(x-(sprite_width/2)+20, y+20, "Instances", obj_melee_attack)
	}

	
}

if(hit){
	
	vsp = -5
	if(dir > 0){
		hsp = -10
	}else{
		hsp = 10
	}
}


// Check horizontal collision with a block.
if (place_meeting(x + hsp, y, obj_ground)) {
      // I am going to hit a block on the next frame.
      while (!place_meeting(x + (sign(hsp)), y, obj_ground)) {
            x += sign(hsp);
      }
	  
      hsp = 0;
}



//check vertical collision with a block
if(place_meeting(x,y+vsp, obj_ground)) {
	
	while(!place_meeting(x,y+(sign(vsp)*(sprite_height/2-15)),obj_ground)){
		y+=(sign(vsp))
	}
	vsp = 0
	if(place_meeting(x,y+(sprite_height/2),obj_ground)){
		grounded = true
	}else{
		grounded = false
	}
}else{
	grounded = false
}

if(place_meeting(x,y+vsp, obj_ground) && (keyleft || keyright)){
	
}



y += vsp
x += hsp
