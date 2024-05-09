
--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--

function Notify(text1,text2,time,type)
    if Config.Notify == 'oxlib' then lib.notify({title = text1,description = text2,type = type}) elseif Config.Notify == 'okokNotify' then exports['okokNotify']:Alert(text1,text2,time,type) elseif Config.Notify == 'mythic' then exports['mythic_notify']:DoHudText(type, text1..' '..text2) end
end
--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
Citizen.CreateThread(function()
    for i,v in pairs(Config.Coords) do 
        local a = v.vault
        exports.qtarget:AddBoxZone("cipa",vec3(a.x,a.y,a.z-1), 0.75, 0.75, {
                name="cwel",
                heading=40.0,
                debugPoly=false,
                minZ=a.z-2,
                maxZ=a.z+2,
                }, 
                {
                     options = {
                        {
                            name = 'box',
                            event ='klamer_napady:sejf',
                            icon = 'fa-solid fa-vault',
                            iconColor = 'gray',
                            label = 'Open vault',
                            sklep = i,
                            kordy = vec3(a.x,a.y,a.z-1)
                        }
                    },
                    distance = 1
            })
    end

end)

--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
local ma_juz_napad = false
local szafka_z_kodem = nil
local kod = ''
local szafki ={}
local dobry_kod = 0
local szafki_all = {} 
local szuka_kodu = false

function clear_napad()
    for i,v in ipairs(szafki_all) do
        exports.ox_target:removeZone(v)
    end
    ma_juz_napad = false
    szafka_z_kodem = nil
    kod = ''
    szafki ={}
    dobry_kod = 0
    szafki_all = {} 
end


--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
function randomId()
    math.randomseed(GetCloudTimeAsInt())
    return string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function(c)
        return string.format("%x", (c == "x") and math.random(0, 0xf) or math.random(8, 0xb))
    end)
end
function GetStreetAndZone()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = street1 .. ", " .. zone
    return street
end
AddEventHandler('klamer_napady:sejf',function(data)
    ESX.TriggerServerCallback('fraud:cooldown_sejf',function(coldown)
        if coldown == 'napada' then
            Notify('Failed', 'You have to wait because someone has already robbery the safe', 5000, 'info')
            return
        end
        if coldown == true then
        if ma_juz_napad == true then
        local input = lib.inputDialog('VAULT', {'INPUT PIN'})
        if not input then return end
        if json.encode(input[1]) == '"'..kod..'"' then
            ESX.TriggerServerCallback('klamer:policecounter', function(enough_police) 
            if enough_police then
            Notify('You entered the correct code', 'The safe was opened', 2500, 'success')
            TriggerServerEvent('fraud:dodaj_do_cooldownu_sejf')
            clear_napad()
            if Config.UseDispatch == true then
                local coordy_pedofila = GetEntityCoords(GetPlayerPed(-1))
                local cwelcweldziwka = {
                code = "",
                street = GetStreetAndZone(),
                id = randomId(),
                priority = 2,
                title = "the store's security alarm went off",
                duration = 10000,
                blipname = '# STORE`S SECURITY ALARM !',
                color = 1,
                sprite = 161,
                fadeOut = Config.Robbery_time,
                position = {
                    x = coordy_pedofila.x,
                    y = coordy_pedofila.y,
                    z = coordy_pedofila.z
                },
                job = Config.PoliceJobName}
                TriggerServerEvent("dispatch:svNotify", cwelcweldziwka)
            end

            if lib.progressCircle({
                label = 'you take the money',
                duration = Config.Robbery_time*1000,
                position = 'middle',
                useWhileDead = false,
                canCancel = true,
                disable = { car = true, move = true, combat = true },
                anim = { dict = 'anim@heists@ornate_bank@grab_cash', clip = 'grab' }
            }) then
                Notify('The robbery is over', '', 2500, 'info')
                szuka_kodu = false
                TriggerServerEvent('IsDamageTrackerActiveOnNetworkId(netID)')
            else
                Notify('The robbery is over', '', 2500, 'info')
            end
        else
         Notify('you cant start a robbery', 'there are not enough police', 2500, 'error')
        end
        end)
        else
            Notify('WRONG PIN ENTERED', 'Unable to open the safe.', 2500, 'error')
        end
        return
    end
    ma_juz_napad = true
    szuka_kodu = true
    Notify("You don't have a code"," Look for it in the store", 5000, 'info')
    local sklep = data.sklep
    Citizen.CreateThread(function()
        for i,v in pairs(Config.Coords) do
            if i == sklep then
                gen_kodu(v.code)
                gen_kodu2()
                for x,a in ipairs(v.code) do
                    local xxx = exports.qtarget:AddBoxZone("cipa",a, 0.75, 0.75, {
                            name="cwel",
                            heading=40.0,
                            debugPoly=false,
                            minZ=a.z-2,
                            maxZ=a.z+2,
                            }, 
                            {
                                options = {
                                    {
                                        name = 'box',
                                        event ='klamer_napady:szukaj-kodu',
                                        icon = 'fa-regular fa-folder-open',
                                        iconColor = 'gray',
                                        label = 'Find code',
                                        id = x
                                    }
                                },
                                distance = 1
                        })
                        table.insert(szafki_all,xxx)
                end
            end
        end
    end)
    glowny_loop(data.kordy)

else
    Notify('You cant start robbery yet', 'you have to wait '..coldown..' seconds left', 2500, 'info')
end
end)

end)


