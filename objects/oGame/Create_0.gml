

	//게임 전체 관리 변수
//시간 관리 변수
set_dayname();
day = 0;
day_name = dayname[day-7*floor(day/7)];
date = 0;			//경과일
time = 540;			//시간(분)
time_hour = floor(time/60);	//시간(시)
alarm[9] = 60;

//재화와 점수
money = 0;			//돈
reputation = 0;		//평판
contribution = 0;	//공헌도
token_guild = 0;	//토큰(미정)

//변화용 변수(업그레이드)
price_variable_scale = 1;
price_basic = 0;
price_scale = 1;
price_min = 0;

//채집용 변수
rooting_speed = 1;
rooting_range = 1;
rooting_motion = 1;
rooting_itempercent = 1;


//게임 상태 변수
game_state = "Play";		//게임상태 ( UI조작, 게임플레이, 일시정지, 등)
game_room = "메인화면";		//현재 게임 룸 (이름 표시용)
game_progress = 0;

//메뉴 관리 변수
menu_state[0] = "계속하기";



//설정변수
language = "Korean";	//언어설정
volume_bgm = 100;
volume_se = 100;

//스킬트리 호출

// 퀘스트 초기화
global.quests = ds_list_create(); // 진행 중인 퀘스트 리스트
global.quest_max = 10; // 최대 퀘스트 수


//시작 변수 호출
item_price[0] = 0;
set_base_price();
set_item_price();
//set_skilltree();
set_global_variables();
dayreset_genpoint();
Encyclopedia_set();

// 저장 변수 초기화 
global.save_menu_open = false;
global.save_slots = 3;
global.selected_slot = 0;
global.savefile_info = ds_map_create();
global.interaction_delay = 0; // 상호작용 딜레이 타이머

// 저장 슬롯 초기화
for (var i = 0; i < global.save_slots; i++) {
    var slot_name = "savefile_" + string(i);
    if (!file_exists(slot_name + ".save")) {
        ds_map_add(global.savefile_info, slot_name, "Empty Slot");
    } else {
        ds_map_add(global.savefile_info, slot_name, "Saved Game " + string(i));
    }
}

// 대사 구조 정의
global.dialogue_data = ds_map_create();
global.current_dialogue = "";
global.dialogue_index = 0;
global.dialogue_speed = 2; // 텍스트 출력 속도 (프레임 단위)
global.dialogue_timer = 0;
global.dialogue_complete = false;
global.dialogue_choices = ds_list_create();

// oGame Create 이벤트
//global.dialogue_data_visual = load_dialogue("Mainstream_dialog.txt");
//global.dialogue_data_balloon = load_dialogue("NPC_dialog.txt");
global.current_dialogue = "";
global.dialogue_index = 0;
global.dialogue_speed = 2; // 텍스트 출력 속도 (프레임 단위)
global.dialogue_timer = 0;
global.dialogue_complete = false;
global.dialogue_npc = noone; // 현재 대화 중인 NPC
global.interaction_delay = 0; // 상호작용 딜레이 타이머
global.dialogue_mode = ""; // "visual" 또는 "balloon"으로 모드를 설정
global.dialogue_active = false; // 대화 활성화 플래그

// 도감 이벤트
global.encyclopedia_page = 0; // 현재 도감 페이지
global.encyclopedia_items_per_page = 10; // 페이지당 항목 수
global.encyclopedia_length = 16; // 임시 설정, 실제 값으로 대체
global.total_encyclopedia_pages = ceil(global.encyclopedia_length / global.encyclopedia_items_per_page);



//인스턴스 생성
gameinput = instance_create_depth(0, 0, 0, oInput);
instance_create_layer(0, 0, "Hud", oHud);
instance_create_layer(0, 0, "Hud", oInventory);
instance_create_layer(0, 0, "Hud", oCamera);
instance_create_layer(0, 0, "Hud", oMouse);


//instance_create_layer(0, 0, "instances", oParallax);
//글로벌 변수 초기화 함수 호출
