
//오버레이
draw_sprite_stretched(light_screen, timelight, 0, 0, width, height);

//ui폰트 셋
draw_set_font(Font01);

if (oGame.game_state == "Play")	&& instance_exists(oPlayer)
{
	#region 체력, 기력 , 만복도, 정신력 표시	(좌상단)

	var lerp_speed = 0.2;
	if instance_exists(oPlayer) 
	{
		draw_hp = lerp(draw_hp, oPlayer.HP, lerp_speed);
		draw_maxhp = oPlayer.maxHP;
		draw_redhp = lerp(draw_redhp, oPlayer.HP, lerp_speed/4);
		draw_sp = lerp(draw_sp, oPlayer.SP, lerp_speed);
		draw_maxsp = oPlayer.maxSP;
		draw_hunger = lerp(draw_hunger, oPlayer.hunger, lerp_speed);
		draw_maxhunger = oPlayer.maxHunger;
		draw_mentality = lerp(draw_mentality, oPlayer.mentality, lerp_speed);
		draw_maxmentality = oPlayer.maxMentality;
	}
	else
	{
		draw_hp = lerp(draw_hp, 0, lerp_speed);
		draw_sp = lerp(draw_sp, 0, lerp_speed);
		draw_hunger = lerp(draw_hunger, 0, lerp_speed);
		draw_mentality = lerp(draw_mentality, 0, lerp_speed);
	}


	var hp_x = 40;
	var hp_y = 20;
	var sp_x = hp_x + 5;
	var sp_y = hp_y + 50;
	var hp_width = 200;
	var hpsp_height = 40;
	var hp_color = c_black;
	var sp_color = c_black;
	var hp_percent = draw_hp / draw_maxhp;
	var hp_redpercent = draw_redhp / draw_maxhp;
	var sp_percent = draw_sp / draw_maxsp;

	var hunger_x = hp_x;
	var hunger_y = hp_y + 110;
	var hunger_height = 20;
	var hunger_width = 160;
	var mentality_x = hp_x + 5;
	var mentality_y = hp_y + 130;
	var hunger_percent = draw_hunger / draw_maxhunger;
	var mentality_percent = draw_mentality / draw_maxmentality;
	var hunger_color = #ACCC51;
	var mentality_color = #CCC351;

	
	if (oPlayer.HP > 20)
	{
		hp_color = c_green;
	}
	else
	{ hp_color = c_red;}
	if (oPlayer.SP > 20)
	{
		sp_color = c_yellow;
	}
	else
	{ sp_color = c_red;}

	draw_sprite(UI_sprite, 1, hp_x - 20, hp_y);
	draw_sprite(UI_sprite, 2, sp_x - 20, sp_y);
	draw_sprite(UI_sprite, 3, hunger_x - 20, hunger_y);
	draw_sprite(UI_sprite, 4, mentality_x - 20, mentality_y);

	//체력바(빨강, 체력색 순서로) 드로우
	draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_redpercent), hp_y + hpsp_height, c_red, c_red, c_red, c_red, 0);
	draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_percent), hp_y + hpsp_height, hp_color, hp_color, hp_color, hp_color, 0);
	draw_rectangle_color(sp_x, sp_y, sp_x + (hp_width * sp_percent), sp_y + hpsp_height, sp_color, sp_color, sp_color, sp_color, 0);

	draw_rectangle_color(hunger_x, hunger_y, hunger_x + (hunger_width * hunger_percent), hunger_y + hunger_height, hunger_color, hunger_color, hunger_color, hunger_color, 0);
	draw_rectangle_color(mentality_x, mentality_y, mentality_x + (hunger_width * mentality_percent), mentality_y + hunger_height, mentality_color, mentality_color, mentality_color, mentality_color, 0);

	draw_sprite_stretched_ext(UI_box, 1, hp_x, hp_y, hp_width + 1, hpsp_height + 1, c_white, 1);
	draw_sprite_stretched_ext(UI_box, 2, sp_x, sp_y, hp_width + 1, hpsp_height + 1, c_white, 1);
	draw_sprite_stretched_ext(UI_box, 3, hunger_x, hunger_y, hunger_width, hunger_height , c_white, 1);
	draw_sprite_stretched_ext(UI_box, 4, mentality_x, mentality_y, hunger_width , hunger_height , c_white, 1);
	
	if instance_exists(oPlayer) 
	{
		draw_mentality = lerp(draw_mentality, oPlayer.mentality, 0.2);
	}
	#endregion
	//사용아이템 표시
	var item_x = 40;
	var item_y = 180;
	var _border = 4;
	draw_sprite_stretched(UI_box, 1, item_x, item_y, 32 + _border*2, 32 + _border*2);
	if (oPlayer.useitem_stock != -1)
	{draw_sprite(sUseitem, oPlayer.useitem_stock, item_x + _border, item_y + _border);}
	
	#region //시간 표시		(우상단)
	var time_x = width - 128;
	var time_y = 64;
	time_text = string(hour) + " : " + string(minute);
	
	draw_sprite_stretched(UI_box, 4, time_x, time_y, 100, 40);
	draw_text_ext_transformed_color(time_x + 12, time_y + 4, time_text , 1, 64, 2, 2.2, 0, c_black, c_black, c_black, c_black, 1);
	
	draw_text_color(width - 84, 30, string(oGame.day) + "일 경과", c_black, c_black, c_black, c_black, 1);
	var _daycolor = c_black;
	draw_text_color(width - 128, 30, string(oGame.dayname[oGame.day]), c_black, c_black, c_black, c_black,1);
	
	#endregion

	//테스트 출력
	#region TestArea

		draw_text(400, 12, oPlayer.SPD);
		draw_text(400, 24, oGame.price_scale);
	#endregion

	#region 좌하단 스킬쿨, 상태 아이콘 
	
	var _x = 80;
	var _y = height - 80;
	var _width = 64 - 4;
	var _height = 64 - 4;
	var _moveskill_cool_progress = oPlayer.moveskill_cooldown / global.moveskill_cooltime[oPlayer.moveskill_num];
	draw_sprite(UI_moveskills, oPlayer.moveskill_num, _x, _y);
	draw_rectangle_color(_x+2, _y+_height +2, _x+2 +_width, (_y + _height+2) - (_height * _moveskill_cool_progress), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
	
	var _distance = 34;
	for (var i = 0; i < 10; i++)
	{
		if oPlayer.bufftime[i] > 0
		{
			draw_sprite(sBufficon, i, _x, _y - 64);
			draw_text_color(_x, _y-84, oPlayer.bufftime[i], c_black, c_black, c_black, c_black, 1);
		}
	}
	
	#endregion

	#region //우하단 재화 표시
	var gold_x = width - 300;
	var gold_y = height - 40;
	var gold_spriteW = 20;
	var gold_boxW = 60;
	var gold_textdis = 32;
	draw_sprite(UI_sprite, 5, gold_x, gold_y);
	draw_sprite_stretched(UI_box, 8, gold_x + gold_spriteW, gold_y, gold_boxW, gold_spriteW);
	draw_sprite(UI_sprite, 6, gold_x + gold_spriteW + gold_boxW, gold_y);
	draw_sprite_stretched(UI_box, 8, gold_x + gold_spriteW*2 + gold_boxW, gold_y, gold_boxW, gold_spriteW);
	draw_sprite(UI_sprite, 7, gold_x + gold_spriteW*2 + gold_boxW*2, gold_y);
	draw_sprite_stretched(UI_box, 8, gold_x + gold_spriteW*3 + gold_boxW*2, gold_y, gold_boxW, gold_spriteW);

	draw_text_color(gold_x + gold_textdis, gold_y + 2, gold, c_white, c_white, c_white, c_white, 1);
	draw_text_color(gold_x + gold_textdis + (gold_boxW + gold_spriteW), gold_y + 2, silver, c_white, c_white, c_white, c_white, 1);
	draw_text_color(gold_x + gold_textdis + ( gold_boxW + gold_spriteW)*2, gold_y + 2, bronze, c_white, c_white, c_white, c_white, 1);
	
	//신앙심, 길드포인트
	var _pietyx = width - 300;
	var _pietyy = height - 80;
	
	draw_sprite(UI_sprite, 8, _pietyx, _pietyy);
	draw_sprite_stretched(UI_box, 10, _pietyx + 20, _pietyy , 60, 20);
	draw_text(_pietyx + 24, _pietyy + 2, floor(global.piety));
	#endregion
}

