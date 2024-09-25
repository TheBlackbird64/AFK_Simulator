function declencheur_jouer() {
	
	menu_creer_fenetre(menu_accueil_fen_chargement, 683, 384)
	reseau_send(["j", global.pseudo])
}

function declencheur_lancer_partie() {
	reseau_send(["r"])
	menu_detruire_fenetre(_parent)
	
	var _x = 500
	var _y = 500
	instance_create_depth(_x, _y, -100, player)
}