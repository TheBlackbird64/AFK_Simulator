// Contient toutes les fonctions utilisables pour tout les jeux: raccourcis


//set global vars
set_global_var()
global.release = false // Mettre ceci à true pour faire une release de façon à pas avoir à modif tout ce qui est 'debug'

function set_global_var()
{
	global.touches = [ord("Z"), ord("S"), ord("D"), ord("Q"), vk_space] // haut, bas, droite, gauche, saut
	global.vie_max = 100 // juste pr le dessin (barre vie)
	global.tps_actualiser_serv_ms = 50
	global.pseudo = ""
	
	// Vars de génération map
	global.gen_taille_map = 50
	global.gen_val_inferieure = 0.6
	global.gen_nb_voisins = 3
	global.nb_dec = 3
	
	// Vars de génération (uniquement visuel donc que coté client) 0.07; 1
	global.gen_intervalle_col = 0.07
	global.gen_nb_voisins_col = 1
	
	set_global_var_default ()
	action_mort_joueur(true)
}

function set_global_var_default () {
	// remet à zéro ces variables à chaque passages par la room R_Accueil
	global.animation = false
	global.focus = 0
	global.pause = false
	
	global.temps_joueur = 0
	global.meilleur_temps = 0
	global.graine_map = 0
	global.id_joueur = -1
	global.inst_ctrl = -1
	
	global.pseudo_gagnant = ""
}

//dessin
function draw_reset_all()
{
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(-1)
}

function draw_set_all(col=-1, alpha=-1, valign=-1, halign=-1, font=-1)
{
	draw_reset_all()
	
	if col != -1 {draw_set_color(col)}
	if alpha != -1 {draw_set_alpha(alpha)}
	if valign != -1 {draw_set_valign(valign)}
	if halign != -1 {draw_set_halign(halign)}
	if font != -1 {draw_set_font(font)}
}

// fonctions de données
function data_caracteres_non_valide(str)
{
	var liste_carac_autorises = "abcdefghijklmnopqrstuvwzyzABCDEFGHIJKLMNOPQRSTUVWZYZ1234567890_+-=/<>."
	var result = ""
	for (var i = 1; string_length(str)+1 > i; i++)
	{
		if string_pos(string_char_at(str, i), liste_carac_autorises) != 0 {
			result += string_char_at(str, i)
		}
	}
	
	return result
}

function data_liste_vers_tab(liste)
{
	var tab = []
	for (var i = 0; ds_list_size(liste) > i; i++)
	{
		array_push(tab, ds_list_find_value(liste, i))
	}
	return tab
}

function data_regrouper(tab, caractere)
{
	var a = 0
	var b = ""
	while a < array_length(tab)
	{
		b += string_format(tab[a], 0, 3) + caractere
		a++
	}
	b = string_copy(b, 1, string_length(b)-string_length(caractere))
	
	if array_length(tab) == 0 {return caractere}
	else {return b}
}

function data_regrouper_2d(tab_2d, carac_1, carac_2)
{
	var temp_tab = []
	for (var i = 0; array_length(tab_2d) > i; i++)
	{
		array_push(temp_tab, data_regrouper(tab_2d[i], carac_2))
	}
	
	return data_regrouper(temp_tab, carac_1)
}

function data_saut_ligne_str(str, nb_carac)
{
	var num = 0
	var liste_mots = data_separer(str, " ")
	for (var i = 0; array_length(liste_mots) > i; i++)
	{
		if string_length(liste_mots[i]) < nb_carac
		{
			if num + string_length(liste_mots[i]) > nb_carac
			{
				liste_mots[i] = "\n" + liste_mots[i]
				num = string_length(liste_mots[i])+1
			}
			else
			{
				num += string_length(liste_mots[i])+1
			}
		}
	}
	return data_regrouper(liste_mots, " ")
}

function data_separer(str, caractere)
{
	if string_char_at(str, 1) != caractere {str = caractere + str}
	if string_char_at(str, string_length(str)) != caractere {str += caractere}
	
	var _debug_ = 0
	var tab = []
	var contenu_liste = str
	while (string_length(contenu_liste) > 2) {
		contenu_liste = string_copy(contenu_liste, string_pos(caractere, contenu_liste)+1, string_length(contenu_liste))
		array_push(tab, string_copy(contenu_liste, 1, string_pos(caractere, contenu_liste)-1))
		if (string_copy(contenu_liste, 1, string_pos(caractere, contenu_liste)-1) == "")
		{
			array_delete(tab, array_length(tab)-1, 1)
		}
		_debug_ ++
	}
	
	return tab
}

function data_tab_index(tab, value)
{
	//on fournit une val et ça retourne l'index
	var index = -1
	for (var i = 0; array_length(tab) > i; i++)
	{
		if tab[i] == value {index = i}
	}
	return index
}

function data_hex_to_dec(hex) 
{
    var dec = 0;
 
    var dig = "0123456789ABCDEF";
    var len = string_length(hex);
    for (var pos = 1; pos <= len; pos += 1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
    }
 
    return dec;
}

function data_time_ms_to_str(ms, allowMS=true, allowS=true, allowMN=true, allowH=true) {
	var s = 0
	var mn = 0
	var h = 0
	
	s = ms div 1000
	ms = string(ms mod 1000)
	
	mn = s div 60
	s = string(s mod 60)
	
	h = string(mn div 60)
	mn = string(mn mod 60)
	
	if string_length(ms) == 1 {ms = "0" + ms}
	if string_length(s) == 1 {s = "0" + s}
	if string_length(mn) == 1 {mn = "0" + mn}
	if string_length(h) == 1 {h = "0" + h}
	
	var res = []
	if allowH {array_push(res, h)}
	if allowMN {array_push(res, mn)}
	if allowS {array_push(res, s)}
	if allowMS {array_push(res, ms)}
	
	return data_regrouper(res, ":")
}

