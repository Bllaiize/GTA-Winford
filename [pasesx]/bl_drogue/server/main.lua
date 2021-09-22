    RegisterNetEvent("test")
    AddEventHandler('test', function(cordd, id)
            MySQL.Async.fetchAll('SELECT * FROM bl_teleport', {},
            function(resultA) -- Ne lis pas les variable extérieur
                local numberofresult = #resultA
                for a = 1, numberofresult do -- Passe la base de donnée
                    local xresult = resultA[a].entrer_x
                    local yresult = resultA[a].entrer_y
                    local zresult = resultA[a].entrer_z

                    local x = resultA[a].sortie_x
                    local y = resultA[a].sortie_y
                    local z = resultA[a].sortie_z

                    local posA = vector3(xresult, yresult, zresult)
                    local resultdistA = #(posA - cordd)

                    if resultdistA < 5 then 
                        print(x,' ',y,' ',z)
                        -- local id = GetPlayerServerId()
                        print(id)
                        TriggerClientEvent('eventNametest', id, x,y,z)
                    end
                end
            end)


            -- for a = 0, i do -- Passe la base de donnée
            --     local xresult = result[a].entrer_x
            --     local yresult = result[a].enter_y
            --     local zresult = result[a].enter_z

            --     print(xresult)
            --     print(yresult)
            --     print(zresult)

                -- for a=1 do -- Compare avec les coordonée joueurs

                -- end

    end)