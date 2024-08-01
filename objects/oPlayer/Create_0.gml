//for test option

event_inherited();

#region Basic status

//오브젝트 그룹
object_type = "player";

#region //기본 스테이터스
maxHP = 100;		//최대 체력
HP = maxHP;
maxSP = 100;		//현재의 최대 기력(공복으로 감소)
maxSP_defalt = 100;	//진짜 최대 기력
SP = maxSP;
SP_regentime = 40;	//공복 회복시작까지 걸리는 시간
isSPregen = false;
sprintable = true;
#endregion

//상태 스테이터스
maxHunger = 100;
hunger = 100;
maxMentality = 100;
mentality = 100;
hunger_endurance = 80;
//장비 스테이터스
equip_necklace = 0;
//공격스킬 변수
attackskill_set = 0;
attackskill_cool  = 0;
attackskill_coolset  = 0;
//이동스킬 변수

#region //사용아이템 변수
useitem_stock = -1;
#endregion

#region //내부 스테이터스
SPD = 1;	//모든 속도 변수
base_move_speed = 6;
extra_move_speed = 3;
move_speed = 6;
buff_move_speed = 0;

base_jumppower = 13;
extra_jumppower = 0;
jumppower = 13;
jumpcount = 1;
maxjumpcount = 1;
knockback_resistance = 0;
knockback_power = 10;
death_knockback = 5;
vsp = 0;
grv = 1;
moveskill_num = 0;
moveskill_cooldown = 0;
moving_speed = 0;
#endregion

//경험치, 레벨
Exp = 0;
maxExp = 20;
level = 1;
//아이템 변수
player_item = "empty";


//기타 제어변수
state = "Move";
cooldown_SPD = 1;
ladder_term = 3;
attackskill_cool = 3;
attackskill_coolset = 30;
invincibility = false;
invincibility_count = 0;
invincibility_maxcount = 20;
crawl_cameramove_count_defalt = 70;
crawl_cameramove_count = 70;
act_count = 0;
restart_count = 40;
issprint = false;

#region //버프 관리
for (var i = 0; i < 10; i ++)
{bufftime[i] = 0;}

#endregion

//스프라이트 설정
sprite_move = player_move;
sprite_sprint = player_sprint;
sprite_crawl = player_crawl;
sprite_jump = player_jump;
sprite_knockback = player_knockback;
sprite_stand = player_defalt;
sprite_ladder = player_ladder;
sprite_baseattack = player_attack_defalt;
sprite_gathering = player_gathering;
sprite_praying = player_praying;

/*
//체력
maxHP = 100;
HP = maxHP;
//마력
maxMP = 100;
MP = maxMP;
MP_regen_time = 100;
alarm[9] = MP_regen_time;
//경험치, 레벨
Exp = 0;
maxExp = 20;
level = 1;
//속도
hspd = 2.4;	
vsp = 1;
SPD = 1;				//애니메이션 속도, 후딜 프레임 감소
rollspd = 8;
//점프
maxjumpcount = 1;
jumpcount = 1;
jumppower = 6.5;
//중력, 마찰력
grv = 0.5;
frict = 0.2;
//공격력
damage = 10;
STR = 0;
//넉백
knockback_speed = 0;
knockback = 3;
knockback_power = 5;
knockback_resistance = 0;
//공격장비 상태
weapon = "empty";
maxattack = 1;
//공격 스킬
attackskill_set = 1;
attackskill_cool = 0;
attackskill_coolset = 70;
skillS_cool = 0;	
skillS_maxcool = 300;
attackskill_cost = 10;
//이동스킬
moveskill_set = 1;
moveskill_cool = 0;
moveskill_maxcool = 100;
moveskill01_cool = 90;
moveskill02_cool = 150;
moveskill03_cool = 120;
moveskill04_cool = 80;
moveskill05_cool = 160;
//피격 이펙트
hit_particle = oparticle_02;
//현재 룸 확인
room_playeris = room;

#endregion

#region ather valiables
//플레이어 상태 표시
state = "Move";			
//무적 변수
invincibility = false;
invincibility_count = 30;
invincibility_maxcount = 45;
//가변 속도
moving_speed = 0;
moving_direction = 0;
//지속상태 변수
isshadow = false;
ismoving = false;
//지면 접촉 확인
isground = true;
//1회용 변수
death_knockback = 6;
ladder_term = 10;
ispushed = false;
//다용도 변수
actingcount = 0;		
action_count = 0;
delaycount = 0;
repeatcount = 0;
act_count = 10;
act_switch = false;
dia_switch = false;
diatext = ".";
//텍스트 출력 변수
notenough_text = false;
notready_text = false;
//부활 변수
revive_count = 0;		
revive_maxcount = 10;
//오디오 출력 변수
audio_play_switch = true;
audio_play_count = 10;
//하단 카메라 이동 변수
crawl_cameramove_count_defalt = 45;
crawl_cameramove_count = crawl_cameramove_count_defalt;
//독백 대화창 출력 변수
dialog_endswitch = false;
dialog_count = 0;
event_tirriger = false;
//그림자이동 좌표 저장
shadow_x = 0;
shadow_y = 0;

//튜토리얼 입력 확인 변수
movekey_input_check = false;
jumpkey_input_check = false;
attackkey_input_check = false;
attackskillkey_input_check = false;
moveskillkey_input_check = false;
itemkey_input_check = false;

//게임 리스타트 퀵키 입력
restart_count = 60;

if global.language == "Korean"
	{player_name = "이드";}
if global.language == "English"
	{player_name = "Ed";}

#endregion

*/

//입력 받아오기
input = instance_create_layer(0, 0, "Instances", oInput);