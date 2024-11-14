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
}