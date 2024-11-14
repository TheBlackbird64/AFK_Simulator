if active {
	draw_reset_all()
	
	draw_text(30, debug_ligne(true), "debug mode")
	draw_text(30, debug_ligne(), "fps: " + string(fps))
	draw_text(30, debug_ligne(), "focus: " + string(global.focus))
	draw_text(30, debug_ligne(), "fen: " + string(instance_number(menu_jeu_fen_jouer)))


	try {
		
	} catch (e) {}
}