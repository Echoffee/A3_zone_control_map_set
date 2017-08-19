_unit = _this select 0;
_side = side _unit;
_color = "colorBLUFOR";
if (_side == east) then { _color = "colorOPFOR";};
if (_side == resistance) then { _color = "colorGUER";};
/*
_zones = allMapMarkers select {getMarkerColor _x == _color};
if (count _zones = 0) then {
	if 
}*/