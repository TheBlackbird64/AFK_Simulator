action_mort_joueur()

if control {
	instance_destroy(interface_dessiner)
	global.inst_ctrl = -1

	action_game_over_player()
}