
function count_decrease(argument0, argument1, argument2)
{
	///@arg count_value
	///@arg decrease_speed
	///@arg decrease_point
	
	//적용 대상
	var count_value = argument0;
	//감소량
	var count_speed = argument1;
	//목적값
	var decrease_point = argument2;

	if count_value > decrease_point
	{
		count_value -= count_speed;
	}
	return count_value;
	
}