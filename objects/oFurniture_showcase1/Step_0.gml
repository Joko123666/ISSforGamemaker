
act_count = count_decrease(act_count, 1, 0);

if (place_meeting(x, y, oPlayer) && oPlayer.input.interaction && isOpen == false)
{
	oPlayer.state = "Stay";
	isOpen = true;
}
else if (isOpen == true) && (oPlayer.input.interaction)
{
	oPlayer.state = "Move";
	isOpen = false;
	
}