


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
	var _money_B = oGame.money;
	Inventory_sellall(1, 9);
	var _money_A = oGame.money;
	var _money_D = _money_A - _money_B;
	var text = instance_create_layer(x, y-84, "Effects", text_drawingob);
	if (_money_D != 0)
	{
		text.text = "열매를 전부" + string(_money_D) + "에 매입했습니다!";
	}
	else 
	{text.text = "매입 할 아이템이 없습니다.";}
	text.box_color = c_blue;
	var text_width = string_width(text.text);
	text.x -= text_width/2 + 4;
	
	audio_play_sound(SE_dialog_m01, 1, false);
}

if act_count > 0 
	{ act_count--;}