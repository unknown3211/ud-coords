local screenWidth, screenHeight = GetScreenResolution()

function DrawCoords()
    if not showCoords then return end

    local ent = PlayerPedId()
    local pp = GetEntityCoords(ent)
    local hd = GetEntityHeading(ent)
    local coordString = string.format("x = %.2f  y = %.2f  z = %.2f  | H: %.2f", pp.x, pp.y, pp.z, hd)
    DrawTxt(coordString, 0.5, 0.01, 0.4, 0.4, true, 255, 255, 255, 150, true)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

RegisterCommand("coords", function()
    showCoords = not showCoords
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DrawCoords()
    end
end)
