// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animation_hit_frame_range(argument0, argument1)
{
	///@arg low
	///@arg high
	var low = argument0;
	var high = argument1;
	
	return image_index >= low and image_index <= high;
	
}