



if place_meeting(x,y,oPlayer) && deactivate_count <= 0	&& oPlayer.state == "Move"
{
	contect = true;
	oPlayer.state = "Stay";
}
else {contect = false;}

if place_meeting(x,y,oPlayer) && oPlayer.state == "Stay"	&& !instance_exists(oTextbox_screen)
{
	#region	뉴 텍스트 호출
	switch (global.dialog_process)
	{
		case 0 :
			oHud.draw_color_set = c_black;
			oHud.draw_color_switch = true;
			oHud.draw_color_alpha = 1;
			dialog_Screen("주인공", 52, 53, Player_picture, 0, SE_system01);
		break;
		case 1 :
			oHud.draw_color_switch = false;
			dialog_Screen("???", 54, 55, System_picture, 0, SE_dialog_m01);
		break;
		case 2 :
			dialog_Screen("주인공", 56, 57, Player_picture, 0, SE_system01);
		break;
		case 3 :
			dialog_Screen("???", 58, 58, System_picture, 0, SE_dialog_m01);
		break;
		case 4 :
			dialog_Screen("주인공", 59, 59, Player_picture, 0, SE_dialog_m01);
		break;
		case 5 :
			dialog_Screen("???", 60, 60, System_picture, 0, SE_dialog_m01);
		break;
		case 6 :
			dialog_Screen("주인공", 61, 61, Player_picture, 0, SE_dialog_m01);
		break;
		case 7 :
			instance_destroy();
			oPlayer.state = "Move";
			oGame.game_progress = 2;	
			global.dialog_process = 0;
		break;
	}
	
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}



act_count = count_decrease(act_count, 1, 0);
