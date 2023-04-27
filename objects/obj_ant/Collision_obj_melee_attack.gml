/// @description Insert description here
// You can write your code in this editor


hit = true
if(instance_exists(obj_player)){
	if(obj_player.holding_sword){
		instance_destroy()
	}
}
alarm[0] = 0.05*room_speed