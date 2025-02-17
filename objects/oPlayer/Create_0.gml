//damage setup
	get_damaged_create(20, true);

//variables for movement
moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;


//sprite control
	centerYOffset = -6;
	centerY = y + centerYOffset;

	weaponOffsetDist = 2;
	aimDir = 0;

	face = 0;
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerUp;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerDown;

	sprite_index = sprite[face];
	
//weapon info
	shootTimer = 0;
	shootCooldown = 9;

	bulletObj = oBullet;
	weaponLength = sprite_get_bbox_right(sGun); //  - sprite_get_xoffset(sGun)