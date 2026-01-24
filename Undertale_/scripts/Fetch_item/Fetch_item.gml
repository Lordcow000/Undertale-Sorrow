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
			"* Aint much but better than nothing"
			],
			use: ["* You raise your fists to your head"],
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
			use: ["* You throw back on your reliable# sweater"],
			type: "Armor",
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
			"* \"Lemon\" - Heals 20 HP #* A yellow fruit, really REALLY#  sour."
			], 
			use: ["* Your tongue recoils at the#  sourness."],
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
			use: ["* Your tongue slightly recoil#  from the sourness."],
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
			use: ["* You down the bottle at a #  terrifyingly fast pace."],
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
			use: ["* You clip the hair clip onto#  your hair"],
			type: "Armor",
			def: 10,
			value: 10,
		};
		
		case ItemID.Stick:
		return
		{
			name: "Stick",
			display_name: "Stick",
			desc: 
			[
			"* \"Stick\" Weapon - ATK 5#* A flimsy looking stick"
			],
			use: ["* You hold the stick firmly in#  both hands"],
			type: "Weapon",
			atk: 5,
			value: 0,
		}
		
		
		
	}
}



