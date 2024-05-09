

local cipeczka={}
local COOLDOWN_SEJF = Config.Cooldown

local napadajacy_sejf = false

--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
ESX.RegisterServerCallback('fraud:cooldown_sejf',function(source,cb)
    if napadajacy_sejf == false then
        if not cipeczka[source] or (GetGameTimer() - cipeczka[source]) >= COOLDOWN_SEJF*1000 then
            cb(true)
        else
            local ile_zostalo = (cipeczka[source] + COOLDOWN_SEJF*1000 - GetGameTimer() )/1000; ile_zostalo = math.floor(ile_zostalo + 0.5)
            cb(ile_zostalo)
        end
    else
        cb('napada')
    end
end)


ESX.RegisterServerCallback('klamer:policecounter'
, function(soure,cb)
    local xPlayers = ESX.GetPlayers()  -- Pobiera listę zalogowanych graczy
    local count = 0

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == Config.PoliceJobName then
            count = count + 1
        end
    end
    if count >= Config.minPoliceCount  then
        cb(true)
        return
    end
    cb(false)
end)


--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--

RegisterNetEvent('fraud:dodaj_do_cooldownu_sejf')
AddEventHandler('fraud:dodaj_do_cooldownu_sejf',function()
    cipeczka[source] = GetGameTimer()+COOLDOWN_SEJF*1000
    napadajacy_sejf = true
    Citizen.Wait(Config.Robbery_time*900)
    napadajacy_sejf = false
end)


--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
RegisterNetEvent('IsDamageTrackerActiveOnNetworkId(netID)')
AddEventHandler('IsDamageTrackerActiveOnNetworkId(netID)',function()
    local ile_kasy =  math.random(Config.Money[1],Config.Money[2])
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Reward_item,ile_kasy)
end)


--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--