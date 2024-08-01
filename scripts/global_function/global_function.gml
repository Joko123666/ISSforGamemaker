// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_global_variables()
{
	global.gold = 0;
	global.piety = 0;
	global.mainstream = 0;
	global.room_direction = 0;
	global.dialog_process = 0;
	global.selection_check = "A";
	
	for (var i = 0; i < 99; i++)
	{
		global.itemstock[i] = 0;
	}
	
	for (var i = 0; i < 10; i ++)
	{
		global.moveskill_cooltime[i] = 90;
		global.moveskill_cost[i] = 10;
		global.attackskill_cooltime[i] = 120;
		global.attackkill_cost[i] = 20;
	}
	
}

function dayreset_genpoint()
{
	for (i = 0; i < 100; i++)
	{
		global.genpoint_available_count[i] = 1;
	}
}

function check_genpoint(_num)
{
	if (global.genpoint_available_count[_num] <= 0)
	{instance_destroy();}
	else {available_count = global.genpoint_available_count[_num];}
}

function reduce_genpoint_count(_num)
{
	global.genpoint_available_count[_num] --;
	available_count --;
	if (available_count <= 0)
	{instance_destroy(); global.genpoint_available_count[_num] = 0;}
}



function draw_interaction(_x, _y, image_num)
{
	draw_sprite(UI_interaction_plate, image_num,_x, _y + 6);
	var _text = string(oPlayer.input.UI_interactionkey);
	draw_text_color(_x - string_length(_text)/2 -4, _y -6, _text, c_black, c_black, c_black, c_black, 1);
}

function draw_progressbar(_x, _y, _width, _height, _count, _total)
{
	var _progress = _width * (_count/_total);
	draw_set_color(c_gray)
	draw_rectangle(_x - _width/2, _y , _x + _width/2 - 2, _y + _height-1, 0);
	draw_set_color(c_aqua)
	draw_rectangle(_x - _width/2, _y , _x - _width/2 + _progress, _y + _height-1, 0);
	draw_sprite_stretched(UI_box, 1, _x - _width/2, _y, _width, _height);
}

function move_inroom(direction_num)
{
	var inst = instance_create_layer(0, 0, 0, ofade);
	with (inst)
	{
		room_goto_name = roomname;
		duration = dur;
		color = col;
	}
}

function fade_screen(dur, col)
{
	var inst = instance_create_depth(0, 0, 0, ofade_screen);
	with inst
	{
		duration = dur;
		color = col;
	}
}

