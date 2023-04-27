/// @description Insert description here
// You can write your code in this editor
if(!hit){
	hp -= other.dmg
}
instance_destroy(other);
hit = true
audio_play_sound(snd_damage,1,false);
alarm[2] = 0.1*room_speed