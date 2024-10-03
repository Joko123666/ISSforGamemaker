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
	
	//문자입력
	global.user_input = ""; // 사용자가 입력한 문자열
	global.input_active = false; // 입력 창 활성화 여부
	
	//NAME
	global.name_player = "주인공";
	global.name_priest = "베르그";
	global.name_cleric = "";
	global.name_goddess = "플라리스";
	global.name_nun = "메르메르";
	global.name_guildmaster = "가가메르";
	global.name_cook = "펫슈";
	global.name_merchant = "금블랑";
	
	// oGame의 Create 이벤트 또는 초기화 스크립트에서
	global.skills_wealth = ds_map_create();
	global.skills_combat = ds_map_create();
	global.skills_harvest = ds_map_create();
	// 스킬트리 초기화 시 스킬 추가
	var skill_start_num = 1;
	ds_map_add(global.skills_wealth, "skill_pray", Skill(string(load_skill_text(skill_start_num)), string(load_skill_text(skill_start_num+1)), [], 0));
	ds_map_add(global.skills_wealth, "skill_minpriceup1", Skill(string(load_skill_text(skill_start_num+2)), string(load_skill_text(skill_start_num+3)), ["skill_pray"], 20));
	ds_map_add(global.skills_wealth, "skill_maxhunger1", Skill(string(load_skill_text(skill_start_num+4)), string(load_skill_text(skill_start_num+5)), ["skill_pray"], 25));
	ds_map_add(global.skills_wealth, "skill_pricerateup1", Skill(string(load_skill_text(skill_start_num+6)), string(load_skill_text(skill_start_num+7)), ["skill_pray"], 30));
	ds_map_add(global.skills_wealth, "skill_varpriceup1", Skill(string(load_skill_text(skill_start_num+8)), string(load_skill_text(skill_start_num+9)), ["skill_pray"], 35));
	ds_map_add(global.skills_wealth, "skill_allpriceup1", Skill(string(load_skill_text(skill_start_num+10)), string(load_skill_text(skill_start_num+11)), ["skill_pricerateup1", "skill_varpriceup1", "skill_minpriceup1"], 100));
	// 스킬 ID를 쉽게 참조하기 위한 배열
	global.skills_wealth_ids = ds_list_create();
	ds_list_add(global.skills_wealth_ids, "skill_pray");
	ds_list_add(global.skills_wealth_ids, "skill_minpriceup1");
	ds_list_add(global.skills_wealth_ids, "skill_maxhunger1");
	ds_list_add(global.skills_wealth_ids, "skill_pricerateup1");
	ds_list_add(global.skills_wealth_ids, "skill_varpriceup1");
	ds_list_add(global.skills_wealth_ids, "skill_allpriceup1");
	// 스킬 위치 정의 (격자 형태)
	global.skill_wealth_positions = ds_map_create();
	ds_map_add(global.skill_wealth_positions, "skill_pray", [0, 0]);
	ds_map_add(global.skill_wealth_positions, "skill_minpriceup1", [0, 1]);
	ds_map_add(global.skill_wealth_positions, "skill_maxhunger1", [-1, 1]);
	ds_map_add(global.skill_wealth_positions, "skill_pricerateup1", [1, 1]);
	ds_map_add(global.skill_wealth_positions, "skill_varpriceup1", [2, 1]);
	ds_map_add(global.skill_wealth_positions, "skill_allpriceup1", [0, 2]);

}

function set_game_variables()
{
	
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

