
function set_dayname()
{
	dayname[0] = "Mon";
	dayname[1] = "Tue";
	dayname[2] = "Wed";
	dayname[3] = "Thu";
	dayname[4] = "Fri";
	dayname[5] = "Sat";
	dayname[6] = "Sun";
	
}

function set_root_probability_table()
{
	//단계별 습득 확률
	//0 = 실패 , 1~5단계 = 같은등급의 물건 획득 확률
	root_probability_table[0][0] = 10;
	root_probability_table[0][1] = 55;
	root_probability_table[0][2] = 35;
	root_probability_table[0][3] = 10;
	root_probability_table[0][4] = 0;
	root_probability_table[0][5] = 0;

	root_probability_table[1][0] = 35;
	root_probability_table[1][1] = 40;
	root_probability_table[1][2] = 40;
	root_probability_table[1][3] = 15;
	root_probability_table[1][4] = 5;
	root_probability_table[1][5] = 0;

	root_probability_table[2][0] = 50;
	root_probability_table[2][1] = 25;
	root_probability_table[2][2] = 45;
	root_probability_table[2][3] = 20;
	root_probability_table[2][4] = 9;
	root_probability_table[2][5] = 1;

	root_probability_table[3][0] = 70;
	root_probability_table[3][1] = 15;
	root_probability_table[3][2] = 40;
	root_probability_table[3][3] = 25;
	root_probability_table[3][4] = 15;
	root_probability_table[3][5] = 5;

	root_probability_table[4][0] = 90;
	root_probability_table[4][1] = 0;
	root_probability_table[4][2] = 20;
	root_probability_table[4][3] = 45;
	root_probability_table[4][4] = 25;
	root_probability_table[4][5] = 10;

	root_probability_table[5][0] = 100;
	root_probability_table[5][1] = 0;
	root_probability_table[5][2] = 0;
	root_probability_table[5][3] = 40;
	root_probability_table[5][4] = 35;
	root_probability_table[5][5] = 25;
}

function set_felling_table()
{
	// [아이템 id] [아이템 등급]
	// [x][0] = 시행횟수
	felling_probability_table[0][0] = 7;
	felling_probability_table[0][1] = 40;
	felling_probability_table[0][2] = 30;
	felling_probability_table[0][3] = 20;
	felling_probability_table[0][4] = 6;
	felling_probability_table[0][5] = 4;
	
	felling_probability_table[1][0] = 5;
	felling_probability_table[1][1] = 50;
	felling_probability_table[1][2] = 40;
	felling_probability_table[1][3] = 30;
	felling_probability_table[1][4] = 20;
	felling_probability_table[1][5] = 10;
	
	felling_probability_table[2][0] = 4;
	felling_probability_table[2][1] = 45;
	felling_probability_table[2][2] = 35;
	felling_probability_table[2][3] = 25;
	felling_probability_table[2][4] = 10;
	felling_probability_table[2][5] = 10;
	
	felling_probability_table[3][0] = 3;
	felling_probability_table[3][1] = 40;
	felling_probability_table[3][2] = 30;
	felling_probability_table[3][3] = 20;
	felling_probability_table[3][4] = 10;
	felling_probability_table[3][5] = 10;
	
	felling_probability_table[4][0] = 2;
	felling_probability_table[4][1] = 20;
	felling_probability_table[4][2] = 10;
	felling_probability_table[4][3] = 10;
	felling_probability_table[4][4] = 10;
	felling_probability_table[4][5] = 10;
	
	felling_probability_table[5][0] = 1;
	felling_probability_table[5][1] = 10;
	felling_probability_table[5][2] = 10;
	felling_probability_table[5][3] = 10;
	felling_probability_table[5][4] = 10;
	felling_probability_table[5][5] = 10;
	
}

function set_mushroom_table()
{
	picking_probability_table[0][0] = 45;
	picking_probability_table[0][1] = 55;
	picking_probability_table[0][2] = 65;
	picking_probability_table[0][3] = 75;
	picking_probability_table[0][4] = 95;
	picking_probability_table[0][5] = 100;
}