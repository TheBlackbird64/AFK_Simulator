draw_set_all(c_black, 1, fa_middle, fa_center, Font_grand)

if compteur > 60 {
	
	draw_text_transformed(cam_mid_x(), cam_mid_y(), ceil(((compteur_max-compteur)/compteur_max)*5), 1.5, 1.5, 0)
}