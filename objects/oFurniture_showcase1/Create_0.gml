
showcase_type = "small";
storage_size = 1;

act_count = 10;
appeal = 1;

display_item = 0;
display_price = 0;
isDisplay = false;

row_length = storage_size;
inventory = array_create(storage_size, -1);
randomize();
inventory[0] = -1;

isOpen = false;
this_item = 0;