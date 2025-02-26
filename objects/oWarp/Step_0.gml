if room == targetRoom
{
	oPlayer.x = targetObj.x;
	oPlayer.y = targetObj.y;
//	oPlayer.face = targetObj.image_index;
	
	with(oPlayer)
	{
		image_index = 0;
		sprite_index = sprite[face];
	//	aimDir = face*90;
		centerY = centerYOffset;
	}
}

if image_speed == -1 && image_index < 1
{
	instance_destroy();
}