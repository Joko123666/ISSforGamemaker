



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
			oHud.draw_color_set = c_white;
			oHud.draw_color_switch = true;
			oHud.draw_color_alpha = 1;
			dialog_Screen("System", 5, 5, System_picture, 0, SE_system01);
		break;
		case 1 :
			dialog_Screen(global.name_player, 6, 7, Player_picture, 0, SE_dialog_m01);
		break;
		case 2 :
			oHud.draw_color_set = c_black;
			dialog_Screen("system", 8, 8, Player_picture, 0, SE_system01);
		break;
		case 3 :
			oHud.draw_color_switch = false;
			dialog_Screen(global.name_player, 9, 9, Player_picture, 0, SE_dialog_m01);
		break;
		case 4 :
			instance_destroy();
			oPlayer.state = "Move";
			oGame.game_progress = 3;	
			global.dialog_process = 0;
		break;
	}
	
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}



act_count = count_decrease(act_count, 1, 0);
