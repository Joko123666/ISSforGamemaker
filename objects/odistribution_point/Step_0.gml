
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
			var _item = instance_create_layer(x + 64, y-38, "Instances", oFood);
			_item.food_id = 0;
			
			audio_play_sound(SE_system01, 1, 0);
			act_count = 30; 
			available_count--;
			oGame.time += 10;
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
else {isActive = false; duration_count = duration_time;}

if (available_count <= 0)
{
	instance_destroy();
}