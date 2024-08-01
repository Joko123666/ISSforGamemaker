
act_count = count_decrease(act_count, 1, 0);

if (place_meeting(x, y, oPlayer)) 
{
	if oPlayer.input.interaction_hold	&& (act_count <= 0)
	{
		isActive = true;
		duration_count = count_decrease(duration_count, oPlayer.SPD, 0);
		
		if (duration_count <= 0)
		{ 

			oInventory.this_item = i;
			with (oInventory)
			{
				if (Inventory_sellitem(id, this_item) == true)
				{Inventory_sellitem(id, this_item);}
			}
			audio_play_sound(SE_coin01, 1, 0);
			act_count = 30; 
		}
	}
	else
	{
		isActive = false;
		duration_count = duration_time;
	}
}
