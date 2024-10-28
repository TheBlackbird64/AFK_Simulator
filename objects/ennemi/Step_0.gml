visible = true

if vie > 0 {explose = true}

if vie <= 0 and explose {
	action_mort_joueur()
	explose = false
}