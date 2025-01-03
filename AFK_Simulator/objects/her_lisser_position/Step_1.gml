
if to_x != 0 and to_y != 0 {
	// nombre d'étapes entre le moment et la prochaine MAJ de position
	var delai = global.tps_actualiser_serv_ms / (1000/60)
	
	// Pour la création de l'instance, sinon déplacement de 0 à to_x
	if x == 0 {x = to_x}
	if y == 0 {y = to_y}
	
	if xcopy != to_x or ycopy != to_y {
		
		xcopy = to_x
		ycopy = to_y
		
		depx = (to_x - x) / delai
		depy = (to_y - y) / delai
	}
	
	if abs(to_x - x) < abs(depx) {x = to_x}
	else {x += depx}
	
	if abs(to_y - y) < abs(depy) {y = to_y}
	else {y += depy}
	
}