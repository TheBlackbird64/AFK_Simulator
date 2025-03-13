if not config {
	config = true
	var gen = true
	
	var inst = collision_circle(x, y, sprite_width, sol_color, false, true)
	if instance_exists(inst) {
		if inst.config {
			col = inst.col
			gen = false
		}
		else {
			gen = true
		}
	}
	
	
	if gen {
		//var _graine_save = gen_nb_rnd(-1, true)
		
		var r = min(gen_random_range(0, round(255/global.ajout_couleur)+1, 0) * global.ajout_couleur, 255)
		var g = min(gen_random_range(0, round(255/global.ajout_couleur)+1, 0) * global.ajout_couleur, 255)
		var b = min(gen_random_range(0, round(255/global.ajout_couleur)+1, 0) * global.ajout_couleur, 255)
		
		col = make_color_rgb(r, g, b)
		//gen_nb_rnd(_graine_save)
		
	}
}