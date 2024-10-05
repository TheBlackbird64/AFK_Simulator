
function gen_tab() {
	random_set_seed(global.graine_map)
	
	var tab = []
	for (var i = 0; global.gen_taille_map > i; i++) {
		array_push(tab, [])
		for (var j = 0; global.gen_taille_map > j; j++) {
			array_push(tab[i], random_range(-1, 1))
		}
	}
	return tab
}

function gen_voisins(t, i, j) {
	
	var tab = []
	for (var i1 = -1; 1 >= i1; i1++) {
		for (var j1 = -1; 1 >= j1; j1++) {
			try {
				array_push(tab, t[i+i1][j+j1])
			} catch (e) {}
		}
	}
	
	return tab
}

function gen_nb_voisins_val(liste, valsup, valinf) {
	var res = 0
    for (var i = 0; array_length(liste) > i; i++) {
		if liste[i] >= valinf and liste[i] <= valsup {
			res += 1
		}
	}
	
    return res
}

function gen_lisser(t, nb=1) {  // parametres à changer pr la génération
	var val_inferieure = global.gen_val_inferieure
	var nb_voisins = global.nb_voisins
	
	var t2 = []
	
	for (var i = 0; global.gen_taille_map > i; i++) {
		array_push(t2, [])
		for (var j = 0; global.gen_taille_map > j; j++) {
			if gen_nb_voisins_val(gen_voisins(t, i, j), 1, val_inferieure) > nb_voisins {
				array_push(t2[i], random_range(val_inferieure, 1))
			}
			else {
				array_push(t2[i], random_range(-1, val_inferieure-0.0001))
			}
		}
	}
	
	if nb > 1 {
		return gen_lisser(t2, nb-1)
	}
	else {
		return t2
	}
}


function gen_generer_map(t) {
	var taille = sprite_get_width(S_mur_jeu)/2
	
	for (var i = 0; array_length(t) > i; i++) {
		for (var j = 0; array_length(t[i]) > j; j++) {
			if t[i][j] >= global.gen_val_inferieure {
				instance_create_depth(275 + taille*i, 275 + taille*j, -10, mur_jeu)
			}
		}
	}
}