//get inputs (litterally dont need these anymore but they are here anyway)
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
lockKey = input_check("shoot2");


// -- VIBRATOR -- //
#region

if input_check_pressed("vibrate")
{
	vibration = !vibration;
}
if input_check_pressed("vibratePattern")
{
	vibrationPattern = !vibrationPattern;
}

//if vibration == true
//{gamepad_set_vibration(0,2,2);}

if input_check_pressed("start")
{
	if !instance_exists(oPauseMenu)
	{
		instance_create_depth(0,0,0,oPauseMenu);
	} else {
		instance_destroy(oPauseMenu);
	}
}

if vibrationPattern == true
{
	vibrationPatternTimer -=1;
	if vibrationPatternTimer <= 0
	{
		vibration = !vibration;
		vibrationPatternTimer = vibrationPatternTime;
	}
}

#endregion

//pause self
if screen_pause() {exit;}

// -- PLAYER MOVEMENT -- // 
#region

	//move speed
	if lockedEnemy {moveSpd = lockSpd}
	else if input_check("sprint"){moveSpd = sprintSpd;}
	else moveSpd = walkSpd;

	//get direction
	var _horizKey = global.xaxisLeft;
	var _vertKey = global.yaxisLeft;
	moveDir = point_direction(0,0, _horizKey, _vertKey);
	
	//get x and y speeds
	var _spd = 0;
	var _inputLevel = point_distance(0,0, _horizKey, _vertKey);
	_inputLevel = clamp(_inputLevel, 0, 1);
	_spd = moveSpd * _inputLevel;
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
	
	//collision
	if place_meeting(x+xspd, y, oWall) {xspd = 0;}
	if place_meeting(x, y+yspd, oWall) {yspd = 0;}
	                        
	//move player
	x += xspd;
	y += yspd;
#endregion

// -- DAMAGE and GAME OVER -- //
#region

	//get damaged
//	if get_damaged(oDamagePlayer, true)
//	{
//		//damage vfx
//		create_screen_pause(25);
//		screen_shake(6);
//	}

	//death / game over
	if hp <= 0
	{
		instance_create_depth(0,0,0,oGameOverScreen);
		instance_destroy();
		exit;
	}

#endregion


// -- AIMING, SPRITE CONTROL and VISUALS -- //
#region
	//aim
		centerY = y + centerYOffset;
		centerX = x + weaponXoffset[face];
	
		//keyboard + mouse
		if global.controllerMode == 0 
		{
			newAimDir = point_direction(x, centerY, mouse_x, mouse_y); 
			gunAimDir = point_direction(centerX, centerY, mouse_x, mouse_y); 
		}
		
		//controller
		if global.controllerMode == 1 && (global.xaxisRight != 0 || global.yaxisRight != 0)
		{
			newAimDir = point_direction(0, 0, global.xaxisRight, global.yaxisRight);
		}


	//target lock
	if lockKey 
	{
	    var bestEnemy = noone;
	    var lockRange = 300;
	    var angleRange = 30;
	    var bestDist = 999999;

	    //find best enemy
	    with oEnemyParent  
	    {  
	        //check distance
	        var dist = point_distance(other.x, other.centerY, x, y);  
	        if dist < lockRange
	        {
	            //check angle
	            var enemyDir = point_direction(other.x, other.centerY, x, y);  
	            var angleDiff = abs(angle_difference(other.newAimDir, enemyDir));
	            if angleDiff < angleRange
	            {
	                if bestEnemy == noone || dist < bestDist || (dist == bestDist && angleDiff < abs(angle_difference(other.newAimDir, point_direction(x, y, bestEnemy.x, bestEnemy.y))))
	                {
	                    bestEnemy = id;
	                    bestDist = dist;
	                }
	            }
	        }
	    }	
	    lockedEnemy = bestEnemy;  
	}
	else 
	{ 
		lockedEnemy = noone; 
	}

	if lockedEnemy 
	{ 
		newAimDir = point_direction(x, centerY, lockedEnemy.x, lockedEnemy.y);
	}


	//fix wacky transition over 0 degrees somehow I forgot how this works tbh lmao
	if (newAimDir - aimDir > 180) {
		newAimDir -= 360;
	} else if (newAimDir - aimDir < -180) {
		newAimDir += 360;
	}


	//lerp aim based on new direction
	aimDir = lerp(aimDir, newAimDir, aimSmoothing); 
	aimDir = (aimDir + 360) mod 360;	


	//face player
	face = round(aimDir/45);
	if face = 8 {face = 0;}
	
	//animate
	if xspd == 0 && yspd == 0
	{
		image_index = 0;
	}

	//set player sprite
	mask_index = sprite[6];
	sprite_index = sprite[face];
	
	depth = -bbox_bottom;

#endregion


// -- WEAPONS -- //
#region

//shoot weapon
if shootTimer > 0 {(shootTimer--);}
if shootKey && shootTimer <=0
{
	//reset timer
	shootTimer = shootCooldown;
	
	//screen shake
	screen_shake(1);
	
	//create bullet
	var _xOffset = lengthdir_x(weaponLength + weaponOffsetDist, gunAimDir);
	var _yOffset = lengthdir_y(weaponLength + weaponOffsetDist, gunAimDir);
	var _bulletInst = instance_create_depth(centerX + _xOffset, centerY + _yOffset, depth-100,bulletObj);
	instance_create_depth(centerX + _xOffset, centerY + _yOffset, depth-100,oFlash);
	
	//change bullets direction
	with(_bulletInst)
	{
		dir = other.gunAimDir;
		image_angle = dir;
	}

}

#endregion
