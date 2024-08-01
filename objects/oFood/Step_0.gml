
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
			consume_food(food_id);		//정해진 번호의 음식효과 수행
			audio_play_sound(SE_system01, 1, 0);
			act_count = 30; 
			oGame.time += 30;
			oPlayer.state = "Move";
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