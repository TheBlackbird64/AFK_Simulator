obj_set_scale(0.5)

var _id = collision_circle(x, y, sprite_width, mur_jeu, false, true)

if noone != _id {
	if _id.image_index != 0 {image_index = _id.image_index}
}
else {
	image_index = 3
	if col < global.gen_val_inferieure+0.14 {image_index = 2}
	if col < global.gen_val_inferieure+0.07 {image_index = 1}
	if col < global.gen_val_inferieure {image_index = 0}
}