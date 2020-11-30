


local Enabled = false
local Menus = {"Self", "Online", "Misc"}
local Menu_Selected = "Self"
local Button = 21 
local FirstOpen = true
local CleatLabels = false

esp_color = {r = 110, g = 0, b = 255}
main_color = {r = 255, g = 255, b = 255, a = 255}
second_color = {r = 12, g = 12, b = 12, a = 255 }





local allButtons = {
    20,
    21,
    22,
    23,
    26,
    29,
    30,
    32,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    47,
    56,
    57,
    58,
    59,
    74,
    107,
    108,
    109,
    110,
    112,
    117,
    118,
    121
}

function GetResolution()
    local W, H = GetActiveScreenResolution()
    if (W/H) > 3.5 then
        return GetScreenResolution()
    else
        return W, H
    end
end


local LoadModel = function(model)
    if type(model) == 'string' then
        model = GetHashKey(model)
    else
        if type(model) ~= 'number' then
            return false
        end
    end

    local timer = GetGameTimer() + 5000
    while not HasModelLoaded(model) do
        Wait(0)
        RequestModel(model)
        if GetGameTimer() >= timer then
            return false
        end
    end

    return model
end





local Spectating = false

local function SpectatePlayer(player)
	local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)

	if (Spectating) then
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		ShowNotification("~g~Successfully started spectating " .. GetPlayerName(targetPed))
	else
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(false, targetPed)

		ShowNotification("~g~Successfully stopped spectating " .. GetPlayerName(targetPed))
	end
end




local function ClonePed(target)
    local ped = GetPlayerPed(target)
    local me = PlayerPedId()
    
    hat = GetPedPropIndex(ped, 0)
    hat_texture = GetPedPropTextureIndex(ped, 0)
    
    glasses = GetPedPropIndex(ped, 1)
    glasses_texture = GetPedPropTextureIndex(ped, 1)
    
    ear = GetPedPropIndex(ped, 2)
    ear_texture = GetPedPropTextureIndex(ped, 2)
    
    watch = GetPedPropIndex(ped, 6)
    watch_texture = GetPedPropTextureIndex(ped, 6)
    
    wrist = GetPedPropIndex(ped, 7)
    wrist_texture = GetPedPropTextureIndex(ped, 7)
    
    head_drawable = GetPedDrawableVariation(ped, 0)
    head_palette = GetPedPaletteVariation(ped, 0)
    head_texture = GetPedTextureVariation(ped, 0)
    
    beard_drawable = GetPedDrawableVariation(ped, 1)
    beard_palette = GetPedPaletteVariation(ped, 1)
    beard_texture = GetPedTextureVariation(ped, 1)
    
    hair_drawable = GetPedDrawableVariation(ped, 2)
    hair_palette = GetPedPaletteVariation(ped, 2)
    hair_texture = GetPedTextureVariation(ped, 2)
    
    torso_drawable = GetPedDrawableVariation(ped, 3)
    torso_palette = GetPedPaletteVariation(ped, 3)
    torso_texture = GetPedTextureVariation(ped, 3)
    
    legs_drawable = GetPedDrawableVariation(ped, 4)
    legs_palette = GetPedPaletteVariation(ped, 4)
    legs_texture = GetPedTextureVariation(ped, 4)
    
    hands_drawable = GetPedDrawableVariation(ped, 5)
    hands_palette = GetPedPaletteVariation(ped, 5)
    hands_texture = GetPedTextureVariation(ped, 5)
    
    foot_drawable = GetPedDrawableVariation(ped, 6)
    foot_palette = GetPedPaletteVariation(ped, 6)
    foot_texture = GetPedTextureVariation(ped, 6)
    
    acc1_drawable = GetPedDrawableVariation(ped, 7)
    acc1_palette = GetPedPaletteVariation(ped, 7)
    acc1_texture = GetPedTextureVariation(ped, 7)
    
    acc2_drawable = GetPedDrawableVariation(ped, 8)
    acc2_palette = GetPedPaletteVariation(ped, 8)
    acc2_texture = GetPedTextureVariation(ped, 8)
    
    acc3_drawable = GetPedDrawableVariation(ped, 9)
    acc3_palette = GetPedPaletteVariation(ped, 9)
    acc3_texture = GetPedTextureVariation(ped, 9)
    
    mask_drawable = GetPedDrawableVariation(ped, 10)
    mask_palette = GetPedPaletteVariation(ped, 10)
    mask_texture = GetPedTextureVariation(ped, 10)
    
    aux_drawable = GetPedDrawableVariation(ped, 11)
    aux_palette = GetPedPaletteVariation(ped, 11) 	
    aux_texture = GetPedTextureVariation(ped, 11)

    SetPedPropIndex(me, 0, hat, hat_texture, 1)
    SetPedPropIndex(me, 1, glasses, glasses_texture, 1)
    SetPedPropIndex(me, 2, ear, ear_texture, 1)
    SetPedPropIndex(me, 6, watch, watch_texture, 1)
    SetPedPropIndex(me, 7, wrist, wrist_texture, 1)
    
    SetPedComponentVariation(me, 0, head_drawable, head_texture, head_palette)
    SetPedComponentVariation(me, 1, beard_drawable, beard_texture, beard_palette)
    SetPedComponentVariation(me, 2, hair_drawable, hair_texture, hair_palette)
    SetPedComponentVariation(me, 3, torso_drawable, torso_texture, torso_palette)
    SetPedComponentVariation(me, 4, legs_drawable, legs_texture, legs_palette)
    SetPedComponentVariation(me, 5, hands_drawable, hands_texture, hands_palette)
    SetPedComponentVariation(me, 6, foot_drawable, foot_texture, foot_palette)
    SetPedComponentVariation(me, 7, acc1_drawable, acc1_texture, acc1_palette)
    SetPedComponentVariation(me, 8, acc2_drawable, acc2_texture, acc2_palette)
    SetPedComponentVariation(me, 9, acc3_drawable, acc3_texture, acc3_palette)
    SetPedComponentVariation(me, 10, mask_drawable, mask_texture, mask_palette)
    SetPedComponentVariation(me, 11, aux_drawable, aux_texture, aux_palette)
