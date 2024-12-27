RegisterCommand('car', function(source, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Oops, ' .. vehicleName .. ' is not a Vehicle.', }
        })
        
        return
        
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local pos       = GetEntityCoords(playerPed)
    local heading   = GetEntityHeading(playerPed)

    local vehicle   = CreateVehicle(
        vehicleName,
        pos,
        heading,
        true
    )

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)