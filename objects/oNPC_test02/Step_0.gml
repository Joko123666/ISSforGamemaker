


if place_meeting(x,y,oPlayer) && act_count <= 0
{
	if x < oPlayer.x 
	{image_xscale = 1;}
	else if x > oPlayer.x 
	{image_xscale = -1;}
}

// oNPC_test02 Step 이벤트
if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < 32 && !global.dialogue_active) 
{
	deactivate_count = 75;
	act_count = 75;
	text_line = irandom_range(text_line_min, text_lint_max);
	text = load_dialogue_NPC(text_line);
	
	create_textbox_popup(text, c_ltgray, c_black);
			
	state = "Selling";
	
	audio_play_sound(SE_dialog_m01, 1, false);
}




act_count = count_decrease(act_count, 1, 0);