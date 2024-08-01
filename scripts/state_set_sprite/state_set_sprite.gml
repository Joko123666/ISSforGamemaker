// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_set_sprite(argument0, argument1, argument2)
{
	///@arg sprite
	///@arg speed
	///@arg index
	var new_sprite = argument0;
	var new_speed = argument1;
	var new_index = argument2;
	
	if sprite_index != new_sprite
	{
		sprite_index = new_sprite;
		image_speed = new_speed;
		image_index = new_index;
	}
}