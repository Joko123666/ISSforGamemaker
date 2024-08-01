event_inherited();

#region Base statuse

//오브젝트 그룹
object_type = "enemy";
//체력
maxHP = 50 ;
HP = maxHP;
//속도
move_speed = 2;
//공격 변수
attack_power = 25;
knockback_power = 8;
//넉백 저항
knockback_resistance = 0;
//중력, 마찰력
grv = 0.4;
frict = 0.2;
//피격시 출력 이펙트
hit_particle = oparticle_05;

//플레이어와의 거리 체크
alert_range = 400
deactivate_range = 500;
vertical_range = 84;

//제거시 드랍 보상
Exp = 0 ;
gold = 0 ;
dead_item = oItem_drop;

//상태별 스프라이트
sprite_defalt = sEnemy_dummy;
sprite_move = sEnemy_dummy_move;
sprite_alert = sEnemy_dummy_alert;
sprite_Cbefore = sEnemy_dummy_charge_before;
sprite_Cwhile = sEnemy_dummy_charge_while;
sprite_Cafter = sEnemy_dummy_charge_after;
sprite_knockback = sEnemy_dummy_knockback;
//sprite_death = enemy_hill_goblin_death;

#endregion

#region other variables

//오브젝트의 상태
state = "Neutral";
isSet = false;
alarm[1] = 60;
//가변 속도
moving_speed = 1;
//넉백 쿨타임
knockback_maxcount = 10;
knockback_count = knockback_maxcount;
//무적 변수
invincibility = false;
invincibility_count = 3;
//세로 속도
vsp = 0;
//다용도 카운트 변수
act_count = 30;
act_count_set = 30;
act_switch = false;
move_count = 0;
charge_state = 0;
#endregion


image_speed = 1;