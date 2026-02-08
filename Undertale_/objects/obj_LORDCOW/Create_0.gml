test_cow =
{
	obj: obj_LORDCOW,
	name: "LORDCOW",
	max_health: 1000,
	_health: 101,
	low_health_amt: 100,
	
	dialog_first: "* You remember you're geno...cows?",
	low_hp: "* What the fuck man?",
	
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
array_insert(global.BattleEnemies,array_length(global.BattleEnemies),test_cow);

