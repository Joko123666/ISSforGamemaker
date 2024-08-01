
var _xpoint = x;
var _ypoint = y;
var _distance = 84;
var _boxsize = 64;

for (j = 0; j < 5; j++)
{
	for (i = 0; i < 3; i++)
	{
		//아이콘 드로우
		draw_sprite(UI_skills, j + i*3, _xpoint + i*_distance, _ypoint - j*_distance);
		//상태박스 드로우
		if (global.skilltree_temple[i][j] == false)
		{draw_sprite_stretched(UI_box, 13, _xpoint + i* _distance, _ypoint - j* _distance, _boxsize, _boxsize);}
		else
		{draw_sprite_stretched(UI_box, 11, _xpoint + i* _distance, _ypoint - j* _distance, _boxsize, _boxsize);}
		//현재 투자 가능 스킬
		if (j != 0)
		{
			if (global.skilltree_temple[i][j-1] == true) && (global.skilltree_temple[i][j] == false)
			{draw_sprite_stretched(UI_box, 12, _xpoint + i* _distance, _ypoint - j* _distance, _boxsize, _boxsize);}
		}
		else
		{
			if (global.skilltree_temple[i][j] == false)
			{draw_sprite_stretched(UI_box, 12, _xpoint + i* _distance, _ypoint - j* _distance, _boxsize, _boxsize);}
		}
	}
}



