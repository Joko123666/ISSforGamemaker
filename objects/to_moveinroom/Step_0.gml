

if place_meeting(x,y,oPlayer) && oPlayer.input.interaction 
{
	active = true;
}

if active == true
{
	var _fadetoroom = instance_create_depth(0, 0, 0, ofade_inroom);
	_fadetoroom.goto_num = room_direction;
	_fadetoroom.duration = 20;
	_fadetoroom.color = c_black
	oPlayer.state = "Stay";
	oPlayer.alarm[0] = 30;
	active = false;
	
	if act_sound != false && act_switch == false
	{
		audio_play_sound(act_sound , 2, false);
		act_switch = true;
	}
	
}