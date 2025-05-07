//draw weapon behind player
	if aimDir >= 112.5 && aimDir < 247.5
	{
		draw_my_weapon(arm[face]);
	}

//draw player
draw_self();

//draw weapon in front of player
	if aimDir >= 247.5 && aimDir < 360 || aimDir >=0 && aimDir < 112.5
	{
		draw_my_weapon(arm[face]);
	}
	