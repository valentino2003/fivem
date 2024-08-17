local aircraftData = {}

-- Event handler for setting callsign
RegisterNetEvent('radar:setCallsign')
AddEventHandler('radar:setCallsign', function(callsign)
    local _source = source
    if not aircraftData[_source] then
        aircraftData[_source] = {}
    end
    aircraftData[_source].callsign = callsign
    TriggerClientEvent('radar:updateCallsign', _source, callsign)
end)

-- Event handler for setting squawk code
RegisterNetEvent('radar:setSquawk')
AddEventHandler('radar:setSquawk', function(squawkCode)
    local _source = source
    if not aircraftData[_source] then
        aircraftData[_source] = {}
    end
    aircraftData[_source].squawkCode = squawkCode
    TriggerClientEvent('radar:updateSquawk', _source, squawkCode)
end)

-- Event handler for toggling transponder
RegisterNetEvent('radar:toggleTransponder')
AddEventHandler('radar:toggleTransponder', function(transponderState)
    local _source = source
    if not aircraftData[_source] then
        aircraftData[_source] = {}
    end
    aircraftData[_source].transponderEnabled = transponderState
    TriggerClientEvent('radar:updateTransponder', _source, transponderState)
end)

-- Event handler for getting initial aircraft data
RegisterNetEvent('radar:getAircraftData')
AddEventHandler('radar:getAircraftData', function()
    local _source = source
    if not aircraftData[_source] then
        aircraftData[_source] = {
            callsign = "N/A",
            squawkCode = 1200,
            transponderEnabled = true
        }
    end
    TriggerClientEvent('radar:receiveAircraftData', _source, aircraftData[_source])
end)

-- Cleanup data when player disconnects
AddEventHandler('playerDropped', function(reason)
    local _source = source
    aircraftData[_source] = nil
end)
