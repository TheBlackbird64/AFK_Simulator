obj_set_scale(0.5)

if col != -1 {
	var _id = collision_circle(x, y, sprite_width, mur_jeu, false, true)

	if _id {
		if _id.image_index != 0 {image_index = _id.image_index}
		else {
			image_index = random_range(0, 2)
		}
	}
	else {
		var d = 1-global.gen_val_inferieure
		image_index = 3
		if col < global.gen_val_inferieure+2/3*d {image_index = 2}
		if col < global.gen_val_inferieure+1/3*d {image_index = 1}
		if col < global.gen_val_inferieure {image_index = 0}
	}
}