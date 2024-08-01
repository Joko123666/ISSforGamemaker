


if image_alpha >0
{
	image_alpha -= 0.03;
	speed -= 0.01;
	image_angle += angspd;
}
else
{
	instance_destroy();
}