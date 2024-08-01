
//화면 비율 가져오기
width = display_get_gui_width();
height = display_get_gui_height();

//돈 세분화
gold = 0;
silver = 0;
bronze = 0;
//시간 세분화
hour = 0;
minute = 0;
gametime = 60;
timelight = 0;

//hp,sp draw
draw_hp = 0;
draw_maxhp = 0;
draw_redhp = 0;
draw_sp = 0;
draw_maxsp = 0;
draw_hunger = 0;
draw_maxhunger = 0;
draw_mentality = 0;
draw_maxmentality = 0;

//게임중 메뉴 시스템
menu_width = width - 120;
menu_height = height - 80;
menu_border = 12;
menu_space = 44;
pos = 0;

menu[0,0] = "게임 재개";
menu[0,1] = "게임 도감";
menu[0,2] = "게임 불러오기";
menu[0,3] = "게임 설정";
menu[0,4] = "게임 종료";

menu[1,0] = "채집 아이템";
menu[1,1] = "장비 아이템";
menu[1,2] = "키 아이템";
menu[1,3] = "도서";
menu[1,4] = "뒤로";

menu[3,0] = "볼륨 설정";
menu[3,1] = "컨트롤 설정";
menu[3,2] = "언어 설정";
menu[3,3] = "뒤로";

for (var i = 0; i < 16; i++)
{
	menu[11, i] = global.Encyclopedia[0][i];
}


menu_length = array_length(menu);
menu_level = 0;

encyclopedia_length = array_length(global.Encyclopedia[0]);
encyclopedia_length = 16;	//임시
encyclopedia_pos = 0;

//암전효과, 설정
draw_color_switch = false;
draw_color_set = c_black;
draw_color_alpha = 1;

