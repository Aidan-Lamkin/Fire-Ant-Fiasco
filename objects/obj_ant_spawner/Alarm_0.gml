/// @description Insert description here
// You can write your code in this editor

//goes in alarm[0]
// TODO: some visual queue
alarm[1]=1*room_speed

if(place_meeting(x-sprite_width, y, obj_ground)){
	instance_create_layer(x+(sprite_width*2)-32, y+(sprite_height/2)+10, "Instances", obj_ant_spawn_animation_right)
	
}
else{
	instance_create_layer(x-sprite_width+30, y+(sprite_height/2)+10,"Instances", obj_ant_spawn_animation_left)
}