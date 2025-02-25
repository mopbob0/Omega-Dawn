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
			
			shoot:		input_binding_mouse_button(mb_left),
        },
        
        gamepad:
        {
        },
        
        touch:
        {
        }
    };
}