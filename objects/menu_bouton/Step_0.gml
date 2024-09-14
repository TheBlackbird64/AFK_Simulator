if active {
	image_index = 0
	if focus >= global.focus {
		if collision_point(mouse_x, mouse_y, id, false, false) and not global.animation{
			image_index = 1
			if mouse_check_button_released(bt_mouse) {
				if not global.animation {
					event_user(0)
				}
			}
		}
		if mouse_check_button(bt_mouse) and image_index == 1 {
			image_index = 2
		}
	}
}
else {
	image_index = 3
}
