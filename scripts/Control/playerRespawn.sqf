_unit = _this select 0;
_side = side _unit;
_color = "colorBLUFOR";
if (_side == east) then { _color = "colorOPFOR";};
_points = allMapMarkers select {getMarkerColor _x == _color};
if (count _points > 0) then {
	_p = selectRandom _points;
	_pos = (getMarkerPos _p) vectorAdd [((random 100)-50),((random 100)-50),0];
	_unit setPos _pos;
} else {
	"LOSER" call BIS_fnc_endMission;
};
