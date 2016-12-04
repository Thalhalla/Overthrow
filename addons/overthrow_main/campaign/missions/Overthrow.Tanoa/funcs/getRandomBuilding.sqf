private ["_found","_range","_houses","_house"];

private _search = _this select 0;
private _types = _this select 1;

private _found = false;
private _range = 150;
private _house = false;
while {!_found and _range < 900} do {
	_houses = nearestObjects [_search, _types, _range,false];
	_possible = [];
	if(count _houses > 0) then {
		{if !(_x call hasOwner) then {_possible pushback _x}}foreach(_houses);
		if(count _possible > 0) then {
			_house = _possible call BIS_fnc_selectRandom;
			_found = true;
		}
	};
	_range = _range + 100;
	if(_range > 1200) exitWith {};
};

_house
