test_enemy =
{
	obj: obj_test_enemy,
	name: "Not Sans",
	_health: 1000,
	dialog_first: "You remember you're genocides",
	def: 0,
	spareable: false,
	act_actions: [{Name: "Argue", ID: "Sans_Argue",}, {Name: "Talk", ID: "Sans_Talk",}, {Name: "Your cringe", ID: "Sans_Instakill",}],
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
			obj_test_enemy.alarm[0] = 30;			
		}
	},
	{
		Name: "Bones",
		Duration: 10,
		BattleBoxSize: {Left: 237, Right: 397,Up: 250, Down: 385},
		pattern: function()
		{
			obj_test_enemy.alarm[1] = 30;			
		}
	}
	]
}

ds_grid_create(1,2);





