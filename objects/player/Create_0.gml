obj_set_scale(1)
depth = -100

/*
PARAMETRES A MODIFIER SI NECESSAIRE:

h_vitesse; h_coef_acceleration; h_coef_deceleration
v_vitesse; v_coef_deceleration
recharge_max; sens_gravite
*/

h_acceleration = 0 // acceleration (entre -1 et 1)
h_vitesse = 6 // vitesse max horizontale
h_coef_acceleration = 0.1 // vitesse à laquelle h_acceleration grandit (entre 0 et h_vitesse, et h_coef_acceleration = h_vitesse correspond à une transition de 0 à la vitesse max d'un coup)
h_coef_deceleration = 0.85 // coef de ralentissement (entre 0 et 1, à 0 le freinage est instantané, et à 1 le freinage est nul)

v_vitesse = 6 // vitesse max verticale
v_acceleration = 0 // acceleration (entre -1 et 1)
v_coef_deceleration = 0.1 // valeur de décélération verticale à chaque etape
gravite = 0 // gravite à 0 veux dire que la vitesse du saut est = à la vitesse d'attraction max. gravite < 0 veux dire que le saut est plus rapide que l'attraction, gravite = -1 annule l'attraction, gravite = 1 rend le saut impossible
recharge_max = 30 // temps du saut
recharge = 0

sens_gravite = 270