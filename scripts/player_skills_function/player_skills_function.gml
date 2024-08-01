

function player_moveskills(skill_num)
{
	switch(skill_num)
	{
		case 0 :			// 다이버식 회피 
		
			state_set_sprite(player_moveskill, SPD, 0);
			
			if animation_hit_frame(1)
			{
				invincibility = true;
				moving_speed = base_move_speed * SPD * 3.5;
				vsp = -3;
				image_alpha = 0.6;
				isSPregen = false;
				audio_play_sound(SE_jump, 1, 0);
			}
			moving_speed = moving_speed * 0.9;
			if animation_hit_frame(6)
			{
				invincibility = false;
				image_alpha = 1;
				moving_speed = 0;
			}
			move_and_collide(moving_speed * image_xscale, 0, oWall);
			
			if animation_end()
			{
				state = "Move";
				moveskill_cooldown = global.moveskill_cooltime[skill_num];
				alarm[4] = SP_regentime;
			}
			
			//gravity
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

		break;
		
		case 1 :
			state = "Move";
			moveskill_cooldown = global.moveskill_cooltime[skill_num];
		break;
		
		case 2 :
			state = "Move";
			moveskill_cooldown = global.moveskill_cooltime[skill_num];
		break;
		
		case 3 :
			state = "Move";
			moveskill_cooldown = global.moveskill_cooltime[skill_num];
		break;
		
		case 4 :
			state = "Move";
			moveskill_cooldown = global.moveskill_cooltime[skill_num];
		break;
		
	}
}