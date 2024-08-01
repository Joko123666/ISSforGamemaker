if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1
{
	exit;
}
if creator.object_type == other.object_type
{
	exit;
}
if other.state != "Death"
{
	if other.invincibility == false			//invincibility check
	{
		other.HP -= damage;
		repeat(random_range(5,10))
		{
			instance_create_layer(other.x + (random_range(-16, 16)), other.y - 12, "Effects", oHit_effect);
		}
		repeat(random_range(4,10))			//충돌 오브젝트 별 이펙트
		{
			instance_create_layer(other.x, other.y - 12, "Effects", other.hit_particle);
		}
	}

	if instance_exists(Player)
	{
		if creator.object_index == Player
		{
			if other.HP <= 0
			{
				Player.playerscore += 1;
			}
		}
	
		if other.object_index == Player			//hit player
		{
			screen_shake(6, 10);
		
			if other.HP <=0 
			{
				var number = sprite_get_number(test_death);
				for (var i = 0 ; i < number ; i++)
				{
					var bx = other.x + random_range(-8 , 8);
					var by = other.y + random_range(-36 , -8);
					var bone = instance_create_layer(bx, by, "Instances", player_death_object);
					bone.direction = 90-(image_xscale * random_range(30, 60));
					bone.speed = random_range(4, 10);
					bone.image_index = i;
					if i == 5 {bone.image_angle = 130; }
				}
			}
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
		other.state = "Knockback";
		if other.object_index == Player
		{
			Player.invincibility = true;
		}
	}
	other.knockback_speed = knockback * image_xscale;
}

show_debug_message(other.HP);