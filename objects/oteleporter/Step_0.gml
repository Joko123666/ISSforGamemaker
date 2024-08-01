
//완전 미작동 상태
if global.mainstream < 43
{
	state = "stoped";
}

//가동 가능 상태
if global.mainstream >=43	&&	active == false
{
	state = "deactive";
	sprite_index = teleport_defalt;
}

switch(state)
{
	case "stoped" :
	if place_meeting(x,y,oPlayer) && oPlayer.input.interaction
	{
		var text = instance_create_layer(x, y-62, "Effects", text_drawingob);
		if global.language == "Korean"
		{text.text = "아무 반응이 없다";}
		if global.language == "English"
		{text.text = "No response";}
		var text_width = string_width(text.text);
		text.x -= text_width/2 + 4;
		audio_play_sound(SE_system08, 1, false);
	}
	break;
	
	case "deactive" :
	if place_meeting(x,y,oPlayer) && oPlayer.input.interaction
	{
		var text = instance_create_layer(x, y-62, "Effects", text_drawingob);
		if global.language == "Korean"
		{text.text = "텔레포터 기동됨";}
		if global.language == "English"
		{text.text = "Teleporter activated";}
		var text_width = string_width(text.text);
		text.x -= text_width/2 + 4;
		state = "active";
		active = true;
		audio_play_sound(SE_activate01, 1, false);
	}
	
	break;
	
	case "active" :
	state_set_sprite(teleport_defalt_active, 1, 0);
	if animation_end()
	{
		image_speed = 0;
		var portal = instance_create_layer(x, y-42, "Effects", oportal_purple);
		portal.room_goto_name = teleportto;
		portal.room_direction = 99;
	}
	break;
	
}