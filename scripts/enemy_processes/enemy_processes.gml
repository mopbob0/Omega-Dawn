function check_for_player(){
	var _dis = distance_to_object(oPlayer);
	
	if (_dis <= alertDis or alert) and _dis > attackDis
	{
		alert = true;
		
		if calcPathTimer-- <= 0
		{
			calcPathTimer = calcPathDelay;
			//can we make a path to the player?
			var _found_player = mp_grid_path(global.mpGrid, path, x, y, oPlayer.x, oPlayer.y, choose(0,1));
	
			//start path if we can reach player
			if _found_player
			{
				path_start(path, moveSpeed, path_action_stop, false);	
			}
		}
	} else {
		//are we close enough to attack?
		if _dis <= attackDis
		{
			path_end();	
		}
	}
}

function enemy_anim(){
	switch(state)
	{
		case states.IDLE:
			sprite_index = sIdle;
		break;
		case states.MOVE:
			sprite_index = sMove;
		break;
		case states.ATTACK:
			sprite_index = sAttack;
		break;
		case states.DEAD:
			sprite_index = sDead;
		break;
	}
	//updade previous position
	xp = x;
	yp = y;
}