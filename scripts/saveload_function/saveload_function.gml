
/*
function save_game(){

	#region SAVE GAME
	var _saveData = array_create(0);
	
	with (oPlayer)
	{
		var _saveEntity = 
		{
			#region Player status
			obj : object_get_name(object_index),
			y : y,
			x : x,
			image_index : image_index,
			image_blend : image_blend,
			HP : HP,
			MP : MP,
			maxHP : maxHP,
			maxMP : maxMP,
			Exp : Exp,
			attackskill_set : attackskill_set,
			attackskill_cool : attackskill_cool,
			attackskill_coolset : attackskill_coolset,
			hspd : hspd,
			vsp : vsp,
			grv : grv,
			SPD : SPD,
			maxjumpcount : maxjumpcount,
			jumppower : jumppower,
			rollspd : rollspd,
			knockback : knockback,
			knockback_power : knockback_power,
			state : state,
			skillS_maxcool : skillS_maxcool,
			moveskill_maxcool : moveskill_maxcool,
			moveskill_set : moveskill_set,
			#endregion
			
			#region global_variables
			input_type : global.input_type,
			gamevolume : global.gamevolume,
			room_direction : 99,
			BGM_number : global.BGM_number,
			
			
			language : global.language,
			
			#endregion
			
		}
		array_push(_saveData, _saveEntity);
	}

	// turn data to JSON string and save it
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1 , buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savedgame.save");
	buffer_delete(_buffer);
	
	show_debug_message("Game Saved!" + _string);
	#endregion
	
	audio_play_sound(SE_system07, 1, false);
}
*/

// 게임 상태를 저장하는 구조체
function GameState() {
    return {
        player_state: oPlayer.state,
        skills: skills,
        skill_positions: skill_positions,
        unlocked_skills: get_unlocked_skills()
    };
}

// 해제된 스킬 목록을 반환하는 함수
function get_unlocked_skills() {
    var unlocked = ds_list_create();
    for (var i = 0; i < ds_list_size(skill_ids); i++) {
        var skill_id = ds_list_find_value(skill_ids, i);
        var skill = ds_map_find_value(skills, skill_id);
        if (skill.unlocked) {
            ds_list_add(unlocked, skill_id);
        }
    }
    return unlocked;
}

function save_game() {
    #region SAVE GAME
    var _saveData = ds_map_create();

    with (oPlayer) {
        var _saveEntity = ds_map_create();
        
        // Player status
        _saveEntity[? "obj"] = object_get_name(object_index);
        _saveEntity[? "y"] = y;
        _saveEntity[? "x"] = x;
        _saveEntity[? "image_index"] = image_index;
        _saveEntity[? "image_blend"] = image_blend;
        _saveEntity[? "HP"] = HP;
        _saveEntity[? "SP"] = SP;
        _saveEntity[? "maxHP"] = maxHP;
        _saveEntity[? "maxSP"] = maxSP;
        _saveEntity[? "maxHunger"] = maxHunger;
        _saveEntity[? "hunger"] = hunger;
        _saveEntity[? "maxMentality"] = maxMentality;
        _saveEntity[? "mentality"] = mentality;
        _saveEntity[? "hunger_endurance"] = hunger_endurance;
        _saveEntity[? "attackskill_set"] = attackskill_set;
        _saveEntity[? "attackskill_cool"] = attackskill_cool;
        _saveEntity[? "attackskill_coolset"] = attackskill_coolset;
        _saveEntity[? "moveskill_num"] = moveskill_num;
        _saveEntity[? "moveskill_cooldown"] = moveskill_cooldown;
        _saveEntity[? "SPD"] = SPD;
        _saveEntity[? "base_move_speed"] = base_move_speed;
        _saveEntity[? "extra_move_speed"] = extra_move_speed;
        _saveEntity[? "move_speed"] = move_speed;
        _saveEntity[? "vsp"] = vsp;
        _saveEntity[? "grv"] = grv;
        _saveEntity[? "maxjumpcount"] = maxjumpcount;
        _saveEntity[? "jumppower"] = jumppower;

        // Global variables
        _saveEntity[? "room_playeris"] = room;
        _saveEntity[? "room_direction"] = 99;
        _saveEntity[? "gold"] = global.gold;
        _saveEntity[? "piety"] = global.piety;
        _saveEntity[? "mainstream"] = global.mainstream;

        _saveData[? "player"] = _saveEntity;
    }
    
    // Save Encyclopedia
    var _encyclopedia = ds_list_create();
    for (var i = 0; i < 100; i++) {
        var _entry = ds_list_create();
        for (var j = 0; j < 10; j++) {
            ds_list_add(_entry, global.Encyclopedia[j][i]);
        }
        ds_list_add(_encyclopedia, _entry);
    }
    _saveData[? "Encyclopedia"] = _encyclopedia;

    // Save Skilltree
    var _skilltree_guild = ds_list_create();
    for (var i = 0; i < 3; i++) {
        var _guild = ds_list_create();
        for (var j = 0; j < 10; j++) {
            ds_list_add(_guild, global.skilltree_guild[i][j]);
        }
        ds_list_add(_skilltree_guild, _guild);
    }
    _saveData[? "skilltree_guild"] = _skilltree_guild;

    var _skilltree_temple = ds_list_create();
    for (var i = 0; i < 3; i++) {
        var _temple = ds_list_create();
        for (var j = 0; j < 10; j++) {
            ds_list_add(_temple, global.skilltree_temple[i][j]);
        }
        ds_list_add(_skilltree_temple, _temple);
    }
    _saveData[? "skilltree_temple"] = _skilltree_temple;

    // Turn data to JSON string and save it
    var _string = json_stringify(_saveData);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, "savedgame.save");
    buffer_delete(_buffer);

    show_debug_message("Game Saved!" + _string);
    #endregion

    audio_play_sound(SE_system07, 1, false);
}



