// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Update_state()
{
	move_speed = SPD * base_move_speed + extra_move_speed;
	jumppower = base_jumppower * SPD + extra_jumppower;
	if (jumppower > base_jumppower)
	{jumppower -= (jumppower - base_jumppower)*2/3}
	attackskill_cool = count_decrease(attackskill_cool, cooldown_SPD, 0);
	
	
}