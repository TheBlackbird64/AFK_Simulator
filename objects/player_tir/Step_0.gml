
if reload < reload_max {reload ++}

if mouse_check_button_pressed(mb_left) and reload == reload_max {
	reload = 0
	dir_projectile = int64(point_direction(player.x, player.y, mouse_x, mouse_y))
}