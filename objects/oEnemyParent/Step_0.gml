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
			
					//check if this inst is alraeady in damage list
					if ds_list_find_index(damageList, _inst) == -1
					{
						//add new damage inst to damage list
						ds_list_add(damageList, _inst);
					
						//take damnage from specific instance
						hp -= _inst.damage;
						//tell damnage inst it has impacted
						_inst.hitConfirm = true;
					}
				}
	
			//free memory
				ds_list_destroy(_instList);	
	}
	
	//clear damage list of objects that don't exist anymore or arent touching anymore 
	var _damageListSize = ds_list_size(damageList);
	for(var i = 0; i < _damageListSize; i++)
	{
		//if not touching damage inst anymore, remove it from list AND set loop back 1 position
		var _inst = ds_list_find_value(damageList, i);
		if !instance_exists(_inst) || !place_meeting(x,y, _inst)
		{
			ds_list_delete(damageList, i);
			i--;
			_damageListSize--;
		}
	}


//death
if hp <= 0 
{
	instance_destroy();
}