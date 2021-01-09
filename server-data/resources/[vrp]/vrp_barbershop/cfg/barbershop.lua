local cfg = {}

local parts = {
	["Rosto"] = -1,
	["Olhos"] = -2,
	["Defeitos"] = 0,
	["Barba"] = 1,
	["Sobrancelhas"] = 2,
	["Envelhecimento"] = 3,
	["Maquiagem"] = 4,
	["Blush"] = 5,
	["Rugas"] = 6,
	["Pele"] = 7,
	["Batom"] = 8,
	["Sardas"] = 9,
	["Cabelo no Peito"] = 10,
	["Manchas no Corpo"] = 11,
	["Cabelo"] = 12,
	["Cabelo 2"] = 13
}

cfg.barbershops = {
	{ parts,-815.59,-182.16,37.56 },
	{ parts,139.21,-1708.96,29.30 },
	{ parts,-1282.00,-1118.86,7.00 },
	{ parts,1934.11,3730.73,32.85 },
	{ parts,1211.07,-475.00,66.21 },
	{ parts,-34.97,-150.90,57.08 },
	{ parts,-280.37,6227.01,31.70 }
}
cfg.default = {
	["-1"] = {0,0},
	["9"] = {18,0},
	["7"] = {11,0},
	["8"] = {10,0},
	["10"] = {17,0},
	["11"] = {12,0},
	["12"] = {38,0},
	["13"] = {18,0},
	["6"] = {12,0},
	["5"] = {33,0},
	["4"] = {72,0},
	["3"] = {15,0},
	["2"] = {34,0},
	["1"] = {29,0},
	["0"] = {24,0},
	["-2"] = {32,0}
}

return cfg