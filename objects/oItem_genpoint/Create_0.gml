
isActive = false;
act_count = 30;

duration_count = 0;

if global.genpoint_available_count[genpoint_num] == 0
{instance_destroy();}
else
{ 
	available_count = floor( available_count * global.genpoint_available_count[genpoint_num]);
}