end


function GetCurrentEspBoxColor()
    return esp_color
end

function GetMainColor()
    return main_color
end

function GetSecondColor()
    return second_color
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP8", TextEntry .. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end


    ClearLabels = true

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
        blockinput = false
        ClearLabels = false
		return result
	else
		Citizen.Wait(500)
        blockinput = false
        ClearLabels = false
		return nil
	end
end


function FormatXWYH(Value, Value2)
    return Value/1920, Value2/1080
end

function GetCharacterCount(str)
    local characters = 0
    for c in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        local a = c:byte(1, -1)
        if a ~= nil then
            characters = characters + 1
        end
    end
    return characters
end


local MouseDelay = 200


function MeasureStringWidthNoConvert(str, font, scale)
    BeginTextCommandWidth("STRING")
    AddLongString(str)
    SetTextFont(0)
    SetTextScale(0.3)
    return EndTextCommandGetWidth(true)
end

function GetByteCount(str)
    local bytes = 0

    for c in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        local a,b,c,d = c:byte(1, -1)
        if a ~= nil then
            bytes = bytes + 1
        end
        if b ~= nil then
            bytes = bytes + 1
        end
        if c ~= nil then
            bytes = bytes + 1
        end
        if d ~= nil then
            bytes = bytes + 1
        end
    end
    return bytes
end

function AddLongStringForAscii(str)
    local maxbytelength = 99
    for i = 0, GetCharacterCount(str), 99 do
        AddTextComponentSubstringPlayerName(string.sub(str, i, math.min(maxbytelength, GetCharacterCount(str) - i))) --needs changed
    end
end

function AddLongStringForUtf8(str)
    local maxbytelength = 99
    local bytecount = GetByteCount(str)

    if bytecount < maxbytelength then
        AddTextComponentSubstringPlayerName(str)
        return
    end

    local startIndex = 0

    for i = 0, GetCharacterCount(str), 1 do
        local length = i - startIndex
        if GetByteCount(string.sub(str, startIndex, length)) > maxbytelength then
            AddTextComponentSubstringPlayerName(string.sub(str, startIndex, length - 1))
            i = i - 1
            startIndex = startIndex + (length - 1)
        end
    end
    AddTextComponentSubstringPlayerName(string.sub(str, startIndex, GetCharacterCount(str) - startIndex))
end 

function AddLongString(str)
    local bytecount = GetByteCount(str)
    if bytecount == GetCharacterCount(str) then
        AddLongStringForAscii(str)
    else
        AddLongStringForUtf8(str)
    end
end

function getStrWidth(str, font, scale)
    BeginTextCommandWidth("STRING")
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font)
    SetTextScale(0.0, scale)
    return EndTextCommandGetWidth(true)
end

local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

function MeasureStringWidth(str, font, scale)


    return MeasureStringWidthNoConvert(str, font, scale) * 1920
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringWebsite(msg)
	DrawNotification(false, true)
end
function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function IsMouseInBounds(X, Y, Width, Height)
    local MX, MY = math.round(GetControlNormal(0, 239) * 1920), math.round(GetControlNormal(0, 240) * 1080)
    MX, MY = FormatXWYH(MX, MY)
    X, Y = FormatXWYH(X, Y)
    Width, Height = FormatXWYH(Width, Height)
    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
end




function DrawTitle()
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.0, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString("Batak.ltd")
    DrawText(0.43, 0.27)
end

