
//y -= move_speed;
//move_speed = move_speed * 0.85;
speed = speed * 0.9;
image_alpha = image_alpha * 0.95;

if (image_alpha <= 0.1)
{
	instance_destroy();
}
