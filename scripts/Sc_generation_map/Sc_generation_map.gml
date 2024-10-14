
// générateur congruentiel
function gen_nb_rnd(graine=-1, recup_graine=false) {
	static _x = 0
	if recup_graine {return _x}
	
	if graine != -1 {
		_x = graine
	}
	else {
		_x = ((16807 * _x + 1) % power(2, 32))
		return _x
	}
}

function gen_random_range(xmin, xmax, nb_dec = global.nb_dec) {
	var puissance10 = power(10, nb_dec)
	xmin *= puissance10
	xmax *= puissance10
	
	var tmp = xmax-xmin
	var rnd = gen_nb_rnd()
	
	if tmp <= 0 or power(2, 32) < tmp  {return xmax}
	
	return ((rnd % tmp) + xmin) / puissance10
}

function gen_tab(graine=global.graine_map, taille=global.gen_taille_map) {
	gen_nb_rnd(graine)
	
	var tab = []
	for (var i = 0; taille > i; i++) {
		array_push(tab, [])
		for (var j = 0; taille > j; j++) {
			array_push(tab[i], gen_random_range(-1, 1))
		}
	}
	
	return tab
}

function gen_voisins(t, i, j) {
	
	var tab = []
	for (var i1 = -1; 1 >= i1; i1++) {
		for (var j1 = -1; 1 >= j1; j1++) {
			if i+i1 >= 0 &&  j+j1 >= 0 && i + i1 < array_length(t) && j + j1 < array_length(t) {
				array_push(tab, t[i+i1][j+j1])
			}
		}
	}
	
	return tab
}

function gen_nb_voisins_val(liste, valinf, valsup) {
	var res = 0
    for (var i = 0; array_length(liste) > i; i++) {
		if liste[i] >= valinf and liste[i] <= valsup {
			res ++
		}
	}
	
    return res
}

function gen_lisser(t, nb=1, val_inferieure=global.gen_val_inferieure, nb_voisins=global.gen_nb_voisins, nb_dec=global.nb_dec) { 
	
	var t2 = []
	var voi = []
	
	for (var i = 0; array_length(t) > i; i++) {
		array_push(t2, [])
		for (var j = 0; array_length(t) > j; j++) {
			voi = gen_voisins(t, i, j)
			if gen_nb_voisins_val(voi, val_inferieure, 1) > nb_voisins {
				array_push(t2[i], gen_random_range(val_inferieure, 1))
			}
			else { 
				// gestion des couleurs ici
				if gen_nb_voisins_val(voi, val_inferieure-global.gen_intervalle_col, val_inferieure-power(10, -nb_dec)) > global.gen_nb_voisins_col {
					array_push(t2[i], gen_random_range(val_inferieure-global.gen_intervalle_col, val_inferieure-power(10, -nb_dec)))
				}
				else {
					array_push(t2[i], gen_random_range(-1, val_inferieure-global.gen_intervalle_col-power(10, -nb_dec)))
				}
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


function gen_generer_map(t, coinG, coinD, dep=-10, val_inferieure=global.gen_val_inferieure) {
	var taille = sprite_get_width(S_mur_jeu)/2
	var valtmp = 0
	
	for (var i = 0; array_length(t) > i; i++) {
		for (var j = 0; array_length(t[i]) > j; j++) {
			if t[i][j] >= val_inferieure {
				instance_create_depth(coinG+25 + taille*i, coinD+25 + taille*j, dep, mur_jeu, {col : t[i][j]})
			}
			else {
				// couleurs carte
				valtmp = val_inferieure-global.gen_intervalle_col
				if t[i][j] >= valtmp {
					instance_create_depth(coinG+25 + taille*i, coinD+25 + taille*j, dep, sol_color)//, {col : floor((t[i][j]-valtmp)*10)})
				}
			}
		}
	}
}