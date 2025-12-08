// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
if(!file_exists("save.txt"))
{

global.Game_Data = 
{
Inventory_1: [],
PlayerStartxPos: 0,
PlayerStartyPos: 0,
Previ_Room: Room0,
Gold: 0
}

var _string = json_stringify(global.Game_Data);

var _file = file_text_open_write("save.txt");

file_text_write_string(_file, _string);

file_text_close(_file);

}

if(file_exists("save.txt"))
{
var _file = file_text_open_read("save.txt");

var _json = file_text_read_string(_file);

global.Game_Data = json_parse(_json);

file_text_close(_file);


}

function reset_game()
{
file_delete("save.txt");
}

function save_game() 
{

var _string = json_stringify(global.Game_Data);

var _file = file_text_open_write("save.txt");

file_text_write_string(_file, _string);

file_text_close(_file);

}

function load_game()
{
if(file_exists("save.txt"))
{
var _file = file_text_open_read("save.txt");

var _json = file_text_read_string(_file);

global.Game_Data = json_parse(_json);

file_text_close(_file);


}
}

