//drawing the player's weapon
	function draw_my_weapon()
	{
		//draw weapon
		//offset weapon
		var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
		//flip weapon upright
		var _weaponYscl = 1;
		if aimDir > 90 && aimDir < 270
		{
			_weaponYscl = -1;
		}

		draw_sprite_ext(sBigGun,0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1);
	}



//damage calculation
	//damage create event
	function get_damaged_create(_hp = 10, _iframes = false)
	{
		hp = _hp;
		
		//get the iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 30;
		}

		//create damage list
		if _iframes == false
		{
			damageList = ds_list_create();
		}
	}
	
	//damage cleanup event
	function get_damaged_cleanup()
	{
		//DO NOT NEED if using iframes
			
		//delete damage list data structure to free memory
		ds_list_destroy(damageList);
	}
	
	//damage step event
	function get_damaged(_damageObj, _iframes = false)
	{
			//iframe visuals
				//special exit for iframe timer
				if _iframes == true && iframeTimer > 0 
				{
					iframeTimer--;
				
					if iframeTimer mod 4 == 0
					{
						if image_alpha == 1
						{
							image_alpha = 0;
						} else {
							image_alpha =1;
						}
					}
				
					exit;
				}
			
				//make sure iframe blinking stops
				if _iframes == true
				{
					image_alpha = 1;
				}
			
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
						var _hitConfirm = false;
						for(var i = 0; i < _listSize; i++)
						{
							//get a damage inst from list
							var _inst = ds_list_find_value(_instList, i);
			
							//check if this inst is alraeady in damage list
							if _iframes == true || ds_list_find_index(damageList, _inst) == -1
							{
								//add new damage inst to damage list
								if _iframes == false
								{
									ds_list_add(damageList, _inst);
								}
					
								//take damnage from specific instance
								hp -= _inst.damage;
								_hitConfirm = true;
								//tell damnage inst it has impacted
								_inst.hitConfirm = true;
							}
						}
						
						//set iframes if we were hit 
						if _iframes == true && _hitConfirm == true
						{
							iframeTimer = iframeNumber;
						}
	
					//free memory
						ds_list_destroy(_instList);	
			}
	
			//clear damage list of objects that don't exist anymore or arent touching anymore 
			if _iframes == false
			{
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
	}