//===========================================================================
//THIS VERSION IS FOR ARMA 3: ANDRE CONVOYS / Updated by Tinboye for Exile
//===========================================================================

if (isServer) then {
	//=======================
	//BASIC KONFIGURATION 1!
	//=======================

	//Vehicles: Its ok to repeate the same car with different configuration.
	donn_carsConvy = [
		//(0) Crew: 2 / Armed
		["Exile_Car_Offroad_Armed_Guerilla12",0,["100Rnd_127x99_mag_Tracer_Yellow"]],
		//(1) Crew: 3 / Armed
		["Exile_Car_Offroad_Armed_Guerilla03",1,["100Rnd_127x99_mag_Tracer_Yellow"]],
		//(2) Crew: 4 / Armored
		["Exile_Car_Strider",2,["200Rnd_127x99_mag_Tracer_Yellow"]],
		//(3) Crew: 4 / Armored
		["Exile_Car_SUV_Armed_Black",3,[]],
		//(4) Crew: 2 / Armored
		["Exile_Car_Zamak",1,[]],
		//(5) Crew: 6 / Uncovered Truck
		["Exile_Car_HMMWV_M134_Desert",5,[]],
		//(6) Crew: 8 / Covered Truck
		["Exile_Car_Zamak",7,[]]
	];

	//Soldier of the Convoys
	donn_soldierSkin = ["B_Soldier_F","B_Soldier_lite_F","B_Soldier_SL_F","B_Soldier_TL_F"];

	//=======================
	//BASIC KONFIGURATION 2!
	//=======================

	//CONVOY CONFIGURATION
	
	//Time between each consecutive spawn
	_timeBetweenSpawns = 160;

	//Cars in each convoy (refere to donn_carsConvy)
	_convoyFormation = [
		[0,5],
		[3,4],
		[1,3],
		[6],
		[1,6],
		[3,3],
		[4,5],
		[3,3]
	];
	
	//Crew Skill (driver, cargors and turreters)
	_driverManSkill = 0.8;	//Skill of the driver, from 0 to 1
	_cargoMansSkill = 0.8;	//Skill of the cargo ocupants, from 0 to 1
	_turretMansSkill = 0.1;	//Skill ot the turret operators, from 0 to 1
	
	//RUNNER BOMBER MAN CONFIG - Percentage of bomberman AI in car disembarks: 0 is 0% and 1 is 100%
	//Those bomberman will not fight and search for a player to explode right after disembark
	//0.2 means 1 runner bomber each 5 vehicle disembark (1/0.2 = 5)
	donn_runnerBomberManPerc = 0.2;
	
	//Others
	_lootCutter = 2;			//Number of loot piles in veh are divided by this number (minimum of 1 loot pile)
	_showCrewNumber = true;	//Show crew number on the vehicle icon on map?
	
	//====================
	//MAP CONFIGURATION
	//====================

	// 0 - Altis; 1 - Chernarus; 2 - Bornholm; 3 - Napf
	_myMapIs = 3;
	
	//Select Spawns Based on _myMapIs
	//VEHICLES SPAWN: [[vehicle spawn position],[nothing],spawn angle,spawn radius]
	_spawns = [
		//Altis (0)
		[
			[[10648,15920,0.2],[],174,15],
			[[16514,15674,0.2],[],20,15],
			[[21484,7850,0.2],[],108,15],
			[[5797,13747,0.2],[],335,15]
		],
		//Chernarus (1)
		[
			[[2296,15313,0.1],[],152,15],
			[[9732,13466,0.1],[],184,15],
			[[13361,5430,0.1],[],269,15],
			[[33,1589,0.1],[],82,15]
		],
		//Bornholm (2)
		[
			[[14870,2816,0.2],[],0,15],
			[[3477,7397,0.2],[],180,15],
			[[10308,10118,0.2],[],0,15],
			[[5797,13747,0.2],[],0,15]
		],
		//Napf (3)
		[
			[[5086.517,14879.507,0],[],229.051,15]
		]
	] select _myMapIs;

	//=====================
	//EXTRA KONFIGURATION!
	//=====================

	//LOOT IN VEHICLE
	_loot1 = [
		[["addWeaponCargoGlobal","Srifle_GM6_F",[1,1,2]],["addMagazineCargoGlobal","5Rnd_127x108_Mag",[4,4,5]]],		//Maried Loot
		[["addWeaponCargoGlobal","Exile_Weapon_LeeEnfield",[1,1,2]],["addMagazineCargoGlobal","Exile_Magazine_10Rnd_303",[2,3,4]]],		//Maried Loot
		[["addWeaponCargoGlobal","srifle_DMR_01_F",[1,1,2]],["addMagazineCargoGlobal","10Rnd_762x51_Mag",[4,4,5]]],	//Maried Loot
		[["addWeaponCargoGlobal","Exile_Weapon_AK107",[1,1,2]],["addMagazineCargoGlobal","Exile_Magazine_30Rnd_762x39_AK",	[3,4,5]]],		//Maried Loot
		[["addWeaponCargoGlobal","Srifle_LRR_F",[1,1,2]],["addMagazineCargoGlobal","7Rnd_408_Mag",[4,4,5]]],			//Maried Loot
		[["addWeaponCargoGlobal","ItemCompass",[1,2,3]]],
		[["addWeaponCargoGlobal","ItemWatch",[1,2,3]]],
		[["addWeaponCargoGlobal","Binocular",[1,2,3]]],
		[["addWeaponCargoGlobal","acc_flashlight",[1,2,3]]],
		[["addMagazineCargoGlobal","Exile_Item_Foolbox",[2,3,4]]],
		[["addMagazineCargoGlobal","Exile_Item_Matches",[2,3,4]]],
		[["addMagazineCargoGlobal","Exile_Item_EMRE",[4,5,6]]],
		[["addMagazineCargoGlobal","Exile_Item_Cement",[4,5,6]]],
		[["addMagazineCargoGlobal","Exile_Item_ConcreteWallKit",[4,5,6]]],
		[["addMagazineCargoGlobal","Exile_Item_FuelCanisterFull",[2,3,4]]],
		[["addMagazineCargoGlobal","B_IR_Grenade",[4,6,8]]],
		[["addBackpackCargoGlobal","B_Kitbag_mcamo",[1,2,2]]],
		[["addBackpackCargoGlobal","B_TacticalPack_mcamo",[1,2,2]]],
		[["addBackpackCargoGlobal","B_AssaultPack_mcamo",[1,2,2]]],
		[["addBackpackCargoGlobal","B_FieldPack_ocamo",[1,2,2]]],
		[["addBackpackCargoGlobal","B_FieldPack_cbr",[1,2,2]]]
	];
	
	//AI WEAPONS & AMMO
	_donn_weapons = [
		["Exile_Weapon_AKS_Gold","Exile_Magazine_75Rnd_545x39_RPK_Green"],
		["Exile_Weapon_SVDCamo","Exile_Magazine_10Rnd_762x54"],
		["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
		["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
		["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
		["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
		["Exile_Weapon_M1014","Exile_Magazine_8Rnd_74Pellets"],
		["Exile_Weapon_TaurusGold","Exile_Magazine_8Rnd_74Slug"],
		["srifle_EBR_F","20Rnd_762x51_Mag"],
		["srifle_DMR_01_F","10Rnd_762x51_Mag"],
		["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
		["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"]
	];
	
	//=========================
	//END OF KONFIGURATION
	//=========================
	
	//==============================================================================================================
	//==============================================================================================================
	//==============================================================================================================
	//==============================================================================================================
	
	//=================================================================
	//Generate Function Begin =========================================
	//=================================================================

	//Find Roads Intersections (can be separated by water)
	donn_find_intersections = {
		_minDist = _this select 0;
		_roads = [0,0,0] nearRoads 50000;
		_donn_wps = [];
		{
			_road = _x;
			if (count roadsConnectedTo _x > 2) then {
				_alone = true;
				{
					if (_road distance _x < _minDist) exitWith {
						_alone = false;
					};
				} forEach _donn_wps;
				if (_alone) then {
					_donn_wps = _donn_wps + [position _x];
				};
			};
		} forEach _roads;
		_donn_wps
	};

	//AI handle damage Event Handler	
	donn_casca_unit_HD = {
		_hurtedOne = _this select 0;
		_partDamage = _this select 1;
		_damage = _this select 2;
		_ofender = _this select 3;
		if (isPlayer _ofender) then {
			_dist = _ofender distance _hurtedOne; //MANY
			_groupShoted = group _hurtedOne; //MANY
			_groupShoted setVariable ["donn_pshot",true,false]; //MANY
			if (_dist < 300) then {_groupShoted reveal [_this select 3,4];}; //MANY
		} else {
			if (_hurtedOne != _ofender) then {_damage = 0;};
		};
		_damage
	};

	//BomberMan handle damage
	donn_casca_unit_HD_bomber = {
		_hurtedOne = _this select 0;
		_partDamage = _this select 1;
		_damage = _this select 2;
		_ofender = _this select 3;
		if (isPlayer _ofender) then {
			if (_partDamage == "body" && _damage > 1) then {
				_uPos = position _hurtedOne;
				"HelicopterExploSmall" createVehicle _uPos;
				_hurtedOne setPos [0,0,0];
				deleteVehicle _hurtedOne;
			};
		} else {
			if (_hurtedOne != _ofender) then {_damage = 0;};
		};
		_damage
	};

	//Vehicle Handle Damage
	donn_casca_veh_HD = {
		_motor = _this select 0;
		_dist = (_this select 3) distance _motor;
		_groupShoted = _motor getVariable ["car_group",GrpNull];
		_inWar = _groupShoted getVariable ["donn_inWar",false];
		if (!_inWar) then {
			_crew = crew _motor;
			if (count _crew > 0) then {
				_groupShoted setVariable ["donn_pshot",true,false];
				if (_dist < 120) then {_groupShoted reveal [_this select 3,4];};
			};
		};
		if (_inWar) then {_groupShoted setVariable ["donn_pshot",true,false];	if (_dist < 120) then {_groupShoted reveal [_this select 3,4];};};
	};

	//Clean AI on death and re-assign a new driver
	donn_cleanUnit = {
		_unit = _this select 0;
		_motor = assignedVehicle _unit;
		_role = assignedVehicleRole _unit;
		_unit removeAllEventHandlers "handleDamage";
		if (_role select 0 == "Driver") then {_unit call donn_roll_driver;};
		{_unit removeMagazine _x;} forEach magazines _unit;
		if (random 100 > 60) then {
			{_unit removeWeapon _x;} forEach weapons _unit;
		};
		donn_units_motor = donn_units_motor - [_unit];
	};

	//Loot Selection Function
	donn_selectLoot = {
		_lootsOriginal = _this select 0;
		_qtd = _this select 1;
		_loots = +_lootsOriginal;
		_qtd = _qtd min 8;
		_return = [];
		for "_x" from 0 to (_qtd - 1) do {
			_rnd = (ceil (random (count _loots))) - 1;
			_rnd = _rnd max 0;
			_return = _return + [_loots select _rnd];
			_loots set [_rnd,"delme"];
			_loots = _loots - ["delme"];
			if (count _loots == 0) then {_loots = +_lootsOriginal;};
		};
		_return
	};

	//Add or Remove Turret Ammo - Function
	donn_cascar_tuAmmo = {
		_ammos = _this select 0;
		_motor = _this select 1;
		_action = _this select 2;
		if (_action == "add") then {
			{
				_ammo = _x;
				for "_a" from 1 to 8 do {
					_motor addMagazineTurret [_ammo,[_forEachIndex]];
				};
			} forEach _ammos;
		};
		if (_action == "remove") then {
			{
				_motor removeMagazinesTurret [_x,[_forEachIndex]];
			} forEach _ammos;
		};
	};

	//Select a new driver
	donn_roll_driver = {
		_unit = _this;
		_assignedVehDrv = assignedVehicle _unit;
		_unitsGrp = units group _unit;
		_newDriver = ObjNull;
		{
			if (alive _x) then {
				if (assignedVehicle _x == _assignedVehDrv) then {
					if (isNull _newDriver) then {
						_newDriver = _x;
					} else {
						if ((assignedVehicleRole _newDriver) select 0 == "Turret") then {
							_newDriver = _x;
						};
					};
				};
			};
		} forEach (_unitsGrp - [_unit]);
		if (!isNull _newDriver) then {
			unassignVehicle _unit;
			_newDriver assignAsDriver _assignedVehDrv;
			if ((group _newDriver) getVariable "donn_inWar") then {
				if ((assignedVehicleRole _newDriver) select 0 == "Turret") then {
					[_newDriver] orderGetIn false;
					[_newDriver] allowGetIn false;
					_newDriver setSkill 1;
				};
			};		
		};
	};

	//Protect Vehicles from players until all crew is off
	donn_casca_getIn = {
		_motor = _this select 0;
		_unit = _this select 2;
		if (isPlayer _unit) then {
			_carGroup = _motor getVariable ["car_group",GrpNull];
			_allOff = true;
			{if (alive _x && assignedVehicle _x == _motor) then {_allOff = false;};} forEach units _carGroup;
			if (!_allOff) then {_unit action ['getOut', _motor];};
			if (_allOff) then {
				_motor removeAllEventHandlers "handleDamage";
				_motor removeAllEventHandlers "getIn";
				_motor removeAllEventHandlers "getOut";
				_motor setFuel 0.5;
			};
		};
	};

	//Make bomber man on disembark
	donn_disembarkCount = 0;
	donn_casca_getOut = {
		_unit = _this select 2;
		if (!isPlayer _unit) then {
			donn_disembarkCount = donn_disembarkCount + 1;
			if (donn_disembarkCount mod (round (1/(donn_runnerBomberManPerc max 0.001))) == 0) then {
				_agentPos = position assignedVehicle _unit;
				_agent = createAgent ["B_Soldier_exp_F",_agentPos,[],0,"NONE"];
				_agent removeAllEventHandlers "handleDamage";
				_agent addEventHandler ["handleDamage",{_this call donn_casca_unit_HD_bomber}];
				[objNull,_agent, group _unit] execFSM "andre_convoy_bomber.fsm";	
			};	
		};
	};

	//Route Maker
	donn_makeroute = {
		_origin = _this select 0;
		_rosa_group = _this select 1;
		_speed = _this select 2;
		_posBefore = _origin;
		_posNow = _origin;
		_wp = _rosa_group addWaypoint [_posNow,0,0];
		_wp setWaypointCompletionRadius 15;
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed _speed;
		_posNext = [0,0,0];
		for "_c" from 1 to 5 do {
			_distToBefore = 0;
			_distToNext = 0;
			_found = false;
			for "_x" from 1 to 200 do {
				_posNext = donn_wps call BIS_fnc_selectRandom;
				_distToNext = _posNow distance _posNext;
				_distToBefore = _posNext distance _posBefore;
				_otherIsland = false;
				if (_distToNext > 2500 && _distToNext < 5000 && _distToBefore > 2000) then {
					_found = true;
					_distUnits = _distToNext/20;
					_dltX = ((_posNext select 0) - (_posNow select 0))/_distUnits;
					_dltY = ((_posNext select 1) - (_posNow select 1))/_distUnits;
					for "_i" from 1 to _distUnits do {
						_travelPos = [(_posNow select 0)+_i*_dltX,(_posNow select 1)+_i*_dltX]; 
						if (surfaceIsWater _travelPos) exitWith {_found = false;};
					};
				};
				if (_found) exitWith {};
				sleep 0.001;
			};
			if (!_found) then {_posNext = donn_wps call BIS_fnc_selectRandom;};
			_wp = _rosa_group addWaypoint [_posNext,0,_c];
			_wp setWaypointCompletionRadius 15;
			_wp setWaypointType "MOVE";
			_wp setWaypointSpeed _speed;
			_posNow = _posNext;
		};
		_wp = _rosa_group addWaypoint [_origin,0,6];
		_wp setWaypointCompletionRadius 15;
		_wp setWaypointType "CYCLE";
		_wp setWaypointSpeed _speed;
	};

	//MoveTo unit to vehcile
	donn_moveTB_veh = {
		{
			_role = assignedVehicleRole _x;
			if (count _role > 0) then {
				_roleTxt = _role select 0;
				if (_roleTxt == "CARGO") then {
					_x action ["moveToCargo", assignedVehicle _x];
				};
				if (_roleTxt == "DRIVER") then {
					_x action ["moveToDriver", assignedVehicle _x];
				};
				if (_roleTxt == "TURRET") then {
					_rolePos = _role select 1;
					_x action ["moveToTurret", assignedVehicle _x,_rolePos];
				};
			};
		} forEach _this;
	};

	//=================================================================
	//Generate Function End ===========================================
	//=================================================================
	
	//Find Waypoints: Automatic find street waypoints
	donn_wps = [1200] call donn_find_intersections;
	
	//Show Spawn Icons on Map / refuel Vehicles / Show convoy icons on map 
	donn_motor = [];
	donn_units_motor = [];
	[_spawns,_showCrewNumber] spawn {
			//Convoy Icons on Map Iniciate variables
			_showCrewNumber = _this select 1;
			_add = [];
			_remove = [];
			_update = [];
			_donn_units_motor_icon_old = [];
			//Add Icon Function
			_addIcon = {
				_iName = _this select 0;
				_iPos = _this select 1;
				_iColor = _this select 2;
				_iText = _this select 3;
				_mark = createMarker [_iName, _iPos];
				_mark setMarkerColor _iColor;
				_mark setMarkerShape "Icon";
				_mark setMarkerType "mil_dot";
				_mark setMarkerText _iText;
			};
		
		//Spawn icons on map iniciate variables
		_spawns = _this select 0;
		_donn_casca_icons = [];
		{_donn_casca_icons = _donn_casca_icons + [[_x select 0,"Convoy Spawn " + str (_forEachIndex + 1)]];} forEach _spawns;
		
		//While: Spawn icons / Convoy Icons / Refuel
		_sleep_a = 0;
		_sleep_b = 0;
		_sleep_c = 0;
		while {true} do {
			//Spawn Icons Add
			if (_sleep_a == 0) then {
				{
					_mark = createMarker ["Donn_Spawn_" + str _forEachIndex, _x select 0];
					_mark setMarkerShape "Icon";
					_mark setMarkerText (_x select 1);
					_mark setMarkerType "mil_dot";
					_mark setMarkerColor "ColorPink";
				} forEach _donn_casca_icons;
			};

			//Refual Vehicles each 180 seconds
			if (_sleep_b >= 200) then {
				_sleep_b = 0;{_x setFuel 1;} forEach donn_motor;
			};
			
			//Convoy Icons
			{
				deleteMarker vehicleVarName _x;
			} forEach _remove;
			{
				_color = "";
				if (_x isKindOf "LandVehicle") then {
					if (_x getVariable ["donn_tu",false]) then {_color = "ColorRed";} else {_color = "ColorBlue";};
				} else {
					_color = "ColorYellow";
				};
				_array = [vehicleVarName _x,position _x,_color,""];
				_array call _addIcon;
			} forEach _add;
			{
				_posXY = position _x;
				_marker = vehicleVarName _x;
				_marker setMarkerPos (getPosATL _x);
				if (_x isKindOf "LandVehicle") then {
					if (_showCrewNumber) then {_marker setMarkerText str ({alive _x} count crew _x);};
				};

			} forEach _update;
			_donn_units_motor_icon = [];
			_vehIcon = [];
			{
				_veh = vehicle _x;
				_assigned = assignedVehicle _x;
				if (_veh != _x) then {
					if !(_veh in _vehIcon) then {
						_vehIcon = _vehIcon + [_veh];
						_donn_units_motor_icon = _donn_units_motor_icon + [_veh];
					};
				} else {
					_donn_units_motor_icon = _donn_units_motor_icon + [_x];
				};
				if !(_assigned in _vehIcon) then {
					_vehIcon = _vehIcon + [_assigned];
					_donn_units_motor_icon = _donn_units_motor_icon + [_assigned];
				};
			} forEach donn_units_motor;
			if (_sleep_c >= 20) then {
				_add = _donn_units_motor_icon;
				_remove = _donn_units_motor_icon_old;
				_donn_units_motor_icon_old = _donn_units_motor_icon;
				_sleep_c = 0;
			} else {
				_add = _donn_units_motor_icon - _donn_units_motor_icon_old;
				_remove = _donn_units_motor_icon_old - _donn_units_motor_icon;
				_update = _donn_units_motor_icon - _add;
				_donn_units_motor_icon_old = _donn_units_motor_icon;
			};
			
			//Sleep Divisor of all
			_sleepTime = 2.5;
			sleep _sleepTime;
			_sleep_a = _sleep_a + _sleepTime;
			_sleep_b = _sleep_b + _sleepTime;
			_sleep_c = _sleep_c + _sleepTime;
		
			//Spawn Icons Remove
			if (_sleep_a == 15) then {
				_sleep_a = 0;
				{deleteMarker ("Donn_Spawn_" + str _forEachIndex);} forEach _donn_casca_icons;
			};
		};
	};
	
	//Safe Sleep
	sleep 15;
	
	//Spawn Casca Units/Cars
	for "_cs" from 1 to (count _convoyFormation) do {
		diag_log ("[CASCA CONVOY] Initialized Spawn! " + str _cs);
		
		//Inicialization
		_spawn = _spawns select ((_cs + ((count _spawns)-1)) mod (count _spawns));
		_origin = _spawn select 0;
		_rad = _spawn select 3;
		_rosa_group = createGroup east;
		_convoy = _convoyFormation select (_cs-1);
		_behaviorSafe = "CARELESS";
		_speed = "NORMAL";
		_qtd = count _convoy;
		_cars = [];
		{
			_cars = _cars + [donn_carsConvy select _x];
		} forEach _convoy;
		for "_n" from 1 to _qtd do {

			//Spawn Car
			_car = _cars select (_n - 1);
			_motor = createVehicle [_car select 0,_origin,[],_rad,"NONE"];
			_motor allowDamage false;
			_motor setVehicleVarName ("CASCA_CAR_" + str _cs + "_" + str _n);
			_motor setVariable ["car_group",_rosa_group,false];
			_motor removeAllEventHandlers "HandleDamage";
			_motor addEventHandler ["HandleDamage",{_this call donn_casca_veh_HD}];
			_motor setDir (_spawn select 2);
			_motor setFuel 1;
			donn_motor = donn_motor + [_motor];
			_motor addEventHandler ["GetIn",{_this call donn_casca_getIn;}];
			_motor addEventHandler ["GetOut",{_this call donn_casca_getOut;}];
			
			//Add Vehicle Ammo
			_ammos = _car select 2;
			if (count _ammos > 0) then {
				[_ammos,_motor,"add"] call donn_cascar_tuAmmo;
				_motor setVariable ["donn_tu",true,true];
			};
			
			//count Crew
			_driverCount = 1;
			_turreterCount = count _ammos;
			_cargorsCount = _car select 1;
			_crewCount = _driverCount + _turreterCount + _cargorsCount;
			
			//Put Loot in the Car
			clearWeaponCargoGlobal _motor;
			clearMagazineCargoGlobal _motor;
			{
				{call compile format ["_motor %1 ['%2',%3];",_x select 0,_x select 1,_x select 2 select ((_qtd - 1) min 2)];} forEach _x;
			} forEach ([_loot1,ceil (_crewCount/_lootCutter)] call donn_selectLoot);
			
			//Spawn Soldiers
			_gunnerPos = 0;
			for "_y" from 1 to _crewCount do {
				
				//Create Soldier
				_skin = donn_soldierSkin call BIS_fnc_selectRandom;
				_unit = _rosa_group createUnit [_skin,[50,50,50],[],50,"PRIVATE"];
				_unit setVehicleVarName ("CASCA_AI_" + str _cs + "_" + str _n + "_" + str _y);				
				[_unit] joinSilent _rosa_group;
				_unit addEventHandler ["Killed",{_this call donn_cleanUnit;}];
				_unit addEventHandler ["HandleDamage",{_this call donn_casca_unit_HD}];
				donn_units_motor = donn_units_motor + [_unit];
				_unit disableAi "TARGET";
				_unit disableAi "AUTOTARGET";
				
				//Give Soldier Weapon and Ammo
				removeAllWeapons _unit;
				{_unit removeMagazine _x} forEach magazines _unit;
				_weap_mag = _donn_weapons call BIS_fnc_selectRandom;
				_weapon = _weap_mag select 0;
				_magazine = _weap_mag select 1;
				_unit addWeapon _weapon;
				_unit selectWeapon _weapon;
				for "_pa" from 1 to 8 do {
					_unit addMagazine _magazine;
				};
				
				//Put AI in the car
				if (_y == 1) then {
					//Driver
					_unit assignAsDriver _motor;
					_unit moveInDriver _motor;
					_unit setSkill _driverManSkill;
				};
				if (_y > 1 && _y <= 1 + _turreterCount) then {
					//Turreters
					_unit assignAsGunner _motor;
					_unit moveInTurret [_motor,[_gunnerPos]];
					_unit setSkill _turretMansSkill;
					_gunnerPos = _gunnerPos + 1;
 				};
				if (_y > 1 + _turreterCount) then {
					//Cargors
					_unit assignAsCargo _motor;
					_unit moveInCargo _motor;
					_unit setSkill _cargoMansSkill;
				};
			};
			_rosa_group setCombatMode "BLUE";
			_rosa_group setBehaviour _behaviorSafe;
			_rosa_group setVariable ["donn_pshot",false,false];
			_rosa_group setVariable ["donn_inWar",false,false];
			{_x allowFleeing 0} forEach units _rosa_group;		
			{[_x] allowGetIn true;sleep 0.2;} forEach units _rosa_group;
			{[_x] orderGetIn true;sleep 0.2;} forEach units _rosa_group;
		};
		
		//Make Units leave or Embark car
		[_rosa_group,_behaviorSafe] spawn {
			_rosa_group = _this select 0;
			_behaviorSafe = _this select 1;
			_noHurtTime = 0;
			_tm = 1;
			_targetOff = true;
			while {!isNil "_rosa_group"} do {
				_newHurt = _rosa_group getVariable ["donn_pshot",false];
				if (isNil "_newHurt") then {_newHurt = false;};
				if (_newHurt) then {
					_noHurtTime = 0;
					_rosa_group setVariable ["donn_pshot",false,false];
					if (_targetOff) then {
						_targetOff = false;
						_rosa_group setVariable ["donn_inWar",true,false];
						{_x enableAi "TARGET";sleep 0.025;} forEach units _rosa_group;
						{_x enableAi "AUTOTARGET";sleep 0.025;} forEach units _rosa_group;
						sleep 0.5;
						_rosa_group setBehaviour "COMBAT";
						_rosa_group setCombatMode "RED";
						sleep 0.5;
						_turreters = [];
						{if ((assignedVehicleRole _x) select 0 == "Turret") then {_turreters = _turreters + [_x];};} forEach units _rosa_group;
						_leaveToFight = (units _rosa_group) - _turreters;
						{[_x] orderGetIn false;sleep 0.05;} forEach _leaveToFight;
						{[_x] allowGetIn false;sleep 0.05;} forEach _leaveToFight;
						_tm = 15;
					};
				} else {
					_noHurtTime = _noHurtTime + _tm;
					if (_noHurtTime > 120) then {
						_noDangerFell = true;
						{if (_rosa_group knowsAbout _x > 0) exitWith {_noDangerFell = false;};} forEach playableUnits;
						if (_noDangerFell) then {
							_targetOff = true;
							_rosa_group setVariable ["donn_inWar",false,false];
							{_x disableAi "TARGET";} forEach units _rosa_group;
							{_x disableAi "AUTOTARGET";} forEach units _rosa_group;
							sleep 1;
							_rosa_group setBehaviour _behaviorSafe;
							_rosa_group setCombatMode "BLUE";
							sleep 2;
							{[_x] allowGetIn true;sleep 0.2;} forEach units _rosa_group;
							{[_x] orderGetIn true;sleep 0.2;} forEach units _rosa_group;
							_tm = 1;
						};
					};
				};
				sleep _tm;
			};
		};
		
		//Make Convoy Route
		[_spawn select 0,_rosa_group,_speed,donn_wps] call donn_makeroute;
	
		//Sleep Before Next Spawn
		sleep _timeBetweenSpawns;
	};
};