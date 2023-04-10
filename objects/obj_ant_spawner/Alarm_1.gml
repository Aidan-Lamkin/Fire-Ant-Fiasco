/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x-sprite_width, y, obj_ground)){
	instance_create_layer(x+(sprite_width*2), y+(sprite_height/2), "Instances", obj_ant)
}
else{
	instance_create_layer(x-sprite_width, y+(sprite_height/2),"Instances", obj_ant)
}
