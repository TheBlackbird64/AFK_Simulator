// animations

function action_draw_joueur() {
	if vie > 0 {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, event_string_to_color(col), image_alpha)
		
		var ecart = 2
		
		draw_set_color(c_black)
		draw_rectangle(x, y-obj_haut()-15, x+sprite_width, y-obj_haut()-30, true)
		draw_set_color($00FF00)
		draw_rectangle(x+ecart, y-obj_haut()-15-ecart, x+ecart + (vie/global.vie_max)*(obj_larg()*2-2*ecart), y-obj_haut()-30+ecart, false)
	}
}
