

var l = 50
var comp = 0
var coef = 0
var maxi = ceil(1366/l)
var maxj = ceil(768/l)

for (var i = 0; i < maxi; i++) {
	for (var j = 0; j < maxj; j++) {
		comp = (abs(compteur)/compteur_max)
		coef = (l/2) * comp - i/maxi * (1-comp) * (l) - j/maxj * (1-comp) * (l)
		if coef > (l/2) {coef = (l/2)}
		if coef < 0 {coef = 0}
		
		draw_set_color(make_color_rgb(comp*255, comp*255, comp*255))
		draw_rectangle(i*l + coef, j*l + coef, (i+1)*l - coef, (j+1)*l - coef, false)
	}
}
