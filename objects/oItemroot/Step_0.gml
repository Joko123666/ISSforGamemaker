
if isact == false	&& place_meeting(x, y, oPlayer)	&& oPlayer.input.interaction	&& isfail == false
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
		if (keyboard_check_pressed(ord("Q")))
		{	//체크 성공시 
			if (grade_check > root_probability_table[root_grade][0])
			{
				root_grade++;
				grade_check = irandom(100);
				audio_play_sound(SE_system01, 1, 0);
			}
			else	//체크 실패시
			{
				isfail = true;
				alarm[0] = 15;
				isact = false;
				oPlayer.alarm[0] = 3;//플레이어 상태틑 '이동'으로
				audio_play_sound(SE_system08, 1, 0);
				var drop_item =  instance_create_layer(x, y-84, "Instances", oItem_drop);
				drop_item.item_id = item_id_start;
				oPlayer.mentality -= 4;
			}
			act_count = 15;
		}
		if (keyboard_check_pressed(ord("E")))
		{
			if (grade_check < root_probability_table[root_grade][1])
			{item_grade = 1;}
			else if (grade_check < root_probability_table[root_grade][2])
			{item_grade = 2;}
			else if (grade_check < root_probability_table[root_grade][3])
			{item_grade = 3;}
			else if (grade_check < root_probability_table[root_grade][4])
			{item_grade = 4;}
			else if (grade_check < root_probability_table[root_grade][5])
			{item_grade = 5;}
			
			var drop_item =  instance_create_layer(x, y-84, "Instances", oItem_drop);
			drop_item.item_id = item_id_start + item_grade;
			
			oGame.time += 40;
			decreas_mentality_byhunger( 4);
			act_count = 15;
			alarm[0] = 15;
			isact = false;
			oPlayer.alarm[0] = 3;
			if (item_grade == 1)
			{audio_play_sound(SE_system08, 1, 0);}
			else
			{audio_play_sound(SE_system02, 1, 0);}
		}
	}
}

act_count = count_decrease(act_count, 1, 0);