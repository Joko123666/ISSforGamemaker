//state_update
if (oGame.game_state != "Play")
{ exit;}
#region State_update
//레벨업
/*
	if invincibility_count > 0			//무적 상태
	{
		invincibility_count--;
		invincibility = true;			//무적카운트 계산
		image_alpha = 0.6;
	}
	else 
	{
		invincibility = false;			//무적 해제
		image_alpha = 1;
	}
*/

//최대체력, 마력 설정
if HP > maxHP
	{HP = maxHP;}
if SP > maxSP
	{SP = maxSP;}
if mentality < 0
	{mentality = 0;}
if hunger < 0
	{hunger = 0;}
	

//각종 재사용 대기시간
ladder_term = count_decrease(ladder_term, 1, 0);
act_count = count_decrease(act_count, 1, 0);
attackskill_cool = count_decrease(attackskill_cool , 1, 0);
moveskill_cooldown = count_decrease(moveskill_cooldown, 1, 0);

//버프 시간 관리
for (var i = 0; i < 10; i++)
{
	if (bufftime[i] > 0)
	{bufftime[i] -= 1;}
	
	if (bufftime[1] <= 0)
	{buff_move_speed = 0;}
	if (bufftime[2] > 0)
	{HP++; if (HP > maxHP) {HP = maxHP;}}
}
//버프 상태 관리


if (isSPregen == true) && (SP < maxSP)
{
	SP++;
	if (SP > 20)
	{sprintable = true;}
	else
	{sprintable = false;}
}
	

#endregion