if (oGame.game_state == "Menu")
{
	screen_color_alpha(c_dkgray, 0.4);
	draw_text(0, 2, menu_level);
	draw_text(0, 10, pos);
	if (menu_level == 0) or (menu_level == 1) or (menu_level == 3)
	{
		var _new_w = 0;
		//draw option
		draw_set_font(TitleFont);
		draw_set_color(c_dkgray);

		draw_set_valign(fa_top);
		draw_set_halign(fa_left);

		for (var i = 0; i < menu_length; i++)
		{
			var _op_w = string_width(menu[menu_level, i]);
			_new_w = max(_new_w, _op_w);
		}
		menu_width = _new_w + menu_border*2 + menu_space;
		menu_height = menu_border*2 + 10 + (menu_length )*menu_space;

		//메뉴를 화면 가운데로 정렬
		//var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2 - 100;
		//var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 -height/2;
		var _menu_x = 60;
		var _menu_y = 40;
	
		//매뉴 전체 배경 그리기
		draw_sprite_stretched(UI_box, 8, _menu_x, _menu_y, menu_width, menu_height);

		//draw_text
		for (i = 0; i < menu_length; i++)
		{
			var _c = c_white;
			if (pos == i) {_c = c_yellow}
			draw_text_color(_menu_x+menu_border*2, _menu_y+menu_border*2+menu_space*i, menu[menu_level, i], _c, _c, _c, _c, 1);
		}
	}
	
	if (menu_level == 2)	//Quest
	{
		draw_quests();
	}
	
	if (menu_level == 11)	//도감 - 재료
	{
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		//draw option
		var _new_w = 0;
		for (var i = 0; i < encyclopedia_length; i++)
		{
			var _op_w = string_width(global.Encyclopedia[0, i]);
			_new_w = max(_new_w, _op_w);
		}
		menu_width = display_get_gui_width() - 120;
		menu_height = display_get_gui_height() - 80;

		//메뉴를 화면 가운데로 정렬
		//var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2 - 100;
		//var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 -height/2;
		var _menu_x = 60;
		var _menu_y = 40;
	
		//매뉴 전체 배경 그리기
		draw_sprite_stretched(UI_box, 8, _menu_x, _menu_y, menu_width, menu_height);

		//draw_text
		for (i = 0; i < encyclopedia_length; i++)
		{
			var _c = c_white;
			if (pos == i) {_c = c_yellow}
			var _check_count = global.Encyclopedia[0][i].count;
			
			//아이템 이름
			draw_sprite_stretched(UI_box, 3, _menu_x+menu_border*3 - 6, _menu_y+menu_border*2+menu_space*i/2 - 4, menu_border*8, menu_space/2);
			if (_check_count > 0)
			{
				draw_text_color(_menu_x+menu_border*3, _menu_y+menu_border*2+menu_space*i/2, global.Encyclopedia[0][i].name, _c, _c, _c, _c, 1);
			}
			else {draw_text_color(_menu_x+menu_border*3, _menu_y+menu_border*2+menu_space*i/2, "???", _c, _c, _c, _c, 1);}
			//아이템 번호
			draw_text_color(_menu_x+menu_border - 8, _menu_y+menu_border*2+menu_space*i/2, string(i) + ".", _c, _c, _c, _c, 1)
		}
		var _check_count = global.Encyclopedia[0][pos].count;
		//아이템 이미지 박스
		draw_sprite_stretched(UI_box, 1, _menu_x + +menu_border*11 -2, _menu_y + menu_border*2 -2, 68, 68);
		if (_check_count > 0)
		{
			//아이템 설명
			draw_text_color(_menu_x + +menu_border*17, _menu_y + menu_border*2, global.Encyclopedia[0][pos].explanation, c_black, c_black, c_black, c_black, 1);
			//아이템 이미지
			draw_sprite_ext(sItems, pos, _menu_x + +menu_border*11, _menu_y + menu_border*2, 2, 2, 0, c_white, 1);
			//아이템 획득 갯수
			draw_text(_menu_x + +menu_border*11, _menu_y + menu_border*6, "획득 수 : " + string( global.Encyclopedia[0][pos].count));
		}
	}
	
}

// 문자입력 받아오기
if (global.input_active) {
    draw_text(10, 10, "Enter text: " + keyboard_string);
    draw_text(10, 30, "Press Enter to save");
}

if (draw_color_switch == true)
{
	screen_color_alpha(draw_color_set, draw_color_alpha);
}