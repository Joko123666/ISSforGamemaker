
act_count = count_decrease(act_count, 1, 0);

if (place_meeting(x, y, oPlayer))
{
	if oPlayer.input.interaction_hold	&& (act_count <= 0)
	{
		isActive = true;
		duration_count = count_decrease(duration_count, oPlayer.SPD, 0);
		oPlayer.state = "Gathering";
		
		if (duration_count <= 0)
		{ 
			if (global.piety >= global.skilltree_temple_price[skill_i][skill_num])
			{
				global.skilltree_temple[skill_i][skill_num] = true;
				global.piety -= global.skilltree_temple_price[skill_i][skill_num];
				get_templeskilltree(skill_i, skill_num);
				skill_num++;
				audio_play_sound(SE_system01, 1, 0);
			}
			else
			{
				audio_play_sound(SE_system04, 1, 0);	
			}
			act_count = 30; 
			oPlayer.state = "Move";
		}
	}
	else
	{
		isActive = false;
		duration_count = duration_time;
		oPlayer.state = "Move";
	}
}