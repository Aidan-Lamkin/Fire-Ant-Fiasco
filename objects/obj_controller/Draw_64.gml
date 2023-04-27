/// @description Insert description here

if(room == Introduction){
	
	draw_set_font(fnt_introduction)
	draw_set_color(c_white)
	draw_set_halign(fa_middle)

	draw_text(room_width/2,room_height/2 - 70,"Welcome to Fire Ant Fiasco!");
	draw_text(room_width/2,(room_height/2) - 40,"Move with A and D keys.")
	draw_text(room_width/2,(room_height/2) - 10,"Jump with space.")
	draw_text(room_width/2,(room_height/2) + 20,"Hit space in air to double jump.")
	draw_text(room_width/2,(room_height/2) + 50,"Hit K to attack.")
	draw_text(room_width/2,(room_height/2) + 80,"Collect weapons in small room for power ups.")
	draw_text(room_width/2, (room_height/2) + 110, "Hit enter to start!")
} else if (room = EndRoom){
	draw_set_font(fnt_end)
	draw_set_color(c_black)
	draw_set_halign(fa_middle)
	draw_text(room_width/2,room_height/2 - 200,"Congratulations! You escaped!");
	
	
}else{
	if(instance_exists(obj_player)){
		var pc = (obj_player.hp/obj_player.max_hp)*100
		draw_healthbar(window_get_width()-250, window_get_height()-50, window_get_width()-25, window_get_height()-25, pc, c_black, c_red, c_lime, 0, true, true)
	}
	
	if(instance_exists(obj_player)){
		if(obj_player.holding_sword){
			draw_sprite_ext(sword, -1 ,window_get_width() - 50, window_get_height() - 85, 1, 1, 90, c_white, 1)
		
		if(obj_player.has_speed){
			draw_sprite_ext(soda_can, -1 ,window_get_width() - 80, window_get_height() - 85, 1, 1, 0, c_white, 1)
		}
	}
	}
	
	
}

