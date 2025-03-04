//get cameras width and height
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//center on player
if instance_exists(oPlayer)
{
	x = oPlayer.x - _camW/2;
	y = oPlayer.centerY - _camH/2;
}

//camera shaking
if keyboard_check_pressed(vk_enter) 
{
	screen_shake(4);
}

	//x shake
	if xShakeAmount > 0
	{
		xShakeDir += xShakeDirSpd;
		xShakeAmount -= xShakeAmountSpd;
	} else {
		xShakeAmount = 0;
		xShakeDir = 0;
	}
	xShake = dsin(xShakeDir) * xShakeAmount;
	
	//y shake
	if yShakeAmount > 0
	{
		yShakeDir += yShakeDirSpd;
		yShakeAmount -= yShakeAmountSpd;
	} else {
		yShakeAmount = 0;
		yShakeDir = 0;
	}
	yShake = dsin(yShakeDir) * yShakeAmount;

//add camera shake
x += xShake;
y += yShake;


//clamp camera to room borders
x = clamp(x,0,room_width - _camW);
y = clamp(y,0,room_height - _camH);


//set camera position
camera_set_view_pos(view_camera[0], x, y);