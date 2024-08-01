


if place_meeting(x, y, oPlayer) && oPlayer.invincibility == false	&& state == "Active"
{
	if animation_hit_frame_range(1, 5)
	{
		if side == 1
			{oPlayer.moving_direction = 0; oPlayer.moving_speed = 7; oPlayer.ismoving = true;}
		else if side == 2
			{oPlayer.vsp = -13;}
		else if side == 3
			{oPlayer.moving_direction = 180; oPlayer.moving_speed = 7; oPlayer.ismoving = true;}
		else if side == 4
			{oPlayer.vsp = 13;}
	}
}

if place_meeting(x, y, oPlayer)	&& state == "Deactive"
{
	state = "Active";
	state_set_sprite(spring_01_active, 1, 0);
	audio_play_sound(SE_system05, 1, 0);
	image_alpha = 1;
}

if state == "Active"
{
	if animation_end()
	{state = "Deactive"; image_alpha = 1; image_speed = 0; sprite_index = spring_01;}
}