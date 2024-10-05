rep = client.msg_lire

if rep[0] == "a" {  
	global.meilleur_temps = rep[1]
	
	// Mettre à jour les ennemis/player
	with (ennemi) {suppr = true}
	
	for (var i = 0; array_length(rep[2]) > i; i++) {
		var tab_tmp = rep[2]
		var idtmp = 0
		var exists = false
		
		// player
		if instance_exists(player) {
			if int64(tab_tmp[i][0]) == global.id_joueur {
				player.vie = int64(tab_tmp[i][4])
				player.col = tab_tmp[i][5]
			}
		}
		
		
		// ennemis
		for (var id_inst = 0; instance_number(ennemi) > id_inst; id_inst++) {
			idtmp = instance_find(ennemi, id_inst)
			
			// actualiser
			if idtmp.id_ennemi == int64(tab_tmp[i][0]) {
				exists = true
				idtmp.suppr = false
				
				idtmp.pseudo = tab_tmp[i][1]
				idtmp.x = int64(tab_tmp[i][2])
				idtmp.y = int64(tab_tmp[i][3])
				idtmp.vie = int64(tab_tmp[i][4])
				idtmp.col = tab_tmp[i][5]
				
				break;
			}
		}
		
		if not exists and int64(tab_tmp[i][0]) != global.id_joueur {
			idtmp = instance_create_depth(0, 0, -100, ennemi)
			idtmp.id_ennemi = int64(tab_tmp[i][0])
			idtmp.x = int64(tab_tmp[i][2])
			idtmp.y = int64(tab_tmp[i][3])
			idtmp.vie = int64(tab_tmp[i][4])
			idtmp.col = tab_tmp[i][5]
		}
	}
	
	// Supprimer les ennemis déconnectés
	with (ennemi) {if suppr {instance_destroy()}}
	
	
	// projectiles
	if array_length(rep) > 3 {
		with (arme1) {suppr = true}
		
		for (var i = 0; array_length(rep[3]) > i; i++) {
			var tab_tmp = rep[3]
			var idtmp = 0
			var exists = false
		
		
			for (var id_inst = 0; instance_number(arme1) > id_inst; id_inst++) {
				idtmp = instance_find(arme1, id_inst)
				if idtmp.idarme == int64(tab_tmp[i][0]) {
					exists = true
					idtmp.suppr = false
				
					idtmp.x = int64(tab_tmp[i][1])
					idtmp.y = int64(tab_tmp[i][2])
				}
			}
		
			if not exists {
				idtmp = instance_create_depth(0, 0, -100, arme1)
				idtmp.idarme = int64(tab_tmp[i][0])
				idtmp.x = int64(tab_tmp[i][1])
				idtmp.y = int64(tab_tmp[i][2])
				idtmp.dir = int64(tab_tmp[i][3])
			}
		}
	
		with (arme1) {if suppr {instance_destroy()}}
	}
	
	
}