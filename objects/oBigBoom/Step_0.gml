//if screen_pause() {exit;}
screen_pause();

if createdDamageObj == false
{
	damageInst = instance_create_depth(x,y,-20000, oDamageAll);
	with(damageInst)
	{
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale;
	}
	
	createdDamageObj = true;
}

if floor(image_index) > 1
{
	//destroy
	if instance_exists(damageInst)
	{
		instance_destroy(damageInst);
	}
	
}