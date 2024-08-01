



if place_meeting(x,y,oPlayer) && oPlayer.input.interaction	&& act_switch2 == true
{
	active = true;
}

if active == true
{
	var rm = asset_get_index(room_goto_name);
	fade_toroom(rm, 20, c_black);
	global.effect_fadeout = true;
	oPlayer.state = "Stay";
	oPlayer.alarm[0] = 30;
	if act_switch == false
	{
		audio_play_sound(SE_doormove_01, 2, false);
		act_switch = true;
	}
	global.room_direction = room_direction;

}