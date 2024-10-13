if active {
	draw_reset_all()
	
	draw_text(30, debug_ligne(true), "debug mode")
	draw_text(30, debug_ligne(), "fps: " + string(fps))
	draw_text(30, debug_ligne(), "player: " + string(instance_exists(player)))


	try {
		
	} catch (e) {}
}