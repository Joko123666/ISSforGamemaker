if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
{
	exit;	//중복타격 방지
}
if creator.object_type == other.object_type
{
	exit;	//같은 그룹 오브젝트 타격 방지
}
if other.state != "Death"
{
	if other.invincibility == false			//invincibility check
	{
		other.HP -= damage;
		/*
		//데미지 화면 표시	
		#region Damage_text_draw
		var damage_texttext = floor(damage);
		var damage_text = instance_create_layer(other.x, y-16, "Effects", text_drawingob_move)
		damage_text.text = damage_texttext;
		var damage_text_width = string_width(damage_text.text);
		damage_text.x -= damage_text_width/2;
		damage_text.y -= other.sprite_height;
		#endregion
		#region Hit_effect_create
		repeat(random_range(4,10))			//충돌 오브젝트 별 이펙트
		{
			instance_create_layer(other.x, other.y - 12, "Effects", other.hit_particle);
		}
		#endregion
		*/
	}

	if instance_exists(oPlayer)
	{
		if creator.object_index == oPlayer
		{
			
		}
	
		if other.object_index == oPlayer			//hit player
		{
			screen_shake(32, 10);
		}
		else				// hit enemy
		{
			other.alarm[0] = 120;
			screen_shake(4, 10);
			if other.HP <=0
			{
				other.state = "Death"
			}
		}
	}
	

ds_list_add(hit_objects, other);
	if other.state != "Knockback" && other.invincibility == false && other.object_type != "boss"
	{
		other.knockback_count -= damage
		if other.knockback_count <=0
		{
			other.state = "Knockback";
			other.knockback_count = other.knockback_maxcount;
			if other.object_index == oPlayer
			{
				oPlayer.invincibility = true;
				audio_play_sound(SE_beat01, 3, false);
			}
		}
	}
	other.knockback_speed = knockback * image_xscale;
}

if particle_switch == false	&& hit_particle != 0
	{instance_create_layer(other.x, other.y - (other.sprite_height/2), "Effects", hit_particle); particle_switch = true;}



show_debug_message(other.HP);
