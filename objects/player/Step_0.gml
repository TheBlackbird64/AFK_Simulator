
if not global.pause and not global.animation {

	// mouv horizontal
	var touche_appuye = 0

	if input_droite() {
		touche_appuye += 1
		h_acceleration += h_coef_acceleration
		if h_acceleration > 1 {h_acceleration = 1}
	}
	if input_gauche() {
		touche_appuye += 2
		h_acceleration -= h_coef_acceleration
		if h_acceleration < -1 {h_acceleration = -1}
	}
	if touche_appuye == 0 {
		if abs(h_acceleration) > 0.005 {h_acceleration *= h_coef_deceleration} else {h_acceleration = 0}
	}


	//mouv vertical (saut)
	var gr = degtorad(sens_gravite)
	var t = event_dep_gravite_ligne()
	x1 = t[0]
	x2 = t[1]
	y1 = t[2]
	y2 = t[3]
	/* 
	Quand le sol est touché la recharge est au max, si le sol n'est pas touché
	et que la touche de saut n'est pas activé la recharge est à 0 pour empecher le saut en l'air
	*/
	if collision_line(x1, y1, x2, y2, her_solide, false, true) or collision_line(x1, y1, x2, y2, her_solide_mouvement, false, true) {
		recharge = recharge_max+(-gravite)*10
		v_acceleration = 0
	}
	if input_saut() and recharge > 0 {
		v_acceleration = 1-gravite*0.5
		recharge --
	}
	else {
		recharge = 0
		v_acceleration -= v_coef_deceleration*(1+gravite)
		if v_acceleration < -(1+gravite) {v_acceleration = -(1+gravite)}
	}

	var dep_h = h_acceleration*h_vitesse
	var dep_v = (v_acceleration)*(-v_vitesse)
	event_dep(dep_h*-sin(gr) - dep_v*-cos(gr), dep_h*cos(gr) + dep_v*-sin(gr))
	
	// anim
	
	if touche_appuye == 1 or (touche_appuye == 3 and h_acceleration > 0) {
		image_xscale = abs(image_xscale)
	}

	if touche_appuye == 2 or (touche_appuye == 3 and h_acceleration < 0){
		image_xscale = - abs(image_xscale)
	}
	image_angle = sens_gravite-270
}
else
{image_index = 0}