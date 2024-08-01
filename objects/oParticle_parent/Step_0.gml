
if image_alpha >0
{
	image_alpha -= 0.04;
	image_angle += angspd;
}
else
{
	instance_destroy();
}