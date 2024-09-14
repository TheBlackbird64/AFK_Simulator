
if not global.animation {

	// mouv horizontal
	var touche_appuye = false

	if input_droite() {
		touche_appuye = true
		h_acceleration += h_coef_acceleration
		if h_acceleration > 1 {h_acceleration = 1}
	}
	if input_gauche() {
		touche_appuye = true
		h_acceleration -= h_coef_acceleration
		if h_acceleration < -1 {h_acceleration = -1}
	}
	if not touche_appuye {
		if abs(h_acceleration) > 0.005 {h_acceleration *= h_coef_deceleration} else {h_acceleration = 0}
	}
	
	// mouv vertical
	var touche_appuye = false

	if input_haut() {
		touche_appuye = true
		v_acceleration += v_coef_acceleration
		if v_acceleration > 1 {v_acceleration = 1}
	}
	if input_bas() {
		touche_appuye = true
		v_acceleration -= v_coef_acceleration
		if v_acceleration < -1 {v_acceleration = -1}
	}
	if not touche_appuye {
		if abs(v_acceleration) > 0.005 {v_acceleration *= v_coef_deceleration} else {v_acceleration = 0}
	}
	var dep_h = h_acceleration*h_vitesse
	var dep_v = (v_acceleration)*(-v_vitesse)
	
	// deplacement
	
	event_dep(dep_h, dep_v)
	
	// animation
	
}
else
{image_index = 0}