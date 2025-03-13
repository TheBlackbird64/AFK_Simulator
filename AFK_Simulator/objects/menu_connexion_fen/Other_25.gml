rep = client.msg_lire

if rep[0] == "c" {
	menu_detruire_fenetre(id)
}
if rep[0] == "rst" {
	event_change_room(R_accueil)
	menu_detruire_fenetre(id)
}