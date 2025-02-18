//get cameras width and height
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//center on player
if instance_exists(oPlayer)
{
	x = oPlayer.x - _camW/2;
	y = oPlayer.centerY - _camH/2;
}

//set camera position
camera_set_view_pos(view_camera[0], x, y);