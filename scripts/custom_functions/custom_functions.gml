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




//vfx
	function screen_pause()
	{
		//pause self
		if instance_exists(oScreenPause)
		{
			image_speed = 0;
			
			return true;
			
		} else {
			image_speed = 1;
			
			return false;
		}
	}
	function create_screen_pause(_time = 3)
	{
		with( instance_create_depth(0,0,0, oScreenPauseTimed) )
		{
			timer = _time;
		}
	}
	function screen_shake(_amount = 4)
	{
		_amount *= global.screenShakeAmount;
		
		with(oCamera)
		{
			xShakeAmount = _amount;
			yShakeAmount = _amount;
		}
	}




//damage calculation
	//damage create event
	function get_damaged_create(_hp = 10, _iframes = false)
	{
		maxHp = _hp;
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
				
					//clamp hp
					hp = clamp(hp, 0, maxHp);
				
					return false;
				}
			
				//make sure iframe blinking stops
				if _iframes == true
				{
					image_alpha = 1;
				}
			
			
			

			
			//receive damage
			var _hitConfirm = false;
			if place_meeting(x,y, _damageObj)
			|| ( _damageObj != oDamageParent && place_meeting(x,y, oDamageAll)) /// || place_meeting(x,y, oDamageAll) //
			{
				
				//getting list of damage insts
				
					//create list and copy instances to it
						var _instList = ds_list_create();	
						instance_place_list(x,y, _damageObj, _instList, false);
						if _damageObj != oDamageParent
						{
							instance_place_list(x,y, oDamageAll, _instList, false);
						}
	
					//get size of list
						var _listSize = ds_list_size(_instList);
		
					//loop through list
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
			
			hp = clamp(hp, 0, maxHp);
			
			return _hitConfirm;
	}