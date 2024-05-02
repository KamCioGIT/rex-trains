local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------
-- spawn train function
---------------------------
local function SpawnTrain(trainid, route, trainhash, startcoords)
    SetRandomTrains(false)
    local trainWagons = GetNumCarsFromTrainConfig(trainhash)
    for wagonIndex = 0, trainWagons - 1 do
        local trainWagonModel = GetTrainModelFromTrainConfigByCarIndex(trainhash, wagonIndex)
        while not HasModelLoaded(trainWagonModel) do
            RequestModel(trainWagonModel, 1)
            Wait(100)
        end
    end
    train = CreateMissionTrain(trainhash, startcoords, 0, 0, 1, 0)
    SetTrainSpeed(train, 0.0)
    SetVehicleCanBeTargetted(train, false)
    NetworkRegisterEntityAsNetworked(train)
    SetModelAsNoLongerNeeded(train)
    return train
end

---------------------------
-- send info to spawn train / train track switches / train route
---------------------------
Citizen.CreateThread(function()
    for k, v in ipairs(Config.TrainSetup) do
        SpawnTrain(v.trainid, v.route, v.trainhash, v.startcoords)
        SetTransportConfigFlag(train, 0, 1)
        TriggerEvent('rex-trains:client:trackswithches', train, v.route)
        TriggerEvent('rex-trains:client:startroute', train, v.route, v.trainname)
    end
end)

---------------------------
-- train track switching system
---------------------------
RegisterNetEvent('rex-trains:client:trackswithches', function(train, route)

    while true do
        Wait(0)
        local coords = GetEntityCoords(train)
        local traincoords = vector3(coords.x, coords.y, coords.z)
        -- valentine route
        if train ~= nil and route == 'trainRouteOne' then
            -- set track switching
            for i = 1, #Config.RouteOneTrainSwitches do
                local switchdist = #(Config.RouteOneTrainSwitches[i].coords - traincoords)
                if switchdist < 15 then
                    SetTrainTrackJunctionSwitch(Config.RouteOneTrainSwitches[i].trainTrack, Config.RouteOneTrainSwitches[i].junctionIndex, Config.RouteOneTrainSwitches[i].enabled)
                    Citizen.InvokeNative(0x3ABFA128F5BF5A70, Config.RouteOneTrainSwitches[i].trainTrack, Config.RouteOneTrainSwitches[i].junctionIndex, Config.RouteOneTrainSwitches[i].enabled)
                end
            end
        end
        -- big loop route
        if train ~= nil and route == 'trainRouteTwo' then
            -- set track switching
            for i = 1, #Config.RouteTwoTrainSwitches do
                local switchdist = #(Config.RouteTwoTrainSwitches[i].coords - traincoords)
                if switchdist < 15 then
                    SetTrainTrackJunctionSwitch(Config.RouteTwoTrainSwitches[i].trainTrack, Config.RouteTwoTrainSwitches[i].junctionIndex, Config.RouteTwoTrainSwitches[i].enabled)
                    Citizen.InvokeNative(0x3ABFA128F5BF5A70, Config.RouteTwoTrainSwitches[i].trainTrack, Config.RouteTwoTrainSwitches[i].junctionIndex, Config.RouteTwoTrainSwitches[i].enabled)
                end
            end
        end
        -- saint denis tram route
        if train ~= nil and route == 'tramRouteOne' then
            -- set track switching
            for i = 1, #Config.RouteOneTramSwitches do
                local switchdist = #(Config.RouteOneTramSwitches[i].coords - traincoords)
                if switchdist < 15 then
                    SetTrainTrackJunctionSwitch(Config.RouteOneTramSwitches[i].trainTrack, Config.RouteOneTramSwitches[i].junctionIndex, Config.RouteOneTramSwitches[i].enabled)
                    Citizen.InvokeNative(0x3ABFA128F5BF5A70, Config.RouteOneTramSwitches[i].trainTrack, Config.RouteOneTramSwitches[i].junctionIndex, Config.RouteOneTramSwitches[i].enabled)
                end
            end
        end
    end

end)

