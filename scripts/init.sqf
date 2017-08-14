respawn_blu = [-1, -1, -1, -1, -1, -1, -1 ,-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
respawn_op = [-1, -1, -1, -1, -1, -1, -1 ,-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
respawn_res = [-1, -1, -1, -1, -1, -1, -1 ,-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

for "_i" from 0 to 24 do {
	_s = format ["zone_%1", _i];
	[_s] call echo_fnc_checkZoneControl;
};

{
    [_x] call echo_fnc_initialGetObjective; 
} forEach allGroups;

call echo_fnc_manageAIRespawn;
