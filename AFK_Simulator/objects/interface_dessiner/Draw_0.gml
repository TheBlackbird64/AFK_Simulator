draw_reset_all()

if instance_exists(global.inst_ctrl)
{
	var _x = camera_get_view_x(view_camera[0])+1160
	var _y = camera_get_view_y(view_camera[0])+450
	var sc = 0.4

	var c1 = $0000FF //?
	var tab_col = [c1, $00FF00, $FF0000]

	var h = sprite_get_height(S_jauge_col)
	var w = sprite_get_width(S_jauge_col)
	var decx = 6
	var decy = 40
	var l = 0

	for (var i = 0; 3 > i; i++) {
		draw_sprite_ext(S_jauge_col, i, _x+i*70, _y, sc, sc, 0, c_white, 1)
	
		draw_set_color(tab_col[i])
	
		l = int64(data_hex_to_dec(string_copy(global.inst_ctrl.col, 1+2*i, 2))) / 255
		draw_rectangle(_x+i*70+decx, _y+h*sc-decy, _x+i*70+w*sc-decx, _y+h*sc-decy-((h*sc-decy*2)*l), false)
	
		draw_set_halign(fa_center)
		draw_text_transformed(_x+i*70+w*sc/2, _y+10, string(round(l*255)), 1.2, 1.2, 0)
	}

	//nb_projectiles
	draw_set_all(c_black, 1, fa_middle, fa_center, Font_grand)
	draw_sprite_ext(S_icon_projectile, 0, cam_sync_x(30), cam_sync_y(5), 0.6, 0.6, 0, c_white, 1)
	draw_text_transformed(cam_sync_x(135), camera_get_view_y(view_camera[0])+45, global.inst_ctrl.nb_projectiles, 0.8, 0.8, 0)

	draw_text(cam_mid_x(), cam_sync_y(50), data_time_ms_to_str(global.temps_joueur, false, true, true, false))
	
}

// joueurs connecté
draw_set_all($B0B0B0, 0.5, -1, -1, Font_principal)
draw_rectangle(cam_sync_x(1150), cam_sync_y(0), cam_sync_x(1366), cam_sync_y(20+instance_number(joueur)*30), false)
var inst = 0
var xs = 0.75

for (var i = 0; i < instance_number(joueur); i++) {
	inst = instance_find(joueur, i)
	draw_set_all(c_black, 0.25, -1, -1, Font_principal)
	draw_rectangle(cam_sync_x(1155), cam_sync_y(10+i*30), cam_sync_x(1360), cam_sync_y(30+i*30), false)
	draw_set_all(c_black, 1, -1, -1, Font_principal)
	if string_length(inst.pseudo) > 10 {xs = 0.75 - (string_length(inst.pseudo)-10)*0.04}
	draw_text_ext_transformed(cam_sync_x(1160), cam_sync_y(10+i*30), inst.pseudo, 0, 190, xs, 0.75, 0)
}