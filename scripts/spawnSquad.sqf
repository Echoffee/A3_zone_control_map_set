_side = _this select 0;

blu_squad_comp = ["B_soldier_TL_F", "B_soldier_AR_F", "B_soldier_GL_F", "B_soldier_LAT_F"];
opp_squad_comp = ["O_soldier_TL_F", "O_soldier_AR_F", "O_soldier_GL_F", "O_soldier_LAT_F"];
gre_squad_comp = ["I_soldier_TL_F", "I_soldier_AR_F", "I_soldier_GL_F", "I_soldier_LAT_F"];


_group = createGroup _side;
_cmp = [];
_color = "colorWhite";

if (_side == west ) then {_cmp = blu_squad_comp; _color = "colorBLUFOR";};
if (_side == east ) then {_cmp = opp_squad_comp; _color = "colorOPFOR";};
if (_side == resistance ) then {_cmp = gre_squad_comp; _color = "ColorGUER";};

_zones = allMapMarkers select {getMarkerColor _x == _color};
if (count _zones > 0) then {
	
	_pos = (getMarkerPos (selectRandom _zones)) vectorAdd [((random 100)-50),((random 100)-50),0];

	{
    	_group createUnit [_x, _pos, [], 0, "NONE"];
	} forEach _cmp;
};

[_group] call echo_fnc_getNewObjective;