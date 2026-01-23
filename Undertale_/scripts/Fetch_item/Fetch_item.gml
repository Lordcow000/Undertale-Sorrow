// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Fetch_item(id){
    switch (id) {
		
		case ItemID.Fists:
		return
		{
			name: "Fists",
			display_name: "Fists",
			desc: {Text:"* Aint much but better than#   Nothing"},
			type: "Weapon",
			atk: 1,
			value: 0,
		}
		
		case ItemID.Worn_sweater:
		return
		{
			name: "Worn Sweater",
			display_name: "Worn Swtr",
			desc: {Text:"* Sweater"},
			type: "Armour",
			def: 1,
			value: 10,
		}
		      
		case ItemID.Lemon:
        return 
		{
				name: "Lemon",
				display_name: "Lemon", 
				desc: {Text:"* A yellow fruit, really REALLY sour. Heals 20 HP."}, 
				type: "Heal",
				heal_value: 20,
				value: 10
			};
		
		case ItemID.Lime:
        return 
		{
				name: "Lime",
				display_name: "Lime", 
				desc: {Text:"* A green fruit, really sour. Heals 10 HP."}, 
				type: "Heal",
				heal_value: 10,
				value: 5
			};
		
		case ItemID.Lemon_Lime_Bitters:
        return 
		{
				name: "Lemon Lime Bitters",
				display_name: "Limon Bitt", 
				desc: {Text: "* The best drink. Heals 100 HP."}, 
				type: "Heal",
				heal_value: 100,
				value: 50
			};

		case ItemID.Hair_Clip:
		return
		{
			name: "Hair Clip",
			display_name: "Hair Clip",
			desc: {Text:"* A cyan hair clip"},
			type: "Armour",
			def: 10,
			value: 10,
		}
		
		
	}
}



