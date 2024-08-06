



if place_meeting(x,y,oPlayer) && deactivate_count <= 0	&& oPlayer.state == "Move"
{
	contect = true;
	oPlayer.state = "Stay";
}
else {contect = false;}

if place_meeting(x,y,oPlayer) && oPlayer.state == "Stay"	&& !instance_exists(oTextbox_screen)
{
	#region	뉴 텍스트 호출
	
	if global.dialog_process == 0
	{
		oHud.draw_color_set = c_black;
		oHud.draw_color_switch = true;
		dialog_Screen("???", 11, 13, System_picture, 0, SE_system01);
	}
	else if global.dialog_process == 1	
	{
		oHud.draw_color_switch = false;
		dialog_Screen(global.name_player, 14, 14, Player_picture, 0, SE_dialog_m01);
	}
	else if global.dialog_process == 2	
	{
		dialog_Screen("???", 15, 16, System_picture, 0, SE_system01);
	}
	else if global.dialog_process == 3
	{
		dialog_Screen(global.name_player, 17, 17, Player_picture, 0, SE_dialog_m01);
	}
	else if global.dialog_process == 4
	{
		dialog_Screen("???", 18, 20, System_picture, 0, SE_system01);
	}
	else if global.dialog_process == 5
	{
		dialog_Screen(global.name_player, 21, 21, Player_picture, 0, SE_dialog_m01);
	}
	else if global.dialog_process == 6
	{
		dialog_Screen(global.name_goddess, 22, 33, GOD_picture, 2, SE_system01);
	}
	else if global.dialog_process == 7
	{
		dialog_Screen(global.name_player, 34, 34, Player_picture, 0, SE_dialog_m01);
	}
	else if global.dialog_process == 8
	{
		dialog_Screen(global.name_goddess, 35, 46, GOD_picture, 0, SE_system01);
	}
	#endregion
	act_count = 15;
	
	//대화가 끝까지 진행 된 경우 대화창 종료시 삭제 
	if global.dialog_process == 9
	{
		instance_destroy();
		oPlayer.state = "Move";
		oGame.game_progress = 3;	
		global.dialog_process = 0;
		instance_create_depth(oPlayer.x, oPlayer.y - 8, 0, oEvent004_sel);
	}
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}



act_count = count_decrease(act_count, 1, 0);
