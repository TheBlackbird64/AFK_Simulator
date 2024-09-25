if client.connecte {
	menu_detruire_fenetre(id)
}

x = cam_mid_x()
y = cam_mid_y()
if view_get_visible(1) {
	x = cam_mid_x(1)
	y = cam_mid_y(1)
}