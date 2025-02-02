local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_policia")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = 416.34
local CoordenadaY = -1022.88
local CoordenadaZ = 29.06
local rotaid = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
--- ROTA NORTE ( PREVENTIVO )
	[1] = { ['x'] =408.39852905273,['y'] =-693.32171630859,['z'] =28.826406478882 },
	[2] = { ['x'] =132.46971130371,['y'] =-574.69268798828,['z'] =31.074014663696 },
	[3] = { ['x'] =28.528078079224,['y'] =-302.95565795898,['z'] =46.859073638916 },
	[4] = { ['x'] =66.024955749512,['y'] =-190.23335266113,['z'] =54.293327331543 },
	[5] = { ['x'] =-52.709186553955,['y'] =-111.08502197266,['z'] =57.514671325684 },
	[6] = { ['x'] =-226.44497680664,['y'] =-51.434391021729,['z'] =49.246223449707 },
	[7] = { ['x'] =-375.28521728516,['y'] =-0.54881399869919,['z'] =46.596832275391 },
	[8] = { ['x'] =-389.96969604492,['y'] =108.20202636719,['z'] =65.203247070313 },
	[9] = { ['x'] =-246.62051391602,['y'] =120.46387481689,['z'] =69.065139770508 },
	[11] = { ['x'] =-62.035655975342,['y'] =38.896705627441,['z'] =71.760597229004 },
	[12] = { ['x'] =105.68536376953,['y'] =-23.425937652588,['z'] =67.449531555176 },
	[13] = { ['x'] =260.96252441406,['y'] =-79.587608337402,['z'] =69.583686828613 },
	[14] = { ['x'] =351.19793701172,['y'] =111.97436523438,['z'] =102.41180419922 },
	[15] = { ['x'] =226.89381408691,['y'] =196.12413024902,['z'] =104.99100494385 },
	[16] = { ['x'] =255.85871887207,['y'] =323.51177978516,['z'] =105.09609985352 },
	[17] = { ['x'] =401.84188842773,['y'] =300.27618408203,['z'] =102.5559387207 },
	[18] = { ['x'] =546.66754150391,['y'] =248.8703918457,['z'] =102.68128967285 },
	[19] = { ['x'] =765.58984375,['y'] =154.01397705078,['z'] =80.380638122559 },
	[20] = { ['x'] =631.06481933594,['y'] =-47.125553131104,['z'] =77.069061279297 },
	[21] = { ['x'] =482.16995239258,['y'] =-287.56411743164,['z'] =46.724937438965 },
	[22] = { ['x'] =336.77230834961,['y'] =-390.30603027344,['z'] =44.818767547607 },
	[23] = { ['x'] =181.25146484375,['y'] =-793.71362304688,['z'] =31.000133514404 },
	[24] = { ['x'] =390.21337890625,['y'] =-864.84741210938,['z'] =29.285194396973 },
	[25] = { ['x'] =401.25207519531,['y'] =-939.67004394531,['z'] =29.43165397644 },
--- ROTA SUL ( PREVENTIVO )
	[26] = { ['x'] =252.75157165527,['y'] =-1042.8200683594,['z'] =28.910940170288 },
	[27] = { ['x'] =-7.3922867774963,['y'] =-958.51898193359,['z'] =28.979099273682 },
	[28] = { ['x'] =-100.17411804199,['y'] =-1118.6898193359,['z'] =25.35168838501 },
	[29] = { ['x'] =-116.99532318115,['y'] =-1344.3435058594,['z'] =28.80562210083 },
	[30] = { ['x'] =-206.69055175781,['y'] =-1418.4417724609,['z'] =30.911630630493 },
	[31] = { ['x'] =-151.54943847656,['y'] =-1718.9412841797,['z'] =29.718214035034 },
	[32] = { ['x'] =30.067617416382,['y'] =-1692.3818359375,['z'] =28.799993515015 },
	[33] = { ['x'] =245.98672485352,['y'] =-1851.9771728516,['z'] =26.223562240601 },
	[34] = { ['x'] =460.94805908203,['y'] =-2041.9041748047,['z'] =23.948059082031 },
	[35] = { ['x'] =739.52581787109,['y'] =-2072.3178710938,['z'] =28.828332901001 },
	[36] = { ['x'] =913.12774658203,['y'] =-2088.8071289063,['z'] =30.049331665039 },
	[37] = { ['x'] =1043.9122314453,['y'] =-2093.1489257813,['z'] =31.06711769104 },
	[38] = { ['x'] =1029.7338867188,['y'] =-2451.0925292969,['z'] =27.928590774536 },
	[39] = { ['x'] =909.85455322266,['y'] =-2457.6616210938,['z'] =28.119804382324 },
	[40] = { ['x'] =777.22253417969,['y'] =-2443.4370117188,['z'] =19.796709060669 },
	[41] = { ['x'] =788.16998291016,['y'] =-2091.017578125,['z'] =28.846691131592 },
	[42] = { ['x'] =838.60943603516,['y'] =-1774.2971191406,['z'] =28.688983917236 },
	[43] = { ['x'] =806.22613525391,['y'] =-1455.6461181641,['z'] =26.76230430603 },
	[44] = { ['x'] =786.91442871094,['y'] =-1027.1812744141,['z'] =25.83219909668 },
	[45] = { ['x'] =414.68286132813,['y'] =-1039.9539794922,['z'] =29.000715255737 },
