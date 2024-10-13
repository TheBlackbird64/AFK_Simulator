// Inherit the parent event
event_inherited();
depth = -500

x = cam_mid_x()
y = cam_mid_y()
if view_get_visible(1) {
	x = cam_mid_x(1)
	y = cam_mid_y(1)
}
obj_set_scale(0.5)