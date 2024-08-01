
act_count = 10;
duration_count = 10;
duration_time = 15;
isActive = false;

skill_num = 0;


while (global.skilltree_temple[skill_i][skill_num] == true)
{
	skill_num ++;
	if (global.skilltree_temple[skill_i, skill_num] == false)
	{break;}
	if (skill_num >= 6)
	{break;}
}