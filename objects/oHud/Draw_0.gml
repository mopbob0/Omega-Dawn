var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _hpString = "HP:" + string(playerHp) + "/" + string(playerMaxHp);

draw_text(_camX, _camY, _hpString);