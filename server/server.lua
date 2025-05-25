RegisterServerEvent('SEM_InteractionMenu:GlobalChat')
AddEventHandler('SEM_InteractionMenu:GlobalChat', function(Color, Prefix, Message)
	TriggerClientEvent('chatMessage', -1, Prefix, Color, Message)
end)

RegisterServerEvent('SEM_InteractionMenu:CuffNear')
AddEventHandler('SEM_InteractionMenu:CuffNear', function(ID)
	if ID == -1 or ID == '-1' then
		if source ~= '' then
			print('^1[#' .. source .. '] ' .. GetPlayerName(source) .. '  -  attempted to cuff all players^7')
			DropPlayer(source, '\n[SEM_InteractionMenu] Attempting to cuff all players')
		else
			print('^1Someone attempted to cuff all players^7')
		end

		return
	end

	if ID ~= false then
		TriggerClientEvent('SEM_InteractionMenu:Cuff', ID)
	end
end)

RegisterServerEvent('SEM_InteractionMenu:DragNear')
AddEventHandler('SEM_InteractionMenu:DragNear', function(ID)
	if ID == -1 or ID == '-1' then
		if source ~= '' then
			print('^1[#' .. source .. '] ' .. GetPlayerName(source) .. '  -  attempted to drag all players^7')
			DropPlayer(source, '\n[SEM_InteractionMenu] Attempting to drag all players')
		else
			print('^1Someone attempted to drag all players^7')
		end

		return
	end
	
	if ID ~= false and ID ~= source then
		TriggerClientEvent('SEM_InteractionMenu:Drag', ID, source)
	end
end)

RegisterServerEvent('SEM_InteractionMenu:SeatNear')
AddEventHandler('SEM_InteractionMenu:SeatNear', function(ID, Vehicle)
    TriggerClientEvent('SEM_InteractionMenu:Seat', ID, Vehicle)
end)

RegisterServerEvent('SEM_InteractionMenu:UnseatNear')
AddEventHandler('SEM_InteractionMenu:UnseatNear', function(ID, Vehicle)
    TriggerClientEvent('SEM_InteractionMenu:Unseat', ID, Vehicle)
end)

RegisterServerEvent('SEM_InteractionMenu:Jail')
AddEventHandler('SEM_InteractionMenu:Jail', function(ID, Time)
	if ID == -1 or ID == '-1' then
		if source ~= '' then
			print('^1[#' .. source .. '] ' .. GetPlayerName(source) .. '  -  attempted to jail all players^7')
			DropPlayer(source, '\n[SEM_InteractionMenu] Attempting to jail all players')
		else
			print('^1Someone attempted to jail all players^7')
		end

		return
	end
	
	TriggerClientEvent('SEM_InteractionMenu:JailPlayer', ID, Time)
	TriggerClientEvent('chatMessage', -1, 'Judge', {86, 96, 252}, GetPlayerName(ID) .. ' has been Jailed for ' .. Time .. ' months(s)')
end)

RegisterServerEvent('SEM_InteractionMenu:Unjail')
AddEventHandler('SEM_InteractionMenu:Unjail', function(ID)
	TriggerClientEvent('SEM_InteractionMenu:UnjailPlayer', ID)
end)

RegisterServerEvent('SEM_InteractionMenu:Backup')
AddEventHandler('SEM_InteractionMenu:Backup', function(Code, StreetName, Coords)
	TriggerClientEvent('SEM_InteractionMenu:CallBackup', -1, Code, StreetName, Coords)
end)

RegisterServerEvent('SEM_InteractionMenu:Ads')
AddEventHandler('SEM_InteractionMenu:Ads', function(Text, Name, Loc, File)
	TriggerClientEvent('SEM_InteractionMenu:SyncAds', -1, Text, Name, Loc, File, source)
end)

BACList = {}
RegisterServerEvent('SEM_InteractionMenu:BACSet')
AddEventHandler('SEM_InteractionMenu:BACSet', function(BACLevel)
	BACList[source] = BACLevel
end)

RegisterServerEvent('SEM_InteractionMenu:BACTest')
AddEventHandler('SEM_InteractionMenu:BACTest', function(ID)
	local BACLevel = BACList[ID]
	TriggerClientEvent('SEM_InteractionMenu:BACResult', source, BACLevel)
end)

Inventories = {}
RegisterServerEvent('SEM_InteractionMenu:InventorySet')
AddEventHandler('SEM_InteractionMenu:InventorySet', function(Items)
	Inventories[source] = Items
end)

RegisterServerEvent('SEM_InteractionMenu:InventorySearch')
AddEventHandler('SEM_InteractionMenu:InventorySearch', function(ID)
	local Inventory = Inventories[ID]

	TriggerClientEvent('SEM_InteractionMenu:InventoryResult', source, Inventory)
end)

RegisterServerEvent('SEM_InteractionMenu:Hospitalize')
AddEventHandler('SEM_InteractionMenu:Hospitalize', function(ID, Time, Location)
	if ID == -1 or ID == '-1' then
		if source ~= '' then
			print('^1[#' .. source .. '] ' .. GetPlayerName(source) .. '  -  attempted to hospitalize all players^7')
			DropPlayer(source, '\n[SEM_InteractionMenu] Attempting to hospitalize all players')
		else
			print('^1Someone attempted to hospitalize all players^7')
		end

		return
	end

	TriggerClientEvent('SEM_InteractionMenu:HospitalizePlayer', ID, Time, Location)
	TriggerClientEvent('chatMessage', -1, 'Doctor', {86, 96, 252}, GetPlayerName(ID) .. ' has been Hospitalized for ' .. Time .. ' months(s)')
end)

RegisterServerEvent('SEM_InteractionMenu:Unhospitalize')
AddEventHandler('SEM_InteractionMenu:Unhospitalize', function(ID)
	TriggerClientEvent('SEM_InteractionMenu:UnhospitalizePlayer', ID)
end)

RegisterServerEvent("sem:server:fetch_permissions")
AddEventHandler("sem:server:fetch_permissions", function(permissions)
    for key, _ in pairs(permissions) do
        local permission = "sem_intmenu." .. key:lower()
        local has_permission = IsPlayerAceAllowed(source, permission)

        TriggerClientEvent("sem:client:update_permissions", source, key, has_permission)
    end
end)