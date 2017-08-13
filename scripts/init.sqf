for "_i" from 0 to 24 do {
	_s = format ["zone_%1", _i];
	[_s] execVM "checkZoneControl.sqf";
};

{
    [_x] execVM "initialGetObjective.sqf"; 
} forEach allGroups;

execVM "manageAIRespawn.sqf";
