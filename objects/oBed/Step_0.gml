

act_count = count_decrease(act_count, 1, 0);

if (place_meeting(x, y, oPlayer))
{
	if oPlayer.input.interaction_hold	&& (act_count <= 0)
	{
		isActive = true;
		duration_count = count_decrease(duration_count, oPlayer.SPD, 0);
		
		if (duration_count <= 0)
		{ 
			audio_play_sound(SE_system01, 1, 0);
			oGame.time = 480;
			oGame.day ++;
			dayreset_genpoint();
			set_item_price();
			with (oPlayer)
			{
				hunger -= 10;
				HP = maxHP
				mentality = maxMentality;
				state = "Stay";
				alarm[0] = 30;
				save_game();
			}
			fade_screen(30, c_black);
			instance_destroy();
		}
	}
	else
	{
		isActive = false;
		duration_count = duration_time;
		oPlayer.state = "Move";
	}
}
else {isActive = false; duration_count = duration_time;}

