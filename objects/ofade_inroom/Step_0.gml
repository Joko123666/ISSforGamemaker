
if (state == 0) 
{
	timer++;
	if timer >= duration
	{
		with (oplayer_apport)
		{
			if (other.goto_num == room_direction)
			{oPlayer.x = x; oPlayer.y = y; oCamera.x = x; oCamera.y = y - 100;}
			audio_play_sound(SE_system03, 1, 0);
		}

		//BGM_controller.alarm[0] = 6;
		state = 1;
	}
}

else if state == 1
{
	timer--;
	if timer <= 0
	{
		instance_destroy();
	}
}

alpha = timer / duration;