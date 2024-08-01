
function item_get_effect(_level)
{
	if (_level == 0)
	{
		repeat(irandom_range(4, 6))
		{
			instance_create_layer(x, y, "Instances", oparticle_01);
			instance_create_layer(x, y, "Instances", oparticle_02);
		}
		
	}
	
	if (_level == 1)
	{
		repeat(irandom_range(8, 10))
		{
			instance_create_layer(x, y, "Instances", oparticle_01);
			instance_create_layer(x, y, "Instances", oparticle_02);
		}
		
	}
}