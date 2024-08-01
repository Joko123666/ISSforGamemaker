
switch (state)
{
	#region Neutral
	case "Neutral" :
	state_set_sprite(sprite_defalt, 1, 0);
	//일정 거리 내에 들어오면 공격
	var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
	if (distance_to_player < alert_range) && (isSet == true)	//&& (abs(oPlayer.y - y) < vertical_range)
	{
		state = "Charge";
		charge_state = 0;
		moving_speed = 0;
		if (x - oPlayer.x > 0)
		{image_xscale = -1;}
		else
		{image_xscale = 1;}
	}
	//평소엔 랜덤
	if (isSet == true)
	{
		var act_randomize = irandom(100);
		if (act_randomize < 40)
		{
			state = "Move";
		}
		else if (act_randomize < 60)
		{
			image_xscale = image_xscale * -1;
			alarm[1] = 30;
			isSet = false;
		}
		else
		{
			alarm[1] = 60;
			isSet = false;
		}
	}
	
	
	break;
	#endregion
	
	case "Move" :
		state_set_sprite(sprite_move, 1, 0);
		if (animation_hit_frame(1))
		{moving_speed = move_speed*2; vsp = -4;}
		if (animation_hit_frame_range(3, 6))
		{moving_speed = moving_speed * 0.9;}
		if animation_hit_frame(7) or animation_hit_frame(8)
		{moving_speed = moving_speed * 0.6;}
		
		move_and_collide(moving_speed * image_xscale, 0, oWall);
		gravity_defalt();
		
		if place_meeting(x, y, oPlayer)
		{create_hitbox(x, y, self, mask_index, knockback_power, 2, attack_power/2, image_xscale);}
		
		if animation_end()
		{state = "Neutral";isSet = true;}
	break;
	
	case "Charge" :
		if (charge_state == 0)
		{state_set_sprite(sprite_Cbefore, 1, 0);}
		else if (charge_state == 1)
		{state_set_sprite(sprite_Cwhile, 1, 0);}
		else
		{state_set_sprite(sprite_Cafter, 1, 0);}
		
		if (animation_end() && charge_state == 0)
		{charge_state = 1;}
		if (charge_state == 1)
		{
			moving_speed = move_speed * 2.5;
		}
		if (charge_state == 1 && place_meeting(x + 64*image_xscale, y, oWall))
		{charge_state = 2; moving_speed = moving_speed * 0.3;}
		
		if (charge_state == 2 && animation_end())
		{state = "Neutral"; charge_state = 0; isSet = false; alarm[1] = 60;}
		
		move_and_collide(moving_speed * image_xscale, 0, oWall);
		
	
	break;
	
	case "Knockback" :
	
	break;
	
}