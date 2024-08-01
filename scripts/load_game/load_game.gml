// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/*
function load_game(){

#region LOAD GAME
		if (file_exists("savedgame.save"))
		{with (oPlayer) instance_destroy();}
		
				//add Fadeout script here 
		
		if (file_exists("savedgame.save"))
		{
			var _buffer = buffer_load("savedgame.save");
			var _string = buffer_read(_buffer, buffer_string);
			buffer_delete(_buffer);
		
			var _loadData = json_parse(_string);
		
			while (array_length(_loadData) > 0)
			{
				var _loadEntity = array_pop(_loadData);
				with (instance_create_layer(0, 0, "player_layer", asset_get_index(_loadEntity.obj)))
				{
					room = _loadEntity.room_playeris;
				
					#region Player status
				
					x = _loadEntity.x;
					y = _loadEntity.y - 24;
					image_blend = _loadEntity.image_blend;
					image_index = _loadEntity.image_index;
					maxHP = _loadEntity.maxHP;
					maxMP = _loadEntity.maxMP;
					HP = _loadEntity.HP;
					MP = _loadEntity.MP;
					Exp = _loadEntity.Exp;
					maxExp = _loadEntity.maxExp;
					level = _loadEntity.level;
					STR = _loadEntity.STR;
					damage = _loadEntity.damage;
					weapon = _loadEntity.weapon;
					maxattack = _loadEntity.maxattack;
					attackskill_set = _loadEntity.attackskill_set;
					attackskill_cool = _loadEntity.attackskill_cool;
					attackskill_coolset = _loadEntity.attackskill_coolset;
					hspd = _loadEntity.hspd;
					vsp = _loadEntity.vsp;
					grv = _loadEntity.grv;
					SPD = _loadEntity.SPD;
					maxjumpcount = _loadEntity.maxjumpcount;
					jumppower = _loadEntity.jumppower;
					rollspd = _loadEntity.rollspd;
					knockback = _loadEntity.knockback;
					knockback_power = _loadEntity.knockback_power;
					state = _loadEntity.state;
					skillS_maxcool = _loadEntity.skillS_maxcool;
					moveskill_set = _loadEntity.moveskill_set;
					moveskill_maxcool = _loadEntity.moveskill_maxcool;
					revive_maxcount = _loadEntity.revive_maxcount;
				
					#endregion
				
					#region global_variables
					global.input_type = _loadEntity.input_type;
					global.room_direction =  _loadEntity.room_direction;
					global.BGM_number = _loadEntity.BGM_number;
					global.quest_stack[1] =  _loadEntity.quest_stack1;
					global.quest_stack[2] =  _loadEntity.quest_stack2;
					global.quest_stack[3] =  _loadEntity.quest_stack3;
					global.quest_stack[4] =  _loadEntity.quest_stack4;
					
					global.Player_item = _loadEntity.Player_item;
					global.root_item[1] = _loadEntity.root_item01;
					global.root_item[2] = _loadEntity.root_item02;
					global.root_item[3] = _loadEntity.root_item03;
					global.root_item[4] = _loadEntity.root_item04;
					global.root_item[5] = _loadEntity.root_item05;
					global.root_item[6] = _loadEntity.root_item06;
					global.root_item[7] = _loadEntity.root_item07;
					
					global.guildcard = _loadEntity.guildcard;
					global.greenorb = _loadEntity.greenorb;
					global.redorb = _loadEntity.redorb;
					global.blueorb = _loadEntity.blueorb;
					global.gold = _loadEntity.gold;
					global.Deathcount_total = _loadEntity.Deathcount_total;
					
					global.Player_moveskill = _loadEntity.Player_moveskill;
					global.Player_sword = _loadEntity.Player_sword;
					global.Player_attack3 = _loadEntity.Player_attack3;
					global.Playerequip01 = _loadEntity.Player_equip01;
					global.Playerequip02 = _loadEntity.Player_equip02;
					global.Playerequip03 = _loadEntity.Player_equip03;
					
					global.moveskill01 = _loadEntity.moveskill01;
					global.moveskill02 = _loadEntity.moveskill02;
					global.moveskill03 = _loadEntity.moveskill03;
					global.moveskill04 = _loadEntity.moveskill04;
					global.moveskill05 = _loadEntity.moveskill05;
					global.moveskill06 = _loadEntity.moveskill06;
					
					global.attackskill01 = _loadEntity.attackskill01;
					global.attackskill02 = _loadEntity.attackskill02;
					global.attackskill03 = _loadEntity.attackskill03;
					global.attackskill04 = _loadEntity.attackskill04;
					global.attackskill05 = _loadEntity.attackskill05;
					global.attackskill06 = _loadEntity.attackskill06;
					
					global.chest_number[1] = _loadEntity.chest_number1;
					global.chest_number[2] = _loadEntity.chest_number2;
					global.chest_number[3] = _loadEntity.chest_number3;
					global.chest_number[4] = _loadEntity.chest_number4;
					global.chest_number[5] = _loadEntity.chest_number5;
					global.chest_number[6] = _loadEntity.chest_number6;
					global.chest_number[7] = _loadEntity.chest_number7;
					global.chest_number[8] = _loadEntity.chest_number8;
					
					global.store_item_stock01 = _loadEntity.store_item_stock01;
					global.store_item_stock02 = _loadEntity.store_item_stock02;
					global.store_item_stock03 = _loadEntity.store_item_stock03;
					global.store_item_stock04 = _loadEntity.store_item_stock04;
			
					global.mainstream = _loadEntity.mainstream;
					global.mainquest[1] = _loadEntity.mainquest1;
					global.mainquest[2] = _loadEntity.mainquest2;
					global.mainquest[3] = _loadEntity.mainquest3;
					global.mainquest[4] = _loadEntity.mainquest4;
					global.mainquest[5] = _loadEntity.mainquest5;
					global.mainquest[6] = _loadEntity.mainquest6;
					global.mainquest[7] = _loadEntity.mainquest7;
					global.mainquest[8] = _loadEntity.mainquest8;
					global.mainquest[9] = _loadEntity.mainquest9;
					global.mainquest[10] = _loadEntity.mainquest10;
					global.mainquest[11] = _loadEntity.mainquest11;
					global.mainquest[12] = _loadEntity.mainquest12;
					global.mainquest[13] = _loadEntity.mainquest13;
					global.mainquest[14] = _loadEntity.mainquest14;
					global.mainquest[15] = _loadEntity.mainquest15;
					global.mainquest[16] = _loadEntity.mainquest16;
					global.mainquest[17] = _loadEntity.mainquest17;
					global.mainquest[20] = _loadEntity.mainquest20;
					
					global.subquest[1] = _loadEntity.subquest1;
					global.subquest[2] = _loadEntity.subquest2;
					global.subquest[3] = _loadEntity.subquest3;
					global.subquest[4] = _loadEntity.subquest4;
					global.subquest[5] = _loadEntity.subquest5;
			
					global.NPC_shopper01_dialog =_loadEntity.NPC_shopper01_dialog;
					global.NPC_shopper02_dialog =_loadEntity.NPC_shopper02_dialog;
					global.NPC_shopper03_dialog =_loadEntity.NPC_shopper03_dialog;
					global.NPC2_dialog = _loadEntity.NPC2_dialog;
					global.NPC4_dialog =_loadEntity. NPC4_dialog;
					global.NPC7_dialog = _loadEntity.NPC7_dialog;
					global.NPC8_dialog = _loadEntity.NPC8_dialog;
					global.NPC09_dialog = _loadEntity.NPC09_dialog;
					global.NPC10_dialog = _loadEntity.NPC10_dialog;
					global.NPC15_dialog = _loadEntity.NPC15_dialog;
					global.NPC16_dialog = _loadEntity.NPC16_dialog;
					global.NPC17_dialog = _loadEntity.NPC17_dialog;
					global.NPC18_dialog = _loadEntity.NPC18_dialog;
					global.NPC19_dialog = _loadEntity.NPC19_dialog;
					global.NPC20_dialog = _loadEntity.NPC20_dialog;
					global.NPC21_dialog = _loadEntity.NPC21_dialog;
					global.NPC23_dialog = _loadEntity.NPC23_dialog;
					global.NPC24_dialog = _loadEntity.NPC24_dialog;
					global.NPC28_dialog = _loadEntity.NPC28_dialog;
					global.NPC29_dialog = _loadEntity.NPC29_dialog;
					global.NPC30_dialog = _loadEntity.NPC30_dialog;
					global.NPC31_dialog = _loadEntity.NPC31_dialog;
					global.NPC43_dialog = _loadEntity.NPC43_dialog;
					global.NPC44_dialog = _loadEntity.NPC44_dialog;
					global.NPC45_dialog = _loadEntity.NPC45_dialog;
					global.NPC46_dialog = _loadEntity.NPC46_dialog;
					global.NPC50_dialog = _loadEntity.NPC50_dialog;
					global.NPC51_dialog = _loadEntity.NPC51_dialog;
					global.NPC99_dialog = _loadEntity.NPC99_dialog;
					
					global.NPC8_status = _loadEntity.NPC8_status;
					
					global.yabawi_token = _loadEntity.yabawi_token;
					global.end_sleep = _loadEntity.end_sleep;
					
					
					#endregion
					global.room_direction = 98;
				}
				show_debug_message("Game Loaded!" + _string);
			}
		
		}	
		#endregion
}