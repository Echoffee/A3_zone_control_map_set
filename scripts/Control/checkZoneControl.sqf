_zone_name = _this select 0;
_pos = getMarkerPos _zone_name;
_old_side = civilian;

//_units = _pos nearEntities ["Man", 50];

_units = allUnits select {side _x in [west, east, resistance]  && _pos distance (getPos _x) < 50};

if (count _units > 0) then {
	_array = [];
	_color = getMarkerColor _zone_name;
	_fside = side (_units select 0);
	_u2 = _units select {side _x == _fside};
	_n_s = (toArray _zone_name) ;
	_n_s deleteRange [0, 5];
	_zone_id = parseNumber (toString _n_s);
	switch (getMarkerColor _zone_name) do {
		case "colorBLUFOR" : {_old_side = west; _array = respawn_blu};
		case "colorOPFOR" : {_old_side = east; _array = respawn_op};
		case "colorGUER" : {_old_side = resistance; _array = respawn_blu};
	};
	if (count _array > 0) then {
		player sideChat format ["%2 : idp: %1", _zone_id, _zone_name];
		_idp = (_array select _zone_id);
		if (_idp != -1) then {
			[_old_side, _idp] call BIS_fnc_removeRespawnPosition;
		};
	};
	
	if (count _units != count _u2) then {
		_color = "colorYellow";
	} else {
		switch (_fside) do {
		    case west : {_color = "colorBLUFOR"; _array = respawn_blu};
		    case east : {_color = "colorOPFOR"; _array = respawn_op};
		    case resistance : {_color = "colorGUER"; _array = respawn_res};
		};

		_rp = [_fside, _pos] call BIS_fnc_addRespawnPosition;
		_array set [_zone_id, _rp];
	};
	
	
	_zone_name setMarkerColor _color;
};

//sleep 4;
[_zone_name] spawn echo_fnc_checkZoneControl;
//[_zone_name] execVM "checkZoneControl.sqf";