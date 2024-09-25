
var type = ds_map_find_value(async_load, "type")

/*
if type == network_type_connect {}
if type == network_type_disconnect {}
if type == network_type_non_blocking_connect {}
*/

if type == network_type_data {
	var buff = ds_map_find_value(async_load, "buffer")
	
	msg = buffer_read(buff, buffer_string)
	
	msg_tab = reseau_tout_separer(msg, [sep1, sep2, sep3, sep4])
	
	for (var i = 0; array_length(msg_tab) > i; i++){
		msg_lire = msg_tab[i]
		show_debug_message(msg_lire)
		with (all) {event_user(15)}
	}
}

