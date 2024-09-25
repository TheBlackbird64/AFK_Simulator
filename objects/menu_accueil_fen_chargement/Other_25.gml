rep = client.msg_lire
show_debug_message(rep)

if rep[0] == "p" {
	global.graine_map = int64(rep[1])
	global.id_joueur = int64(rep[2])
	event_change_room(R_Jeu, 0, 0)
}
