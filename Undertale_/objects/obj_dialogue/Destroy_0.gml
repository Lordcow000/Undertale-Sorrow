/// @description Insert description here
// You can write your code in this editor
with (obj_mainchara)
{

var interactready = function()
{
	ready = true
}

State = other.Player_Next_State;
ready = false;
var cooldowninteract = time_source_create(time_source_global, .1, time_source_units_seconds, interactready);
time_source_start(cooldowninteract);

}