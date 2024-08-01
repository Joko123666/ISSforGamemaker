draw_self();
if (isOpen == true)
{
	var x_point = x - 28;
	var y_point = y - 94;
	draw_sprite_stretched
	(
		sInventory,
		0,
		x_point,
		y_point,
		12 + row_length * 36,
		12+(((storage_size -1) div row_length) + 1) * 36
	);
	
	for (var i = 0; i < storage_size; i++)
	{
		var xx = x_point + (i mod row_length) * 36 + 8;
		var yy = y_point + (i div row_length) * 36 + 8;
		var hover = (oMouse.inventory_hover == id) && (oMouse.slot_hover == i)
		draw_sprite(sSlot, hover, xx, yy);
		if (inventory[i] != -1)
		{
			var alpha = 1.0;
			if (oMouse.inventort_drag == id) && (oMouse.slot_drag == i) alpha = 0.5;
			draw_set_alpha(alpha);
			draw_sprite(sItems, inventory[i], xx, yy);
			draw_set_alpha(1.0);
		}
	}
	
	with (oMouse)
	{
		if (item_drag != -1)
		{
			draw_set_alpha(0.5);
			draw_sprite(sItems, item_drag, mouse_x, mouse_y);
			draw_set_alpha(1.0);
		}
	}
}

if (isDisplay == true)
{
	draw_sprite(sItems, display_item,x, y - 32)
}
