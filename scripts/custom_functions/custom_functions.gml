//drawing the player's weapon
function draw_my_weapon()
{
	//draw weapon
	//offset weapon
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
	//flip weapon upright
	var _weaponYscl = 1;
	if aimDir >90 && aimDir < 270
	{
		_weaponYscl = -1;
	}

	draw_sprite_ext(sGun,0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1);
}