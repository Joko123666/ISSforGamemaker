

act_count = count_decrease(act_count, 1, 0);

if (place_meeting(x, y, oPlayer))
{
	if oPlayer.input.interaction_hold	&& (act_count <= 0)
	{
		isActive = true;
		oPlayer.state = "Praying";
	}
	else
	{
		isActive = false;
		oPlayer.state = "Move";
	}
}
else {isActive = false; act_count = 10;}