function DrawTextHere(x,y, text)
    SetTextFont(2)
    SetTextProportional(1)
    SetTextScale(0.0, 0.3)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function ShowInfoAboutThisGuy(id)
    DrawRect(0.135, 0.2, 0.153, 0.005, 255, 255, 255, 255)
    DrawRect(0.135, 0.1, 0.153, 0.005, 255, 255, 255, 255)
    DrawRect(0.06, 0.15, 0.003, 0.1, 255, 255, 255, 255)
    DrawRect(0.21, 0.15, 0.003, 0.1, 255, 255, 255, 255)
    DrawRect(0.135, 0.15, 0.15, 0.095, 12, 12, 12, 240)

    local healthcolour = "~g~"

    if CreateButton(0.065, 0.11, 255,255,255, "Name > ~p~" .. GetPlayerName(id)) then
    
    end
    

    if GetEntityHealth(GetPlayerPed(id)) < 50 then
        healthcolour = "~r~"
    else
        healthcolour = "~g~"
    end

    if CreateButton(0.065, 0.13, 255,255,255, "Health > ".. healthcolour .."i" .. GetEntityHealth(GetPlayerPed(id))) then
    
    end


    print(id)
    
    
end


function OnlineCreateButton(x,y, r, g, b, text, id)
    SetTextFont(2)
    SetTextProportional(1)
    SetTextScale(0.0, 0.3)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    local lol = DrawText(x, y)

    local CursorX, CursorY = GetDisabledControlNormal(0, 239), GetDisabledControlNormal(0, 240)

    if (CursorY - y <= 0.02) and (CursorY - y >= 0.001) then
        local Start, End = x, x + getStrWidth(text, 2, 0.3)
            if (CursorX - Start >= -0.005) and (CursorX - End <= 0.005) then
                    ShowInfoAboutThisGuy(id)

                    if IsDisabledControlPressed(0, 142) and MouseDelay <= GetGameTimer()  then
                    MouseDelay = GetGameTimer() + 100
                    return true
            end
        end
    end
end


function CreateButton(x,y, r, g, b, text)
    SetTextFont(2)
    SetTextProportional(1)
    SetTextScale(0.0, 0.3)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    local lol = DrawText(x, y)

    local CursorX, CursorY = GetDisabledControlNormal(0, 239), GetDisabledControlNormal(0, 240)

    if (CursorY - y <= 0.02) and (CursorY - y >= 0.001) then
        local Start, End = x, x + getStrWidth(text, 2, 0.3)
            if (CursorX - Start >= -0.005) and (CursorX - End <= 0.005) then
                    SetCursorSprite(5)
                    SetTextColour(110, 0, 255, 255)
                    if IsDisabledControlPressed(0, 142) and MouseDelay <= GetGameTimer()  then
                    MouseDelay = GetGameTimer() + 100
                    return true
            end
        end
    
    end


end


local hovering = false

function MenuCreateButton(x,y, r, g, b, text)
    if Enabled then
    SetTextFont(2)
    SetTextProportional(1)
    SetTextScale(0.0, 0.3)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
    local CursorX, CursorY = GetDisabledControlNormal(0, 239), GetDisabledControlNormal(0, 240)
    if (CursorY - y <= 0.02) and (CursorY - y >= 0.001) then
        local Start, End = x, x + getStrWidth(text, 2, 0.3)
            if (CursorX - Start >= -0.005) and (CursorX - End <= 0.005) then
                    SetCursorSprite(5)
                    if IsDisabledControlPressed(0, 142) and MouseDelay <= GetGameTimer()  then
                    MouseDelay = GetGameTimer() + 100
                    return true
                end

            end
        end
    end
end


function CheckBox(x,y, r,g,b, text, bool, callback)
	local checked = "~r~OFF"
	if bool then
		checked = "~g~ON"
	end

	if CreateButton(x, y, r, g, b, text .. " > " .. checked) then
		bool = not bool
		callback(bool)
    
		return true
	end

	return false
end

function SelectMenu(x,y, r,g,b, text, bool, callback)

	if MenuCreateButton(x, y, r, g, b, text) then
		bool = not bool
        callback(bool)
        
		return true
	end

	return false
end


function SelectedMenu(menu)

    if menu == "selfmenu" then
        Menu_Selected = "Self"
    elseif menu == "onlinemenu" then
        Menu_Selected = "Online"
    elseif menu == "weaponmenu" then
        Menu_Selected = "Weapon"
    elseif menu == "misc" then
        Menu_Selected = "Misc"
    elseif menu == "visual" then
        Menu_Selected = "Visual"
    end
end



