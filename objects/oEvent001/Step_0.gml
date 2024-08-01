
//대화가 끝까지 진행 된 경우 대화창 종료시 삭제 
if global.dialog_process == 2
{
	oGame.game_progress = 1;	
	global.dialog_process = 0;
	instance_destroy();
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
	
	var textbox = instance_create_layer(0, 0, "Hud", oTextbox_screen)
	if global.dialog_process == 0	//시작 대화 
	{
		oHud.draw_color_switch = true;
		textbox.draw_name = "System"; 
		textbox.textline_start = 1;	
		textbox.textline_end = 2;	
		textbox.page = textbox.textline_start;
		textbox.progress_set = 1;	
		textbox.sprite_set = System_picture;
		textbox.sound_set = SE_system01;

	}
	else if global.dialog_process == 1	//시작 대화 
	{
		oHud.draw_color_switch = false;
		textbox.draw_name = "주인공"; 
		textbox.textline_start = 3;	
		textbox.textline_end = 4;	
		textbox.page = textbox.textline_start;
		textbox.progress_set = 2;
		textbox.sprite_set = Player_picture;
		textbox.sound_set = SE_dialog_m01;
	}

	#endregion
	act_count = 15;
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}



act_count = count_decrease(act_count, 1, 0);
