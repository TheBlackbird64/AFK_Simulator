if not config {
	config = true
	
	var inst = collision_circle(x, y, sprite_width, sol_color, false, true)
	if inst.config {
		col = inst.col
	}
	else {
		//var _graine_save = gen_nb_rnd(-1, true)
	
		var r = gen_random_range(0, 15, 0) * 17
		var g = gen_random_range(0, 15, 0) * 17
		var b = gen_random_range(0, 15, 0) * 17
	
		col = make_color_rgb(r, g, b)
		//gen_nb_rnd(_graine_save)
	}
}