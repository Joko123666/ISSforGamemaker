act_count = count_decrease(act_count, 1, 0);

if place_meeting(x, y, oPlayer)	&& act_count <= 0	&& state == "Active"
{
	//플레이어와 충돌시 플레이어의 스프라이트 방향으로 가속
	audio_play_sound(SE_system03, 1, 0);
	oPlayer.moving_speed = 10;
	oPlayer.ismoving = true;
	oPlayer.vsp = -3;
	if oPlayer.image_xscale > 0
	{oPlayer.moving_direction = 0;}
	else if oPlayer.image_xscale < 0
	{oPlayer.moving_direction = 180;}
	//플레이어 사망시 반대방향으로 가속
	if oPlayer.state == "Death"
	{
		if oPlayer.image_xscale > 0
		{oPlayer.moving_direction = 180;}
		else if oPlayer.image_xscale < 0
		{oPlayer.moving_direction = 0;}
	}
	state = "Deactive";
	sprite_index = sObject_deactive;
	act_count = 90;
}

if state == "Deactive"	&&	act_count <= 0
{
	state = "Active";
	sprite_index = sObject_dash;
}