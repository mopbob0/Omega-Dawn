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

//inherit parent event
	//getting damaged and dying
	event_inherited();

