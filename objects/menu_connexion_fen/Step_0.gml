if client.connecte and not envoi {
	if global.id_joueur == -1 {
		menu_detruire_fenetre(id)
	}
	else {
		reseau_send(["c", string(global.id_joueur)])
		envoi = true
	}
}

x = cam_mid_x()
y = cam_mid_y()
if view_get_visible(1) {
	x = cam_mid_x(1)
	y = cam_mid_y(1)
}