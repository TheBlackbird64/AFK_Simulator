
if not connecte {
	if not instance_exists(menu_connexion_fen) {
		menu_creer_fenetre(menu_connexion_fen, cam_mid_x(), cam_mid_x())
	}
	socket = reseau_connexion()
	connecte = socket != -1
	
	if connecte and dernier_msg_crash != "" {
		reseau_send(dernier_msg_crash)
		if connecte {dernier_msg_crash = ""}
	}
}
