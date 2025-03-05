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
	centerYOffset = -60;
	centerY = y + centerYOffset;

	weaponOffsetDist = 2;
	aimDir = 0;
	aimSmoothing = 0.4; // 0 = doesnt move, 1 = instant,     0.35 is what someone else uses

	face = 0;
	sprite[0] = sWalkE;
	sprite[1] = sWalkNE
	sprite[2] = sWalkN;
	sprite[3] = sWalkNW
	sprite[4] = sWalkW;
	sprite[5] = sWalkSW
	sprite[6] = sWalkS;
	sprite[7] = sWalkSE

	sprite_index = sprite[face];

//weapon info
	shootTimer = 0;
	shootCooldown = 9; //9 default

	bulletObj = oBullet;
	weaponLength = sprite_get_bbox_right(sBigGun); //  - sprite_get_xoffset(sGun)