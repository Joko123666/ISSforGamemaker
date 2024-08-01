
if HP<=0
{
	if Exp > 0
	{repeat(5){instance_create_depth(x, y-16, 10, oparticle_expdrop);}}
	
	state = "Death"
	invincibility = true;
	vsp = -4; 
	moving_speed = image_xscale * -2;
	revive_count = revive_maxcount; 
	HP=1;
	audio_play_sound(SE_death01, 1, false);
	screen_shake(30, 10);
	Exp = 0;
	
}

