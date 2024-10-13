// Inherit the parent event
event_inherited();

draw_set_all(c_white, image_alpha, fa_middle, fa_center, Font_principal)
draw_text_transformed(x, y-62, data_time_ms_to_str(global.meilleur_temps, false, true, true, false), 2, 2, 0)
