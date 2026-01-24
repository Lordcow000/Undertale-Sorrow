// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Fetch_item(id){
    switch (id) {
		
		case ItemID.Fists:
		return
		{
			name: "Fists",
			display_name: "Fists",
			desc: 
			[
			"* Aint much but better than#   Nothing"
			],
			type: "Weapon",
			atk: 1,
			value: 0,
		}
		
		case ItemID.Worn_sweater:
		return
		{
			name: "Worn Sweater",
			display_name: "Worn Swtr",
			desc: 
			[
			"* \"Worn Sweater\" - Armor DF 1#*  Your old sweater"
			],
			type: "Armour",
			def: 1,
			value: 10,
		}
		      
		case ItemID.Lemon:
        return 
		{
				name: "Lemon",
				display_name: "Lemon", 
				desc: 
				[
				"* \"Lemon\" - Heals 20 HP #* A yellow fruit, really REALLY#  sour.", "* Mwah"
				], 
				type: "Heal",
				heal_value: 20,
				value: 10
			};
		
		case ItemID.Lime:
        return 
		{
				name: "Lime",
				display_name: "Lime", 
				desc: ["* \"Lime\" - Heals 10 HP#* A green fruit, really sour."], 
				type: "Heal",
				heal_value: 10,
				value: 5
			};
		
		case ItemID.Lemon_Lime_Bitters:
        return 
		{
				name: "Lemon Lime Bitters",
				display_name: "Limon Bitt", 
				desc: ["* \"Lemon Lime Bitters\"#  - Heals 100HP#* The best drink."], 
				type: "Heal",
				heal_value: 100,
				value: 50
			};

		case ItemID.Hair_Clip:
		return
		{
			name: "Hair Clip",
			display_name: "Hair Clip",
			desc: ["* \"Hair Clip\" - Armor DF 10#* A cyan hair clip"],
			type: "Armour",
			def: 10,
			value: 10,
		}
		
		
	}
}



