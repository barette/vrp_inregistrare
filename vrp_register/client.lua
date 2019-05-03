--[[
	SCRIPTER: Mihail#5138
--]]
RegisterNetEvent('scriptermihail')
AddEventHandler('scriptermihail', function()
	introServer()
end)
function introServer()
	Citizen.Wait(0)
	SetEntityVisible(GetPlayerPed(-1), false)
	FreezeEntityPosition(GetPlayerPed(-1), true)
	SetEntityCoords(GetPlayerPed(-1),222.41590881348,-1042.3555908203,54.531940460205,true, false, false,true)
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:#1E90FF'>Despre server</b> <br /><br /><b style='color:#fdbf21'>STAFF</b>: Cu multa munca si ambitie am deschis serverul nostru,<b style='color:#1E90FF'> EliteZone </b>  <b style='color:#fdbf21'>ROMANIA ROLEPLAY</b>!<br /><br /><b style='color:#1E90FF'> SCRIPT </b>: Un grup de oameni experimentati si pasionati pe diferite domenii au dezvoltat unul dintre cele mai unice servere din RO!<br /><br /><b style='color:#1E90FF'> CAND </b> si <b style='color:#fdbf21'>CUM</b>? : Am decis pe data de 5.05.2018 sa deschidem acest server , <b style='color:#ff4c4c'>Mihail</b> a dezvoltat unul dintre cele mai unice servere, impreuna cu sustinerea si ajutorul <b style='color:#fdbf21'>STAFF-ULUI</b>, dupa multe saptamani de munca ,probleme intr-un final am deschis <b style='color:#fdbf21'>EliteZone!</b><br />",
		type = "alert",
		timeout = (18500),
		layout = "center",
		queue = "global"
	})
	Citizen.Wait(20000)
	SetEntityCoords(GetPlayerPed(-1),-293.80242919922,-517.28063964844,82.515983581543,true, false, false,true)
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:#1E90FF'>Drumuri si poduri</b> <br /><br />Conform legii intr-o zona rezidentiala, de trafic intens, viteza automobilelor nu trebuie sa depaseasca 50 KM/H<br /><br />In zone urbane, cu trafic obisnuit, viteza ideala nu depaseste 80KM/H <br /><br />In cazul autostrazilor, legea doreste ca automobilele sa nu depaseasca viteza de 130KM/H<br />",
		type = "alert",
		timeout = (10000),
		layout = "center",
		queue = "global"
	})
	Citizen.Wait(11500)
	SetEntityCoords(GetPlayerPed(-1),393.24786376953,-943.24426269531,52.790142059326,true, false, false,true)
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:#1E90FF'>Politia</b> <br/><br/> LSPD, organizatie guvernamentala pentru aplicarea legii, exercita atributii privind prevenirea, descoperirea si cercetarea in conditiile legii a tuturor infractiunilor.<br/> <br/><br/>  FBI: agentia federala de investigatii a crimelor si nu numai.<br/>",
		type = "alert",
		timeout = (10000),
		layout = "center",
		queue = "global"
	})
	Citizen.Wait(11500)
	SetEntityCoords(GetPlayerPed(-1),188.59785461426,193.18286132813,133.37438964844,true, false, false,true)
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:#1E90FF'>Banca</b> <br /><br />Banca este cel mai sigur loc unde ai putea sa pastrezi banii in cazul atacurilor sau in cazul in care aveti de-a face cu mafiile!. <br />",
		type = "alert",
		timeout = (10000),
		layout = "center",
		queue = "global"
	})				
	Citizen.Wait(11500)		
	TriggerServerEvent('nodaicumihail')
end
RegisterNetEvent('bymihail')
AddEventHandler('bymihail', function(user_id,nume,prenume,varsta)
	user_id = user_id
	nume = nume
	prenume = prenume
	varsta = varsta
	SetEntityCoords(GetPlayerPed(-1),-544.95623779296,-204.4200744629,38.215145111084,true, false, false,true)
	SetEntityVisible(GetPlayerPed(-1), true)
	FreezeEntityPosition(GetPlayerPed(-1), false)
	Citizen.CreateThread(function()
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)
			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieFunctionParameterString("<FONT COLOR='#ffffff'>BINE AI VENIT PE <FONT COLOR='#00aeff'>EliteZone<FONT COLOR='#ffffff'> ROMANIA")
            PushScaleformMovieFunctionParameterString("ID:~g~"..user_id.."~w~, Nume: ~g~"..nume.."~w~, Prenume: ~g~"..prenume.."~w~, Varsta: ~g~"..varsta)
			PopScaleformMovieFunctionVoid()
			PlaySoundFrontend(-1, "UNDER_THE_BRIDGE", "HUD_AWARDS", 1)
			Citizen.SetTimeout(5000, function()
				PushScaleformMovieFunction(scaleform, "SHARD_ANIM_OUT")
				PushScaleformMovieFunctionParameterInt(1)
				PushScaleformMovieFunctionParameterFloat(0.33)
				PopScaleformMovieFunctionVoid()
				PlaySoundFrontend(-1, "1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET", 1)
			end)
			return scaleform
		end
		scaleform = Initialize("mp_big_message_freemode")
		while true do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
		end
	end)
end)
