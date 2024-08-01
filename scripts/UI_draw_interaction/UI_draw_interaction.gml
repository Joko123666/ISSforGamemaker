
function UI_draw_interaction(argument0, argument1, argument2)
{
	///@arg interaction_button
	///@arg x
	///@arg y
	
	var interaction_button = argument0;
	var x_point = argument1;
	var y_point = argument2;
	
	var draw_ob = instance_create_layer(x_point, y_point, "Effects", ui_interaction_button);
	draw_ob.text = interaction_button;
	
	
	

}