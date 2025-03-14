// animations

function action_draw_joueur() {
	if vie > 0 {
		var fade = 2000
		
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, event_string_to_color(col), image_alpha)
		
		var ecart = 2
		
		draw_set_all(c_black, (fade-temps) / fade, fa_middle, fa_center, Font_principal) 
		
		draw_text(x+obj_larg(), y-15, pseudo)
		draw_set_color(c_black)
		draw_rectangle(x, y-obj_haut()-10, x+sprite_width, y-obj_haut()-25, true)
		draw_set_color($00FF00)
		draw_rectangle(x+ecart, y-obj_haut()-10-ecart, x+ecart + (vie/global.vie_max)*(obj_larg()*2-2*ecart), y-obj_haut()-25+ecart, false)
		draw_reset_all()
		
		if connecte == "False" {
			draw_sprite_ext(S_connexion_icon, 0, x, y, 0.5, 0.5, 0, c_white, (fade-temps) / fade)
		}
	}
}

function action_mort_joueur(setup=false) {
		
	static _ps = part_system_create();
	static _pemit1 = part_emitter_create(_ps);
	static _ptype1 = part_type_create();
	
	if setup {
		part_system_draw_order(_ps, true);
		part_system_position(_ps, 0, 0);

		part_type_shape(_ptype1, pt_shape_square);
		part_type_size(_ptype1, 0.3, 0.6, 0, 0);
		part_type_scale(_ptype1, 1, 1);
		part_type_speed(_ptype1, 6, 10, -0.2, 0);
		part_type_direction(_ptype1, 0, 360, 0, 0);
		part_type_gravity(_ptype1, 0, 270);
		part_type_orientation(_ptype1, 0, 0, 0, 0, false);
		part_type_alpha3(_ptype1, 1, 0.471, 0);
		part_type_blend(_ptype1, false);
		part_type_life(_ptype1, 30, 60)
	}
	else {
		part_system_depth(_ps, depth-1)
		var color = event_string_to_color(col)
		part_type_colour3(_ptype1, $333333, color, color);
		var zone = 50
		part_emitter_region(_ps, _pemit1, x, x+zone, y, y+zone, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(_ps, _pemit1, _ptype1, 50);
	}

}

function action_game_over_player() {
	global.animation = true
	
	instance_create_depth(0, 0, -150, anim_mort_player)
	
}

