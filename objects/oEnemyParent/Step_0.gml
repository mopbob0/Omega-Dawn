//receive damage
if place_meeting(x,y, oDamageEnemy)
{
	var _inst = instance_place(x,y, oDamageEnemy);
	
	//take damage from specific instance
	hp -= _inst.damage;
	
	//tell damage inst to destroy self
	_inst.destroy = true;
}

//death
if hp <= 0 
{
	instance_destroy();
}