--- ROTA LESTE / ESTRADA ( PREVENTIVO )
	[46] = { ['x'] =760.10583496094,['y'] =-1015.5076293945,['z'] =25.606109619141 },
	[47] = { ['x'] =794.42681884766,['y'] =-1224.0708007813,['z'] =25.914079666138 },
	[48] = { ['x'] =751.99212646484,['y'] =-1230.0734863281,['z'] =44.596706390381 },
	[49] = { ['x'] =1410.7574462891,['y'] =-1086.0531005859,['z'] =53.354671478271 },
	[50] = { ['x'] =1827.8452148438,['y'] =-828.17297363281,['z'] =75.860153198242 },
	[51] = { ['x'] =2126.9660644531,['y'] =-591.72497558594,['z'] =95.047027587891 },
	[52] = { ['x'] =2454.8981933594,['y'] =-171.11265563965,['z'] =88.027236938477 },
	[53] = { ['x'] =2561.8234863281,['y'] =792.56329345703,['z'] =89.018669128418 },
	[54] = { ['x'] =2171.533203125,['y'] =1303.8278808594,['z'] =75.314872741699 },
	[55] = { ['x'] =1958.7845458984,['y'] =2466.7331542969,['z'] =54.142524719238 },
	[56] = { ['x'] =2241.3325195313,['y'] =2750.4404296875,['z'] =44.351627349854 },
	[57] = { ['x'] =2433.1926269531,['y'] =2860.3459472656,['z'] =48.594604492188 },
	[58] = { ['x'] =2300.0356445313,['y'] =2997.8623046875,['z'] =46.29891204834 },
	[59] = { ['x'] =1608.2642822266,['y'] =2824.3959960938,['z'] =38.664848327637 },
	[60] = { ['x'] =1167.6519775391,['y'] =2685.6882324219,['z'] =37.587310791016 },
	[61] = { ['x'] =298.94473266602,['y'] =2641.8544921875,['z'] =44.18297958374 },
	[62] = { ['x'] =691.40350341797,['y'] =2284.1801757813,['z'] =50.481887817383 },
	[63] = { ['x'] =1162.2678222656,['y'] =1807.4182128906,['z'] =73.824028015137 },
	[64] = { ['x'] =1034.3865966797,['y'] =500.57699584961,['z'] =95.962631225586 },
	[65] = { ['x'] =799.64581298828,['y'] =175.82818603516,['z'] =80.713790893555 },
	[66] = { ['x'] =484.91506958008,['y'] =-291.05752563477,['z'] =46.489303588867 },
	[67] = { ['x'] =335.70126342773,['y'] =-390.3994140625,['z'] =44.818458557129 },
	[68] = { ['x'] =52.508975982666,['y'] =-291.01641845703,['z'] =47.118968963623 },
	[69] = { ['x'] =-57.835681915283,['y'] =-528.09240722656,['z'] =39.931007385254 },
	[70] = { ['x'] =329.37048339844,['y'] =-661.03845214844,['z'] =28.831077575684 },
	[71] = { ['x'] =297.80880737305,['y'] =-829.11907958984,['z'] =28.899114608765 },
	[72] = { ['x'] =400.47827148438,['y'] =-938.66107177734,['z'] =28.957666397095 },
