if active {
	draw_reset_all()
	
	draw_text(30, debug_ligne(true), "debug mode")
	draw_text(30, debug_ligne(), "fps: " + string(fps))
	draw_text(30, debug_ligne(), "focus: " + string(global.focus))
	draw_text(30, debug_ligne(), "x: " + string(mouse_x))
	draw_text(30, debug_ligne(), "y: " + string(mouse_y))


	try {
		
	} catch (e) {}
}