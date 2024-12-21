// Inherit the parent event
event_inherited();

draw_set_all($4343ff, 1, fa_middle, fa_center, Font_principal)

draw_text_transformed(obj_x_pos_rel(0.5), obj_y_pos_rel(0.9), nb_joueurs + "/" + string(global.nb_joueur_min) + " joueur(s) en attente..", 1, 1, 0)