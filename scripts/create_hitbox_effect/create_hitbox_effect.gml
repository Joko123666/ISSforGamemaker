// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_hitbox_effect(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
{
	///@arg x
	///@arg y
	///@arg creator
	///@arg sprite
	///@arg knockback
	///@arg lifespan
	///@arg damage
	///@arg xscale
	///@arg hiteffect
	
	var x_position = argument0;
	var y_position = argument1;
	var creator = argument2;
	var sprite = argument3;
	var knockback = argument4;
	var lifespan = argument5;
	var damage = argument6;
	var xscale = argument7;
	var effect = argument8;
	
	var hitbox = instance_create_layer(x_position, y_position, "Instances", oHitbox);
	hitbox.sprite_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;
	hitbox.hit_particle = effect;
}