Config = {}


Config.Dystans_pokaz_marker = 7


-- FRAUDRP wynajem rowerów
Config.frp_bike_npc = 'csb_thornton'
Config.frp_bikerent = {
	{x = -245.21882629395, y = -992.91589355469, z = 29.28915977478, h = 258.82550048828},
}
Config.frp_rowery = {
	{rower = 'tribike', money = 300, label = 'Rower szosowy'},
	{rower = 'bmx', money = 250, label = 'BMX'},
	{rower = 'cruiser', money = 200, label = 'Rower miejski'},
	{rower = 'scorcher', money = 400, label = 'Rower górski'}
}


-- Policja garaż
Config.frp_policja_garaz = {

	-- SPEED
	{kat = 'speed', auto = 'ZL1', label = 'Camaro ZL1', ranga = 9}, -- KAPITAN I
	{kat = 'speed', auto = 'rmodfordpolice', label = 'Ford Mustang', ranga = 9}, -- KAPITAN I

	-- SEDAN
	{kat = 'sedan', auto ='pd9', label = 'Chevrolet Caprice', ranga = 2}, -- OFICER I

	--UNMARKED
	{kat = 'unmarked', auto = 'fibbuffalosx', label = 'Buffalo Bravado UNMARKED', ranga = 5}, -- SIERZANT I
	{kat = 'unmarked', auto = 'Mercedes', label = 'Mercedes AMG C63 UNMARKED', ranga = 5}, -- SIERZANT I

	--MOTOCYKLE
	{kat = 'bike', auto = 'Kawasaki', label = 'Kawasaki Concours', ranga = 4} -- oficer III

}

Config.frp_spawn_coord_LSPD = {x = 435.57360839844, y = -976.04699707031, z = 25.69980430603, h = 91.015182495117}

-- FraudRP Winda
Config.frp_winda = {
	fraudrp = {
		windy = {
			{
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
				job = {name = ''},
				wejscie = vector3(-119.485, -1023.73, 26.977),
				wyjscie = vector3(-170.721, -999.052, 254.50)
			},
			{
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
				job = {name = ''},
				wejscie = vector3(-170.721, -999.052, 253.54),
				wyjscie = vector3(-119.485, -1023.73, 26.977)
			},
				-- EMS windy
			{	--DÓŁ GARAŻ
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
				job = {name = 'ambulance'},
				wejscie = vector3(339.6618, -584.515, 27.816),
				wyjscie = vector3(331.7257, -595.407, 43.284)
			},
			{	--GÓRA GARAŻ
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
				job = {name = 'ambulance'},
				wejscie = vector3(329.9364, -600.957, 42.384),
				wyjscie = vector3(340.9286, -580.827, 28.796)
			}
			
		},

	}
}

-- Fraud Garage 

