get_damaged(oDamageParent);

//show damage
var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * image_number;

if hp <= 0
{
	instance_create_depth(x+8, y+8, -3000, oBigBoom);
	
	//vfx
	create_screen_pause(10);
	screen_shake(8);
	
	instance_destroy();
}