
if image_alpha >0
{
	image_alpha -= 0.02;
	image_xscale += 0.01 * angspd;
	if image_xscale >= 1
	{image_xscale = -1;}
}
else
{
	instance_destroy();
}


vsp = vsp + grv;
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = -vsp * 0.9;
	}

	y = y + vsp;
