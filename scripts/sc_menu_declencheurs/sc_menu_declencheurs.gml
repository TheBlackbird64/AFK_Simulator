function declencheur_jouer() {
	
	menu_creer_fenetre(menu_accueil_fen_chargement, 683, 384)
	reseau_send(["j", global.pseudo])
}

function declencheur_lancer_partie() {
	reseau_send(["r"])
	menu_detruire_fenetre(_parent)
	
	var dec = 300
	var _x = 250
	var _y = 250
	var t = sprite_get_height(S_player)/2
	while collision_rectangle(_x-t, _y-t, _x+t, _y+t, her_solide, false, true) {
		_x = irandom_range(dec, dec+global.gen_taille_map*50)
		_y = irandom_range(dec, dec+global.gen_taille_map*50)
	}
	
	
	if instance_exists(player) {instance_destroy(player)}
	instance_create_depth(_x, _y, -100, player)
}

function declencheur_retour() {
	event_change_room(R_accueil, 0, 0)
}