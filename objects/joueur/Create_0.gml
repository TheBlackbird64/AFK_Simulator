_id = 0
pseudo = ""
vie = 0
col = "000000"
temps = 0
nb_projectiles = 0

depth = -100
visible = false

if control {
	global.inst_ctrl = id
	
	instance_create_depth(x, y, depth, player_cam, {_parent : id})
	instance_create_depth(x, y, depth-10, interface_dessiner)
}