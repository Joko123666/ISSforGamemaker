act_count = count_decrease(act_count, 1, 0);

if place_meeting(x, y, oPlayer)	&& act_count <= 0	&& state == "Active"
{
	audio_play_sound(SE_system02, 1, 0);
	oPlayer.jumpcount ++;
	state = "Deactive";
	sprite_index = sObject_deactive;
	act_count = 90;
}

if state == "Deactive"	&&	act_count <= 0
{
	state = "Active";
	sprite_index = sObject_jumpplus;
}