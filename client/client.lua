local RSGCore = exports['rsg-core']:GetCoreObject()

Citizen.CreateThread(function()
    for bank, v in pairs(Config.BankLocations) do
        
        exports['rsg-target']:AddCircleZone(v.name, v.coords, 1, {
            name = v.name,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "client",
                    icon = "fas fa-dollar-sign",
                    label = "Open " .. v.name,
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent('re2-bank:openBank', bank)
                    end,
                },
            },
            distance = 2.0,
        })
        if v.showblip == true then
            local StoreBlip = N_0x554d9d53f696d002(1664425300, v.coords)
            SetBlipSprite(StoreBlip, -2128054417, 52)
            SetBlipScale(StoreBlip, 0.2)
        end
    end
end)




RegisterNetEvent('re2-bank:openBank', function(bankId)
    local player = RSGCore.Functions.GetPlayerData()
    local money = player.money
    local bankLocation = Config.BankLocations[bankId]
    local charinfo = player.charinfo
    exports['rsg-menu']:openMenu({
        {
            header = "Welcome To " .. bankLocation.name,
            txt = charinfo.firstname .. " " .. charinfo.lastname,
            isMenuHeader = true,
        },
        {
            header = "Personal Info ",
            txt = charinfo.firstname .. " " .. charinfo.lastname,
            disabled = true,
        },
        {
            header = "Chash : " .. money.cash .. " $",
            disabled = true,
        },
        {
            header = "Bank : " .. money[bankLocation.bankType] .. " $",
            disabled = true,
        },
        {
            header = "Deposit",
            txt = "Deposit Money To Bank",
            params = {
                event = 're2-bank:deposit',
                args = {
                    bankType = bankLocation.bankType
                }
            }
        },
        {
            header = "Withdraw",
            txt = "Withdraw Money From Bank",
            params = {
                event = 're2-bank:withdraw',
                args = {
                    bankType = bankLocation.bankType
                }
            }
        },
    
    })
end)

RegisterNetEvent('re2-bank:withdraw', function(data)
    local inputdata = exports['rsg-input']:ShowInput({
        header = "Withfraw",
        submitText = "withdraw",
        inputs = {
            {
                text = "amount",
                input = "amount",
                type = "number",
                isRequired = true
            },
        }
    })
    if inputdata ~= nil then
        for k, v in pairs(inputdata) do
            TriggerServerEvent('re2-bank:server:withdraw', v, data)
        end
    end
end)

RegisterNetEvent('re2-bank:deposit', function(data)
    local inputdata = exports['rsg-input']:ShowInput({
        header = "Deposit",
        submitText = "deposit",
        inputs = {
            {
                text = "amount",
                input = "amount",
                type = "number",
                isRequired = true
            },
        }
    })
    if inputdata ~= nil then
        for k, v in pairs(inputdata) do
            TriggerServerEvent('re2-bank:server:deposit', v, data)
        end
    end
end)
