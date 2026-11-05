local isOpen = false

local function getState()
    local ped = PlayerPedId()
    local c = GetEntityCoords(ped)
    return { x = c.x, y = c.y, z = c.z, h = GetEntityHeading(ped) }
end

local function setOpen(state)
    if isOpen == state then return end
    isOpen = state
    SetNuiFocus(state, state)
    SendNUIMessage({ action = state and 'open' or 'close' })

    if state then
        CreateThread(function()
            while isOpen do
                SendNUIMessage({ action = 'coords', data = getState() })
                Wait(100)
            end
        end)
    end
end

RegisterNetEvent('afkcoords:toggle', function()
    setOpen(not isOpen)
end)

RegisterNUICallback('close', function(_, cb)
    cb('ok')
    setOpen(false)
end)

RegisterNUICallback('teleport', function(data, cb)
    cb('ok')

    local x, y, z, h = tonumber(data.x), tonumber(data.y), tonumber(data.z), tonumber(data.h)
    if not (x and y and z) then return end

    local ped = PlayerPedId()
    local entity = ped
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
        entity = veh
    end

    DoScreenFadeOut(250)
    while not IsScreenFadedOut() do Wait(0) end

    FreezeEntityPosition(entity, true)
    RequestCollisionAtCoord(x, y, z)
    SetEntityCoordsNoOffset(entity, x, y, z, false, false, false)
    if h then SetEntityHeading(entity, h) end

    local tries = 0
    while not HasCollisionLoadedAroundEntity(entity) and tries < 50 do
        RequestCollisionAtCoord(x, y, z)
        Wait(100)
        tries = tries + 1
    end

    FreezeEntityPosition(entity, false)
    DoScreenFadeIn(250)
end)

AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() and isOpen then
        SetNuiFocus(false, false)
    end
end)
