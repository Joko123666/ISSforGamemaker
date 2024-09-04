// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sell_food(food_num)
{
	if (oGame.money >= food_price(food_num))
	{
		var _item = instance_create_layer(x + 64, y-38, "Instances", oFood);
		_item.food_id = food_num;
		oGame.money -= food_price(food_num);
		state  = "Stand";
		act_count = 75;
		switch(food_num)
		{
			case 0 : create_textbox_popup("가난한 녀석이구만~", c_ltgray, c_black);
			break;
			case 1 : create_textbox_popup("오우~ 잔뜩 먹고 가라고!", c_ltgray, c_black);
			break;
			case 2 : create_textbox_popup("맛을 좀 아는 녀석이구만?", c_ltgray, c_black);
			break;
			case 3 : create_textbox_popup("젊은사람이 벌써부터 이런걸 찾는건 좀 그렇지 않냐?", c_ltgray, c_black);
			break;
		}
	}
	else
	{
		var text = instance_create_layer(x, y-84, "Effects", text_drawingob);
		text.text = "돈이 부족하잖아! 저리 꺼져!";
		state  = "Stand";
		act_count = 75;
	}
}

function sell_useitem(item_num)
{
	if (oGame.money >= food_price(item_num))
	{
		var _item = instance_create_layer(x + 64, y-38, "Instances", oUseitem);
		_item.item_id = item_num;
		oGame.money -= food_price(item_num);
		state  = "Stand";
		act_count = 75;
		switch(item_num)
		{
			case 0 : create_textbox_popup("먹는다. 밥, 챙겨서 반드시", c_ltgray, c_black);
			break;
			case 1 : create_textbox_popup("먹는다. 밥, 맛은 없다. 좀많이", c_ltgray, c_black);
			break;
			case 2 : create_textbox_popup("빨라진다. 잠깐 많이", c_ltgray, c_black);
			break;
			case 3 : create_textbox_popup("안아프다 마시면. 이거", c_ltgray, c_black);
			break;
			case 4 : create_textbox_popup("돌아온다. 이곳으로, 한순간에", c_ltgray, c_black);
			break;
		}
	}
	else
	{
		var text = instance_create_layer(x, y-84, "Effects", text_drawingob);
		text.text = "부족하다. 돈. 나 안속는다 절대!";
		state  = "Stand";
		act_count = 75;
	}
}


function useitem_price(item_num)
{
	var _price = 0;
	switch (item_num)
	{
		case 0 :	_price = 50;
		break;
		case 1 :	_price = 150;
		break;
		case 2 :	_price = 250;
		break;
		case 3 :	_price = 500;
		break;
		case 4 :	_price = 444;
		break;
	}
	return(_price);
}