--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--

function gen_kodu(______Kl4m3R___d__e___v)
    local dostepneLokalizacje = {}
      
    for _, v in ipairs(______Kl4m3R___d__e___v) do
        table.insert(dostepneLokalizacje, v)
    end
  
    if #dostepneLokalizacje > 0 then
        local losowyIndex = math.random(1, #dostepneLokalizacje)
        szafka_z_kodem = losowyIndex
    else
        return nil
    end
end

--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
function gen_kodu2()    
    for i = 1, 6 do                             
        local digit = math.random(0, 9)  -- Losowanie cyfry od 0 do 9
        kod = kod .. tostring(digit)  -- Dodanie cyfry do hasła
    end
end



--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
function glowny_loop(coords)
    while szuka_kodu do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - coords)
        if distance > 15 then
            Notify('Robbery stopped', '', 2500, 'info')
            szuka_kodu = false
            clear_napad()
            break
        end
        Citizen.Wait(1000)
    end
end

--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--
local przeszukane = {}
AddEventHandler('klamer_napady:szukaj-kodu',function(data)
    if dobry_kod == data.id then
        Notify('You found code, remember it','Code is: '..kod, 10000, 'success')
        return
    end
    for i,v in pairs(szafki) do
        if v == data.id then
            Notify("You've already looked here",'keep searching', 2500, 'info')
            return
        end
    end
    RequestAnimDict("missheist_agency2aig_13")
    while (not HasAnimDictLoaded("missheist_agency2aig_13")) do
        Citizen.Wait(1) 
    end
    TaskPlayAnim(PlayerPedId(), 'missheist_agency2aig_13', 'pickup_briefcase', 10.0, -8.0, -1, 49, 0, false, false, false)
    local success = lib.skillCheck({{areaSize = 30, speedMultiplier = 1.0},{areaSize = 30, speedMultiplier = 1.0},{areaSize = 30, speedMultiplier = 1.0}}, {'w', 'a', 's', 'd'})
    ClearPedTasks(PlayerPedId())
    if success then
        if data.id == szafka_z_kodem then
            Notify('You found code, remember it','Code is: '..kod, 10000, 'success')
            dobry_kod = data.id
        else
            table.insert(szafki,data.id)
            Notify("there is nothing here",'keep searching', 2500, 'info')
        end
    end
end)

--
---
----
-----  DISCORD:::  klamer.dev
-----
----
---
--