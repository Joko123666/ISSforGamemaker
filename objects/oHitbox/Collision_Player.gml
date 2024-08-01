if creator == noone or creator == other or ds_list_find_value(hit_objects, other) != -1
{
	exit;
}
ds_list_add(hit_objects, other);
other.HP -= damage;