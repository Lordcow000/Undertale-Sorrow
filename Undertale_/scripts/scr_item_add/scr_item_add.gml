// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_item_add(Item){

    for (var i = 1; i <= 8; i++)
    {
        if (global.Game_Data.Inventory[i] == "Nothing")
        {
            global.Game_Data.Inventory[i] = Item;
            return true;
        }
        else if (i == 8)
        {
            return false;
        }
    }
}
