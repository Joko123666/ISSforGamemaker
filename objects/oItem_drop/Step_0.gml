
//시간경과에 따른 투명화 및 제거
count_decrease(duration, 1, 0);
if (duration < 90)
{image_alpha = image_alpha * 0.96;}
if (duration <= 0)
{instance_destroy();}

gravity_defalt();

act_count = count_decrease(act_count, 1, 0);

if place_meeting(x, y, oPlayer) && act_count <= 0
{
	oInventory.this_item = item_id;
	with (oInventory)
	{
		if (!Inventory_isfull(id))
		{
			Inventory_add(id, this_item);
			audio_play_sound(SE_getitem, 1, 0);
			item_get_effect(0);
			global.Encyclopedia[0][this_item].count += 1;
		}
		else
		{isfull = true;}
	}
	
	if (oInventory.isfull == true)
	{
		vsp = -8;
		act_count = 60;
		draw_full_message = true;
		alarm[1] = 40;
	}
	else 
	{
		
		instance_destroy();
	}
}

if (act_count > 0)
{
	image_alpha = 0.8;
}