function load_game() {
    if (file_exists("savedgame.save")) {
        with (oPlayer) instance_destroy();
    }

    if (file_exists("savedgame.save")) {
        var _buffer = buffer_load("savedgame.save");
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);

        var _loadData = json_parse(_string);

        var _loadEntity = _loadData[? "player"];
        with (instance_create_layer(0, 0, "Playerlayer", asset_get_index(_loadEntity[? "obj"]))) {
            room = _loadEntity[? "room_playeris"];
            x = _loadEntity[? "x"];
            y = _loadEntity[? "y"] - 24;
            image_blend = _loadEntity[? "image_blend"];
            image_index = _loadEntity[? "image_index"];
            maxHP = _loadEntity[? "maxHP"];
            maxSP = _loadEntity[? "maxSP"];
            HP = _loadEntity[? "HP"];
            SP = _loadEntity[? "SP"];
            attackskill_set = _loadEntity[? "attackskill_set"];
            attackskill_cool = _loadEntity[? "attackskill_cool"];
            attackskill_coolset = _loadEntity[? "attackskill_coolset"];
            hspd = _loadEntity[? "hspd"];
            vsp = _loadEntity[? "vsp"];
            grv = _loadEntity[? "grv"];
            SPD = _loadEntity[? "SPD"];
            maxjumpcount = _loadEntity[? "maxjumpcount"];

            // Global variables
            global.room_direction = _loadEntity[? "room_direction"];
            global.gold = _loadEntity[? "gold"];
            global.piety = _loadEntity[? "piety"];
            global.mainstream = _loadEntity[? "mainstream"];
        }

        // Load Encyclopedia
        var _encyclopedia = _loadData[? "Encyclopedia"];
        for (var i = 0; i < 100; i++) {
            for (var j = 0; j < 10; j++) {
                global.Encyclopedia[j][i] = ds_list_find_value(_encyclopedia[| i], j);
            }
        }

        // Load Skilltree
        var _skilltree_guild = _loadData[? "skilltree_guild"];
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 10; j++) {
                global.skilltree_guild[i][j] = ds_list_find_value(_skilltree_guild[| i], j);
            }
        }

        var _skilltree_temple = _loadData[? "skilltree_temple"];
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 10; j++) {
                global.skilltree_temple[i][j] = ds_list_find_value(_skilltree_temple[| i], j);
            }
        }

        show_debug_message("Game Loaded!" + _string);
        oPlayer.state = "Move";
    }
}