// fonctions de sauvegarde
function sauvegarde_save(num_save)
{
	var tab_noms_var_save = []
	
	var f = file_text_open_write("sauvegarde_" + string(num_save) + ".txt")
	var contenu = ""
	for (var i = 0; array_length(tab_noms_var_save) > i; i++)
	{
		contenu = variable_global_get(tab_noms_var_save[i])
		if is_array(contenu)
		{
			contenu = "#" + data_regrouper(variable_global_get(tab_noms_var_save[i]), ";")
		}
		file_text_write_string(f, tab_noms_var_save[i] + "=" + string(contenu))
		file_text_writeln(f)
	}
	file_text_close(f)
}

function sauvegarde_load(num_save)
{
	var f = file_text_open_read("sauvegarde_" + string(num_save) + ".txt")
	var contenu = "a"
	var contenu2 = "a"
	while (contenu != "")
	{
		contenu = file_text_read_string(f)
		if contenu != ""
		{
			contenu = data_separer(contenu, "=")
			if string_char_at(contenu[1], 1) == "#"
			{
				contenu[1] = string_copy(contenu[1], 2, string_length(contenu[1]))
				contenu2 = data_separer(contenu[1], ";")
			}
			else
			{
				contenu2 = contenu[1]
			}
			
			try
			{
				variable_global_set(contenu[0], int64(contenu2))
			}
			catch(e)
			{
				show_debug_message(e.message)
				variable_global_set(contenu[0], contenu2)
			}
			file_text_readln(f)
		}
	}
	file_text_close(f)
}

// fonctions graphiques (caméras, zoom, ect..)

function cam_set_zoom(coef)
{
	camera_set_view_size(view_camera[0], 1366*coef, 768*coef)
	camera_set_view_border(view_camera[0], 683*cam_get_zoom(), 384*cam_get_zoom())
}

function cam_get_zoom()
{
	return camera_get_view_height(view_camera[0])/768
}

function cam_sync_nb(nb)
{
	return nb*cam_get_zoom()
}

function cam_sync_x(_x)
{
	return camera_get_view_x(view_camera[0])+_x*cam_get_zoom()
}

function cam_sync_y(_y)
{
	return camera_get_view_y(view_camera[0])+_y*cam_get_zoom()
}

function cam_mid_x(id_cam=0)
{
	return camera_get_view_x(view_camera[id_cam])+683*cam_get_zoom()
}

function cam_mid_y(id_cam=0)
{
	return camera_get_view_y(view_camera[id_cam])+384*cam_get_zoom()
}


// gagner du temps
function debug_ligne(reset=false, get=false)
{
	static ligne = 20
	if reset {ligne = 20}
	else {if not get {ligne += 30}}
	return ligne
}

function obj_set_scale(taille, cam_adapt=false)
{
	image_xscale = taille
	if cam_adapt {image_xscale = taille*cam_get_zoom()}
	image_yscale = image_xscale
}

function obj_larg(_id=id)
{
	return abs(_id.sprite_width/2)
}

function obj_haut(_id=id)
{
	return abs(_id.sprite_height/2)
}

function obj_grand_cote(_id=id)
{
	if abs(_id.sprite_height) > abs(_id.sprite_width) {return abs(_id.sprite_height)}
	else {return abs(_id.sprite_width)}
}

function obj_petit_cote(_id=id)
{
	if _id.sprite_height < sprite_width {return _id.sprite_height}
	else {return _id.sprite_width}
}

function obj_x_pos_rel(x_relative) {
	return x-obj_larg() + sprite_width*x_relative
}

function obj_y_pos_rel(y_relative) {
	return y-obj_haut() + sprite_height*y_relative
}

function part_convert_dec_neg(dec) {
	// convertit les valeurs décimales en leur inverse négatif pour les émetteurs de particules
	
	if dec < 1 {return -1/dec}
	else {return round(dec)}
}

// Fonctions input

function get_slot_gamepad() { 
	// Pour les jeux avec une seule manette connectée
	var res = -1
	for (var i = 0; i < gamepad_get_device_count(); i++;)
	{
	    if gamepad_is_connected(i) {res = i}
	}
	return res
}

function input_droite() {
	var a = keyboard_check(global.touches[2])
	var b = false
	if get_slot_gamepad() != -1 {b = gamepad_axis_value(get_slot_gamepad(), gp_axislh) > 0.1}
	return a or b
}

function input_gauche() {
	var a = keyboard_check(global.touches[3])
	var b = false
	if get_slot_gamepad() != -1 {b = gamepad_axis_value(get_slot_gamepad(), gp_axislh) < -0.1}
	return a or b
}

function input_haut() {
	var a = keyboard_check(global.touches[0])
	var b = false
	//if get_slot_gamepad() != -1 {b = gamepad_axis_value(get_slot_gamepad(), gp_axislh) < -0.1}
	return a or b
}

function input_bas() {
	var a = keyboard_check(global.touches[1])
	var b = false
	//if get_slot_gamepad() != -1 {b = gamepad_axis_value(get_slot_gamepad(), gp_axislh) < -0.1}
	return a or b
}

function input_saut() {
	var a = keyboard_check(global.touches[4])
	var b = false
	if get_slot_gamepad() != -1 {b = gamepad_button_check(get_slot_gamepad(), gp_face1)}
	return a or b
}