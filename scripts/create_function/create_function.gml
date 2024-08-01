
function create_item(x_point, y_point, item_id)
{
	var _item = instance_create_layer(x_point, y_point, "Instances", oItem_drop);
	_item.item_id = item_id;
}