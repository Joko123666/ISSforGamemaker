/// @description change_image_num

if (sprite_get_number(this_sprite)-1 > sprite_num)
{ 
	sprite_num++;
}
else
{
	sprite_num = 0;
}

alarm[2] = 6/oPlayer.SPD;