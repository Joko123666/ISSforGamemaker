/// @description 자연경과시간
alarm[9] = 600;
time += 10;

if instance_exists(oPlayer)
{
	oPlayer.hunger -= 1;
}