// Fonctions générales

function event_change_room(_room, _x, _y) {
	room = _room
	if instance_exists(player) {event_dep_tp_player(_x, _y)}
}

function event_demarrage_room(r) {
	
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
	
	// Pour faire suivre les instances sur les plateformes
	if instance_exists(her_solide_gravite) {
		var tab = ds_list_create()
		collision_circle_list(x, y, obj_grand_cote(), her_solide_gravite, false, true, tab, false)
		tab = data_liste_vers_tab(tab)
		
		for (var i = 0; array_length(tab) > i; i++) {
			var t = event_dep_gravite_ligne(tab[i])
			var x1 = t[0]
			var x2 = t[1]
			var y1 = t[2]
			var y2 = t[3]
			if collision_line(x1, y1, x2, y2, id, false, false) {
				with (tab[i]) {
					event_dep(_x, _y)
				}
			}
		}
	}
	
	event_dep_x(_x)
	event_dep_y(_y)
	
}

function event_dep_tp_player(_x, _y) { // déplacer player en annulant l'impulsion de déplacement qu'il a
	player.x = _x
	player.y = _y
	player.h_acceleration = 0
	player.v_acceleration = 0
}

function event_dep_gravite_ligne(_id=id) {
	with (_id) {
		var a = []
		var gr = degtorad(sens_gravite)
		var ecartx = 3
		var ecarty = 3
		array_push(a, x-(obj_larg()-ecartx)*-sin(gr) + (obj_haut()+ecarty)*cos(gr))
		array_push(a, x+(obj_larg()-ecartx)*-sin(gr) + (obj_haut()+ecarty)*cos(gr))
		array_push(a, y+(obj_haut()+ecarty)*-sin(gr) + (obj_larg()-ecartx)*cos(gr))
		array_push(a, y+(obj_haut()+ecarty)*-sin(gr) - (obj_larg()-ecartx)*cos(gr))
	}
	
	return a
}