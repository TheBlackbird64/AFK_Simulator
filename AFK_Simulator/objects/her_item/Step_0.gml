visible = true

compteur++
if compteur > 360 {compteur = 0}
y = _y
y += sin(degtorad(compteur))*10