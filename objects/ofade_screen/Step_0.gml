
if (state == 0) 
{
	timer++;
	if timer >= duration
	{
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

var _alpha = timer/duration;
if (_alpha > 0.8)
{alpha = 1;}
else
{alpha = _alpha}
alpha = timer / duration;