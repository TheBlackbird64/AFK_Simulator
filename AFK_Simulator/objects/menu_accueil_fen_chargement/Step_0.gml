

// Pas de réception pendant 3 secondes = déconnection
if compteur_tps > 180 {
	reseau_fin_connexion()
	
	menu_detruire_fenetre(id)
}
else {
	compteur_tps ++
}