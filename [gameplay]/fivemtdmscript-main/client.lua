local spawnPos = vector3(-969.88, -3162.98, 13.94)
local spawnPos1 = vector3(1228.65, 136.78, 81.95)

RegisterNetEvent("red")
AddEventHandler("red", function()
    exports.spawnmanager:setAutoSpawnCallback(function()
    exports.spawnmanager:spawnPlayer({
            x = spawnPos1.x,
            y = spawnPos1.y,
            z = spawnPos1.z,
            model = 'mp_m_freemode_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'WELCOME TO RED TEAM' }
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn(true)
    Citizen.Wait(1000)
    local ped = GetPlayerPed(PlayerId())
    local weapon = GetHashKey("WEAPON_COMBATPISTOL")
    GiveWeaponToPed(ped, weapon, 230, false, false)
    local weapon = GetHashKey("WEAPON_COMBATPDW")
    GiveWeaponToPed(ped, weapon, 250, false, false)
    local weapon = GetHashKey("WEAPON_CARBINERIFLE")
    GiveWeaponToPed(ped, weapon, 250, false, false)
    AddArmourToPed(ped,100)
    SetPedArmour(ped, 100)

    SetPedComponentVariation(ped, 9, 7, 1, 0)
    SetPedComponentVariation(ped, 11, 15, 0, 0)
    SetPedComponentVariation(ped, 3, 1, 0, 0)
    SetPedComponentVariation(ped, 11, 221, 20, 0)

    SetPedComponentVariation(ped, 4, 97, 9,0)
end)



RegisterNetEvent("blue")
AddEventHandler("blue", function()
    exports.spawnmanager:setAutoSpawnCallback(function()
    exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'mp_m_freemode_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'WELCOME TO THE BLUE TEAM' }
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn(true)
    Citizen.Wait(1000)
    local ped = GetPlayerPed(PlayerId())
    local weapon = GetHashKey("WEAPON_COMBATPISTOL")
    GiveWeaponToPed(ped, weapon, 230, false, false)
    local weapon = GetHashKey("WEAPON_COMBATPDW")
    GiveWeaponToPed(ped, weapon, 250, false, false)
    local weapon = GetHashKey("WEAPON_CARBINERIFLE")
    GiveWeaponToPed(ped, weapon, 250, false, false)
    AddArmourToPed(ped,100)
    SetPedArmour(ped, 100)
 
    SetPedComponentVariation(ped, 9, 7, 1, 0)
    SetPedComponentVariation(ped, 11, 15, 0, 0)
    SetPedComponentVariation(ped, 3, 1, 0, 0)
    SetPedComponentVariation(ped, 11, 221, 20, 0)

    SetPedComponentVariation(ped, 4, 97, 10,0)
end)


