event_inherited();

spd = 0;
chaseSpd = 0.5;
dir = 0;
xspd = 0;
yspd = 0;

//sprite control
	face = 0;
	sprite[0] = sCombatRight;
	sprite[1] = sCombatUp;
	sprite[2] = sCombatLeft;
	sprite[3] = sCombatDown;

	sprite_index = sprite[face];
	
//state machine
state = 1;
	//shooting state
	cooldownTime = 4*60;
	shootTimer = 0;
	windupTime = 60;
	recoverTime = 45;
	bulletInst = noone;