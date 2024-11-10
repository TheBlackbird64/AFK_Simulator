rep = client.msg_lire

if rep[0] == "a" {
	
	reseau_traiter_msg_actu(joueur, rep[1], ["pseudo", "temps", "to_x", "to_y", "vie", "col", "nb_projectiles"])
	reseau_traiter_msg_actu(arme1, rep[2], ["to_x", "to_y", "dir", "id_joueur"])
	reseau_traiter_msg_actu(item_color, rep[3], ["x", "_y", "col"])
	reseau_traiter_msg_actu(item_recharge, rep[4], ["x", "_y"])
	
	
}
if rep[0] == "g" {
	global.pseudo_gagnant = rep[1]
	global.pause = true
	menu_creer_fenetre(menu_fin_partie_fen, cam_mid_x(), cam_mid_y())
}