if not global.pause and not global.animation {
	var t = event_dep_gravite_ligne()
	var x1 = t[0]
	var x2 = t[1]
	var y1 = t[2]
	var y2 = t[3]

	if collision_line(x1, y1, x2, y2, her_solide, false, true) or collision_line(x1, y1, x2, y2, her_solide_mouvement, false, true) {
		v_acceleration = 0
	}
	else {
		v_acceleration += v_coef_acceleration + gravite/10
		if v_acceleration > 1+gravite {v_acceleration = 1}
	}
	
	var dep_h = 0
	var dep_v = v_vitesse*v_acceleration
	var gr = degtorad(sens_gravite)
	event_dep(dep_h*-sin(gr) - dep_v*-cos(gr), dep_h*cos(gr) + dep_v*-sin(gr))
}