Update_state();
switch (state)
{
	case "Stay" :
	#region Stay

	gravity_defalt();
	
	#endregion
	break
	
	case "Rooting" :
	#region Stay

	gravity_defalt();
	
	#endregion
	break
	
	case "Gathering" :
	#region Gathering
	state_set_sprite(sprite_gathering, SPD, 0);
	gravity_defalt();
	
	#endregion
	break
	
	case "Praying" :	#region Praying
	state_set_sprite(sprite_praying, 0, 0);
	mentality += 0.2;
	global.piety += 0.1;
	oGame.time ++;
	if (mentality > maxMentality)	{mentality = maxMentality;}
	#endregion
	break
	
	case "Move" :
		#region Move_state
		oCamera.camera_ymovement_point = 0;
		mask_index = player_mask;
		alarm[0] = 0;
		act_switch = false;
		//이동속도 설정
		if (input.sprint)	&& (sprintable == true)
		{
			move_speed = (base_move_speed + extra_move_speed + buff_move_speed) * SPD;
			issprint = true;
			
		}
		else {move_speed = base_move_speed * SPD + buff_move_speed;	issprint = false;}
		
		if input.right					//이동 우측
		{
			image_xscale = 1;
			if (issprint == true) && (SP > 1)	//대쉬
			{
				state_set_sprite(sprite_sprint, SPD, 0);
				SP--;
				alarm[4] = SP_regentime;
				isSPregen = false;
				if (!audio_is_playing(SE_sprint))
				{audio_play_sound(SE_sprint, 1, 0);}
			}
			else
			{state_set_sprite(sprite_move, SPD, 0);}
			move_and_collide(move_speed, 0, oWall);
			oCamera.camera_xmovement_point = 20;
		}	
	
		if input.left					//이동 좌측
		{
			image_xscale = -1;
			if (issprint == true) && (SP > 1)	//대쉬
			{
				state_set_sprite(sprite_sprint, SPD, 0);
				SP--;
				alarm[4] = SP_regentime;
				isSPregen = false;
				if (!audio_is_playing(SE_sprint))
				{audio_play_sound(SE_sprint, 1, 0);}
			}
			else
			{state_set_sprite(sprite_move, SPD, 0);}
			move_and_collide(-move_speed, 0, oWall);
			oCamera.camera_xmovement_point = -20;
		}

		if !input.right && !input.left	//이동 중립
		{
			sprite_index = sprite_stand;
		}
		
		if input.down && place_meeting(x,y+4,oWall)	
		{
			state = "Crawl";
		}
		
		if input.moveskill					//회피기 입력
		{
			if (moveskill_cooldown <= 0)
			{
				state = "MoveSkill";
				SP -= global.moveskill_cost[moveskill_num];
				if (SP < 0)	 {SP = 0;}
				
			}
		}
		
		if input.baseattack && place_meeting(x,y+4,oWall)				//공격A 입력
		{
			state = "BaseAttack";
		}
		
		if input.attackskill				//공격S 입력
		{

		}
		
		#region Jump					// 점프 입력
		
		if (input.use_item)				//아이템 사용
		{
			if (useitem_stock != -1)
			{
				UseInventory_use(useitem_stock);
			}
		}
		
		// jump
		vsp = vsp + grv;				//중력 계산

		if (place_meeting(x,y+1,oWall))	&& sign(vsp) > 0	//바닥에 닿았을 경우
		{
			jumpcount = maxjumpcount;	
			isground = true;
		}

		if ((input.jump) && (jumpcount > 0)) && (SP > 10)	//점프 가능 계산
		{
			SP -= 10;
			alarm[4] = SP_regentime;
			isSPregen = false;

			vsp = -jumppower;
			jumpcount -= 1;
			audio_play_sound(SE_jump, 10, false);
			isground = false;
			
		}
		
			//Veltical Collosion
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);	
				
			}
			vsp = 0;
		}
		
		y = y + vsp;

	
		//Jump animation
		if (!place_meeting(x,y+1,oWall))	//공중에 떠있을 경우 
		{
			sprite_index = player_jump;
		
			image_speed = 0;
			isground = false;
			if (sign(vsp) > 0) image_index = 1; else image_index = 0; 	//상승, 하강 상태 결정
		
			if input.baseattack { state = "JumpAttack";}
		}
	
		#endregion
		

		#endregion
	break;
	
	case "Crawl" :
	#region
		state_set_sprite(sprite_crawl, 1, 0);
		
		//if (hunger < maxHunger)	{hunger++;}
		
		if crawl_cameramove_count > 0				//카메라 이동 카운트
		{crawl_cameramove_count--;}
		else
		{oCamera.camera_ymovement_point = 70; oCamera.camera_yspeed = 8;}
		mask_index = player_crawlmask;
	
		//knockback Veltical Collosion
			vsp = vsp + grv;
			if (place_meeting(x,y+vsp,oWall))
			{
				while (!place_meeting(x,y+sign(vsp),oWall))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
		
			y = y + vsp;

	
		if !input.down or !place_meeting(x,y+4,oWall)	
		{
			crawl_cameramove_count = crawl_cameramove_count_defalt;
			state = "Move";
		}
		
	#endregion
	break;
	
	case "MoveSkill" :
		#region 
		//state_set_sprite(player_moveskill, 1, 0);
		
		
		player_moveskills(moveskill_num);
		
		
		#endregion
	break;
	
	case "Knockback" :
		#region Knockback_state
			
			invincibility = true;
			invincibility_count = invincibility_maxcount;
			knockback_state(player_knockback, "Move");
			
				//knockback Veltical Collosion
			vsp = vsp + grv/2;
			if (place_meeting(x,y+vsp,oWall))
			{
				while (!place_meeting(x,y+sign(vsp),oWall))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
		
			y = y + vsp;

		#endregion
	break;
	

	case "JumpAttack" :	
	#region Jumpattack_state
		
		invincibility = false;
		invincibility_count = 0;
		
		
		
			//knockback Veltical Collosion
		vsp = vsp + grv;
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}	
		y = y + vsp;
		
		if input.right					//이동 우측
		{
			move_and_collide(move_speed/2, 0, oWall);
			image_xscale = 1;
		}	
	
		if input.left					//이동 좌측
		{
			move_and_collide(-move_speed/2, 0, oWall);
			image_xscale = -1;
		}
				
		
		
		if animation_end()
		{
			{
				state = "Move"
			}
		}
		
		#endregion
	break;

	case "BaseAttack" :
		#region AttackA_state
		//무적 리셋
		invincibility = false;
		invincibility_count = 0;
		state_set_sprite(sprite_baseattack, SPD, 0);
		if (animation_hit_frame(4))
		{
			create_hitbox(x, y, self, player_attack_defalt_hitbox, knockback_power, 4, 1, image_xscale);
		}
		gravity_defalt();
		
		
		
		if animation_end()
		{
			state = "Move"
		}
		
		
		#endregion
	break;
	
	case "Attackskill1" :
	#region AttackS_state

	if attackskill_cool <= 0
	
		//맨주먹 스킬 
		
		//gravity
		
		vsp = vsp + grv;
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}	
		y = y + vsp;
		
	
	#endregion
	break;
	
	case "Useitem" :
	Use_item();
	#region Gravity
	vsp = vsp + grv/2;
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}	
		y = y + vsp;
	#endregion
	break;

	case "Ladder" :
	#region Laddering
		state_set_sprite(sprite_ladder, 1, 0);
		if input.up					//이동 위
		{
			move_and_collide(0 , -move_speed, oWall);
			image_speed = 1;
			oCamera.camera_ymovement_point = -10;
		}	
	
		if input.down					//이동 아래
		{
			move_and_collide( 0 , move_speed, oWall);
			image_speed = 1;
			oCamera.camera_ymovement_point = 10;
		}

		if !input.up && !input.down	//이동 중립
		{
			image_speed = 0;
		}
		
		if input.jump
		{vsp = -5 ; state = "Move";}
		
		if place_meeting(x, y + 2, oWall) && input.down	&& ladder_term <= 0
		{state = "Move"; vsp = -1;}
		
		if !place_meeting(x, y, oLadder)
		{vsp = -3 ;state = "Move";}

		
	#endregion
	break;
	
	case "Death" :
	#region Death state
		state_set_sprite(player_death_act, 1, 0);	
		
		//instance_create_depth(x, y-46, -3, ui_revive_button);
			// 사망시 넉백
		move_and_collide(death_knockback, 0, oWall);
		if death_knockback > 0  {death_knockback -= 0.3;}
		
		if input.interaction
		{revive_count--; image_index = 0; image_speed = 1;}
		if revive_count <=0			//부활
		{
			revive_maxcount += 1; 
			HP = maxHP; 
			state = "Move"; 
			invincibility = true; 
			invincibility_count = 60;
			death_knockback = 6;
			vsp = -3;
			repeat(8)
			{
				instance_create_depth(x, y-24, -1, oparticle_09);
				instance_create_depth(x, y-24, -1, oparticle_10);
			}
		}
		
		if animation_end()
		{image_speed = 0;}
		
		#region Gravity
		vsp = vsp + grv/2;
			if (place_meeting(x,y+vsp,oWall))
			{
				while (!place_meeting(x,y+sign(vsp),oWall))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}	
			y = y + vsp;
		#endregion
		
	#endregion
	break;
}

if vsp >= 10 {vsp = 10;}		//수직하강속도 제한