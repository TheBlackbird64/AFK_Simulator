
var type = ds_map_find_value(async_load, "type")

/*
if type == network_type_connect {}
if type == network_type_disconnect {}
if type == network_type_non_blocking_connect {}
*/

if type == network_type_data {
	var buff = ds_map_find_value(async_load, "buffer")
	
	//show_debug_message(string(buffer_get_size(buff)) + string("     ") + string(buffer_get_size(buff) div 1024))
	
	msg += buffer_read(buff, buffer_string)
	
	if string_char_at(msg, string_length(msg)) == sep1 {
		
		msg_tab = reseau_tout_separer(msg, [sep1, sep2, sep3, sep4])
		
		for (var i = 0; array_length(msg_tab) > i; i++){
			msg_lire = msg_tab[i]
			if debug.active {show_debug_message(msg_lire)}
			
			if not is_array(msg_lire) {msg_lire = [msg_lire]}
			with (all) {event_user(15)}
		}
		
		msg = ""
	}
}

