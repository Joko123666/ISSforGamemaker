
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

#region 문자 입력
if (global.input_active) {
    // 엔터키로 입력 완료
    if (keyboard_check_pressed(vk_enter)) {
        global.input_active = false; // 입력 창 비활성화
        global.user_input = keyboard_string;
        show_debug_message("Input saved: " + global.user_input);
        // 여기서 입력된 내용을 저장하거나 다른 처리를 할 수 있음
        keyboard_string = ""; // 입력된 문자열 초기화
    }

    // 백스페이스로 문자 삭제
    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(keyboard_string) > 0) {
            keyboard_string = string_delete(keyboard_string, string_length(keyboard_string), 1);
        }
    }
}
#endregion
