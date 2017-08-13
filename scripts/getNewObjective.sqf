_group = _this select 0;
_markers = allMapMarkers select {"zone" in (_x splitString "_")};
_current_zone = [_markers, getPos (leader _group)] call BIS_fnc_nearestPosition;
if (getMarkerColor _current_zone == "colorYellow") then {
	_wp = _group addWaypoint [getPos (leader _group), 50];
	_wp setWaypointType "SAD";
};

_n_s = (toArray _current_zone) ;
_n_s deleteRange [0, 5];
_n = parseNumber (toString _n_s);
_north = _n - 5;
_south = _n + 5;
_east = _n + 1;
_west = _n - 1;

_choices = [];
if (_north > -1) then {_choices = _choices + [_north];};
if (_south < 25) then {_choices = _choices + [_south];};
if (_east mod 5 != 0) then {_choices = _choices + [_east];};
if (_west mod 5 != 4) then {_choices = _choices + [_west];};

_choices2 = [];
{
	_choices2 = _choices2 + [format ["zone_%1", _x]];
} forEach _choices;

_choices2 = _choices2 select {getMarkerColor _x != getMarkerColor _current_zone};
_next_pos = [0, 0, 0];

if (count _choices2 > 0) then {
	
	_next_marker = selectRandom _choices2;
	_next_pos = getMarkerPos _next_marker;
}else{
	_markers = _markers select {getMarkerColor _x != getMarkerColor  _current_zone};
	_next_marker = [_markers, getPos (leader _group)] call BIS_fnc_nearestPosition;
	_next_pos = getMarkerPos _next_marker;
};

_wp = _group addWaypoint [_next_pos, 10];
_wp setWaypointStatements ["true", "[group this] execVM 'getNewObjective.sqf' "];