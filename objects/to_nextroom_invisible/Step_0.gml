

if place_meeting(x,y,oPlayer) && oPlayer.input.interaction 
{
	active = true;
}

if active == true
{
	var rm = asset_get_index(room_goto_name);
	fade_toroom(rm, 20, c_black);
	global.effect_fadeout = true;
	global.room_direction = room_direction;
	
	oPlayer.state = "Stay";
	oPlayer.alarm[0] = 30;
	
	if act_sound != false && act_switch == false
	{
		audio_play_sound(act_sound , 2, false);
		act_switch = true;
	}
	
}