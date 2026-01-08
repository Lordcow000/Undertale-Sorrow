test_cow =
{
	obj: obj_LORDCOW,
	name: "LORDCOW",
	_health: 1000,
	dialog_first: "You remember you're geno...cows?",
	def: 0,
	spareable: false,
	act_actions: [{Name: "Argue", ID: "Sans_Argue",}, {Name: "Talk", ID: "Sans_Talk",},{Name: "Argue", ID: "Sans_Argue",},{Name: "Argue", ID: "Sans_Argue",},],
	dialog: ["*omnomnomnomnom", "Breakin it down", "Please stop making fanart of me"],
	dialog_type: "Random",
	dialog_next: "None",
	//this was supposed to be an array, but the game crashed
	fire_rate: 30,
	Attacks: [
	{
		Name: "EnemyTest",
		Duration: 10,
		BattleBoxSize: {Left: 237, Right: 397,Up: 250, Down: 385},
		pattern: function()
		{
			obj_LORDCOW.alarm[0] = 30;			
		}
	},
	]
}
enemies = obj_heart.Enemy_Count;

array_insert(enemies,array_length(enemies),test_cow);

