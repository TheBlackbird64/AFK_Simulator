
function reseau_connexion() {
	var sock_client = network_create_socket(network_socket_tcp)
	network_set_config(network_config_connect_timeout, 100)

	var r = network_connect_raw(sock_client, "127.0.0.1", 10000)
	
	network_set_config(network_config_connect_timeout, 500)
	
	if r < 0 {
		network_destroy(sock_client)
		return -1
	}
	else {return sock_client}
}

function reseau_send(msg_tab, sock = client.socket) {
	msg_tab = data_regrouper(msg_tab, client.sep2)
	msg_tab += client.sep1
	
	var buff = buffer_create(1, buffer_grow, 1)
	buffer_seek(buff, buffer_seek_start, 0)
	buffer_write(buff, buffer_string, msg_tab)
	
	if network_send_raw(sock, buff, string_length(msg_tab)) < 0 {
		network_destroy(client.socket)
		client.connecte = false
	}
}

function reseau_tout_separer(str, tab_sep, i=0) {
	if string_count(tab_sep[i], str) == 0 {return str}
	
	var tab = data_separer(str, tab_sep[i])
	
	i++
	if i == array_length(tab_sep) {return tab}
	
	for (var j = 0; array_length(tab) > j; j++) {
		tab[j] = reseau_tout_separer(tab[j], tab_sep, i)
	}
	
	return tab
}


function reseau_traiter_msg_actu(nom_obj, tab_infos, tab_vars) {
	
	with (nom_obj) {suppr = true}
	
	var tab_tmp = tab_infos
	var idtmp = 0
	var exists = false
	
	for (var i = 0; array_length(tab_infos) > i; i++) {
		exists = false
		
		for (var id_inst = 0; instance_number(nom_obj) > id_inst; id_inst++) {
			idtmp = instance_find(nom_obj, id_inst)
		
			// actualiser
			if idtmp._id == int64(tab_tmp[i][0]) {
				exists = true
				idtmp.suppr = false
				
				for (var j = 0; array_length(tab_vars) > j; j++) {
					variable_instance_set(idtmp, tab_vars[j], tab_tmp[i][j+1])
				}
			
				break;
			}
		}
		
		if not (int64(tab_tmp[i][0]) == global.id_joueur and (nom_obj == ennemi or nom_obj == player)) {
			if not exists {
				idtmp = instance_create_depth(0, 0, -100, nom_obj)
				idtmp._id = int64(tab_tmp[i][0])
			
				for (var j = 0; array_length(tab_vars) > j; j++) {
					if is_string(variable_instance_get(idtmp, tab_vars[j])) {
						variable_instance_set(idtmp, tab_vars[j], tab_tmp[i][j+1])
					}
					else {
						variable_instance_set(idtmp, tab_vars[j], int64(tab_tmp[i][j+1]))
					}
				}
			}
		}
	}
	
	if instance_exists(nom_obj) {with (nom_obj) {if suppr {instance_destroy()}}}
}