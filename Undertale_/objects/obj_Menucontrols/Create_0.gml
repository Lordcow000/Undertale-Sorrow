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
global.Game_Data.WeaponEquipped =
{
	Name: "Fists",
	Attack: 0
}
global.Game_Data.ArmorEquipped =
{
	Name: "Worn Sweater",
	Defense: 1
}
global.Game_Data.NEXTLV = 10;
room_goto(Room0)
}
	