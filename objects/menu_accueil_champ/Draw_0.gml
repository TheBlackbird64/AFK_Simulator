
draw_set_all(c_black, image_alpha, fa_middle, fa_left, Font_principal)
draw_self()

var aff = texte
if compteur > 30 {aff += "|"}
draw_text(x-obj_larg()+10, y, aff)