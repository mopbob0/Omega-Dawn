//state machine
switch(state)
{
	//wait for enemy to shoot
	case 0:
		//aim for player
		if instance_exists(oPlayer)
		{
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		}
		
		//set depth to make myself more visible
		depth = -y - 50;

	break;
	
	//shoot / travel
	case 1:
		
		//movement
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd,dir);
		x += xspd;
		y += yspd;
		
		//depth
		depth = -y;
		
	break;
}

//cleanup
	//out of room bounds
	if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
	{
		destroy = true;
	}

	//player collision
	if hitConfirm == true && playerDestroy == true {destroy = true;}

	//actually destroy self
	if destroy == true {instance_destroy();}

	//wall collision
	if place_meeting(x,y, oSolidWall) {destroy = true;}
