// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
			up:			input_binding_key(ord("W")),
			down:		input_binding_key(ord("S")),
			left:		input_binding_key(ord("A")),
			right:		input_binding_key(ord("D")),	
			
			sprint:		input_binding_key(vk_shift),
			
			shoot:		input_binding_mouse_button(mb_left),
			
			start:		input_binding_key(vk_escape),
        },
        
        gamepad:
        {
			//up:		[input_binding_gamepad_axis(gp_axislv, true), input_binding_gamepad_button(gp_padu)],
			//down:		[input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
			//left:		[input_binding_gamepad_axis(gp_axislh, true), input_binding_gamepad_button(gp_padl)],
			//right:	[input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
			
			up:			input_binding_gamepad_button(gp_padu),
			down:		input_binding_gamepad_button(gp_padd),
			left:		input_binding_gamepad_button(gp_padl),
			right:		input_binding_gamepad_button(gp_padr),
			
			sprint:		input_binding_gamepad_button(gp_stickl),
			
			shoot:		input_binding_gamepad_button(gp_shoulderrb),
			
			start:		input_binding_gamepad_button(gp_start),
        },
        
        touch:
        {
			// you play on mobile? well that sucks, just get better
        }
    };
}