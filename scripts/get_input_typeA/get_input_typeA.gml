
right = keyboard_check(vk_right);
left  = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
sprint = keyboard_check(vk_shift);
moveskill  = keyboard_check_pressed(vk_space);
interaction = keyboard_check_pressed(ord("E"));
interaction_hold = keyboard_check(ord("E"));
use_item = keyboard_check_pressed(ord("Q"));
inventory = keyboard_check_pressed(ord("I"));

baseattack = keyboard_check_pressed(ord("A"));
jump = keyboard_check_pressed(ord("S"));
attackskill = keyboard_check_pressed(ord("D"));

cancel_menu = keyboard_check_pressed(vk_escape);

down_jump = down && jump;

UI_interactionkey = "E";
UI_attackskill = "D";
UI_moveskill = "Spc";
UI_itemkey = "Q";
UI_attackkey = "A";
UI_jumpkey = "S";
UI_move = "←↑→↓";

menu_up = keyboard_check_pressed(vk_up);
menu_left = keyboard_check_pressed(vk_left);
menu_right = keyboard_check_pressed(vk_right);
menu_down = keyboard_check_pressed(vk_down);
menu_confirm = keyboard_check_pressed(ord("E"));
menu_confirm_hold = keyboard_check(ord("E"));
menu_cancel = keyboard_check_pressed(vk_escape);
menu_back = keyboard_check_pressed(ord("Q"));

