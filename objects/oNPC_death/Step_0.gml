


if place_meeting(x,y,oPlayer) && deactivate_count <= 0	&& oPlayer.state == "Move"
{
	contect = true;
}
else {contect = false;}

if place_meeting(x,y,oPlayer) && oPlayer.input.interaction	&& act_count <=0	&& oPlayer.state == "Move"
{

	if x < oPlayer.x 
	{image_xscale = 1;}
	if x > oPlayer.x 
	{image_xscale = -1;}
	
	#region	구 텍스트 호출
	/*
	act_count = 5;
	deactivate_count = 75;
	if instance_exists(text_drawingob)	{instance_destroy(text_drawingob);}
	var text = instance_create_layer(x, y-62, "Effects", text_drawingob);
	text.text = NPC_death_dialog(dialog_count);
	text.dianame = name_text;
	text.name_color = c_blue;
	var text_width = string_width(text.text);
	text.x -= text_width/2 + 4;
	*/
	#endregion
	
	#region	뉴 텍스트 호출
	
	var textbox = instance_create_layer(0, 0, "Hud", oTextbox_screen)
	if oGame.game_progress == 0	//시작 대화 
	{
		textbox.textline_start = 2;	
		textbox.textline_end = 5;	
		textbox.page = textbox.textline_start;
		oGame.game_progress = 1;	
		textbox.sprite_set = sStanding_default;
		textbox.sound_set = SE_dialog_f01;
		oPlayer.state = "Stop";
	}
	else if oGame.game_progress == 1	//시작 대화 
	{
		textbox.textline_start = 6;	
		textbox.textline_end = 18;	
		textbox.page = textbox.textline_start;
		oGame.game_progress = 2;	
		textbox.sprite_set = sStanding_default;
		textbox.sound_set = SE_dialog_f01;
		oPlayer.state = "Stop";
	}
	else if oGame.game_progress == 2	//시작 대화 
	{
		textbox.textline_start = 21;	
		textbox.textline_end = 22;	
		textbox.page = textbox.textline_start;
		textbox.game_progress_set = 3;	
		textbox.sprite_set = sStanding_default;
		textbox.sound_set = SE_dialog_f01;
		oPlayer.state = "Stop";
	}
	
	#endregion
	act_count = 15;
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}



act_count = count_decrease(act_count, 1, 0);
	
if deactivate_count > 0
	{state_set_sprite(sNPC_death, 1, 0); deactivate_count--;}
else {state_set_sprite(sNPC_death, 1, 0);}

if oGame.game_progress == 3
{instance_destroy();}