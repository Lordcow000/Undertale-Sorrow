test_enemy =
{
	obj: obj_test_enemy,
	name: "Not Sans",
	_health: 1000,
	def: 0,
	spareable: false,
	act_actions: [{Name: "Argue", ID: "Sans_Argue", Effect: {def: +1}, Description: "You argue with NotSans.#He thinks he's right."}, {Name: "Talk", ID: "Sans_Talk", Effect: {spareable: true}, Description: "You say hi to NotSans.#He says bye."}, {Name: "Your cringe", ID: "Sans_Instakill", Effect: {_health: 0}, Description: "You call NotSans cringe.#He dies."}],
	dialog: ["*omnomnomnomnom", "Breakin it down", "Please stop making fanart of me"],
	dialog_type: "Random",
	dialog_next: "None",
}
array_push(obj_heart.Enemy_Count, test_enemy)