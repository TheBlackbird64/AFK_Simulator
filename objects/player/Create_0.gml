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
instance_create_depth(x, y, depth, player_tir)
instance_create_depth(x, y, depth-10, interface_dessiner)

// Variables de jeu
_id = global.id_joueur
pseudo = global.pseudo
vie = global.vie_max
col = "000000"

// pr ne pas mettre à jour les coordonnés :
__x = -1
__y = -1

compteur_invincible = 30
