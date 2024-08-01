

var _width = 640;
var _height = 300;

var _blockwidth = 60;
var _blockheight = 40;
//전체 보드 그리기
draw_sprite_stretched(UI_box, 9, x, y, _width, _height);
//표시 칸 그리기 
var _xdistance = 12;
var _ydistance = 8;
var _xpoint = x + 8;
var _ypoint = y + 24;
for (var i = 0; i < 6; i ++)
{
	for (var j = 0; j < 5; j++)
	{
		draw_sprite_stretched(UI_box, 10, _xpoint + i*(_blockwidth +_xdistance +32), _ypoint + 4 + j*(_blockheight + _ydistance), 32, 32);
		draw_sprite(sItems, i + j*10, _xpoint + i*(_blockwidth + _xdistance +32), _ypoint + 4 + j*(_blockheight + _ydistance));
		draw_sprite_stretched(UI_box, 10, _xpoint + 34 + i*(_blockwidth + _xdistance +32), _ypoint + j*(_blockheight + _ydistance), _blockwidth, _blockheight);
		draw_text_color(_xpoint + 4 + 36+ i*(_blockwidth + _xdistance +32), _ypoint + 8 + j*(_blockheight + _ydistance), (global.item_price[i + 10*j]), c_black, c_black, c_black, c_black, 1);
	}
	
}

