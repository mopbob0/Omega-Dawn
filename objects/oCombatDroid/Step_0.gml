//chase player
	if instance_exists(oPlayer)
	{
		dir = point_direction(x,y, oPlayer.x, oPlayer.y);
	}
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

	//collisions
	if place_meeting(x+xspd, y, oWall) || place_meeting(x+xspd, y, oEnemyParent)
	{
		xspd = 0;
	}
	if place_meeting(x, y+yspd, oWall) || place_meeting(x, y+yspd, oEnemyParent)
	{
		yspd = 0;
	}
	
	//move
	x += xspd;
	y += yspd;
	
	
	
	
	//face
	face = round(dir/90);
	if face = 4 {face = 0;}
	
	//animate
	if xspd == 0 && yspd == 0
	{
		image_index = 0;
	}

	//set player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
	
	

//inherit parent event
	//getting damaged and dying
	event_inherited();

