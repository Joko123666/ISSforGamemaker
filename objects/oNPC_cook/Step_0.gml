



switch (state)
{
	case "Stand" :
	{

		if place_meeting(x,y,oPlayer) && oPlayer.input.interaction	&& act_count <=0
		{
			//sprite_index = NPC_village_01_active;
			deactivate_count = 75;
			act_count = 75;
			
			create_textbox_popup("나니니시마스까?", c_ltgray, c_black);
			
			state = "Selling";
	
			audio_play_sound(SE_dialog_m01, 1, false);
		}

		if act_count > 0 
			{ act_count--;}
		}
	break;
	
	case "Selling" :
	{
		//메뉴의 전체 갯수를 카운트
		op_length = array_length(option[menu_level]);

		//get_key
		up_key = oGame.gameinput.menu_up;
		down_key = oGame.gameinput.menu_down;
		confirm_key = oGame.gameinput.menu_confirm;


		//메뉴바를 이동하면 커서 위치를 변경
		pos += down_key - up_key;
		if (pos >= op_length) {pos = 0;}
		if (pos < 0) {pos = op_length - 1;}


		if (confirm_key)
		{
			var _sel = menu_level;
			switch(menu_level)
			{
				case 0 :	//메뉴 고르기
				switch(pos)
				{
					case 0 :	//빵
						sell_food(pos);
						
					break;
	
					case 1 :	//고기스튜
						sell_food(pos);
					break;
	
					case 2 :	//슬라임 푸딩
						sell_food(pos);
					break;
	
					case 3 :	//만드라고라 스프
						sell_food(pos);
					break;
	
					case 4 :
						create_textbox_popup("배고파 지면 다시 오라고!", c_ltgray, c_black);
						state = "Stand";
						act_count = 75;
					break;
				}
				break;
	
				break;
			}
			if (_sel != menu_level) {pos = 0;}	
			op_length = array_length(option[menu_level]);
		}
	}
	break;
}