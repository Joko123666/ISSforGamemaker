
//Check game progress
if oGame.game_progress > 6
{instance_destroy();}

if place_meeting(x,y,oPlayer) && deactivate_count <= 0	&& oPlayer.state == "Move"
{
	contect = true;
	oPlayer.state = "Stay";
}
else {contect = false;}

if place_meeting(x,y,oPlayer) && oPlayer.state == "Stay"	&& !instance_exists(oTextbox_screen)
{
	#region	뉴 텍스트 호출
	switch (global.dialog_process)
	{
		case 0 :
			oHud.draw_color_set = c_black;
			oHud.draw_color_switch = true;
			oHud.draw_color_alpha = 1;
			dialog_Screen(global.name_goddess, 51, 51, GOD_picture, 0, SE_system01);
		break;
		case 1 :
			dialog_Screen(global.name_player, 52, 53, Player_picture, 0, SE_dialog_m01);
		break;
		case 2 :
			oHud.draw_color_switch = false;
			dialog_Screen("???", 54, 55, System_picture, 0, SE_system01);
		break;
		case 3 :
			dialog_Screen(global.name_player, 56, 57, Player_picture, 0, SE_dialog_m01);
		break;
		case 4 :
			dialog_Screen("???", 58, 58, System_picture, 0, SE_dialog_m01);
		break;
		case 5 :
			dialog_Screen(global.name_player, 59, 59, Player_picture, 0, SE_dialog_m01);
		break;
		case 6 :
			dialog_Screen("???", 60, 60, System_picture, 0, SE_dialog_m01);
		break;
		case 7 :
			dialog_Screen(global.name_player, 61, 61, Player_picture, 0, SE_dialog_m01);
		break;
		case 8 :
			dialog_Screen("???", 62, 62, System_picture, 0, SE_dialog_m01);
		break;
		case 9 :
			dialog_Screen(global.name_player, 63, 65, Player_picture, 0, SE_dialog_m01);
		break;
		case 10 :
			dialog_Screen("???", 66, 71, System_picture, 0, SE_dialog_m01);
		break;
		case 11 :
			dialog_Screen(global.name_player, 72, 72, Player_picture, 0, SE_dialog_m01);
		break;
		case 12 :
			dialog_Screen(global.name_nun, 73, 74, System_picture, 0, SE_dialog_m01);
		break;
		case 13 :
			dialog_Screen(global.name_player, 75, 75, Player_picture, 0, SE_dialog_m01);
		break;
		case 14 :
			dialog_Screen(global.name_nun, 76, 76, System_picture, 0, SE_dialog_m01);
		break;
		case 15 :
			dialog_Screen(global.name_player, 77, 77, Player_picture, 0, SE_dialog_m01);
			if (act_switch == false)
			{
				var _move = instance_create_depth(oPlayer.x, oPlayer.y, 0, ofade_inroom); 
				_move.goto_num = 5;
				_move.duration = 30;
				act_switch = true;
			}
		break;
		case 16 :
			dialog_Screen(global.name_nun, 78, 83, System_picture, 0, SE_dialog_m01);
		break;
		case 17 :
			dialog_Screen(global.name_player, 84, 84, Player_picture, 0, SE_dialog_m01);
			act_switch = false;
		break;
		case 18 :
			dialog_Screen(global.name_nun, 85, 93, System_picture, 0, SE_dialog_m01);
		break;
		case 19 :
			dialog_Screen(global.name_player, 94, 94, Player_picture, 0, SE_dialog_m01);
		break;
		case 20 :
			dialog_Screen(global.name_nun, 95, 95, System_picture, 0, SE_dialog_m01);
		break;
		case 21 :	//Input Player NAME
			if (act_switch == false)
			{
				keyboard_string = "" ;
				instance_create_depth(x, y, 0, oGet_name); 
				act_switch = true;
			}
			if (act_switch == true && global.input_active == false)
			{
				global.name_player = global.user_input;
				global.dialog_process++;
			}
		break;
		case 22 :
			dialog_Screen(global.name_nun, 97, 97, System_picture, 0, SE_dialog_m01);
			act_switch = false;
		break;
		
		case 23 :	//End dialog
			instance_destroy();
			oPlayer.state = "Move";
			oGame.game_progress = 7;	
			global.dialog_process = 0;
		break;
	}
	
}


if diafalse_count > 0 
{diafalse_count = count_decrease(diafalse_count, 1, 0); if diafalse_count <= 0 {dialog_endswitch = false;}}

if act_switch == true
{toPlayer();}

act_count = count_decrease(act_count, 1, 0);