Config.frp_garage = {
	fraudrp = {
		ustawienia = {
			{
				uzyj_kategorii = 'true',
				job = {name = 'police'},
				kat = {
					{name = 'patrol',label = 'PATROL',ranga = 0},--KADET
					{name = 'cel',label = 'PATROL',ranga = 3},--KADET

				}
			},
			{
				uzyj_kategorii = 'false',
				job = {name = 'ambulance'},
			}
		},
		garaze = {
				{
					name_organizacji = 'EMS',
					plate_start = 'EMS',
					Marker = {type = 27, x = 5.0, y = 5.0, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
					job = {name = 'ambulance'},
					coord = vector3(333.1689, -576.315, 27.856),
					heading = 340.0,
				},
				{
					name_organizacji = 'EMS',
					plate_start = 'EMS',
					Marker = {type = 27, x = 5.0, y = 5.0, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
					job = {name = 'ambulance'},
					coord = vec3(449.83740234375, -975.70336914063, 24.699798583984),
					heading = 340.0,
				},
				--[[{
					name_organizacji = 'LSPD',
					plate_start = 'LSPD',
					Marker = {type = 27, x = 5.0, y = 5.0, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
					job = {name = 'police'},
					coord = vec3(449.83740234375, -975.70336914063, 24.699798583984),
					heading = 340.0,
				},]]
				{
					name_organizacji = 'EMS',
					plate_start = 'EMS',
					Marker = {type = 27, x = 5.0, y = 5.0, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
					job = {name = 'ambulance'},
					coord = vector3(325.7109, -573.056, 27.856),
					heading = 340.0,
				},			
				{
					name_organizacji = 'LCN',
					plate_start = 'org',
					Marker = {type = 27, x = 5.0, y = 5.0, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true},
					job = {name = 'frp_mafia'},
					coord = vector3(1408.178, 1118.447, 113.90),
					heading = 90.0,
				}
		},
		auta = {	-- KOLORY https://wiki.rage.mp/index.php?title=Vehicle_Colors

					----- POLICE ------
					{model = 'police', label = 'CWEL', grade = 0, org = 'police', color1 = nil, color2 = nil, kat = 'patrol'},

					----- EMS -----
					{model = 'ambulance', label = 'ambulans', grade = 0, org = 'ambulance', color1 = nil, color2 = nil},

					----- MAFIA LCN -----
					{model = 'baller3', label = 'Baller', grade = 1, org = 'frp_mafia', color1 = 1, color2 = 1},
					{model = 'dubsta2', label = 'Dubsta', grade = 1, org = 'frp_mafia', color1 = 1, color2 = 1},
					{model = 'windsor', label = 'Windsor', grade = 1, org = 'frp_mafia', color1 = 1, color2 = 1},

				}
	}
}



--- KLAMER darkshop

Config.Darkshop = {
	procent_za_czyste = 70, -- przy zakupie za czyste 30% taniej
	items = {
		{item = 'laptop',money=8000},
		{item = 'bag', money =300},
		{item = 'thermite_bomb', money =500},
		{item = 'frp_laptop', money =12000},
		{item = 'frp_msr', money =3000},
		{item = 'frp_pusty_blank', money =1500},
		{item = 'frp_skim', money =8000},

	}
}

Config.Darkshop_bron = {
	procent_za_czyste = 70,
	items = {
		{item = 'weapon_pistol',money=20000},
		{item = 'weapon_combatpistol',money=24000},
		{item = 'weapon_snspistol',money=15000},
		{item = 'weapon_appistol',money=80000},
		{item = 'weapon_microsmg',money=100000},

		{item = 'armour',money=10000},
		
		{item = 'at_clip_extended_pistol',money=7000},
		{item = 'at_clip_extended_smg',money=12000},
		{item = 'at_suppressor_light',money=5000},
		{item = 'at_flashlight',money=3000},

		{item = 'ammo-9',money=80},
		{item = 'ammo-45',money=50},

	}
}


-- KLAMER NAPAD SKLEPY (( ZAJEBISTE WYMYŚIŁEM ))
Config.debug_napad = false

Config.blip_napad = {
	sprite = 156,
	scale = 0.8,
	color = 0,
	name = 'Napad na sklep'
}
Config.napad_sklepy = {
	
	sklep1 = {
		sejf ={x = -44.006851196289, y = -1748.0258789062, z = 28.236200714111},
		szukaj = {vec3(-45.949459075928, -1750.5375976562, 27.61515045166),vec3(-45.880802154541, -1749.7999267578, 27.421012878418),vec3(-44.577228546143, -1749.0737304688, 27.253593444824),vec3(-39.741611480713, -1750.8477783203, 27.078002548218),vec3(-47.743431091309, -1758.3013916016, 26.606482696533),vec3(-47.992115020752, -1759.7723388672, 26.605765533447)
		}
	},
	sklep2 = {
		sejf = {x = 28.228927612305, y = -1338.4881591797, z = 27.847906112671},
		szukaj ={vec3(29.453687667847, -1338.8249511719, 27.332921981812),vec3(30.849334716797, -1338.4146728516, 26.501037597656),vec3(31.481533050537, -1339.0394287109, 26.668447494507),vec3(27.071008682251, -1338.4633789062, 27.486322402954),vec3(25.417984008789, -1338.5637207031, 27.390188217163)		
		}
	},
	sklep3 = {
		sejf = {x = 378.30349731445, y = 334.01214599609, z = 102.31847991943},
		szukaj ={vec3(379.39791870117, 333.50491333008, 101.40143585205),vec3(381.20623779297, 332.46475219727, 101.6628112793),vec3(380.81686401367, 333.44290161133, 101.11952972412),vec3(376.47790527344, 334.75811767578, 102.03686523438),vec3(371.84301757812, 327.27505493164, 101.06639099121)
		}
	},
	sklep4 = {
		sejf = {x = 546.50402832031, y = 2662.1354980469, z = 41.005031585693},
		szukaj ={vec3(545.37298583984, 2662.1079101562, 40.066078186035),vec3(544.02661132812, 2661.9621582031, 40.211769104004),vec3(543.26824951172, 2662.5576171875, 39.611289978027),vec3(548.96185302734, 2662.5544433594, 40.49069442749),vec3(549.82189941406, 2671.1164550781, 39.789910125732)
				}
	},
	sklep5 = {
		sejf = {x = 1958.9376220703, y = 3749.5017089844, z = 30.515586853027},
		szukaj ={vec3(1959.9287109375, 3749.8720703125, 30.381938934326),vec3(1961.2259521484, 3750.7346191406, 30.324890136719),vec3(1962.0211181641, 3750.6411132812, 30.245465087891),vec3(1958.1459960938, 3748.9116210938, 30.338760375977),vec3(1959.4888916016, 3739.5876464844, 30.112949371338)
				}
	},
	sklep6 = {
		sejf = {x = 2672.1813964844, y = 3286.8640136719, z = 53.07014465332},
		szukaj ={
			vec3(2672.9497070312, 3287.9367675781, 53.055480957031),
			vec3(2673.3610839844, 3288.96875, 53.081218719482),
			vec3(2674.2934570312, 3289.5251464844, 52.639667510986),
			vec3(2671.712890625, 3286.0708007812, 53.127662658691),
			vec3(2677.8442382812, 3278.5727539062, 52.325229644775)
				}
	},
	monopolowy1 = {
		sejf = {x = -1221.2573242188, y = -916.38427734375, z = 9.804207801819},
		szukaj ={vec3(-1221.0089111328, -917.22698974609, 9.711353302002),vec3(-1220.8601074219, -915.34594726562, 9.834433555603),vec3(-1220.5212402344, -910.58117675781, 9.786493301392),vec3(-1224.0291748047, -908.94073486328, 9.283737182617),vec3(-1220.5393066406, -906.62896728516, 9.688638687134)		
		}
	},
	monopolowy2 = {
		sejf = {x = -1478.5903320312, y = -375.62521362305, z = 37.636680603027},
		szukaj = {vec3(-1477.8120117188, -375.46939086914, 37.348149108887),vec3(-1479.6763916016, -375.7946472168, 37.415546417236),vec3(-1483.8851318359, -376.70272827148, 37.908046722412),vec3(-1485.5065917969, -379.45803833008, 37.228466033936),vec3(-1488.4178466797, -376.98770141602, 37.518779754639)
				}
	},
}