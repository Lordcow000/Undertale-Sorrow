global.testenemies = [
{
	ID: "test_enemy",
	data:
{
	sprite: spr_notcopyrightedtestenemy,
	name: "Not Sans",
	_health: 1000,
	def: 0,
	spareable: false,
	act_actions: [{Name: "Argue", ID: "Sans_Argue",}, {Name: "Talk", ID: "Sans_Talk",}, {Name: "Your cringe", ID: "Sans_Instakill",}],
	dialog: ["*omnomnomnomnom", "Breakin it down", "Please stop making fanart of me"],
	dialog_type: "Random",
	dialog_next: "None",
	textboxdialog:
	{
		battlebegin: "You remember you're genocides.",
		duringbattle: ["Sans stands there.#Menancingly", "Sans does skeleton stuff"],
		mercy: "Sans feels like not fighting",
		dying: "Sans is weak",
	},
	//this was supposed to be an array, but the game crashed
	Attacks: [
	{
		Name: "EnemyTest",
		Duration: 10,
		BattleBoxSize: {Ytop: 201, Xleft: 225, Ybottom: 389, Xright: 413},
		pattern: function()
		{
			
		}
	}
	]
}
}
]