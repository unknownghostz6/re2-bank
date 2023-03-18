local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('re2-bank:server:withdraw')
AddEventHandler('re2-bank:server:withdraw', function(amount, data)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentBankAmount = xPlayer.Functions.GetMoney(data.bankType)
    local requestAmount = tonumber(amount)
    if currentBankAmount >= requestAmount then
        xPlayer.Functions.RemoveMoney(data.bankType, requestAmount, 'banking-quick-withdraw')
        xPlayer.Functions.AddMoney('cash', requestAmount, 'banking-quick-withdraw')
        TriggerClientEvent('RSGCore:Notify', src, "You withdraw "..amount.." from Bank" , 'success')

    else
        TriggerClientEvent('RSGCore:Notify', src, "U dont Have this Much Money in your Bank", 'error')
    end
end)

RegisterServerEvent('re2-bank:server:deposit')
AddEventHandler('re2-bank:server:deposit', function(amount, data)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentCashAmount = xPlayer.Functions.GetMoney("cash")
    local requestAmount = tonumber(amount)
    if currentCashAmount >= requestAmount then
        xPlayer.Functions.RemoveMoney("cash", requestAmount, 'banking-quick-deposit')
        xPlayer.Functions.AddMoney(data.bankType, requestAmount, 'banking-quick-deposit')
        TriggerClientEvent('RSGCore:Notify', src, "You Deposit "..amount.." To Bank" , 'success')
    else
        TriggerClientEvent('RSGCore:Notify', src, "U dont Have this Much Money in your Packet", 'error')
    end
end)
