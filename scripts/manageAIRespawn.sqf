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


for "_i" from 1 to ((count _bluz) / 2 - (count _blu)) do {
    [west] execVM "spawnSquad.sqf";
};
for "_i" from 1 to ((count _redz) / 2 - (count _red)) do {
    [east] execVM "spawnSquad.sqf";
};
for "_i" from 1 to ((count _grez) / 2 - (count _gre)) do {
    [resistance] execVM "spawnSquad.sqf";
};

uiSleep 60;
execVM "manageAIRespawn.sqf";