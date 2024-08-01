
if (state == 0) 
{
	timer++;
	if timer >= duration
	{
		room_goto(room_goto_name);
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