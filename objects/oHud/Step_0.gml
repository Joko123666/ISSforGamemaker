/*
hour = floor(oGame.time/gametime/360);	//시간(시)
minute = floor(oGame.time/gametime/60 - hour*60);
second = floor(oGame.time/gametime - minute*60);
*/

hour = floor(oGame.time/gametime);
minute = floor(oGame.time) - 60*hour;

gold = floor(oGame.money/10000);
silver = floor(oGame.money/100) - gold*100;
bronze = oGame.money - gold*10000 - silver*100;
//silver = floor(oGame.)

if (hour < 6)
{	timelight = 4;}
else if (hour < 11)
{	timelight = 0;}
else if (hour < 16)
{	timelight = 1;}
else if (hour < 19)
{	timelight = 2;}
else if (hour < 21)
{	timelight = 3;}
else
{	timelight = 4;}


if (oGame.game_state == "Menu")	#region //메뉴가 열려있다면
{
	//메뉴의 전체 갯수를 카운트
	menu_length = array_length(menu[menu_level]);
	
	//get_key
	up_key = oGame.gameinput.menu_up;
	down_key = oGame.gameinput.menu_down;
	confirm_key = oGame.gameinput.menu_confirm;
	cancel_key = oGame.gameinput.menu_back;


	//메뉴바를 이동하면 커서 위치를 변경
	pos += down_key - up_key;
	if (pos >= menu_length) {pos = 0;}
	if (pos < 0) {pos = menu_length - 1;}


	if (confirm_key)
	{
		var _sel = menu_level;
		switch(menu_level)
		{
			case 0 :	//최상위 메뉴
			switch(pos)
			{
				case 0 :	//게임 재개
					oGame.game_state = "Play";
				break;
	
				case 1 :	//게임 도감
					menu_level = 1;
				break;
				
				case 2 :	//퀘스트
					menu_level = 2;
				break;
	
				case 3 :	//게임 불러오기
					//load_game();
					game_restart();
				break;
	
				case 4 :	//게임 설정
					menu_level = 3;
				break;
	
				case 5 :	//게임 종료
					game_end();
				break;
			}
			break;
			
			case 1 :	//도감
			switch(pos)
			{
				case 0 :	//채집 아이템
					menu_level = 11;
				break;
		
				case 1 :	//장비 아이
					menu_level = 0;
				break;
		
				case 2 :	//키 아이템
					menu_level = 0;
				break;
		
				case 3 :	//도서
					menu_level = 0;
				break;
				
				case 4 :	//뒤로 
				menu_level = 0;
				break;
			}
			break;
			
			
			case 2 :	//Quest
			switch(pos)
			{
				case 0 :
				break;
			} 
			
			case 3 :	//설정
			switch(pos)
			{
				case 0 :	//볼륨 설정
					menu_level = 0;
				break;
		
				case 1 :	//컨트롤 설정
					menu_level = 0;
				break;
		
				case 2 :	//언어 설정
					menu_level = 0;
				break;
		
				case 3 :	//뒤로
					menu_level = 0;
				break;
			}
				
			break;
		}
		if (_sel != menu_level) {pos = 0;}	
		menu_length = array_length(menu[menu_level]);
	}
	
	if (cancel_key)
	{
		var _sel = menu_level;
		switch(menu_level)
		{
			case 0 :	//최상위 메뉴
			 with(oGame)
			 {
				 game_state = "Play";
				audio_play_sound(SE_system06, 1, 0);
			 }
			break;
			case 1 :	//도감 메뉴
				menu_level = 0;
			break;
			case 2 :	//Quest
				menu_level = 0;
			break;
			case 3 :	//설정 메뉴
				menu_level = 0;
			break;
			case 11 :	//도감
				menu_level = 1;
			break;
		}
		if (_sel != menu_level) {pos = 0;}	
		menu_length = array_length(menu[menu_level]);
	}
} #endregion
else
{
	//화면 비율 가져오기
	width = display_get_gui_width();
	height = display_get_gui_height();

}

