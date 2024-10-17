

//배열 선언및 초기화
#macro ITEM_TOTAL 100
var i = ITEM_TOTAL;
repeat(ITEM_TOTAL)
{
    global.item_price[i] = 0;
	global.item_baseprice[i] = 0;
	global.item_variableprice[i] = 0;
    i -= 1;
}


function set_base_price()
{
	#region baseprice
	array_set(global.item_baseprice, 0, 50);
	array_set(global.item_baseprice, 1, 15);
	array_set(global.item_baseprice, 2, 20);
	array_set(global.item_baseprice, 3, 1);
	array_set(global.item_baseprice, 4, 80);
	array_set(global.item_baseprice, 5, 30);
	array_set(global.item_baseprice, 6, 25);
	array_set(global.item_baseprice, 7, 3);
	array_set(global.item_baseprice, 8, 28);
	array_set(global.item_baseprice, 9, 22);
	array_set(global.item_baseprice, 10, 33);
	array_set(global.item_baseprice, 11, 8);
	array_set(global.item_baseprice, 12, 20);
	array_set(global.item_baseprice, 13, 20);
	array_set(global.item_baseprice, 14, 20);
	array_set(global.item_baseprice, 15, 10);
	array_set(global.item_baseprice, 16, 10);
	array_set(global.item_baseprice, 17, 10);
	array_set(global.item_baseprice, 18, 10);
	array_set(global.item_baseprice, 19, 10);
	array_set(global.item_baseprice, 20, 200);
	array_set(global.item_baseprice, 21, 210);
	array_set(global.item_baseprice, 22, 220);
	array_set(global.item_baseprice, 23, 230);
	array_set(global.item_baseprice, 24, 240);
	array_set(global.item_baseprice, 25, 250);
	array_set(global.item_baseprice, 30, 300);
	array_set(global.item_baseprice, 31, 310);
	array_set(global.item_baseprice, 32, 320);
	array_set(global.item_baseprice, 33, 330);
	array_set(global.item_baseprice, 34, 340);
	array_set(global.item_baseprice, 35, 350);
	array_set(global.item_baseprice, 40, 50);
	array_set(global.item_baseprice, 41, 40);
	array_set(global.item_baseprice, 42, 40);
	array_set(global.item_baseprice, 43, 40);
	array_set(global.item_baseprice, 44, 40);
	array_set(global.item_baseprice, 45, 500);
	array_set(global.item_baseprice, 50, 500);
	array_set(global.item_baseprice, 51, 510);
	array_set(global.item_baseprice, 52, 520);
	array_set(global.item_baseprice, 53, 530);
	array_set(global.item_baseprice, 54, 540);
	array_set(global.item_baseprice, 55, 550);
	array_set(global.item_baseprice, 60, 600);

	#endregion
	
	#region variable price
	
	array_set(global.item_variableprice, 0, 10);
	array_set(global.item_variableprice, 1, 5);
	array_set(global.item_variableprice, 2, 5);
	array_set(global.item_variableprice, 3, 0);
	array_set(global.item_variableprice, 4, 10);
	array_set(global.item_variableprice, 5, 5);
	array_set(global.item_variableprice, 6, 5);
	array_set(global.item_variableprice, 7, 1);
	array_set(global.item_variableprice, 8, 5);
	array_set(global.item_variableprice, 9, 5);
	array_set(global.item_variableprice, 10, 5);
	array_set(global.item_variableprice, 11, 1);
	array_set(global.item_variableprice, 12, 20);
	array_set(global.item_variableprice, 13, 20);
	array_set(global.item_variableprice, 14, 20);
	array_set(global.item_variableprice, 15, 15);
	array_set(global.item_variableprice, 20, 25);
	array_set(global.item_variableprice, 21, 25);
	array_set(global.item_variableprice, 22, 25);
	array_set(global.item_variableprice, 23, 25);
	array_set(global.item_variableprice, 24, 25);
	array_set(global.item_variableprice, 25, 25);
	array_set(global.item_variableprice, 30, 35);
	array_set(global.item_variableprice, 31, 35);
	array_set(global.item_variableprice, 32, 35);
	array_set(global.item_variableprice, 33, 35);
	array_set(global.item_variableprice, 34, 35);
	array_set(global.item_variableprice, 35, 35);
	array_set(global.item_variableprice, 40, 45);
	array_set(global.item_variableprice, 41, 45);
	array_set(global.item_variableprice, 42, 45);
	array_set(global.item_variableprice, 43, 45);
	array_set(global.item_variableprice, 44, 45);
	array_set(global.item_variableprice, 45, 45);
	array_set(global.item_variableprice, 50, 55);
	
	#endregion
	
}

function set_item_price()
{
	for (var i = 0; i < ITEM_TOTAL; i++)
	{
		array_set(
			global.item_price, 
			i, 
			round(oGame.price_basic + (oGame.price_scale * global.item_baseprice[i]) + (irandom(global.item_variableprice[i]) * oGame.price_variable_scale))+oGame.price_min
		);
	}
	

}



