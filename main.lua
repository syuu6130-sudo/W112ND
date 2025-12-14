--[[
 W112ND Ultimate Edition
 Recommended full-feature + optimized build
 Rayfield UI required
]]

if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Loaded") then return end
local flag = Instance.new("BoolValue")
flag.Name = "Loaded"
flag.Parent = game:GetService("Players").LocalPlayer.PlayerScripts

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

-- UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "W112ND Ultimate",
    LoadingTitle = "Loading",
    LoadingSubtitle = "Optimized Edition",
    ConfigurationSaving = {Enabled = true, FolderName = "W112ND", FileName = "Ultimate"},
    KeySystem = false
})

Rayfield:Notify({Title="W112ND",Content="Ultimate build loaded",Duration=3})

-- Tabs
local Tab = Window:CreateTab("Universal",4483362458)
local Tab2 = Window:CreateTab("MM2",4483362458)
local Tab3 = Window:CreateTab("Utility",4483362458)

-- States
local states = {
    noclip=false, infjump=false, antifling=false, fakerun=false,
    god=false, antiAFK=false, fly=false
}
local savedCFrame = nil

-- Anti AFK
Tab3:CreateToggle({Name="Anti AFK",CurrentValue=false,Callback=function(v)
    states.antiAFK = v
end})
player.Idled:Connect(function()
    if states.antiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end
end)

-- Speed
Tab:CreateSlider({Name="Speed",Range={1,150},Increment=1,CurrentValue=16,Callback=function(v)
    humanoid.WalkSpeed = v
end})

-- God Mode
Tab:CreateToggle({Name="God Mode (Client)",CurrentValue=false,Callback=function(v)
    states.god = v
end})

-- Noclip
Tab:CreateToggle({Name="Noclip",CurrentValue=false,Callback=function(v)
    states.noclip = v
end})

-- Infinite Jump
Tab:CreateToggle({Name="Infinite Jump",CurrentValue=false,Callback=function(v)
    states.infjump = v
end})
UserInputService.JumpRequest:Connect(function()
    if states.infjump then humanoid:ChangeState("Jumping") end
end)

-- Anti Fling
Tab:CreateToggle({Name="Anti Fling",CurrentValue=false,Callback=function(v)
    states.antifling = v
end})

-- Fake Run
Tab:CreateToggle({Name="Fake Run",CurrentValue=false,Callback=function(v)
    states.fakerun = v
end})

-- Save / Load Position
Tab:CreateButton({Name="Save Position",Callback=function()
    savedCFrame = hrp.CFrame
end})
Tab:CreateButton({Name="Load Position",Callback=function()
    if savedCFrame then hrp.CFrame = savedCFrame end
end})

-- Player TP Dropdown
local function refreshPlayers()
    local t = {}
    for _,p in pairs(Players:GetPlayers()) do table.insert(t,p.Name) end
    return t
end
Tab:CreateDropdown({Name="Teleport to Player",Options=refreshPlayers(),Callback=function(name)
    local p = Players:FindFirstChild(name)
    if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame = p.Character.HumanoidRootPart.CFrame
    end
end})

-- Clear ESP
Tab3:CreateButton({Name="Clear ESP",Callback=function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") or v:IsA("BillboardGui") then v:Destroy() end
    end
end})

-- FPS Boost
Tab3:CreateButton({Name="FPS Boost",Callback=function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        end
    end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end})

-- Fly (E)
local bg,bv = Instance.new("BodyGyro"),Instance.new("BodyVelocity")
Tab:CreateToggle({Name="Fly (E)",CurrentValue=false,Callback=function(v)
    states.fly = v
end})
UserInputService.InputBegan:Connect(function(i,gp)
    if gp then return end
    if i.KeyCode==Enum.KeyCode.E and states.fly then
        bg.Parent = hrp
        bv.Parent = hrp
        bg.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
        bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
    end
end)

-- Main Loop (Optimized)
RunService.RenderStepped:Connect(function()
    if states.god then humanoid.Health = humanoid.MaxHealth end
    if states.noclip then
        for _,p in pairs(character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
    if states.antifling then
        hrp.Velocity = Vector3.zero
        hrp.RotVelocity = Vector3.zero
    end
    if states.fakerun and humanoid.MoveDirection.Magnitude > 0 then
        hrp.Velocity = humanoid.MoveDirection * 60
    end
    if states.fly and bv.Parent then
        local cam = workspace.CurrentCamera
        bv.Velocity = cam.CFrame.LookVector * 60
        bg.CFrame = cam.CFrame
    end
end)

-- Toggle UI Key
UserInputService.InputBegan:Connect(function(i,gp)
    if not gp and i.KeyCode==Enum.KeyCode.RightShift then
        Rayfield:Toggle()
    end
end)

-- ================= MM2 ADVANCED =================
-- Auto Detect Murderer / Sheriff + Distance ESP
local mm2ESP = false
Tab2:CreateToggle({Name="MM2 ESP (Roles)",CurrentValue=false,Callback=function(v)
    mm2ESP = v
end})

RunService.RenderStepped:Connect(function()
    if not mm2ESP then return end
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local backpack = plr:FindFirstChild("Backpack")
            local role = nil
            if backpack then
                if backpack:FindFirstChild("Knife") then role = "Murderer" end
                if backpack:FindFirstChild("Gun") then role = "Sheriff" end
            end
            if role then
                if not plr.Character:FindFirstChild("W112ND_MM2") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "W112ND_MM2"
                    hl.FillColor = role=="Murderer" and Color3.fromRGB(255,0,0) or Color3.fromRGB(0,150,255)
                    hl.Parent = plr.Character
                end
            end
        end
    end
end)

-- Auto Dodge Murderer
local autoDodge = false
Tab2:CreateToggle({Name="Auto Dodge Murderer",CurrentValue=false,Callback=function(v)
    autoDodge = v
end})

RunService.RenderStepped:Connect(function()
    if not autoDodge then return end
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            if plr.Backpack:FindFirstChild("Knife") then
                local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist < 20 then
                    hrp.CFrame = hrp.CFrame * CFrame.new(0,0,-30)
                end
            end
        end
    end
end)

-- ================= GAME DETECT =================
local placeId = game.PlaceId
if placeId == 142823291 then -- MM2
    Rayfield:Notify({Title="Game Detected",Content="Murder Mystery 2",Duration=3})
end

-- ================= SAFETY =================
-- Client Kick Protection
for _,v in pairs(player.PlayerScripts:GetDescendants()) do
    if v:IsA("LocalScript") and v.Source:lower():find("kick") then
        v.Disabled = true
    end
end

-- ================= FINAL =================
print("W112ND ULTIMATE ++ FULL STACK LOADED")
