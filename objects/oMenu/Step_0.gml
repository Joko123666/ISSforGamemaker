
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
		case 0 :
		switch(pos)
		{
			case 0 :
				instance_create_layer(1300, 1100, "Playerlayer", oPlayer);
				room_goto(village_main); instance_destroy();
			break;
	
			case 1 :
				room_goto(Testroom); instance_destroy();
			break;
	
			case 2 :
				menu_level = 2;
			break;
	
			case 3 :
				game_end();
			break;
	
	
		}
		break;
	
		case 2 :
		switch(pos)
		{
			case 0 :
				menu_level = 0;
			break;
		
			case 1 :
				menu_level = 0;
			break;
		
			case 2 :
				menu_level = 0;
			break;
		
			case 3 :
				menu_level = 0;
			break;
		}
	
		break;
	}
	if (_sel != menu_level) {pos = 0;}	
	op_length = array_length(option[menu_level]);
}