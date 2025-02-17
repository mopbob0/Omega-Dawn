//drawing the player's weapon
	function draw_my_weapon()
	{
		//draw weapon
		//offset weapon
		var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
		//flip weapon upright
		var _weaponYscl = 1;
		if aimDir >90 && aimDir < 270
		{
			_weaponYscl = -1;
		}

		draw_sprite_ext(sGun,0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1);
	}



//damage calculation
	//damage create event
	function get_damaged_create(_hp = 10)
	{
		hp = _hp;

		//create damage list
		damageList = ds_list_create();
	}
	
	//damage cleanup event
	function get_damaged_cleanup()
	{
		//delete damage list data structure to free memory
		ds_list_destroy(damageList);
	}
	
	//damage step event
	function get_damaged(_damageObj)
	{
			//receive damage
			if place_meeting(x,y, _damageObj)
			{
				//getting list of damage insts
					//create list and copy instances to it
						var _instList = ds_list_create();
						instance_place_list(x,y, _damageObj, _instList, false);
	
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
	}