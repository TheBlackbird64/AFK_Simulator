if not global.release {
	if keyboard_check_pressed(vk_numpad0) {active = not active}
}
visible = active

if active {
	if keyboard_check_pressed(vk_numpad1) {view_set_visible(1, not view_get_visible(1))}
	if keyboard_check_pressed(vk_numpad2) {
		if instance_exists(menu_fenetre) menu_detruire_fenetre(menu_fenetre)
		layer_set_visible(layer_get_id("Assets_1"), not layer_get_visible(layer_get_id("Assets_1")))
	}
	if keyboard_check_pressed(vk_numpad3) {global.animation = not global.animation}
	if keyboard_check_pressed(vk_numpad4) {event_change_room(room)}
	if keyboard_check_pressed(vk_numpad5) {
		if col_player == -1 {
			var i = instance_nearest(global.inst_ctrl.x, global.inst_ctrl.y, sol_color)
			col_player = make_color_rgb(color_get_red(i.col), color_get_green(i.col), color_get_blue(i.col))
		}
		else {col_player = -1}
	}
	
	if keyboard_check_pressed(vk_numpad6) { reseau_fin_connexion()}
	
	
	if col_player != -1 {
		global.inst_ctrl.col = col_player
	}
	
}