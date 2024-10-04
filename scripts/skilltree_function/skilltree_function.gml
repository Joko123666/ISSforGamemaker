
function set_skilltree()
{		//게임 시작시 스킬트리 초기화
	for (var i = 0; i < 3; i++)
	{
		for (var j = 0; j < 10; j++)
		{
			global.skilltree_guild[i][j] = false;
			global.skilltree_temple[i][j] = false;
			global.skilltree_guild_price[i][j] = 0;
			global.skilltree_temple_price[i][j] = 0;
		}
	}
	
	global.skilltree_temple_price[0][0] = 0;
	global.skilltree_temple_price[0][1] = 100;
	global.skilltree_temple_price[0][2] = 500;
	global.skilltree_temple_price[0][3] = 1200;
	global.skilltree_temple_price[1][0] = 10;
	global.skilltree_temple_price[1][1] = 150;
	global.skilltree_temple_price[2][0] = 20;
	global.skilltree_temple_price[2][1] = 200;
}

function open_skill_tree_menu() {
    isOpen = true;  // 스킬트리 창 열기
    // 추가 UI 처리
}


function get_templeskilltree(i, j)
{
	switch (i)
	{
		case 0 :
		switch(j)
		{
			case 0 :
				oGame.price_scale += 0.1;
			break;
			
			case 1 :
				oGame.price_scale += 0.2;
			break;
			
			case 2 :
				oGame.price_scale += 0.3;
			break;
			
			case 3 :
			break;
			
			case 4 :
			break;
		}
		break;
		
		case 1 :
		switch(j)
		{
			case 0 :
				oPlayer.SPD += 0.1;
			break;
			
			case 1 :
				oPlayer.SPD += 0.2;
			break;
			
			case 2 :
				oPlayer.SPD += 0.3;
			break;
			
			case 3 :
			break;
			
			case 4 :
			break;
		}
		break;
		
		case 2 :
		switch(j)
		{
			case 0 :
				oGame.price_scale += 0.1;
			break;
			
			case 1 :
				oGame.price_scale += 0.1;
			break;
			
			case 2 :
				oGame.price_scale += 0.1;
			break;
			
			case 3 :
			break;
			
			case 4 :
			break;
		}
		break;
		
	}
}

function load_skill_text(_linenum)
{
	//텍스트 파일 호출
	var file = file_text_open_read(working_directory + "Skill_description.txt");
	var _text = "";
	for (var i = 0; i < 180; i++;)
	{
		var _raw_text = "";
	    text[i] = file_text_read_string(file);
		_raw_text = text[i];
		var _processed_text = replace_player_name(_raw_text);
		text[i] = _processed_text;
	    file_text_readln(file);
	}
	file_text_close(file);
	return text[_linenum];
}

// 스킬 구조체 정의
function Skill(name, description, prerequisites, piety_cost) {
    var skill = ds_map_create();
    skill[? "name"] = name;
    skill[? "description"] = description;
    skill[? "prerequisites"] = prerequisites;
    skill[? "unlocked"] = false;
    skill[? "piety_cost"] = piety_cost; // 재화 필요량 추가
    return skill;
}

function Skill_Wealth(name, description, prerequisites, piety_cost) {  
        var _wealthskill = ds_map_create();
	    _wealthskill[? "name"] = name;
	    _wealthskill[? "description"] = description;
	    _wealthskill[? "prerequisites"] = prerequisites;
	    _wealthskill[? "unlocked"] = false;
	    _wealthskill[? "piety_cost"] = piety_cost; // 재화 필요량 추가
	    return _wealthskill;
}

// 스킬 해금 여부를 확인하는 함수
function can_unlock(skill_id) {
    var skill = ds_map_find_value(global.selected_skill_tree, skill_id);
    
    if (skill == undefined || skill[? "unlocked"]) {
        return false;  // 이미 해금된 스킬이거나 존재하지 않으면 false
    }

    // 재화 확인
    if (global.piety < skill[? "piety_cost"]) {
        return false;
    }

    // 선행 스킬 조건 확인
    var prerequisites = skill[? "prerequisites"];
    for (var i = 0; i < array_length_1d(prerequisites); i++) {
        var prereq_skill = ds_map_find_value(global.selected_skill_tree, prerequisites[i]);
        if (!prereq_skill[? "unlocked"]) {
            return false;  // 선행 스킬이 해금되지 않으면 false 반환
        }
    }

    return true;  // 모든 조건이 충족되면 true 반환
}


// 스킬을 해금하는 함수
function unlock_skill(skill_id) {
    var skill = ds_map_find_value(global.selected_skill_tree, skill_id);

    if (can_unlock(skill_id)) {
        skill[? "unlocked"] = true;
        global.piety -= skill[? "piety_cost"];  // 재화 차감
        show_debug_message("Skill Unlocked: " + skill[? "name"]);
    } else {
        show_debug_message("Not enough piety or prerequisites not met.");
    }
}


