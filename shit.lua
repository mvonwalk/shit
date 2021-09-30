for _,v in next, game:service("HttpService"):JSONDecode(readfile("cursorpgames")) do
    if game.PlaceId == v then
        return
    end
end

repeat
    wait()
until game:IsLoaded()
getgenv().enabled = true
local images = {
    "https://imgur.com/iVz4jwR.png",
    "https://imgur.com/96iAewd.png",
    "https://imgur.com/s4VyKw6.png",
    "https://imgur.com/lot8CeU.png",
    "https://imgur.com/go4JN5M.png",
    "https://imgur.com/rizYZg9.png",
    "https://imgur.com/5oxfLtd.png",
    "https://imgur.com/ke08l59.png",
    "https://imgur.com/Ex9QvA2.png",
    "https://imgur.com/O09kWKW.png",
    "https://imgur.com/Q70LGsQ.png",
    "https://imgur.com/Z1L0rt5.png",
    "https://imgur.com/rgDM0YQ.png",
    "https://imgur.com/NQQUfBl.png",
    "https://imgur.com/YSL15WS.png",
    "https://imgur.com/qiqtuOG.png",
    "https://imgur.com/8ufz4o3.png",
    "https://imgur.com/sezsOCC.png",
    "https://imgur.com/Bh4V7lK.png",
    "https://imgur.com/rsNyR5a.png",
    "https://imgur.com/ec7MIdh.png",
    "https://imgur.com/ki4pA2F.png",
    "https://imgur.com/c2y37JO.png",
    "https://imgur.com/7yLgL0h.png",
    "https://imgur.com/bZ1YiRZ.png",
    "https://imgur.com/nqjwyE6.png",
    "https://imgur.com/GVZZOKb.png",
    "https://imgur.com/siOxd1u.png",
    "https://imgur.com/UxXqnde.png"
}

local cursor = Drawing.new("Image")
cursor.Size = Vector2.new(32, 32)
cursor.Visible = true
local mouse = game.Players.LocalPlayer:GetMouse()
local Y = game:GetService("GuiService"):GetGuiInset().Y

local loop =
    game:GetService("RunService").RenderStepped:Connect(
    function()
        cursor.Position = Vector2.new(mouse.X, mouse.Y + Y)
        game:GetService("UserInputService").MouseIconEnabled = false
    end
)

if not isfolder("cursor") then
    makefolder("cursor")
    for _, v in ipairs(images) do
        if _ < 10 then
            writefile("cursor/cursor" .."0"..tostring(_) .. ".png", syn.request({Url = v}).Body)
        else
            writefile("cursor/cursor" .. tostring(_) .. ".png", syn.request({Url = v}).Body)
        end
    end
end

local list = listfiles("cursor")

while getgenv().enabled == true do
wait()
for _,v in ipairs(list) do
    wait()
    cursor.Data = readfile(v)
end
end

if getgenv().enabled == false then
    loop:Disconnect()
    game:GetService("UserInputService").MouseIconEnabled = true
    cursor:Remove()
end
