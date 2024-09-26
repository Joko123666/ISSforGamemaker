
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


function check_skilltree()
{
	

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
function Skill(name, description, prerequisites) {
    return {
        name: name,
        description: description,
        prerequisites: prerequisites, // 배열 형태로 이전 스킬 ID를 저장
        unlocked: false
    };
}
function Skill_Wealth(name, description, prerequisites) {
    return {
        name: name,
        description: description,
        prerequisites: prerequisites, // 배열 형태로 이전 스킬 ID를 저장
        unlocked: false
    };
}

// 스킬을 해제할 수 있는지 확인하는 함수
function can_unlock(skill_id) {
    if (skill_id == "") return false;
    var skill = ds_map_find_value(skills, skill_id);
    for (var i = 0; i < array_length_1d(skill.prerequisites); i++) {
        var prerequisite_id = skill.prerequisites[i];
        var prerequisite_skill = ds_map_find_value(skills, prerequisite_id);
        if (!prerequisite_skill.unlocked) {
            return false;
        }
    }
    return true;
}

// 스킬을 해제하는 함수
function unlock_skill(skill_id) {
    if (skill_id == "") return;
    var skill = ds_map_find_value(skills, skill_id);
    skill.unlocked = true;
    ds_map_replace(skills, skill_id, skill);
}

