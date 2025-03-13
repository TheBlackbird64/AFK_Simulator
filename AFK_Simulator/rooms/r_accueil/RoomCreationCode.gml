// R_accueil

// Animations et décor
randomize()

var val_inf = 0.5
var t = gen_tab(irandom_range(1, 1000000), 26)
t = gen_lisser(t, 1, val_inf)
gen_generer_map(t, 50, 0, 150, val_inf)


// Setup le jeu
set_global_var_default ()

// setup reseau
var configNotOk = true
while configNotOk {
	
	global.host = "afk-simulator.com"
	global.port = 4000
	
	var v = global.version
	configNotOk = false
	
	var nomf = "config.txt"
	if file_exists(nomf) {
		global.version = "" // Au cas ou le fichier est vieux et ne contient pas de numéro de version
		file_load_globalvars(nomf)
	}
	else {
		file_save_globalvars(nomf, ["host", "port", "version"])
	}
	
	if v != global.version {
		file_delete(nomf)
		configNotOk = true
		
		global.version = v
	}
	
	if not global.release {
		global.host = "127.0.0.1"
		global.port = 4000
	}
}


if not instance_exists(room_control) { // objet controlleur des débuts rooms
	instance_create_depth(0, 0, 0, room_control)
}

if not instance_exists(client) { // objet controle réseau
	instance_create_depth(0, 0, 0, client)
}

