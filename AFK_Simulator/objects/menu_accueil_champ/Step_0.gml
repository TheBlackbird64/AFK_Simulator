
compteur ++
if compteur > 60 {compteur = 0}

if string_length(keyboard_string) > 15 {
	keyboard_string = string_copy(keyboard_string, 0, 15)
}
texte = data_caracteres_non_valide(keyboard_string)

menu_accueil_bt_jouer.active = texte != ""
global.pseudo = texte