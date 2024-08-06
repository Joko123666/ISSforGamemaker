
function Inventory_search(root_object, item_type)
{
	for ( var i = 0; i < INVENTORY_SLOTS; i++)
	{
		if (root_object.inventory[i] == item_type)
		{
			return(i);
		}
	}
	return -1;
}

function Inventory_remove(root_object, item_type)
{
		var _slot = Inventory_search(root_object, item_type);
		if (_slot != -1)
		{
			with (root_object) inventory[_slot] = -1;
			return true;
		}
		else return false;
}

function Item_remove_effect(item_type)
{
	var _effect =  instance_create_layer(oPlayer.x - 12 + random(24), oPlayer.y - 64, "Effects", oEffect_itemremove)
	_effect.item_num = item_type;
}

function Inventory_sellitem(root_object, item_type)
{
	var _slot = Inventory_search(root_object, item_type);
	if (_slot != -1)
		{
			with (root_object) inventory[_slot] = -1;
			oGame.money += global.item_price[item_type];
			
			return true;
		}
	else return false;
}

function Inventory_sellall(min_num, max_num)
{
	var _isend = false;
	with(oInventory)
	{
		for (i = min_num; i < max_num; i++)
		{
			_isend = false;
			while (_isend == false)
			{
				var _slot = Inventory_search(id, i);
				if (_slot != -1)
				{
					with (id) inventory[_slot] = -1;
					oGame.money += global.item_price[i];
					Item_remove_effect(i);
					_isend = false;
				}
				else {_isend = true;}
			}
		}
	}
}

function Inventory_selltrash(min_num, max_num)
{
	var _isend = false;
	with(oInventory)
	{
		for (i = min_num; i < max_num; i+= 10)
		{
			_isend = false;
			while (_isend == false)
			{
				var _slot = Inventory_search(id, i);
				if (_slot != -1)
				{
					with (id) inventory[_slot] = -1;
					oGame.money += global.item_price[i];
					Item_remove_effect(i);
					_isend = false;
				}
				else {_isend = true;}
			}
		}
	}
}


function Inventory_stockitem(min_num, max_num)
{
	var _isend = false;
	with(oInventory)
	{
		for (i = min_num; i < max_num; i++)
		{
			_isend = false;
			while (_isend == false)
			{
				var _slot = Inventory_search(id, i);
				if (_slot != -1)
				{
					with (id) inventory[_slot] = -1;
					global.itemstock[i]++;
					Item_remove_effect(i);
					_isend = false;
				}
				else {_isend = true;}
			}
		}
	}
}

function Inventory_add(root_object, item_type)
{
	var _slot = Inventory_search(root_object, -1);
	if (_slot != -1)
	{
		with (root_object) inventory[_slot] = item_type;
		return true;
	}
	else return false;
}

//특정 아이템 제거 함수
function remove_item_by_id(root_object, item_type) {
    var slot = Inventory_search(root_object, item_type);
    if (slot != -1) {
        root_object.inventory[slot] = -1; // 아이템 제거
        show_debug_message("Item removed: " + string(item_type));
        return true; // 제거 성공
    } else {
        show_debug_message("Item not found: " + string(item_type));
        return false; // 아이템 없음
    }
}

//인벤토리가 가득 차있는지 확인하고 가득 찼다면 true반환
function Inventory_isfull(root_object)
{
	var _slot = Inventory_search(root_object, -1);
	if (_slot != -1)
	{
		return false;
	}
	else return true;
}

function Inventory_swap(object_from, slot_from, object_to, slot_to)
{
	var _itemFrom = object_from.inventory[slot_from];
	object_from.inventory[slot_from] = object_to.inventory[slot_to];
	object_to.inventory[slot_to] = _itemFrom;
	audio_play_sound(SE_system01, 1, 0);
}

function Inventory_drop(object_from, slot_from)
{
	var _itemFrom = object_from.inventory[slot_from];
	object_from.inventory[slot_from] = -1;
	var drop_item = instance_create_layer(oPlayer.x + 32*oPlayer.image_xscale , oPlayer.y - 64, "Instances", oItem_drop);
	drop_item.item_id = _itemFrom;
	global.Encyclopedia[0][_itemFrom].count -= 1;
	audio_play_sound(SE_system04, 1, 0);
}


function UseInventory_use(item_num)
{
	switch(item_num)
	{
		case 0 :
		{
			oPlayer.HP += 10;
			oPlayer.hunger += 20;
		}	break;
		case 1 :
		{
			oPlayer.HP += 10;
			oPlayer.hunger += 50;
			oPlayer.mentality -= 10;
		}	break;
		
		case 2 :
		{
			get_buff("haste", 120);
		}	break;
		
		case 3 :
		{
			get_buff("regenerate", 30);
		}	break;
		
		case 4 :
		{
			global.room_direction = 2;
			room_goto(village_guild);
		}	break;
		
		case 5 :
		{
			
		}	break;
		
		case 6 :
		{
			
		}	break;
	}
	
	oPlayer.useitem_stock = -1;
}



function show_menu() {
    // 하위 메뉴 구현 예시 (아이템 정보, 이동, 버리기)
    var option = get_user_input("Select an option:\n1. View Info\n2. Move\n3. Drop", 1, 3);
    switch (option) {
        case 1: // View Info
            show_item_info(selected_slot);
            break;
        case 2: // Move
            var target_slot = get_user_input("Select target slot (0-14):", 0, INVENTORY_SLOTS - 1);
            if (target_slot != selected_slot) {
                Inventory_swap(id, selected_slot, id, target_slot);
            }
            break;
        case 3: // Drop
            Inventory_drop(id, selected_slot);
            break;
    }
}

function get_user_input(prompt, min, max) 
{
    // 사용자가 입력한 값을 가져오는 예시 함수
    // 실제로는 다이얼로그나 다른 방법을 사용해야 함
    var input = min; // 기본값 설정
    // 사용자로부터 유효한 입력을 받을 때까지 반복
    do
	{
        input = real(get_string(prompt, string(input)));
    }
	until (input >= min && input <= max);
	
    return input;
}

function show_item_info(slot) {
    // 아이템 정보 표시 예시
    var item_type = inventory[slot];
    if (item_type != -1) {
        show_message("Item Info:\nType: " + string(item_type));
    } else {
        show_message("Empty Slot");
    }
}


