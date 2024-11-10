visible = true


if control {
	var d = input_droite()
	var g = input_gauche()
	var h = input_haut()
	var b = input_bas()
	var clic = -1
	
	if mouse_check_button(mb_left) {
		clic = round(point_direction(x, y, mouse_x, mouse_y))
	}
	
	reseau_send(["a", string(h), string(b), string(d), string(g), string(clic)])
	
	global.temps_joueur = temps
	if global.temps_joueur > global.meilleur_temps {global.meilleur_temps = global.temps_joueur}
}
