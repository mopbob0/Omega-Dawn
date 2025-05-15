event_inherited();

spd = 0;
chaseSpd = 0.5;
dir = 0;
xspd = 0;
yspd = 0;

//sprite control
	face = 0;
	sprite[0] = sCombatWalk; // right
	sprite[1] = sCombatWalk; // up
	sprite[2] = sCombatWalk; // left
	sprite[3] = sCombatWalk; // down

	sprite_index = sprite[face];
	
//state machine
state = 1;
	//shooting state
	cooldownTime = 4*60;
	shootTimer = 0;
	windupTime = 20;
	recoverTime = 45;
	bulletInst = noone;