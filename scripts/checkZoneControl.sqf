_zone_name = _this select 0;
_pos = getMarkerPos _zone_name;
//_units = _pos nearEntities ["Man", 50];

_units = allUnits select {side _x in [west, east, resistance]  && _pos distance (getPos _x) < 50};

if (count _units > 0) then {
	_color = getMarkerColor _zone_name;
	_fside = side (_units select 0);
	_u2 = _units select {side _x == _fside};
	if (count _units != count _u2) then {
		_color = "colorYellow";
	} else {
		switch (_fside) do {
		    case west : {_color = "colorBLUFOR"};
		    case east : {_color = "colorOPFOR"};
		    case resistance : {_color = "colorGUER"};
		};
	};

	_zone_name setMarkerColor _color;
};

uiSleep 3;
[_zone_name] execVM "checkZoneControl.sqf";