--- ROTA OESTE  ( PREVENTIVO )
	[73] = { ['x'] =251.19573974609,['y'] =-1042.5112304688,['z'] =28.81619644165 },
	[74] = { ['x'] =-6.9379420280457,['y'] =-953.73309326172,['z'] =28.883106231689 },
	[75] = { ['x'] =-478.17431640625,['y'] =-835.54895019531,['z'] =29.956327438354 },
	[76] = { ['x'] =-613.44262695313,['y'] =-833.37219238281,['z'] =24.922145843506 },
	[77] = { ['x'] =-647.0126953125,['y'] =-939.56280517578,['z'] =21.547031402588 },
	[78] = { ['x'] =-753.99536132813,['y'] =-1097.6474609375,['z'] =10.188851356506 },
	[79] = { ['x'] =-1053.4957275391,['y'] =-1269.2034912109,['z'] =5.6835651397705 },
	[80] = { ['x'] =-1143.4356689453,['y'] =-1325.7214355469,['z'] =4.5056867599487 },
	[81] = { ['x'] =-1216.1560058594,['y'] =-1360.2995605469,['z'] =3.6049962043762 },
	[82] = { ['x'] =-1287.5909423828,['y'] =-1205.9309082031,['z'] =4.3097801208496 },
	[83] = { ['x'] =-1347.5236816406,['y'] =-1012.3472290039,['z'] =7.5936498641968	 },
	[84] = { ['x'] =-1401.1187744141,['y'] =-927.90087890625,['z'] =10.534672737122 },
	[85] = { ['x'] =-1350.8020019531,['y'] =-859.98461914063,['z'] =16.078598022461 },
	[86] = { ['x'] =-1299.5028076172,['y'] =-889.01531982422,['z'] =10.969274520874 },
	[87] = { ['x'] =-1097.9871826172,['y'] =-778.67852783203,['z'] =18.768501281738 },
	[88] = { ['x'] =-1211.0250244141,['y'] =-602.5986328125,['z'] =26.591539382935 },
	[89] = { ['x'] =-1364.3937988281,['y'] =-407.69387817383,['z'] =36.006660461426 },
	[90] = { ['x'] =-1481.5447998047,['y'] =-266.21911621094,['z'] =49.3996925354 },
	[91] = { ['x'] =-1527.9470214844,['y'] =-189.02394104004,['z'] =54.325813293457 },
	[92] = { ['x'] =-1419.9506835938,['y'] =-79.841911315918,['z'] =52.155536651611 },
	[93] = { ['x'] =-1070.4167480469,['y'] =-179.26972961426,['z'] =37.366813659668 },
	[94] = { ['x'] =-807.42474365234,['y'] =-84.591346740723,['z'] =37.282928466797 },
	[95] = { ['x'] =-570.94171142578,['y'] =-5.756579875946,['z'] =43.960155487061 },
	[96] = { ['x'] =-411.94107055664,['y'] =-10.411109924316,['z'] =46.184757232666 },
	[97] = { ['x'] =-282.16952514648,['y'] =-48.334629058838,['z'] =48.8928565979 },
	[98] = { ['x'] =-274.55932617188,['y'] =-358.45315551758,['z'] =29.547016143799 },
	[99] = { ['x'] =-250.28909301758,['y'] =-637.78247070313,['z'] =32.981216430664 },
	[100] = { ['x'] =-281.58288574219,['y'] =-833.58746337891,['z'] =31.165218353271 },
	[101] = { ['x'] =382.16091918945,['y'] =-1054.2839355469,['z'] =28.688997268677 },
