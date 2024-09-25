if keyboard_check_pressed(vk_numpad0) {active = not active}
visible = active

if active {
	if keyboard_check_pressed(vk_numpad1) {view_set_visible(1, not view_get_visible(1))}
}