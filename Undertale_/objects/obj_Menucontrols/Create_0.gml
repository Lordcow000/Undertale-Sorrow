MenuIndex = 0
reset = function()
{
global.Health = 20;
global.MaxHealth = 20;
global.LOVE = 1;
global.Attack = 10;
global.Defense = 0;
global.EXP = 0;
global.Money = 0;
global.WeaponEquipped =
{
	Name: "Fists",
	Attack: 0
}
global.ArmorEquipped =
{
	Name: "Nothing",
	Defense: 0
}
global.NEXTLV = 10;
room_goto(Room0)
}
	