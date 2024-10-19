rep = client.msg_lire

if rep[0] == "a" {
	
	reseau_traiter_msg_actu(ennemi, rep[1], ["pseudo", "temps", "x", "y", "vie", "col"])
	reseau_traiter_msg_actu(player, rep[1], ["pseudo", "temps", "__x", "__y", "vie", "col"])
	reseau_traiter_msg_actu(arme1, rep[2], ["x", "y", "dir", "id_joueur"])
	reseau_traiter_msg_actu(item_color, rep[3], ["type", "x", "_y", "col"])

	
}
if rep[0] == "g" {
	global.pseudo_gagnant = rep[1]
	global.pause = true
	menu_creer_fenetre(menu_fin_partie_fen, cam_mid_x(), cam_mid_y())
}