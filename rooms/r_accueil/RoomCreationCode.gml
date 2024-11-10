// R_accueil

// Animations et décor
randomize()

var val_inf = 0.5
var t = gen_tab(irandom_range(1, 1000000), 26)
t = gen_lisser(t, 1, val_inf)
gen_generer_map(t, 50, 0, 150, val_inf)


// Setup le jeu
set_global_var_default ()


if not instance_exists(room_control) { // objet controlleur des débuts rooms
	instance_create_depth(0, 0, 0, room_control)
}

if not instance_exists(client) { // objet controle réseau
	instance_create_depth(0, 0, 0, client)
}

