if instance_exists(oPlayer)
{
	if oPlayer.y  > y+2 or oPlayer.input.down_jump or oPlayer.state == "Ladder"
	{
		mask_index = -1;
		act_count = 3;
	}
	else
	{
		if act_count > 0
		{act_count--;}
		else
		{mask_index = halfwall;}
	}
}