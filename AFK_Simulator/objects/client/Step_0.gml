
if not connecte {
	if not instance_exists(menu_connexion_fen) {
		menu_creer_fenetre(menu_connexion_fen, cam_mid_x(), cam_mid_x())
	}
	socket = reseau_connexion()
	connecte = socket != -1
}
