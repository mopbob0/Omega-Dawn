var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw black rectangle over screen
	draw_set_alpha(alpha*alphaMax);
	draw_rectangle_colour(_camX, _camY, _camX+_camW, _camY+_camH, c_black,c_black,c_black,c_black, false);

//draw text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha);
	draw_set_font(fnt8BitOperator);
	
	var _gameoverOffset = -40;
	draw_text_transformed(_camX+_camW/2, _camY+_camH/2 + _gameoverOffset, "Game Over", 7,7,0);
	
	var _restartOffset = 50;
	draw_text_transformed(_camX+_camW/2, _camY+_camH/2 + _restartOffset, "~ Press Shoot to Restart ~", 2,2,0);
	
//reset to default draw settings
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);