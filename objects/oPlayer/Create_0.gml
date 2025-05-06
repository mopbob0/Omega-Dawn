//damage setup
	get_damaged_create(20, true);

//variables for movement
moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;

vibration = false;
vibrationPattern = false;
vibrationPatternTime = 20;
vibrationPatternTimer = vibrationPatternTime;

//sprite control
	centerYOffset = -37;
	centerY = y + centerYOffset;

	weaponOffsetDist = 2;
	aimDir = 0;
	newAimDir = 0;
	mouseDir = 0;
	aimSmoothing = 0.4; // 0 = doesnt move, 1 = instant,  0.4 default,   0.35 is what someone else uses

	face = 0;
	sprite[0] = sPlayerE;
	sprite[1] = sPlayerSW; // ne
	sprite[2] = sPlayerS; // n
	sprite[3] = sPlayerSE; // nw
	sprite[4] = sPlayerW; // w
	sprite[5] = sPlayerSW;
	sprite[6] = sPlayerS;
	sprite[7] = sPlayerSE;
	
	arm[0] = sPlayerArmE;
	arm[1] = sPlayerArmS;
	arm[2] = sPlayerArmS;
	arm[3] = sPlayerArmS;
	arm[4] = sPlayerArmW;
	arm[5] = sPlayerArmSW;
	arm[6] = sPlayerArmS;
	arm[7] = sPlayerArmSE;
	
	weaponXoffset[0] = -2;	// E
	weaponXoffset[1] = 0;	// NE
	weaponXoffset[2] = 0;	// N
	weaponXoffset[3] = 0;	// NW
	weaponXoffset[4] = 0;	// W
	weaponXoffset[5] = -4;	// SW
	weaponXoffset[6] = -8;	// S
	weaponXoffset[7] = -8;	// SE


	sprite_index = sprite[face];

//weapon info
	shootTimer = 0;
	shootCooldown = 9; //9 default

	bulletObj = oBullet;
	weaponLength = sprite_get_bbox_right(sBigGun); //  - sprite_get_xoffset(sGun)
	
	
	
	
	
	
	lockedEnemy = noone;