---------------------------
-- train/tram route system
---------------------------
RegisterNetEvent('rex-trains:client:startroute', function(train, route, trainname)

    while true do
        Wait(0)
        local coords = GetEntityCoords(train)
        local traincoords = vector3(coords.x, coords.y, coords.z)
        if train ~= nil and route == 'trainRouteOne' then
            -- train route
            for i = 1, #Config.RouteTwoTrainStops do
                local distance = #(Config.RouteOneTrainStops[i].coords - traincoords)
                local stopspeed = 0.0
                local cruisespeed = 5.0
                local fullspeed = 15.0
                if distance < Config.RouteOneTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, cruisespeed)
                    Wait(1000)
                    if distance < Config.RouteOneTrainStops[i].dst2 then
                        SetTrainCruiseSpeed(train, stopspeed)
                        TriggerTrainWhistle(train, "STOPPED", 1, 0)
                        Config.PrintDebug(trainname.. ' stopped at '..Config.RouteOneTrainStops[i].name)
                        Wait(Config.RouteOneTrainStops[i].waittime)
                        TriggerTrainWhistle(train, "NEXT_STATION", 1, 0)
                        Config.PrintDebug(trainname.. ' is leaving '..Config.RouteOneTrainStops[i].name)
                        SetTrainCruiseSpeed(train, cruisespeed)
                        Wait(10000)
                    end
                elseif distance > Config.RouteOneTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, fullspeed)
                    Wait(25)
                end
            end
        end
        if train ~= nil and route == 'trainRouteTwo' then
            -- train route
            for i = 1, #Config.RouteTwoTrainStops do
                local distance = #(Config.RouteTwoTrainStops[i].coords - traincoords)
                local stopspeed = 0.0
                local cruisespeed = 5.0
                local fullspeed = 15.0
                if distance < Config.RouteTwoTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, cruisespeed)
                    Wait(1000)
                    if distance < Config.RouteTwoTrainStops[i].dst2 then
                        SetTrainCruiseSpeed(train, stopspeed)
                        TriggerTrainWhistle(train, "STOPPED", 1, 0)
                        Config.PrintDebug(trainname.. ' stopped at '..Config.RouteTwoTrainStops[i].name)
                        Wait(Config.RouteTwoTrainStops[i].waittime)
                        TriggerTrainWhistle(train, "NEXT_STATION", 1, 0)
                        Config.PrintDebug(trainname.. ' is leaving '..Config.RouteTwoTrainStops[i].name)
                        SetTrainCruiseSpeed(train, cruisespeed)
                        Wait(10000)
                    end
                elseif distance > Config.RouteTwoTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, fullspeed)
                    Wait(25)
                end
            end
        end
        if train ~= nil and route == 'tramRouteOne' then
            -- train route
            for i = 1, #Config.RouteOneTramStops do
                local distance = #(Config.RouteOneTramStops[i].coords - traincoords)
                local stopspeed = 0.0
                local cruisespeed = 1.0
                local fullspeed = 2.0
                if distance < Config.RouteOneTramStops[i].dst then
                    SetTrainCruiseSpeed(train, cruisespeed)
                    Wait(1000)
                    if distance < Config.RouteOneTramStops[i].dst2 then
                        SetTrainCruiseSpeed(train, stopspeed)
                        Config.PrintDebug(trainname.. ' stopped at '..Config.RouteOneTramStops[i].name)
                        Wait(Config.RouteOneTramStops[i].waittime)
                        Config.PrintDebug(trainname.. ' is leaving '..Config.RouteOneTramStops[i].name)
                        SetTrainCruiseSpeed(train, cruisespeed)
                        Wait(10000)
                    end
                elseif distance > Config.RouteOneTramStops[i].dst then
                    SetTrainCruiseSpeed(train, fullspeed)
                    Wait(25)
                end
            end
        end
    end
    
end)

-------------------------------------------------------------------------------
-- setup train blips
-------------------------------------------------------------------------------
function trainChecker(train)
    if IsThisModelATrain(GetEntityModel(train)) then
        local trainTrailerNumber = Citizen.InvokeNative(0x60B7D1DCC312697D, train)
        local isTrainIsReal = GetTrainCarriage(train,trainTrailerNumber-1)
        if isTrainIsReal ~= 0 then
            if not Citizen.InvokeNative(0x9FA00E2FC134A9D0, train) then
                local createdBlip = addBlipToTrain(-399496385, train, "Train")
                print("train blip created.", createdBlip)
            end
        end
    end
end

function addBlipToTrain(blipType,train,blipText)
    local blip = Citizen.InvokeNative(0x23f74c2fda6e7c61, blipType, train)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, blipText)
    return blip
end

function getTrains()
    local handle, firstVehicle = FindFirstVehicle()
    trainChecker(firstVehicle)
    local isExist, nextVeh = FindNextVehicle(handle)
    while isExist do
        trainChecker(nextVeh)
        isExist, nextVeh = FindNextVehicle(handle)
    end
    EndFindVehicle(handle)
end

Citizen.CreateThread(function()
    while true do
        getTrains()
        Wait(10000)
    end
end)
