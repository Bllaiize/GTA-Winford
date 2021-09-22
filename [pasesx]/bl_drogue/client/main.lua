RegisterCommand("co", function(source, args, rawcommand)
    local pos = GetEntityCoords(PlayerPedId())
    print(pos.x..", "..pos.y..", "..pos.z)
end, false)

RegisterCommand("ca", function(source, args, rawcommand)
    local pos = GetEntityCoords(PlayerPedId())
    local pointB = vector3(1121.897, -3195.338, -40.4025) -- Le point de sortie de la zones des billets
    local resultdistA = #(pointB - pos)

    print(resultdistA)

end, false)

RegisterCommand("cf", function(source, args, rawcommand)
    RequestIpl('Document_Forgery_Office')
    GetInteriorAtCoordsWithType(-1504.08,1316.3,137.72,'OilfieldsBunker')    

end, false)

Citizen.CreateThread(function()

    -- ###################################
    -- #            Bunker               #
    -- ###################################

    Citizen.wait(1000)
    GunrunningBunker.Ipl.Interior.Load()
    Citizen.wait(1000)

    GunrunningBunker.Style.Set(GunrunningBunker.Style.yellow, true)
    GunrunningBunker.Tier.Set(GunrunningBunker.Tier.upgrade, true)
    GunrunningBunker.Security.Set(GunrunningBunker.Security.upgrade, true)
    GunrunningBunker.Security.Set(GunrunningBunker.Security.upgrade, true)

    GunrunningBunker.Details.Enable(GunrunningBunker.Details.office, true, true)
    GunrunningBunker.Details.Enable(GunrunningBunker.Details.officeLocked, true, true)
    GunrunningBunker.Details.Enable(GunrunningBunker.Details.rangeLights, true, true)
    GunrunningBunker.Details.Enable(GunrunningBunker.Details.rangeWall, true, true)
    GunrunningBunker.Details.Enable(GunrunningBunker.Details.rangeLocked, true, true)
    GunrunningBunker.Details.Enable(GunrunningBunker.Details.schematics, true, true)

    RefreshInterior(GunrunningBunker.interiorId)

    -- ###################################
    -- #       Test IPL Appartement      #
    -- ###################################

    



end)

Citizen.CreateThread(function()
    while true do 
        local interval = 1
        local devantPorte = false
        local Entity = PlayerPedId()
        local pos = GetEntityCoords(PlayerPedId()) -- Les coordonnée du joueur
        local id = GetPlayerServerId(PlayerId())

        -- Point D'imprimante a billet 
        -- Entree
        local pointA = vector3(661.86, -2644.22, 8.40) -- Le point de récup d'entrée de la zone des billets
        local resultdistA = #(pointA - pos)
        -- Sortie 
        local pointB = vector3(1121.897, -3195.338, -40.4025) -- Le point de sortie de la zones des billets
        local resultdistB = #(pointB - pos)

        for f,v in pairs(Config.Zones) do
            for i=1, #v.Entree, 1 do
                if GetDistanceBetweenCoords(pos, v.Entree[i], true) < Config.Size.x then 
                    AddTextEntry("HELP", "Appuyez sur ~b~E ~s~pour entrer dans cette zone")
                    DisplayHelpTextThisFrame("Help", false)
                    if IsControlJustPressed(1, 51) then
                        print("E")
                        local cordd = GetEntityCoords(PlayerPedId())
                        print(Entity)
                        TriggerServerEvent('test', cordd, id)
                    end 
                end
            end 
            for a=1, #v.Sortie, 1 do
                if GetDistanceBetweenCoords(pos, v.Sortie[a], true) < Config.Size.x then
                    AddTextEntry("HELP", "Appuyez sur ~b~E ~s~pour sortir de cette zone")
                    DisplayHelpTextThisFrame("Help", false) 
                    if IsControlJustPressed(1, 51) then
                        print("E")
                        local cordd = GetEntityCoords(PlayerPedId())
                        TriggerServerEvent('test', cordd, id)
                    end 
                end
            end
        end


        
        -- if (resultdistA > 20) or not (resultdistB > 20) then 
        --     interval = 20
        -- else 
        --     interval = 1
        --     --Marche jusque la
        --     -- Entrée Billet
        --     if resultdistA < 10 then 
        --         print("test1")
        --         AddTextEntry("HELP", "Appuyez sur ~b~E ~s~pour entrer dans cette zone")
        --         DisplayHelpTextThisFrame("Help", false)
        --         if IsControlJustPressed(1, 51) then --Si la touche E est entré à moins de 2M de la zone 
        --             SetEntityCoords(Entity, 1121.897, -3195.338, -40.4025)
        --         end
        --     end
        --     -- Sortie Billet
        --     if resultdistB < 10 then
        --         print("test2")
        --         AddTextEntry("HELP", "Appuyez sur ~b~E ~s~pour sortir de cette zone")
        --         DisplayHelpTextThisFrame("Help", false)
        --         if IsControlJustPressed(1, 51) then --Si la touche E est entré à moins de 2M de la zone 
                    -- SetEntityCoords(Entity, 661.76, -2643.30, 8.40)
        --         end
        --     end
        -- end
        Citizen.Wait(interval)
    end
end)

RegisterNetEvent('eventNametest')
AddEventHandler('eventNametest', function(x,y,z)
    local Entity = PlayerPedId()

    SetEntityCoords(Entity, 1121.897, -3195.338, -40.4025)

end)
