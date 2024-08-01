

function consume_food(food_num)
{
	switch (food_num)
	{
	case 0 :	// 빵
		oPlayer.hunger += 50;
	break;
	
	case 1 :	//고기찜
		oPlayer.hunger += 70;
		oPlayer.mentality += 10;
	break;

	case 2 :	//청슬라임 찜
		oPlayer.hunger += 100;
		oPlayer.mentality -= 10;
	break;
	
	case 3 :	//만드라고라 스프
		oPlayer.hunger += 100;
		oPlayer.mentality += 50;
	break;
	
	case 4 :
	
	break;
	
	}
	if (oPlayer.hunger > oPlayer.maxHunger)
	{oPlayer.hunger = oPlayer.maxHunger}
}

function food_price(food_num)
{
	var _price = 0;
	switch (food_num)
	{
		case 0 :	_price = 50;
		break;
		case 1 :	_price = 150;
		break;
		case 2 :	_price = 450;
		break;
		case 3 :	_price = 1000;
		break;
		case 4 :	_price = 444;
		break;
	}
	return(_price);
}

