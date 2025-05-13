//damage setup
	get_damaged_create(20, true);

//variables for movement
moveDir = 0;
moveSpd = 0;
walkSpd = 1;
sprintSpd = 2;
lockSpd = 0.5;
xspd = 0;
yspd = 0;

vibration = false;
vibrationPattern = false;
vibrationPatternTime = 20;
vibrationPatternTimer = vibrationPatternTime;

//sprite control
	centerYOffset = -34;
	centerY = y + centerYOffset;
	centerX = x;

	weaponOffsetDist = 0;
	aimDir = 0;
	newAimDir = 0;
	gunAimDir = 0;
	mouseDir = 0;
	aimSmoothing = 0.4; // 0 = doesnt move, 1 = instant,  0.4 default,   0.35 is what someone else uses

	face = 0;
	sprite[0] = sPlayerE;
	sprite[1] = sPlayerNE;
	sprite[2] = sPlayerN;
	sprite[3] = sPlayerNW;
	sprite[4] = sPlayerW;
	sprite[5] = sPlayerSW;
	sprite[6] = sPlayerS;
	sprite[7] = sPlayerSE;
	
	arm[0] = sPlayerEArm;
	arm[1] = sPlayerNEArm;
	arm[2] = sPlayerNArm;
	arm[3] = sPlayerNWArm;
	arm[4] = sPlayerWArm;
	arm[5] = sPlayerSWArm;
	arm[6] = sPlayerSArm;
	arm[7] = sPlayerSEArm;
	
	weaponXoffset[0] = 0;	// E
	weaponXoffset[1] = 4;	// NE
	weaponXoffset[2] = 8;	// N
	weaponXoffset[3] = 4;	// NW
	weaponXoffset[4] = 0;	// W
	weaponXoffset[5] = -4;	// SW
	weaponXoffset[6] = -8;	// S
	weaponXoffset[7] = -6;	// SE


	sprite_index = sprite[face];

//weapon info
	shootTimer = 0;
	shootCooldown = 9; //9 default

	bulletObj = oBullet;
	weaponLength = 20; //  - sprite_get_xoffset(sGun)
	
	
	
	
	
	
	lockedEnemy = noone;