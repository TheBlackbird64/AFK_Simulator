obj_set_scale(1)
depth = -100

/*
PARAMETRES A MODIFIER SI NECESSAIRE:

h_vitesse; h_coef_acceleration; h_coef_deceleration
v_vitesse; v_coef_acceleration; v_coef_deceleration
*/

h_acceleration = 0 // acceleration (entre -1 et 1)
h_vitesse = 6 // vitesse max horizontale
h_coef_acceleration = 0.1 // vitesse à laquelle h_acceleration grandit (entre 0 et h_vitesse, et h_coef_acceleration = h_vitesse correspond à une transition de 0 à la vitesse max d'un coup)
h_coef_deceleration = 0.85 // coef de ralentissement (entre 0 et 1, à 0 le freinage est instantané, et à 1 le freinage est nul)

v_acceleration = 0 // pareil mais dans l'autre sens
v_vitesse = 6
v_coef_acceleration = 0.1
v_coef_deceleration = 0.85

inst_cam = instance_create_depth(x, y, depth, player_cam)
inst_affichage = instance_create_depth(x, y, depth, player_affichage)

// Variables de jeu
col = "000000"
vie = 0
temps = 0