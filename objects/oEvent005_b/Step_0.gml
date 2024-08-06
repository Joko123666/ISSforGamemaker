
//대화가 끝까지 진행 된 경우 대화창 종료시 삭제 
if global.dialog_process == 1
{
	instance_destroy();
	oGame.game_progress = 2;	
}


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
		dialog_Screen(global.name_goddess, 50, 51, System_picture, 0, SE_system01);

	}

	act_count = 15;
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}



act_count = count_decrease(act_count, 1, 0);
