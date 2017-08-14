_deserts = allUnits select {_x distance (getMarkerPos "zone_12") > 800};
{
    _x setDammage 1;
} forEach _deserts;

_blu = allGroups select {side (leader _x) == west};
_red = allGroups select {side (leader _x) == east};
_gre = allGroups select {side (leader _x) == resistance};
_bluz = allMapMarkers select {getMarkerColor _x == "colorBLUFOR"};
_redz = allMapMarkers select {getMarkerColor _x == "colorOPFOR"};
_grez = allMapMarkers select {getMarkerColor _x == "colorGUER"};


for "_i" from 1 to ((count _bluz) - (count _blu)) do {
    [west] call echo_fnc_spawnSquad;
};
for "_i" from 1 to ((count _redz) - (count _red)) do {
    [east] call echo_fnc_spawnSquad;
};
for "_i" from 1 to ((count _grez) - (count _gre)) do {
    [resistance] call echo_fnc_spawnSquad;
};

uiSleep 60;
[] spawn echo_fnc_manageAIRespawn;