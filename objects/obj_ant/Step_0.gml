/// @description Insert description here


if(dir > 0){
	sprite_index = ant_walk_right
}else {
	sprite_index = ant_walk_left
}

if(hp <= 0){
	instance_destroy(self, true)
}



//walk closer to the player
if(abs(obj_player.x - x) < 25 ){
	if(dir > 0){
		sprite_index = ant_idle_right
	}else {
		sprite_index = ant_idle_left
	}
	hsp = 0
}else if(obj_player.x > x){

	dir = 1
	
	hsp = spd*dir
}else if(obj_player.x < x){

	dir = -1
	
	hsp = spd*dir
}

// if I'm above the player, hop down to a lower level if given the opportunity
// otherwise build a bridge or climb to get to her

//the player is below us
if(obj_player.y > y){
	
	
} else {
	//we're on the edge of a precipice
	if(!place_meeting(x+(sprite_width-25)+hsp, y + vsp, obj_ground)){
		
		//stop moving
		if(dir > 0){
			sprite_index = ant_idle_right
		}else {
			sprite_index = ant_idle_left
		}
		hsp = 0
	}
}

// about to hit a wall
if(place_meeting(x+hsp,y-10,obj_ground)){
		//stop moving
		if(dir > 0){
			sprite_index = ant_idle_right
		}else {
			sprite_index = ant_idle_left
		}
		hsp = 0
}


if (place_meeting(x, y + vsp, obj_ground)) {
	// I am going to hit a block with my feet/head on the next frame.
	
	/*
	while (!place_meeting(x, y + sign(vsp), obj_ground)) {
		y += sign(vsp);
	}
	*/
	
	
	vsp = 0;
	//grounded = true;
}else{
	vsp += grv
}

if(hit){
	hsp = dir*-1*20
	vsp =-5
}
x += hsp
y+= vsp