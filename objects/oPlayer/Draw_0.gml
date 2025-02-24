//draw weapon behind player
	if aimDir >= 0 && aimDir < 180
	{
		draw_my_weapon();
	}

//draw player
draw_self();

//draw weapon in front of player
	if aimDir >= 180 && aimDir < 360
	{
		draw_my_weapon();
	}
	
	
	
//draw hp
draw_text(x,y, string(hp));



draw_text(x,y+15, string(global.controllerMode));