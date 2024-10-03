function action_draw_joueur() {
	if vie > 0 {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, event_string_to_color(col), image_alpha)
	}
}