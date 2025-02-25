//toggle controller mode
if keyboard_check_pressed(ord("K"))
{
	if global.controllerMode == 1 {global.controllerMode = 0;}
	else {global.controllerMode = 1;}
}
/*


//get inputs

	//keyboard + mouse
	if global.controllerMode == 0
	{
		global.rightKey = keyboard_check(ord("D"));
		global.leftKey = keyboard_check(ord("A"));
		global.upKey = keyboard_check(ord("W"));
		global.downKey = keyboard_check(ord("S"));

		global.xaxisLeft = global.rightKey - global.leftKey;
		global.yaxisLeft = global.downKey - global.upKey;
		
		global.shootKey = mouse_check_button(mb_left);
	}
	
	//controller
	if global.controllerMode == 1
	{
		var _gamePad = 0;
		if gamepad_is_connected(_gamePad)
		{
			
			gamepad_set_axis_deadzone(_gamePad, 0.2);
			
			global.rightKey = gamepad_button_check(_gamePad, gp_padr);
			global.leftKey = gamepad_button_check(_gamePad, gp_padl);
			global.upKey = gamepad_button_check(_gamePad, gp_padu);
			global.downKey = gamepad_button_check(_gamePad, gp_padd);
		
			global.xaxisLeft = gamepad_axis_value(_gamePad, gp_axislh) + (global.rightKey - global.leftKey);
			global.yaxisLeft = gamepad_axis_value(_gamePad, gp_axislv) + (global.downKey - global.upKey);
			global.xaxisLeft = clamp(global.xaxisLeft, -1, 1);
			global.yaxisLeft = clamp(global.yaxisLeft, -1, 1);
			
			global.xaxisRight = gamepad_axis_value(_gamePad, gp_axisrh);
			global.yaxisRight = gamepad_axis_value(_gamePad, gp_axisrv);
			
			global.shootKey = gamepad_button_check(_gamePad, gp_shoulderrb);
		}
	}
	
*/

		global.rightKey = input_check("right")
		global.leftKey = input_check("left")
		global.upKey = input_check("up")
		global.downKey = input_check("down")

		global.xaxisLeft = global.rightKey - global.leftKey;
		global.yaxisLeft = global.downKey - global.upKey;
		
		global.shootKey = input_check("shoot")