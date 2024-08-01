

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
	if (oPlayer.useitem_stock == -1)
	{
		oPlayer.useitem_stock = item_id;
		audio_play_sound(SE_getitem, 1, 0);
		item_get_effect(1);
		instance_destroy();
	}
	else
	{
		vsp = -8;
		act_count = 60;
		draw_full_message = true;
		alarm[1] = 40;
	}
}

if (act_count > 0)
{
	image_alpha = 0.8;
}