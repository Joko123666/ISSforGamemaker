// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gravity_defalt(){
	
	vsp = vsp + grv;				//중력 계산
	if (place_meeting(x,y+vsp,oWall))	//공중에 떠있을 경우
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{	y = y + sign(vsp);	}
		vsp = 0;
	}
	
	y = y + vsp;
}