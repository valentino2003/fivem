local radarEnabled = false
local transponderEnabled = true
local callsign = "N/A"
local squawkCode = 7700
local emergency = false
local radarFloor = 200 -- Default radar floor in meters

-- Request initial aircraft data from server
Citizen.CreateThread(function()
    TriggerServerEvent('radar:getAircraftData')
end)

-- Register command to open/close radar
RegisterCommand('radar', function()
    radarEnabled = not radarEnabled
    if radarEnabled then
        SendNUIMessage({action = "openRadar"})
    else
        SendNUIMessage({action = "closeRadar"})
    end
end, false)

-- Register command to set callsign
RegisterCommand('setcallsign', function(source, args)
    callsign = args[1] or 'N/A'
    print('Setting callsign to: ' .. callsign)
    SendNUIMessage({
        action = "updateRadar",
        callsign = callsign,
        squawk = '1200',
        altitude = '0',
        speed = '0',
        emergency = false
    })
end, false)


-- Register command to set squawk code
RegisterCommand('setsquawk', function(source, args)
    squawkCode = tonumber(args[1]) or 1200
    if squawkCode == 7700 then
        emergency = true
    else
        emergency = false
    end
    TriggerServerEvent('radar:setSquawk', squawkCode)
end, false)

-- Main thread to update radar data
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if radarEnabled then
            local playerPed = PlayerPedId()
            if IsPedInAnyPlane(playerPed) or IsPedInAnyHeli(playerPed) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local coords = GetEntityCoords(vehicle)
                local altitude = coords.z
                local speed = GetEntitySpeed(vehicle) * 3.6 -- Convert to km/h
                
                if altitude > radarFloor then
                    SendNUIMessage({
                        action = "updateRadar",
                        callsign = transponderEnabled and callsign or "N/A",
                        squawk = squawkCode,
                        altitude = math.floor(altitude),
                        speed = math.floor(speed),
                        emergency = emergency
                    })
                else
                    SendNUIMessage({action = "clearRadar"})
                end
            else
                SendNUIMessage({action = "clearRadar"})
            end
        end
    end
end)

-- Register NUI callbacks for closing radar
RegisterNUICallback('closeRadar', function(data, cb)
    radarEnabled = false
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Handle updates from server
RegisterNetEvent('radar:updateCallsign')
AddEventHandler('radar:updateCallsign', function(newCallsign)
    callsign = newCallsign
end)

RegisterNetEvent('radar:updateSquawk')
AddEventHandler('radar:updateSquawk', function(newSquawkCode)
    squawkCode = newSquawkCode
    emergency = (newSquawkCode == 7700)
end)

RegisterNetEvent('radar:updateTransponder')
AddEventHandler('radar:updateTransponder', function(state)
    transponderEnabled = state
end)

RegisterNetEvent('radar:receiveAircraftData')
AddEventHandler('radar:receiveAircraftData', function(data)
    callsign = data.callsign
    squawkCode = data.squawkCode
    transponderEnabled = data.transponderEnabled
end)

RegisterCommand('radar', function()
    radarEnabled = not radarEnabled
    if radarEnabled then
        SendNUIMessage({action = "openRadar"})
        print("Radar opened") -- Debug log
    else
        SendNUIMessage({action = "closeRadar"})
        print("Radar closed") -- Debug log
    end
end, false)
