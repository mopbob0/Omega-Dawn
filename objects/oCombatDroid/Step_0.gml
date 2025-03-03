//pause self
if screen_pause() {exit;}

//state machine
switch(state)
{
	//chase state 
		case 0:
			//get direction to player
			if instance_exists(oPlayer)
			{
				dir = point_direction(x,y, oPlayer.x, oPlayer.y);
			}
			//set speed
			spd = chaseSpd;
			
			//transition to shooting state
			shootTimer++;
			if shootTimer > cooldownTime
			{
				//go to shoot state
				state = 1;
				
				//reset timer
				shootTimer = 0;
			}
			
		break;
		
	//pause and shoot state
		case 1:
			//get direction to player
			if instance_exists(oPlayer)
			{
				dir = point_direction(x,y, oPlayer.x, oPlayer.y);
			}
			
			//set speed
			spd = 0;
			
			//shoot bullet
				shootTimer++;
				
				//create bullet
				if shootTimer == 1
				{
					bulletInst = instance_create_depth(x,y,depth,oEnemyBullet);
				}
				
				//shoot bullet after windup is complete
				if shootTimer == windupTime && instance_exists(bulletInst)
				{
					bulletInst.state = 1;
				}
				
				//recover and return to chasing player
				if shootTimer > windupTime + recoverTime
				{
					//go back to chasing playet
					state = 0;
					//reset timer
					shootTimer = 0;
				}
			
		break;
}


//chase player
	
	//get speeds
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
	
	//set depth
		depth = -y;
	
	
	
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

