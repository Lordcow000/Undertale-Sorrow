test_enemy =
{
	obj: obj_test_enemy,
	name: "Not Sans",
	_health: 1000,
	def: 0,
	spareable: false,
	act_actions: [{Name: "Argue", ID: "Sans_Argue",}, {Name: "Talk", ID: "Sans_Talk",}, {Name: "Your cringe", ID: "Sans_Instakill",}],
	dialog: ["*omnomnomnomnom", "Breakin it down", "Please stop making fanart of me"],
	dialog_type: "Random",
	dialog_next: "None",
}
array_push(obj_heart.Enemy_Count, test_enemy)