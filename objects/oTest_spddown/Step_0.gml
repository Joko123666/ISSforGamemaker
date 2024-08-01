
act_count = count_decrease(act_count, 1, 0);

if (place_meeting(x, y, oPlayer))
{
	if oPlayer.input.interaction_hold	&& (act_count <= 0)
	{
		isActive = true;
		duration_count = count_decrease(duration_count, 1, 0);
		
		if (duration_count <= 0)
		{ 
			oPlayer.SPD -= 0.1;
			act_count = 30; 
			available_count--;
		}
	}
	else
	{
		isActive = false;
		duration_count = duration_time;
	}
}

if (available_count <= 0)
{
	instance_destroy();
}