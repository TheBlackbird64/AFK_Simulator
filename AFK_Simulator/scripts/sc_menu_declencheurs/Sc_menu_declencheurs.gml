function declencheur_jouer() {
	
	menu_creer_fenetre(menu_accueil_fen_chargement, 683, 384)
	reseau_send(["j", global.pseudo])
}

function declencheur_lancer_partie() {
	reseau_send(["r"])
	menu_detruire_fenetre(_parent)
	
}

function declencheur_retour() {
	event_change_room(R_accueil)
}

function declencheur_tuto() {
	url_open("http://afk-simulator.com") // /tutorial à régler
}