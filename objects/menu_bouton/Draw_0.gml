if cam_sync {
	x = cam_sync_x(_x)
	y = cam_sync_y(_y)
	obj_set_scale(scale, true)
}

draw_set_all(c_white, image_alpha, fa_middle, fa_center, Font_principal)
draw_self()
if active {draw_text_transformed(x, y, texte, sprite_width/100, sprite_height/100, 0)}