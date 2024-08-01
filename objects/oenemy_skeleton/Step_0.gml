
switch (state)
{
	case "Neutral" :
	#region neutral state
	if !instance_exists(oPlayer) break;
	state_set_sprite(enemy_hill_skeleton, 1, 0);
	var direction_facing = image_xscale;
	var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
	
	act_count = count_decrease(act_count, 1, 0);
	if distance_to_player < act_range && act_count <=0
	{
		state = "Chase"
	}
	
	#endregion
	break;
	
	case "Chase" :
	#region Chase state
		state_set_sprite(enemy_hill_skeleton_move, 1, 0);
		if !instance_exists(oPlayer) break;
		
		act_switch = false;
		act_count = count_decrease(act_count, 1, 0);
		var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
		var direction_facing = image_xscale;
		var ydistance = abs(oPlayer.y - y);
		move_and_collide_enemy(direction_facing * move_speed, 0);
		
		if act_count <= 0
		{
			//방향 리셋
			image_xscale = sign(oPlayer.x - x);
			if image_xscale == 0 
			{
				image_xscale = 1;
			}
			act_count = 50;
		}
		
		if place_meeting(x, y, oPlayer) && oPlayer.invincibility == false
		{
			creat_hitbox(x, y, self, sprite_index, knockback_power, 1, attack_power, image_xscale);
			knockback_speed = -3 * image_xscale;
			state = "Knockback"
		}
		
		if distance_to_player >= act_range	or	ydistance > 32
		{
			state = "Neutral"
		}
		
		
	#endregion
		break;

	case "Knockback" :
		#region Knockback_state
			if !instance_exists(oPlayer) break;
			act_count = act_count_set;
			knockback_state(enemy_hill_skeleton_knockback, "Neutral");

		#endregion
	break;
		
	case "Death" :
	#region
		

		instance_destroy();
	#endregion
	break;
	
	case "Explosion" :
	#region
		
		create_particle(x, y, oeffect_explosion01, 1);
		creat_hitbox(x, y, self, hit_48, 5, 5, 40, image_xscale)
		instance_destroy();

	#endregion
	break;
}


			//Veltical Collosion
		vsp = vsp + grv;
		
		if (place_meeting(x,y+vsp,oWall))	//공중에 떠있을 경우
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}
		
		y = y + vsp;
