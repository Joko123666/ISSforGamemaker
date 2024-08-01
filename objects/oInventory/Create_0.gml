// oInventory 생성 이벤트
#macro INVENTORY_SLOTS 15
row_length = 5;
inventory = array_create(INVENTORY_SLOTS, -1);
randomize();
inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 1;

isOpen = false;
this_item = 0;
selected_slot = 0;
isSwap = false;
original_slot = 0;
isfull = false;
//////

act_count = 0;
deactivate_count = 10;

state = "Closed";

op_border = 8;
op_space = 32;

pos = 0;

option[1, 0] = "자세히";
option[1, 1] = "이 동";
option[1, 2] = "버리기";
option[1, 3] = "취소";

op_length = array_length(option[1]);
menu_level = 0;

width = 156 ;
height = op_length*op_space +op_border*2;


openkey = oGame.gameinput.inventory;

up = oGame.gameinput.menu_up;
down = oGame.gameinput.menu_down;
left = oGame.gameinput.menu_left;
right = oGame.gameinput.menu_right;
confirm = oGame.gameinput.menu_confirm;
back = oGame.gameinput.menu_back;
cancel = oGame.gameinput.menu_cancel;