--- ROTA FAVELAS ( OSTENSIVO )
	[102] = { ['x'] =408.40292358398,['y'] =-877.41638183594,['z'] =28.925987243652 },
	[103] = { ['x'] =906.45037841797,['y'] =-845.96356201172,['z'] =43.181457519531 },
	[104] = { ['x'] =1146.3153076172,['y'] =-844.40954589844,['z'] =53.965263366699 },
	[105] = { ['x'] =1279.2813720703,['y'] =-722.15637207031,['z'] =64.080612182617 },
	[106] = { ['x'] =1266.6428222656,['y'] =-560.96166992188,['z'] =68.495986938477 },
	[107] = { ['x'] =1231.9357910156,['y'] =-376.19595336914,['z'] =68.634704589844 },
	[108] = { ['x'] =889.84265136719,['y'] =-113.84722137451,['z'] =78.216934204102 },
	[109] = { ['x'] =823.61822509766,['y'] =-176.13740539551,['z'] =72.430503845215 },
	[110] = { ['x'] =878.81097412109,['y'] =-232.16412353516,['z'] =69.084869384766 },
	[111] = { ['x'] =834.47106933594,['y'] =-333.72848510742,['z'] =56.771209716797 },
	[112] = { ['x'] =673.49621582031,['y'] =-386.44586181641,['z'] =41.173645019531 },
	[113] = { ['x'] =774.58465576172,['y'] =-538.97320556641,['z'] =33.427452087402 },
	[114] = { ['x'] =773.96313476563,['y'] =-663.3974609375,['z'] =28.414033889771 },
	[115] = { ['x'] =788.63720703125,['y'] =-1414.8627929688,['z'] =26.72095489502 },
	[116] = { ['x'] =564.36169433594,['y'] =-1432.4869384766,['z'] =29.14722442627 },
	[117] = { ['x'] =375.75549316406,['y'] =-1725.8459472656,['z'] =28.827142715454 },
	[118] = { ['x'] =452.0947265625,['y'] =-1820.3382568359,['z'] =27.424318313599 },
	[119] = { ['x'] =375.87783813477,['y'] =-1914.5347900391,['z'] =24.107448577881 },
	[120] = { ['x'] =246.15759277344,['y'] =-2057.7739257813,['z'] =17.232666015625 },
	[121] = { ['x'] =177.43179321289,['y'] =-2036.2650146484,['z'] =17.86861038208 },
	[122] = { ['x'] =217.79487609863,['y'] =-1949.8776855469,['z'] =21.471395492554 },
	[123] = { ['x'] =368.52621459961,['y'] =-1771.1282958984,['z'] =28.777143478394 },
	[124] = { ['x'] =544.32977294922,['y'] =-1554.0690917969,['z'] =28.81308555603 },
	[125] = { ['x'] =505.00765991211,['y'] =-1216.7786865234,['z'] =28.877676010132 },
	[126] = { ['x'] =425.75286865234,['y'] =-1129.5083007813,['z'] =28.978193283081 },
	[127] = { ['x'] =401.26379394531,['y'] =-1073.9296875,['z'] =28.955242156982 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(27,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,240,200,80,50,0,0,0,0)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) and emP.checkPermission() then
						ToggleActionMenu()
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 30.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.30,0,0,0,0,180.0,130.0,2.0,2.0,1.0,240,200,80,50,1,0,0,1)
				if distance <= 1.5 then
					--if IsControlJustPressed(0,38) and emP.checkPermission() then
					if emP.checkPermission() then
						RemoveBlip(blips)
						if selecionado == 25 and rotaid == 1 then
							selecionado = 1
						elseif selecionado == 45 and rotaid == 2 then
							selecionado = 26
						elseif selecionado == 72 and rotaid == 3 then
							selecionado = 46
						elseif selecionado == 101 and rotaid == 4 then
							selecionado = 73
						elseif selecionado == 127 and rotaid == 5 then
							selecionado = 102
						else
							selecionado = selecionado + 1
						end
					    emP.checkPayment()
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) then
            if servico == true then
			    servico = false
			    rotaid = 0
			    RemoveBlip(blips)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Patrulha")
	EndTextCommandSetBlipName(blips)
end
RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()
	if data == "rota1" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		rotaid = 1
		servico = true
		selecionado = 1
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "rota2" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		rotaid = 2
		servico = true
		selecionado = 26
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "rota3" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		rotaid = 3
		servico = true
		selecionado = 46
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "rota4" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		rotaid = 4
		servico = true
		selecionado = 73
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "rota5" then
		PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
		rotaid = 5
		servico = true
		selecionado = 102
		CriandoBlip(locs,selecionado)
		ToggleActionMenu()
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)