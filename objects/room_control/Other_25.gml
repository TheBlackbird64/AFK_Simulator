rep = client.msg_lire

if rep[0] == "a" {
	global.temps = int64(rep[1])
	if global.temps > global.meilleur_temps {global.meilleur_temps = global.temps}
	
	reseau_traiter_msg_actu(ennemi, rep[2], ["pseudo", "x", "y", "vie", "col"])
	reseau_traiter_msg_actu(player, rep[2], ["pseudo", "___x", "__y", "vie", "col"])
	if array_length(rep) > 3 {
		reseau_traiter_msg_actu(arme1, rep[3], ["x", "y", "dir", "id_joueur"])
	}
	if array_length(rep) > 4 {
		reseau_traiter_msg_actu(arme1, rep[4], ["x", "y", "col"])
	}
	
}
if rep[0] == "g" {
	global.animation = true
}