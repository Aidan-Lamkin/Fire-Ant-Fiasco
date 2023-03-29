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
}
