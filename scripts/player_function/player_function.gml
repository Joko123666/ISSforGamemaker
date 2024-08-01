

function decreas_mentality_byhunger( mentality)
{
	if (oPlayer.hunger < oPlayer.hunger_endurance)
	{
		oPlayer.mentality -= mentality;
	}
}

function get_buff(buff_name, buff_time)
{
	switch(buff_name)
	{
		case "haste" : { 
			oPlayer.buff_move_speed = 5;
			oPlayer.bufftime[1] = buff_time;
		} break;
		
		case "regenerate" : {
			oPlayer.bufftime[2] = buff_time;
		} break;
	}
}