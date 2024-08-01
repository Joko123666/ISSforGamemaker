
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
			var i = 0;
			for (var i = 0; i < 5; i++)
			{
				if (set_this_item < picking_probability_table[0][i])
				{
					var _item = instance_create_layer(x, y-32, "Instances", oItem_drop);
					_item.item_id = i + item_startid;
					set_this_item = irandom(100);
					if (i == 0)	//독버섯일경우 데미지
					{
						oPlayer.HP -= 15;
						isPoisonText = true;
						alarm[1] = 40;
						repeat(15)
						{instance_create_layer(oPlayer.x + random_range(-12, 12), oPlayer.y, "Instances", oparticle_10);}
						audio_play_sound(SE_system04, 1, 0);
						oPlayer.mentality += 4;
						oPlayer.alarm[0] = 3;
					}
					decreas_mentality_byhunger(2);
					oPlayer.hunger -= 5;
					oGame.time += 20;
					break;
				}
			}
			
			
			audio_play_sound(SE_system01, 1, 0);
			act_count = 30; 
			reduce_genpoint_count(genpoint_num);
			oPlayer.alarm[0] = 3;//플레이어 상태틑 '이동'으로
		}
	}
	else
	{
		isActive = false;
		duration_count = duration_time;
		if (oPlayer.state == "Gathering" or oPlayer.state == "Stay")
		{oPlayer.alarm[0] = 3;}
	}
}
else {isActive = false; duration_count = duration_time;}

