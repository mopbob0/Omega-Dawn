//receive damage
if place_meeting(x,y, oDamageEnemy)
{
	//getting list of damage insts
		//create list and copy instances to it
			var _instList = ds_list_create();
			instance_place_list(x,y, oDamageEnemy, _instList, false);
	
		//get size of list
			var _listSize = ds_list_size(_instList);
		
		//loop through list
			for(var i = 0; i < _listSize; i++)
			{
				//get a damage inst from list
				var _inst = ds_list_find_value(_instList, i);
			
				//take damnage from specific instance
				hp -= _inst.damage;
			
				//tell damnage inst to destroy self
				_inst.destroy = true;
			}
	
		//free memory
			ds_list_destroy(_instList);	
}

//death
if hp <= 0 
{
	instance_destroy();
}