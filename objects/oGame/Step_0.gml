
//변수 업데이트
if (time > 1440)	//날자 변경
{time = 0; day++; set_item_price(); dayreset_genpoint();}
// 상호작용 입력딜레이
if (global.interaction_delay > 0) {
    global.interaction_delay -= 1;
}



switch (game_state)
{
	case "UI" :
	
	break;
	
	case "Menu" :
	
		if gameinput.cancel_menu
		{
			game_state = "Play";
			audio_play_sound(SE_system06, 1, 0);
		}
	
	break;
	
	case "Play" :	#region	play
	
		if (gameinput.cancel_menu)
		{ 
			game_state = "Menu";
			oHud.menu_level = 0;
			oHud.pos = 0;
			audio_play_sound(SE_system08, 1, 0);
		}
	
	break;	#endregion
	
	case "CutScean" :
		
	
	break;
	
	
}

