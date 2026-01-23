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
global.Game_Data.Health = 20;
global.Game_Data.MaxHealth = 20;
global.Game_Data.LOVE = 1;
global.Game_Data.Attack = 10;
global.Game_Data.Defense = 10;
global.Game_Data.EXP = 0;
global.Game_Data.Money = 0;
global.Game_Data.WeaponEquipped = Fetch_item(ItemID.Fists)
global.Game_Data.ArmorEquipped = Fetch_item(ItemID.Worn_sweater);
global.Game_Data.NEXTLV = 10;


for (var i = 1; i <= 8; i++)
{
	global.Game_Data.Inventory[i] = "Nothing";
}

reset_game();
room_goto(Room0);
}
	