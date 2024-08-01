

if place_meeting(x,y,oPlayer) 
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

	global.room_direction = room_direction;

}