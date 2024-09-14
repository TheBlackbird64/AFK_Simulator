
function menu_creer_fenetre(name, _x, _y, params={image_index : image_index}) {
	// le dernier parametre fait crash le runner si il est vide (ex: {})
	global.focus ++
	var inst = instance_create_depth(_x, _y, -100-(global.focus*5), name, params)
	
	return inst
}

function menu_detruire_fenetre(name_or_id) {
	
	global.focus --
	for (var i = 0; array_length(name_or_id.tab_widget) > i; i++) {
		if instance_exists(name_or_id.tab_widget[i]) {instance_destroy(name_or_id.tab_widget[i])}
	}
	instance_destroy(name_or_id)
}

function menu_ajouter_widget(widget_name, _x, _y, params={image_index : image_index}) {
	// fonction à utiliser uniquement sur l'objet fenetre qui a le focus actuellement
	
	var inst = instance_create_depth(_x, _y, depth-1, widget_name, params)
	inst._parent = id
	array_push(tab_widget, inst)
	
	return inst
}

function menu_widget_x_pos(x_relative) {
	// fonction à utiliser uniquement sur un objet fenetre/frame (x_relative entre 0 et 1)
	return x-obj_larg() + sprite_width*x_relative
}

function menu_widget_y_pos(y_relative) {
	// fonction à utiliser uniquement sur un objet fenetre/frame (y_relative entre 0 et 1)
	return y-obj_haut() + sprite_height*y_relative
}
