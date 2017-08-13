_group = _this select 0;

_zones = allMapMarkers select {getMarkerColor _x == "colorGrey";};
_obj = selectRandom _zones;
_pos = getMarkerPos _obj;
_wp = _group addWaypoint [_pos, 10];
_wp setWaypointStatements ["true", "[group this] execVM 'getNewObjective.sqf' "];