Citizen.CreateThread(
    function()
        while true do
            Wait(1)

            MenuCreateButton(
                0.38,
                0.03,
                255,
                255,
                255,
                "SHARKS MENU | SHARKMENU.COM | 1.0.6"
            )
            local ra = GetCurrentEspBoxColor()

            if Enabled then
                if
                    SelectMenu(
                        0.265,
                        0.272,
                        255,
                        255,
                        255,
                        "Self Options",
                        selfmenu,
                        function(enabled)
                            selfmenu = enabled
                        end
                    )
                 then
                    SelectedMenu("selfmenu")
                end

                if
                    SelectMenu(
                        0.325,
                        0.272,
                        255,
                        255,
                        255,
                        "Online Options",
                        onlinemenu,
                        function(enabled)
                            onlinemenu = enabled
                        end
                    )
                 then
                    SelectedMenu("onlinemenu")
                end

                if
                    SelectMenu(
                        0.385,
                        0.272,
                        255,
                        255,
                        255,
                        "Weapon Options",
                        weaponmenu,
                        function(enabled)
                            weaponmenu = enabled
                        end
                    )
                 then
                    SelectedMenu("weaponmenu")
                end

                if
                    SelectMenu(
                        0.445,
                        0.272,
                        255,
                        255,
                        255,
                        "Misc Options",
                        misc,
                        function(enabled)
                            misc = enabled
                        end
                    )
                 then
                    SelectedMenu("misc")
                end

                if
                SelectMenu(
                    0.495,
                    0.272,
                    255,
                    255,
                    255,
                    "Visual Options",
                    visual,
                    function(enabled)
                        visual = enabled
                    end
                )
             then
                SelectedMenu("visual")
            end

                FreezeEntityPosition(GetPlayerPed(-1), true)
                DrawRect(0.5, 0.5, 0.5, 0.5, 12, 12, 12, 240)
                DrawRect(0.5, 0.25, 0.5, 0.005, 255, 255, 255, 255)
                DrawRect(0.5, 0.32, 0.5, 0.005, 255, 255, 255, 255)
                DrawRect(0.25, 0.5, 0.003, 0.504, 255, 255, 255, 255)
                DrawRect(0.75, 0.5, 0.003, 0.504, 255, 255, 255, 255)
                DrawRect(0.5, 0.75, 0.5, 0.005, 255, 255, 255, 255)

                SetMouseCursorActiveThisFrame()
                DisableControlAction(0, 24)
                SetMouseCursorSprite(1)
                DisableControlAction(0, 1)
                DisableControlAction(0, 2)

                if Menu_Selected == "Self" then

                    if CreateButton(0.26, 0.34, 255, 255, 255, "Heal") then
                        ShowNotification("Healed!")
                        SetEntityHealth(GetPlayerPed(-1), 200)
                    elseif CreateButton(0.26, 0.37, 255, 255, 255, "Suicide") then
                        SetEntityHealth(GetPlayerPed(-1), 0)
                    elseif
                        CheckBox(
                            0.26,
                            0.40,
                            255,
                            255,
                            255,
                            "Godmode",
                            god,
                            function(enabled)
                                god = enabled
                            end
                        )
                     then
                    elseif
                        CheckBox(
                            0.26,
                            0.43,
                            255,
                            255,
                            255,
                            "Invisible",
                            invisible,
                            function(enabled)
                                invisible = enabled
                            end
                        )
                     then



                    end
                end

                -- Next menu
                if Menu_Selected == "Online" then
                    -- ONLINE PLAYERS
                    DrawRect(0.21, 0.5, 0.003, 0.504, 255, 255, 255, 255)
                    DrawRect(0.06, 0.5, 0.003, 0.504, 255, 255, 255, 255)
                    DrawRect(0.135, 0.5, 0.15, 0.5, 12, 12, 12, 240)
                    DrawRect(0.135, 0.75, 0.153, 0.005, 255, 255, 255, 255)
                    DrawRect(0.135, 0.25, 0.153, 0.005, 255, 255, 255, 255)

                    if CreateButton(0.26, 0.34, 255, 255, 255, "Spectate") then
                        local id = KeyboardInput("Type id to spectate", "", 100)


                            print(GetPlayerName(GetPlayerPed(id)))

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then

                                ShowNotification("This is not a valid id")
                            else
                                SpectatePlayer(id)
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    elseif CreateButton(0.26, 0.37, 255, 255, 255, "Clone Outfit") then
                        local id = KeyboardInput("Type id to clone outfit", "", 100)
                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                ClonePed(id)
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    elseif CreateButton(0.26, 0.40, 255, 255, 255, "Teleport") then
                        local id = KeyboardInput("Type id to teleport", "", 100)

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                local Entity =
                                    IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or
                                    PlayerPedId()
                                SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(id)), 0.0, 0.0, 0.0, false)
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    elseif CreateButton(0.26, 0.43, 255, 255, 255, "Give armor") then
                        local id = KeyboardInput("Type id to give armor", "", 100)

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                SetPedArmour(PlayerPedId(id), 200)
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    elseif CreateButton(0.26, 0.46, 255, 255, 255, "Molotov player") then
                        local id = KeyboardInput("Type id to molotov", "", 100)

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                AddExplosion(GetEntityCoords(GetPlayerPed(id)), 3, 100000.0, true, false, 100000.0)
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    elseif CreateButton(0.26, 0.49, 255, 255, 255, "Kick player from vehicle") then
                        local id = KeyboardInput("Type id to kick from vehicle", "", 100)

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                ClearPedTasksImmediately(GetPlayerPed(id))
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    elseif CreateButton(0.26, 0.52, 255, 255, 255, "Spawn dildo") then
                        local id = KeyboardInput("Type id to dildo someone", "", 100)

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                local ec = GetHashKey('prop_cs_dildo_01')
                                local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                                local ped = GetPlayerPed(id)
                                AttachEntityToEntity(ed, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 24818), -0.425, 0.185, 0.0, 270.0, 0.0, -25.0, true, true, false, true, 1, true)
                            end
                        
                        else
                            ShowNotification("This is not a number")
                        end

                    elseif
                    CheckBox(
                        0.26,
                        0.58,
                        255,
                        255,
                        255,
                        "ESP",
                        esp,
                        function(enabled)
                            esp = enabled
                        end
                    )
                 then
                    elseif CreateButton(0.26, 0.55, 255, 255, 255, "Spawn swastika") then
                        local id = KeyboardInput("Type id to swastika someone", "", 100)

                        if tonumber(id) then
                            if GetPlayerName(GetPlayerPed(id)) == "**Invalid**" then
                                ShowNotification("This is not a valid id")
                            else
                                local container1 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container2 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container3 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container4 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container5 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container6 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container7 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container8 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container9 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container10 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container11 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container12 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container13 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container14 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container15 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container16 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container17 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container19 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container20 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container21 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container22 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container23 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container24 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                local container25 = CreateObject(GetHashKey("prop_container_ld_pu"), 0, 0, 0, true, true, true)
                                --                                      BOTTOM LEFT L
                                AttachEntityToEntity(container1, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 0, 0, 90, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container2, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -3.2, 90, 0, 0, 0, true, true, false, true, 1, true)
                                    Citizen.Wait(50)
                                AttachEntityToEntity(container3, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -6.4, 90, 0, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container4, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 0, 90, 0, 0, true, true, false, true, 1, true)
                                    Citizen.Wait(50)
                                AttachEntityToEntity(container5, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 5.6, 90, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container6, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 2.8, 90, 0, 0, true, true, false, true, 1, true)
                                    Citizen.Wait(50)
                                --                                      TOP RIGHT L
                                AttachEntityToEntity(container7, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 11.2, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(20)
                                AttachEntityToEntity(container8, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 14, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(50)
                                AttachEntityToEntity(container9, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 6.4, 16.8, 90, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container10, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 9.6, 16.8, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(50)
                                AttachEntityToEntity(container11, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 12.8, 16.8, 90, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container12, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 16.8, 90, 0, 0, true, true, false, true, 1, true)
                                --                                      MIDDLE LEFT UP
                                Citizen.Wait(50)
                                AttachEntityToEntity(container13, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 0, 8.4, 0, 90, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container14, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -3.2, 8.4, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(50)
                                AttachEntityToEntity(container15, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -6.4, 8.4, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(20)
                              --  AttachEntityToEntity(container16, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -6.4, 11.2, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(50)
                                AttachEntityToEntity(container17, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -6.4, 14, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(20)
                                AttachEntityToEntity(container18, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, -6.4, 16.8, 90, 0, 0, true, true, false, true, 1, true)
                                --                                      MIDDLE RIGHT DOWN
                                Citizen.Wait(50)
                                AttachEntityToEntity(container19, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 6.4, 8.4, 0, 90, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container20, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 9.6, 8.4, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(50)
                                AttachEntityToEntity(container21, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 12.8, 8.4, 90, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container22, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 12.8, 5.6, 90, 0, 0, true, true, false, true, 1, true)
                                Citizen.Wait(50)
                                AttachEntityToEntity(container23, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 12.8, 2.8, 90, 0, 0, true, true, false, true, 1, true)
                                AttachEntityToEntity(container24, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 12.8, 0, 0, 90, 0, true, true, false, true, 1, true)
                                --                                      CENTER BLOCK
                                Citizen.Wait(50)
                                AttachEntityToEntity(container25, GetPlayerPed(id), GetPedBoneIndex(GetPlayerPed(id), 0), 0, 3.2, 8.4, 90, 0, 0, true, true, false, true, 1, true)
                        
                            end
                        else
                            ShowNotification("This is not a number")
                        end
                    end -- End of online players

                    local y = 0.256
                    
                    for i = 0, 128 do
                        if
                            NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and OnlineCreateButton(0.065,y,255,255,255," " .. GetPlayerName(i) .. " " .. GetPlayerServerId(i) .. " ", i)
                             then
                                y = y + 0.03

                            
                        end
                    end
                end

                if Menu_Selected == "Weapon" then
                    if CreateButton(0.26, 0.34, 255, 255, 255, "Give weapon by name") then
                        local result = KeyboardInput("Weapon name", "WEAPON_", 100)
                        GiveWeaponToPed(GetPlayerPed(-1), result, 200, false, false)
                    elseif
                        CheckBox(
                            0.26,
                            0.37,
                            255,
                            255,
                            255,
                            "Oneshot",
                            oneshot,
                            function(enabled)
                                oneshot = enabled
                            end
                        )
                     then
                    end
                end

                if Menu_Selected == "Misc" then
                    if
                        CheckBox(
                            0.26,
                            0.34,
                            255,
                            255,
                            255,
                            "Discord RPC",
                            rpc,
                            function(enabled)
                                rpc = enabled
                            end
                        )
                     then
                    elseif CreateButton(0.26, 0.37, 255, 255, 255, "open menu button current > " .. Button .. "") then
                        local result = KeyboardInput("Type here the button", "", 3)
                        local result2 = tonumber(result)

                        for i = 1, #allButtons do
                            if result2 == allButtons[i] then
                                Button = result2
                            end
                        end
                    elseif
                        CreateButton(
                            0.26,
                            0.40,
                            255,
                            255,
                            255,
                            "change esp color > " .. ra.r .. " > " .. ra.g .. " > " .. ra.b
                        )
                     then
                        local r = KeyboardInput("Type Red color", "", 3)
                        local g = KeyboardInput("Type Green color", "", 3)
                        local b = KeyboardInput("Type Blue color", "", 3)

                        if tonumber(r) and tonumber(g) and tonumber(b) then
                            local xr = tonumber(r)
                            local xg = tonumber(g)
                            local xb = tonumber(b)

                            if xr > 255 or xg > 255 or xb > 255 or xr == nil or xg == nil or xr == nil then
                                ShowNotification("Colors are higher than 255 or nil")
                            else
                                esp_color = {r = xr, g = xg, b = xb}
                            end
                        else
                            ShowNotification("This is not a number!")
                        end
                    end

                    
                    local x = 0.45
                    local y = 0.32
                    
                    local maxy = 0.72
                    
                    

                    for i = 1, GetNumResources() do
                        y = y + 0.03
                        

                        if y > maxy then
                            x = x + 0.08
                            y = 0.37
                        end
                        
                            local script_name = GetResourceByFindIndex(i)
                            local cleaned_name = string.gsub(tostring(script_name), "[^a-zA-Z]", "") 
                            if CreateButton(x, y, 255, 255, 255, cleaned_name) then
                                print("==========================")
                                print("INFORMATAION ABOUT: ^3" .. script_name .. "^7")
                                print("                          ")
                                local state = GetResourceState(script_name)
                                if state == "started" or state == "starting" then
                                    print("STATE: ^2" .. "Started or Starting" .. "^7")
                                end

                                if state == "stopped" then
                                    print("STATE: ^1 ".. "Stopped" .. "^7")
                                end
                                print("                         ")
                                print("==========================")


                        end
                    end
                end



                if Menu_Selected == "Visual" then
                    if CheckBox(0.26, 0.34, 255, 255, 255, "No fog", nofog, function(enabled) nofog = enabled end) then

                    elseif CheckBox(0.26, 0.37, 255, 255, 255, "Crosshair", crosshair, function(enabled) crosshair = enabled end) then

                    elseif CheckBox(0.26, 0.40, 255,255,255, "WIP Free Cam", frecam, function(enabled) frecam = enabled end) then
                    end 
                end -- finish menu


                if CreateButton(0.26, 0.71, 255, 255, 255, "Click here to see IP") then
                    ShowNotification("IP: " .. GetCurrentServerEndpoint())
                end
                if CreateButton(0.705, 0.71, 255, 0, 0, "Close menu") then
                    Enabled = false
                    ShowNotification("Closed menu, click" .. Button .. " to open the menu again!")
                    Menu_Selected = nil
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    EnableControlAction(0, 24)
                end
		if CreateButton(0.705, 0.61, 255, 0, 0, "Wa") then
                    ShowNotification("Closed menu, click" .. Button .. " to open the menu again!")
		end

                local user_count = 0
                local y = 0.25
                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 then
                        user_count = user_count + 1
                        if CreateButton(0.26, 0.68, 255, 255, 255, "User count > " .. user_count) then
                            SelectedPlayer = i
                        end
                    end
                end
            end
        end
    end
)



Citizen.CreateThread(function()
   --[[ SetDiscordAppId(730042741764915250)
    SetDiscordRichPresenceAsset("ez")
--]]
    while true do
        Wait(1)
        local ra = GetCurrentEspBoxColor()



        if IsControlJustReleased(0, Button) then
            if Enabled then
                Enabled = false

                ShowNotification("Closed menu, click " .. Button .. " to open the menu again!")
                FreezeEntityPosition(GetPlayerPed(-1), false)
                EnableControlAction(0, 24)

            else
                Enabled = true
                Menu_Selected = "Self"
            end
        end








        if god then
            SetEntityInvincible(GetPlayerPed(-1), true)
        else
            SetEntityInvincible(GetPlayerPed(-1), false)
        end

        if invisible then
			SetEntityVisible(GetPlayerPed(-1), false, 0)
		else
			SetEntityVisible(GetPlayerPed(-1), true, 0)
        end


        if oneshot then
            SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
        else
            SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
        end


        if rpc then
            SetRichPresence(GetPlayerName(PlayerId()) .. " its playing with Batak.ltd - V2")
        else
            
        end


        if crosshair then

            DrawRect(0.49, 0.5, 0.01, 0.005, 255, 255, 255, 150)
            DrawRect(0.51, 0.5, 0.01, 0.005, 255, 255, 255, 150)

            DrawRect(0.5, 0.48, 0.003, 0.018, 255, 255, 255, 150)
            DrawRect(0.5, 0.52, 0.003, 0.018, 255, 255, 255, 150)


            ShowHudComponentThisFrame(14)

        else

        end

        if frecam then
            FreezeEntityPosition(GetPlayerPed(-1), true)
            local fakeobj = 0
            
                local cam = CreateCam('DEFAULT_SCRIPTED_Camera', 1)
                freecamcam = cam
                RenderScriptCams(1, 0, 0, 1, 1)
                SetCamActive(cam, true)
                SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
            
                local offsetRotX = 0.0
                local offsetRotY = 0.0
                local offsetRotZ = 0.0
                                    
                local weapondelay = 0

                while DoesCamExist(freecamcam) do
                    Wait(0)
            
                    local playerPed = PlayerPedId()
                    local playerRot = GetEntityRotation(playerPed, 2)
                    local vehicletimer, closest, closestobj = 0

            
                    local rotX = playerRot.x
                    local rotY = playerRot.y
                    local rotZ = playerRot.z
            
                    offsetRotX = offsetRotX - (GetDisabledControlNormal(1, 2) * 8.0)
                    offsetRotZ = offsetRotZ - (GetDisabledControlNormal(1, 1) * 8.0)
            
                    if (offsetRotX > 90.0) then 
                        offsetRotX = 90.0 
                    elseif (offsetRotX < -90.0) then 
                        offsetRotX = -90.0 
                    end
            
                    if (offsetRotY > 90.0) then 
                        offsetRotY = 90.0 
                    elseif (offsetRotY < -90.0) then 
                        offsetRotY = -90.0 
                    end
            
                    if (offsetRotZ > 360.0) then 
                        offsetRotZ = offsetRotZ - 360.0 
                    elseif (offsetRotZ < -360.0) then 
                        offsetRotZ = offsetRotZ + 360.0 
                    end

                    -- SetCamCoord(cam, GetCamCoord(cam) + vec3(0.0, 2.0, 0.0))
                    local x, y, z = table.unpack(GetCamCoord(cam))
                    if IsDisabledControlPressed(1, 32) then -- W
                        SetCamCoord(cam, GetCamCoord(cam) + (RotationToDirection(GetCamRot(cam, 2)) * (0.5 * 1.5)))
                    elseif IsDisabledControlPressed(1, 33) then
                        SetCamCoord(cam, GetCamCoord(cam) - (RotationToDirection(GetCamRot(cam, 2)) * (0.5 * 1.5)))
                    end

                    if (IsDisabledControlPressed(1, 21)) then -- SHIFT
                        z = z + (0.1 * 1.5)
                    end
                    if (IsDisabledControlPressed(1, 36)) then -- LEFT CTRL
                        z = z - (0.1 * 1.5)
                    end

                    SetFocusArea(GetCamCoord(cam).x, GetCamCoord(cam).y, GetCamCoord(cam).z, 0.0, 0.0, 0.0)
                    SetCamRot(cam, offsetRotX, offsetRotY, offsetRotZ, 2)

                    --local Markerloc = GetCamCoord(cam) + (RotationToDirection(GetCamRot(cam, 2)) * 15)
            
                    --DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.35, 0.35, 0.35, 0,255,255, 175, false, true, 2, nil, nil, false)
                    -- \n~INPUT_COVER~ Take control of vehicle
                    DisplayHelpTextThisFrame(GetCurrentResourceName(), false)



                    


                

   



                            
  

                    DisableControlAction(0, 24)
                    DisableControlAction(0, 44)


                    Markerloc = GetCamCoord(cam) + (RotationToDirection(GetCamRot(cam, 2)) * 4)






        end



        if not frecam then
            DestroyCam(cam)
            ClearTimecycleModifier()
            RenderScriptCams(false, false, 0, 1, 0)
            FreezeEntityPosition(PlayerPedId(), false)
            SetFocusEntity(PlayerPedId())
            DeleteEntity(fakeobj)
            ClearFocus()
        end 
        else
            
            DestroyCam(cam)
            ClearTimecycleModifier()
            RenderScriptCams(false, false, 0, 1, 0)
            FreezeEntityPosition(PlayerPedId(), false)
            SetFocusEntity(PlayerPedId())
            DeleteEntity(fakeobj)
            ClearFocus()


        end
        if nofog then
            SetWeatherTypePersist("CLEAR")
            SetWeatherTypeNowPersist("CLEAR")
            SetWeatherTypeNow("CLEAR")
            SetOverrideWeather("CLEAR")
            SetTimecycleModifier('CS1_railwayB_tunnel')
        else
            SetWeatherTypePersist("EXTRASUNNY")
            SetWeatherTypeNowPersist("EXTRASUNNY")
            SetWeatherTypeNow("EXTRASUNNY")
            SetOverrideWeather("EXTRASUNNY")
            SetTimecycleModifier("AP1_01_B_IntRefRange")
        end

        if nuke then
            local camion = "phantom"
            local avion = "CARGOPLANE"
            local avion2 = "luxor"
            local heli = "maverick"
            local random = "bus"
            for i = 0, 128 do
                    while not HasModelLoaded(GetHashKey(avion)) do
                        Citizen.Wait(0)
                        RequestModel(GetHashKey(avion))
                    end
                    Citizen.Wait(200)

                    local avion2 = CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
                    CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
                    CreateVehicle(GetHashKey(camion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                    CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
                    CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
                    CreateVehicle(GetHashKey(avion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and 
                    CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
                    CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
                    CreateVehicle(GetHashKey(avion2),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                    CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
                    CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
                    CreateVehicle(GetHashKey(heli),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                    CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
                    CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
                    CreateVehicle(GetHashKey(random),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true)
            end
        end


        if esp then

            for i = 0, 128 do
                if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
                    local pPed = GetPlayerPed(i)
                    local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                    local x, y, z = table.unpack(GetEntityCoords(pPed))


                    LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
                    LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
                    LineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
                    LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                    LineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                    LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
                    LineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)

                    TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
                    TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                    TLineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                    TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                    TLineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                    TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
                    TLineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
--
                    ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
                    ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
                    ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
                    ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
                    ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
                    ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
                    ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
                    ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)


                    DrawLine(
                        LineOneBegin.x,
                        LineOneBegin.y,
                        LineOneBegin.z,
                        LineOneEnd.x,
                        LineOneEnd.y,
                        LineOneEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        LineTwoBegin.x,
                        LineTwoBegin.y,
                        LineTwoBegin.z,
                        LineTwoEnd.x,
                        LineTwoEnd.y,
                        LineTwoEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        LineThreeBegin.x,
                        LineThreeBegin.y,
                        LineThreeBegin.z,
                        LineThreeEnd.x,
                        LineThreeEnd.y,
                        LineThreeEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        LineThreeEnd.x,
                        LineThreeEnd.y,
                        LineThreeEnd.z,
                        LineFourBegin.x,
                        LineFourBegin.y,
                        LineFourBegin.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        TLineOneBegin.x,
                        TLineOneBegin.y,
                        TLineOneBegin.z,
                        TLineOneEnd.x,
                        TLineOneEnd.y,
                        TLineOneEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        TLineTwoBegin.x,
                        TLineTwoBegin.y,
                        TLineTwoBegin.z,
                        TLineTwoEnd.x,
                        TLineTwoEnd.y,
                        TLineTwoEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        TLineThreeBegin.x,
                        TLineThreeBegin.y,
                        TLineThreeBegin.z,
                        TLineThreeEnd.x,
                        TLineThreeEnd.y,
                        TLineThreeEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        TLineThreeEnd.x,
                        TLineThreeEnd.y,
                        TLineThreeEnd.z,
                        TLineFourBegin.x,
                        TLineFourBegin.y,
                        TLineFourBegin.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        ConnectorOneBegin.x,
                        ConnectorOneBegin.y,
                        ConnectorOneBegin.z,
                        ConnectorOneEnd.x,
                        ConnectorOneEnd.y,
                        ConnectorOneEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        ConnectorTwoBegin.x,
                        ConnectorTwoBegin.y,
                        ConnectorTwoBegin.z,
                        ConnectorTwoEnd.x,
                        ConnectorTwoEnd.y,
                        ConnectorTwoEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        ConnectorThreeBegin.x,
                        ConnectorThreeBegin.y,
                        ConnectorThreeBegin.z,
                        ConnectorThreeEnd.x,
                        ConnectorThreeEnd.y,
                        ConnectorThreeEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )
                    DrawLine(
                        ConnectorFourBegin.x,
                        ConnectorFourBegin.y,
                        ConnectorFourBegin.z,
                        ConnectorFourEnd.x,
                        ConnectorFourEnd.y,
                        ConnectorFourEnd.z,
                        ra.r,
                        ra.g,
                        ra.b,
                        255
                    )

                    DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
                    
                end
            end
        end
    end
end)





RegisterCommand("open", function()

    Enabled = true

end, false)