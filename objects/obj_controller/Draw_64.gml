/// @description Insert description here

if(room == Introduction){
	
	draw_set_font(fnt_introduction)
	draw_set_color(c_white)
	draw_set_halign(fa_middle)

	draw_text(room_width/2,room_height/2 - 40,"Welcome to Fire Ant Fiasco!");
	draw_text(room_width/2,(room_height/2) - 10,"Move with left and right arrow keys.")
	draw_text(room_width/2,(room_height/2) + 20,"Jump with space.")
	draw_text(room_width/2,(room_height/2) + 50,"Hit space in air to double jump.")
	draw_text(room_width/2, (room_height/2) + 80, "Hit enter to start!")
}else{
	if(instance_exists(obj_player)){
		var pc = (obj_player.hp/obj_player.max_hp)*100
		draw_healthbar(window_get_width()-250, window_get_height()-50, window_get_width()-25, window_get_height()-25, pc, c_black, c_red, c_lime, 0, true, true)
	}
}

