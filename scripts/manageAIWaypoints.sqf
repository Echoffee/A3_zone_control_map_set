player sideChat "calling...";
_g = allGroups select {count (waypoints _x) == 0};
{
    [_x] execVM "getNewObjective.sqf";
} forEach _g;


uiSleep 15;
execVM "manageAIWaypoints.sqf";