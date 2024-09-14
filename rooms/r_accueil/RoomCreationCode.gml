// R_accueil

set_global_var_default ()


if instance_exists(player) {
	instance_destroy(player)
}


if not instance_exists(room_initialisation) { // objet controlleur des débuts rooms
	instance_create_depth(0, 0, 0, room_initialisation)
}