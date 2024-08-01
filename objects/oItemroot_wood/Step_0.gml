
if isact == false	&& place_meeting(x, y, oPlayer)	&& oPlayer.input.interaction	&& isfail == false	&& act_count <= 0
{
	isact = true;
	oPlayer.state = "Rooting";	
	act_count = 10;
	grade_check = irandom(100);
}

if (isact == true)
{
	if (act_count <= 0)
	{
		//취소키
		if (keyboard_check_pressed(ord("Q")))
		{	
			alarm[0] = 15;
			isact = false;
			oPlayer.alarm[0] = 3;
			audio_play_sound(SE_system08, 1, 0);
		}
		//진행키
		if (keyboard_check_pressed(ord("E")))
		{
			var randomize_val = irandom(100);
			//체력이 요구치 미만일 경우 실패
			if  (oPlayer.hunger > 10)
			{
				//나무에 데미지
				var damage = 20 + irandom(10);
				if (wood_hp > damage)	//데미지가 나무의 체력보다 적을 경우 나무의 체력 감소
				{ 
					wood_hp -= damage;
					if (felling_probability_table[0][0] > randomize_val)
					{
						var drop_item =  instance_create_layer(x + 32*oPlayer.image_xscale, y-84, "Instances", oItem_drop);
						drop_item.item_id = item_id_start + item_grade;
					}
					//나무 채취 단계 (이미지)
					if (wood_hppercent > 0.66)
					{	image_num = 1;	}
					else if (wood_hppercent > 0.33)	{image_num = 2;}
					else {image_num = 3;}
				}
				else//데미지가 나무의 남은 체력 이상일 경우 채취 성공 
				{
					//드랍확률에 따라 드랍체크 반복실행
					for (i = 0; i < 5; i++)
					{
						repeat(felling_probability_table[i][0])
						{
							var randomize_val = irandom(100);
							if (felling_probability_table[i][irandom(4)] > randomize_val)
							{
								var drop_item =  instance_create_layer(x + random(84)*oPlayer.image_xscale, y-84, "Instances", oItem_drop);
								drop_item.item_id = item_id_start + i;
							}
						}
						i++
					}
					oPlayer.state = "Move";
					act_count = 25;
					alarm[0] = 25;
					audio_play_sound(SE_system02, 1, 0);
					isact = false;
				}
			
				oPlayer.hunger -= 10;
				oGame.time += 20;
				decreas_mentality_byhunger(4);
			}
			else 
			{
				act_count = 25;
				alarm[0] = 25;
				isact = false;
				oPlayer.state = "Move";
				audio_play_sound(SE_system02, 1, 0);
				isfail = true;
			}
		}
	}
}

act_count = count_decrease(act_count, 1, 0);