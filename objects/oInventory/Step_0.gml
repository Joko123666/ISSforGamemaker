/*
if (keyboard_check_pressed(vk_numpad7))
{
	show_debug_message(Inventory_search(id, 1) != -1);
}
if (keyboard_check_pressed(vk_numpad8))
{
	Inventory_add(id, irandom(3));
}
if (keyboard_check_pressed(vk_numpad9))
{
	Inventory_remove(id, 1);
}

if (isOpen == true)
{
	x = oPlayer.x + 32;
	y = oPlayer.y - 128;
}

if (!Inventory_isfull(id))
{isfull = false;}
*/
/*
// oInventory 스텝 이벤트
if (keyboard_check_pressed(ord("I"))) {
    isOpen = !isOpen;
    if (isOpen) {selected_slot = 0;} // 인벤토리가 열릴 때 첫 슬롯을 선택
	else {oPlayer.state = "Move";}
}

if (isOpen) {
	x = oPlayer.x + 32;
	y = oPlayer.y - 128;
	oPlayer.state = "Stay";
	switch(state)
	{
		case "" :
		break;
	}
    if (left) {
        selected_slot = (selected_slot - 1 + INVENTORY_SLOTS) % INVENTORY_SLOTS;
    }
    if (right) {
        selected_slot = (selected_slot + 1) % INVENTORY_SLOTS;
    }
    if (up) {
        selected_slot = (selected_slot - row_length + INVENTORY_SLOTS) % INVENTORY_SLOTS;
    }
    if (down) {
        selected_slot = (selected_slot + row_length) % INVENTORY_SLOTS;
    }
    if (confirm) {
        show_menu();
    }
}
*/

switch (state)
{
	case "Closed" :
		if (oGame.gameinput.inventory)
		{
			selected_slot = 0;
			oPlayer.state = "Stay";
			state = "Opened";
			menu_level = 0;
		}
	break;
	case "Opened" :
		x = oPlayer.x + 32;
		y = oPlayer.y - 128;
		oPlayer.state = "Stay";
		//메뉴의 전체 갯수를 카운트
		op_length = array_length(option[menu_level]);

		//메뉴바를 이동하면 커서 위치를 변경
		if (menu_level != 0)
		{
			pos += oGame.gameinput.menu_down - oGame.gameinput.menu_up;
			if (pos >= op_length) {pos = 0;}
			if (pos < 0) {pos = op_length - 1;}
		}
		
		if (menu_level == 0)
		{
		    if (oGame.gameinput.menu_left) {
		        selected_slot = (selected_slot - 1 + INVENTORY_SLOTS) % INVENTORY_SLOTS;
		    }
		    if (oGame.gameinput.menu_right) {
		        selected_slot = (selected_slot + 1) % INVENTORY_SLOTS;
		    }
		    if (oGame.gameinput.menu_up) {
		        selected_slot = (selected_slot - row_length + INVENTORY_SLOTS) % INVENTORY_SLOTS;
		    }
		    if (oGame.gameinput.menu_down) {
		        selected_slot = (selected_slot + row_length) % INVENTORY_SLOTS;
		    }
		}
		if (oGame.gameinput.menu_confirm)
		{
			var _sel = menu_level;
			switch(menu_level)
			{
				case 0 :
					if (isSwap == false)
					{menu_level = 1;}
					else
					{
						if (selected_slot != original_slot) 
						{
			                Inventory_swap(id, original_slot, id, selected_slot);
			            }
						isSwap = false;
					}
				break;
				
				case 1 :	//메뉴 고르기
				switch(pos)
				{
					case 0 :	//Info
						show_item_info(selected_slot);
					break;
	
					case 1 :	//Move
						menu_level = 0;
						isSwap = true;
						original_slot = selected_slot;
					break;
	
					case 2 :	//Drop
						Inventory_drop(id, selected_slot);
						menu_level = 0;
					break;
	
					case 3 :	//Cancel
						menu_level = 0;
					break;
				}
				break;
	
				break;
			}
			if (_sel != menu_level) {pos = 0;}	
			op_length = array_length(option[menu_level]);
		}
		if (oGame.gameinput.menu_back)
		{
			if (menu_level > 0)
			{menu_level--;}
			else {state = "Closed"; oPlayer.state = "Move";}
		}
		//인벤토리 닫기
		if (oGame.gameinput.menu_cancel) or (oGame.gameinput.inventory)
		{state = "Closed"; oPlayer.state = "Move";}

	break;
}
