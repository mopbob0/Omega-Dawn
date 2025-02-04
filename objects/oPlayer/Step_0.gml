//get inputs (litterally dont need these anymore but they are here anyway)
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;


//player movement
#region
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

//sprite control	
#region
	//player aiming
	centerY = y + centerYOffset;
	
	//aim
		//keyboar + mouse
		if global.controllerMode == 0
		{
			aimDir = point_direction(x, centerY, mouse_x, mouse_y);
		}
		
		//controller
		if global.controllerMode == 1
		{
			if global.xaxisRight != 0 || global.yaxisRight != 0 
			aimDir = point_direction(0, 0, global.xaxisRight, global.yaxisRight);
		}

	//face player
	face = round(aimDir/90);
	if face = 4 {face = 0;}
	
	//animate
	if xspd == 0 && yspd == 0
	{
		image_index = 0;
	}

	//set player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
#endregion

//shoot weapon
if shootTimer > 0 {(shootTimer--);}
if shootKey && shootTimer <=0
{
	//reset timer
	shootTimer = shootCooldown;
	
	//create bullet
	var _xOffset = lengthdir_x(weaponLength + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponLength + weaponOffsetDist, aimDir);
	var _bulletInst = instance_create_depth(x + _xOffset, centerY + _yOffset, depth-100,bulletObj);
	
	//change bullets direction
	with(_bulletInst)
	{
		dir = other.aimDir;
	}
}