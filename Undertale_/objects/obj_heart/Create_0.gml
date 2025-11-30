HPMAX = global.MaxHealth
HP = global.Health
items = global.Game_Data.Inventory_1
DEF = global.Defense + global.ArmorEquipped.Defense
ATK = global.Attack + global.WeaponEquipped.Attack
Selec_Index = 0;
Selec = ["FIGHT", "ACT", "ITEM", "MERCY"]
Enemy_Count = []
Attack_Index = 0;
Mercy_Index = 0
Mercy_Select = ["SPARE", "FLEE"]

State_Selec = function()
{
	var right = keyboard_check_pressed(vk_right)
	var left = keyboard_check_pressed(vk_left)
	if(right)
	{
		Selec_Index ++;
		if(Selec_Index > array_length(Selec) - 1)
		{
			Selec_Index = 0
		}
	}
	if(left)
	{
		Selec_Index --;
		if(Selec_Index < 0)
		{
			Selec_Index = array_length(Selec) - 1
		}
	}
	if(keyboard_check_pressed(ord("Z"))) or (keyboard_check_pressed(vk_enter))
	{
		switch(Selec_Index)
		{
			case 0:
			State = State_Fight
			break
		}
	}
	switch(Selec_Index)
	{
		case 0:
		x = 40
		y = 446
		break
		case 1:
		x = 193
		y = 446
		break
		case 2:
		x = 346
		y = 446
		break
		case 3:
		x = 499
		y = 446
		break
	}
}
State_Fight = function()
{
	var up = keyboard_check_pressed(vk_up)
	var down = keyboard_check_pressed(vk_down)
	if(down)
	{
	Attack_Index ++
	if(Attack_Index > array_length(Enemy_Count) - 1)
	{
		Attack_Index = 0
	}
	}
	if(up)
	{
		Attack_Index --
		if Attack_Index < 0
		{
			Attack_Index = array_length(Enemy_Count) - 1
		}
	}
}
State_Mercy = function()
{
	var up = keyboard_check_pressed(vk_up)
	var down = keyboard_check_pressed(vk_down)
	if(down)
	{
		Mercy_Index ++
		if(Mercy_Index > array_length(Mercy_Select) - 1)
		{
			Mercy_Index = 0
		}
	}
	if(up)
	{
		Mercy_Index --
		if(Mercy_Index < 0)
		{
			Mercy_Index = array_length(Mercy_Select) - 1
		}
	}
			
		
}
State = State_Selec