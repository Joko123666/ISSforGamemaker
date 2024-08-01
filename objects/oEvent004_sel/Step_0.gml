
//대화가 끝까지 진행 된 경우 대화창 종료시 삭제 
if global.dialog_process == 5
{
	instance_destroy();
	oGame.game_progress = 2;	
}

//메뉴의 전체 갯수를 카운트
op_length = array_length(option);

//get_key
up_key = oGame.gameinput.menu_up;
down_key = oGame.gameinput.menu_down;
confirm_key = oGame.gameinput.menu_confirm;


//메뉴바를 이동하면 커서 위치를 변경
pos += down_key - up_key;
if (pos >= op_length) {pos = 0;}
if (pos < 0) {pos = op_length - 1;}


if (confirm_key)
{
	var _sel = menu_level;
	switch(pos)
	{
		case 0 :	//선택지1
			instance_create_depth(oPlayer.x, oPlayer.y - 24, 0, oEvent005_a);
			instance_destroy();
		break;
	
		case 1 :	//선택지2
			instance_create_depth(oPlayer.x, oPlayer.y - 24, 0, oEvent005_b);
			instance_destroy();
		break;

	}
	if (_sel != menu_level) {pos = 0;}	
	op_length = array_length(option);
}


act_count = count_decrease(act_count, 1, 0);
