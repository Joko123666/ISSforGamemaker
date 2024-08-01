

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

//시작 변수 호출
item_price[0] = 0;
set_base_price();
set_item_price();
set_skilltree();
set_global_variables();
dayreset_genpoint();
Encyclopedia_set();

//인스턴스 생성
gameinput = instance_create_depth(0, 0, 0, oInput);
instance_create_layer(0, 0, "Hud", oHud);
instance_create_layer(0, 0, "Hud", oInventory);
instance_create_layer(0, 0, "Hud", oCamera);
instance_create_layer(0, 0, "Hud", oMouse);


//instance_create_layer(0, 0, "instances", oParallax);
//글로벌 변수 초기화 함수 호출
