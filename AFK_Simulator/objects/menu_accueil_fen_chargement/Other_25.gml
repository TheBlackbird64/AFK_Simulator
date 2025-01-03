rep = client.msg_lire


if rep[0] == "p" {
	global.graine_map = int64(rep[1])
	global.id_joueur = int64(rep[2])
	event_change_room(R_Jeu)
}

if rep[0] == "f" {
	nb_joueurs = string(rep[1])
}

if rep[0] == "info" {
	global.nb_joueur_min = string(rep[1])
	global.tps_actualiser_serv_ms = string(rep[2])
	global.vie_max = string(rep[3])
}