// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fade_toroom(roomname, dur, col)
{
	var inst = instance_create_depth(0, 0, 0, ofade);
	with inst
	{
		room_goto_name = roomname;
		duration = dur;
		color = col;
	}

}

