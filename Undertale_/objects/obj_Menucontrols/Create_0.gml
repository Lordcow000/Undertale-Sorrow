MenuIndex = 0
Savefilexists = false
if(file_exists("save.txt"))
{
	Savefilexists = true
}
else
{
	Savefilexists = false
}
reset = function()
{
global.Game_Data.Health = 10;
global.Game_Data.MaxHealth = 20;
global.Game_Data.LOVE = 1;
global.Game_Data.Attack = 10;
global.Game_Data.Defense = 10;
global.Game_Data.EXP = 0;
global.Game_Data.Money = 0;
global.Game_Data.WeaponEquipped = ItemID.Fists;
global.Game_Data.ArmorEquipped = ItemID.Worn_sweater;
global.Game_Data.NEXTLV = 10;


global.Game_Data.Inventory = array_create(8, "Nothing");


reset_game();
room_goto(Room0);
}
	