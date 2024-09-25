
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

function reseau_send(msg_tab) {
	msg_tab = data_regrouper(msg_tab, client.sep2)
	msg_tab += client.sep1
	
	var buff = buffer_create(1, buffer_grow, 1)
	buffer_seek(buff, buffer_seek_start, 0)
	buffer_write(buff, buffer_string, msg_tab)
	
	network_send_raw(client.socket, buff, string_length(msg_tab))
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