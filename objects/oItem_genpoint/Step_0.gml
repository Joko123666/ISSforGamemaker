
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
			var _item = instance_create_layer(x, y-32, "Instances", oItem_drop);
			_item.item_id = irandom_range(set_item_min, set_item_max);
			
			audio_play_sound(SE_system01, 1, 0);
			act_count = 30; 
			global.genpoint_available_count[genpoint_num]--;
			oGame.time += 20;
			oPlayer.hunger -= 10;
			decreas_mentality_byhunger(2);
			oPlayer.state = "Move";
		}
	}
	else
	{
		isActive = false;
		duration_count = duration_time;
		if (oPlayer.state == "Gathering" or oPlayer.state == "Stay")
		{oPlayer.state = "Move";}
	}
}
else {isActive = false; duration_count = duration_time;}

if (available_count <= 0)
{
	global.genpoint_available_count[genpoint_num] = 0;
	instance_destroy();
}