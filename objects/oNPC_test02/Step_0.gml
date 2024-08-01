


if place_meeting(x,y,oPlayer) && act_count <= 0
{
	if x < oPlayer.x 
	{image_xscale = 1;}
	else if x > oPlayer.x 
	{image_xscale = -1;}
}

if place_meeting(x,y,oPlayer) && oPlayer.input.interaction	&& act_count <=0
{
	//sprite_index = NPC_village_01_active;
	deactivate_count = 75;
	act_count = 75;
	var text = instance_create_layer(x, y-84, "Effects", text_drawingob);
	text.text = "테스트용 NPC なのです";
	text.box_color = c_blue;
	var text_width = string_width(text.text);
	text.x -= text_width/2 + 4;
	
	audio_play_sound(SE_dialog_m01, 1, false);
}

if act_count > 0 
	{ act_count--;}