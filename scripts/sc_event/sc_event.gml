// Fonctions générales

function event_change_room(_room) {
	if instance_exists(menu_fenetre) {
		instance_destroy(menu_fenetre)
		global.focus = 0
	}
	
	room = _room
}

function event_demarrage_room(r) {
	if r == R_Jeu {
		
		var t = gen_tab()
		t = gen_lisser(t, 2)
		
		gen_generer_map(t, 250, 250)
		
	}
}

// jeu
function event_commencer_partie() {
	menu_creer_fenetre(menu_jeu_fen_jouer, room_width/2, room_height/2)
	if instance_exists(player_cam) {instance_destroy(player_cam)}
	
}

function event_string_to_color(str) {
	var r = int64(data_hex_to_dec(string_copy(str, 1, 2)))
	var g = int64(data_hex_to_dec(string_copy(str, 3, 2)))
	var b = int64(data_hex_to_dec(string_copy(str, 5, 2)))
	return make_color_rgb(r, g, b)
}

