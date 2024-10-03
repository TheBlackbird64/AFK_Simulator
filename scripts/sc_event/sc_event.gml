// Fonctions générales

function event_change_room(_room, _x, _y) {
	room = _room
	if instance_exists(player) {event_dep_tp_player(_x, _y)}
}

function event_demarrage_room(r) {
	if r == R_Jeu {
		
		var t = gen_tab()
		t = gen_lisser(t, 1)
	
		gen_generer_map(t)
	}
}
// fonction relatives au déplacement et au système de collision

function event_dep_x(_x, tab=[], poussee=poids) {
	_x = round(_x)
	if _x != 0 {
		var dep = 0
		var list = ds_list_create()
		var inst_m = noone
		instance_place_list(x+_x, y, her_solide_mouvement, list, false)
		list = data_liste_vers_tab(list)
		if array_length(list) > 0 {
			var i = 0
			while (i < array_length(list)) and (data_tab_index(tab, list[i]) != -1) {
				i ++
			}
			if i < array_length(list) {inst_m = list[i]}
		}
	
		if place_meeting(x+_x, y, her_solide) { // cas de bases
			dep = 0
		}
		else {
			if inst_m == noone {
				dep = _x
			}
			else { 
				if inst_m.poids > poussee {dep = 0}
				else { // Recursion
					dep = _x
				
					array_push(tab, id)
					with (inst_m) {dep = event_dep_x(_x, tab, poussee-inst_m.poids)}
				}
			}
		}
		x += dep
		if dep == 0 {event_dep_x((_x/abs(_x))*(abs(_x)-1), [], poussee)}
		return dep
	}
	return 0
}

function event_dep_y(_y, tab=[], poussee=poids) {
	_y = round(_y)
	if _y != 0 {
		var dep = 0
		var list = ds_list_create()
		var inst_m = noone
		instance_place_list(x, y+_y, her_solide_mouvement, list, false)
		list = data_liste_vers_tab(list)
		if array_length(list) > 0 {
			var i = 0
			while (i < array_length(list)) and (data_tab_index(tab, list[i]) != -1) {
				i ++
			}
			if i < array_length(list) {inst_m = list[i]}
		}
		
		if place_meeting(x, y+_y, her_solide) { // cas de bases
			dep = 0
		}
		else {
			if inst_m == noone {
				dep = _y
			}
			else { 
				if inst_m.poids > poussee {dep = 0}
				else { // Recursion
					dep = _y
					
					array_push(tab, id)
					with (inst_m) {dep = event_dep_y(_y, tab, poussee-inst_m.poids)}
				}
			}
		}
		y += dep
		if dep == 0 {event_dep_y((_y/abs(_y))*(abs(_y)-1), [], poussee)}
		return dep
	}
	return 0
}

function event_dep(_x, _y) {
	// à utiliser uniquement dans les objets ayant pour parents her_solide_mouv
	// COORDONNEES : DEPLACEMENT RELATIF A LA POSITION
	
	event_dep_x(_x)
	event_dep_y(_y)
	
}

function event_dep_tp_player(_x, _y) { // déplacer player en annulant l'impulsion de déplacement qu'il a
	player.x = _x
	player.y = _y
	player.h_acceleration = 0
	player.v_acceleration = 0
}

// jeu
function event_commencer_partie() {
	if instance_exists(player) {instance_destroy()}
	menu_creer_fenetre(menu_jeu_fen_jouer, room_width/2, room_height/2)
}

function event_string_to_color(str) {
	var r = int64(data_hex_to_dec(string_copy(str, 1, 2)))
	var g = int64(data_hex_to_dec(string_copy(str, 3, 2)))
	var b = int64(data_hex_to_dec(string_copy(str, 5, 2)))
	return make_color_rgb(r, g, b)
}

