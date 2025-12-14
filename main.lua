--[[
you better have a good reason on WHY you are looking at the script raw
]]
if not game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Loaded") then
    local data = Instance.new("NumberValue") --does this really matter no i added it for a damn reason
    data.Name = "Loaded"
    data.Parent = game:GetService("Players").LocalPlayer.PlayerScripts
    print("Loaded Scripts")
    local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    local event = ""
    local fling = false
    local opt = false
    local antiteleport = false
    local range = 15
    local partsdipping = false
    -- Create the main window
    local noclip = false
    local speed = 16
    local infjump = false
    local fakerun = false
    local infjumpv2 = false
    local antifling = false
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local bodyVelocity = Instance.new("BodyVelocity")
    local Window = Rayfield:CreateWindow({
        Name = "W112ND",
        LoadingTitle = "Please wait",
        LoadingSubtitle = "By windows11_2nd",
        ShowText = "W112ND", 
        ConfigurationSaving = { 
            Enabled = true,
            FolderName = "Exploits", 
            FileName = "Tools"
        },
        Discord = {
            Enabled = false,
            Invite = "",
            RememberJoins = true
        },
        KeySystem = false 
    })
    Rayfield:Notify({
        Title = "Warning",
        Content = "This is the only OFFICAL W112ND watch out for fake versions.",
        Duration = 4
    })
    -- Create a tab
    local Tab = Window:CreateTab("Universial", 4483362458)
    local Tab2 = Window:CreateTab("MM2", 4483362458)
    local Tab3 = Window:CreateTab("Fred's House", 4483362458)
    local Tab4 = Window:CreateTab("PHONK EDIT TOWER", 4483362458)

    -- Add a button
    Tab:CreateButton({
        Name = "Get all tools",
        Callback = function()
            Rayfield:Notify({
                Title = "Message",
                Content = "Getting all tools!",
                Duration = 4
            })
            for i,v in pairs(game:GetDescendants()) do
                if v:IsA("Tool") then
                    v:Clone().Parent = game:GetService("Players").LocalPlayer.Backpack
                end
            end
        end
    })
    Tab:CreateButton({
        Name = "Teleport to tools (workspace)",
        Callback = function()
            Rayfield:Notify({
                Title = "Message",
                Content = "Getting all tools!",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Tool") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    task.wait()
                end
            end
        end
    })
    Tab:CreateButton({
        Name = "Teleport to every parts (workspace)",
        Callback = function()
            Rayfield:Notify({
                Title = "Message",
                Content = "Teleporting..",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    task.wait()
                end
            end
        end
    })
    Tab:CreateButton({
        Name = "Aimbot",
        Callback = function()
            Rayfield:Notify({
                Title = "HUD",
                Content = "Setting up aimbot!",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") then
                    local player = game:GetService("Players"):GetPlayerFromCharacter(v)
                    if player then
                        game:GetService("Players").LocalPlayer:GetMouse().Target = player.Character.HumanoidRootPart
                        task.wait(0.15)
                    end
                end
            end
        end
    })
    Tab2:CreateButton({
        Name = "Read Users (only after round started)",
        Callback = function()
            Rayfield:Notify({
                Title = "Heads Up",
                Content = "Fetching for people",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") then
                    local player = game:GetService("Players"):GetPlayerFromCharacter(v)
                    if player then
                        for i,v in pairs(player.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.Name ~= "Emotes" then
                                    if v.Name ~= "AAAAA" then
                                        local hl = Instance.new("Highlight")
                                        local bb = Instance.new("BillboardGui")
                                        local tt = Instance.new("TextLabel")
                                        hl.FillColor = Color3.new(1, 1, 1)
                                        hl.OutlineColor = Color3.new(1, 1, 1)
                                        hl.Parent = player.Character
                                        bb.Size = UDim2.new(0,100,0,25)
                                        tt.Text = v.Name
                                        bb.AlwaysOnTop = true
                                        tt.BackgroundTransparency = 1
                                        tt.TextColor3 = Color3.new(1, 1, 1)
                                        tt.TextScaled = true
                                        tt.Font = Enum.Font.BuilderSansBold
                                        bb.StudsOffsetWorldSpace = Vector3.new(0,4,0)
                                        tt.Parent = bb
                                        bb.Enabled = true
                                        tt.TextTransparency = 0
                                        tt.Visible = true
                                        tt.Size = UDim2.new(1,0,1,0)
                                        bb.Parent = player.Character
                                        if v.Name == "Knife" then
                                            hl.FillColor = Color3.new(1, 0, 0)
                                        end
                                        if v.Name == "Gun" then
                                            hl.FillColor = Color3.new(0, 0.482353, 1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    })
    Tab:CreateButton({
        Name = "Fetch for Users",
        Callback = function()
            Rayfield:Notify({
                Title = "Heads Up!",
                Content = "Fetching for players...",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") then
                    local player = game:GetService("Players"):GetPlayerFromCharacter(v)
                    if player then
                        local hl = Instance.new("Highlight")
                        hl.FillColor = Color3.new(1, 1, 1)
                        hl.OutlineColor = Color3.new(1, 1, 1)
                        hl.Parent = player.Character
                    end
                end
            end
        end
    })
    Tab:CreateButton({
        Name = "Fetch for Users (Via username)",
        Callback = function()
            Rayfield:Notify({
                Title = "Heads Up!",
                Content = "Fetching for players by username...",
                Duration = 4
            })
            for i,part in pairs(workspace:GetDescendants()) do
                if part:IsA("Model") then
                    local player = game:GetService("Players")
                    for i,v in pairs(player:GetDescendants()) do
                        if v:IsA("Player") then
                            if v.Name == part.Name then
                                local hl = Instance.new("Highlight")
                                hl.FillColor = Color3.new(1, 1, 1)
                                hl.OutlineColor = Color3.new(1, 1, 1)
                                hl.Parent = v.Character
                            end
                        end
                    end
                end
            end
        end
    })
    Tab2:CreateButton({
        Name = "Go to Sheriff (only after round started)",
        Callback = function()
            Rayfield:Notify({
                Title = "Heads Up",
                Content = "Fetching for sheriff",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") then
                    local player = game:GetService("Players"):GetPlayerFromCharacter(v)
                    if player then
                        for i,v in pairs(player.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Gun" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end
        end
    })
    Tab2:CreateButton({
        Name = "Go to Murderer (only after round started)",
        Callback = function()
            Rayfield:Notify({
                Title = "Heads Up",
                Content = "Fetching for murderer",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") then
                    local player = game:GetService("Players"):GetPlayerFromCharacter(v)
                    if player then
                        for i,v in pairs(player.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Knife" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end
        end
    })
    Tab:CreateButton({
        Name = "Teleport to everyone",
        Callback = function()
            Rayfield:Notify({
                Title = "Heads Up!",
                Content = "Teleporting To everyone (5ms)!",
                Duration = 4
            })
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") then
                    local plr = game:GetService("Players"):GetPlayerFromCharacter(v)
                    if plr then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                        task.wait(0.5)
                    end
                end
            end
        end
    })
    Tab:CreateSlider({
        Name = "Speed",
        Range = {1, 100},
        Increment = 1,
        Suffix = "USpeed",
        CurrentValue = 16,
        Flag = "UserSpeed",
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Value
            speed = Value
        end,
    })
    Tab:CreateInput({
        Name = "RemoteEvents",
        CurrentValue = "",
        PlaceholderText = "Fire all remote event text",
        RemoveTextAfterFocusLost = false,
        Flag = "FARET",
        Callback = function(Text)
            for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
                if v:IsA("RemoteEvent") then
                    v:FireServer(Text)
                end
            end
        end,
    })
    local Toggle = Tab:CreateToggle({
        Name = "Noclip",
        CurrentValue = false,
        Flag = "Nocliping", 
        Callback = function(Value)
            noclip = Value
        end,
    })
    local Toggle = Tab:CreateToggle({
        Name = "Xray",
        CurrentValue = false,
        Flag = "Xray",
        Callback = function(Value)
            if Value == true then
                for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.LocalTransparencyModifier = 0.5
                    end
                end
            else
                for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.LocalTransparencyModifier = 0
                    end
                end
            end
        end,
    })
    Tab:CreateButton({
        Name = "Remove Client Kick Scripts",
        Callback = function()
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("LocalScript") then
                    if v.Source:lower():find("kick") then
                        v:Destroy()
                    end
                end
            end
        end
    })
    local Toggle = Tab:CreateToggle({
        Name = "Optimization",
        CurrentValue = false,
        Flag = "opt",
        Callback = function(Value)
            opt = Value
        end,
    })
    Tab:CreateSlider({
        Name = "Render",
        Range = {1, 100},
        Increment = 1,
        Suffix = "rendering",
        CurrentValue = 15,
        Flag = "renderopt", 
        Callback = function(Value)
            range = Value
        end,
    })
    local Toggle = Tab:CreateToggle({
        Name = "Walkfling",
        CurrentValue = false,
        Flag = "WF",
        Callback = function(Value)
            fling = Value
        end,
    })

    -- 追加された機能
    Tab:CreateToggle({
        Name = "Infinite Jump",
        CurrentValue = false,
        Flag = "InfJump",
        Callback = function(Value)
            infjump = Value
        end,
    })

    Tab:CreateToggle({
        Name = "Anti-Fling",
        CurrentValue = false,
        Flag = "AntiFling",
        Callback = function(Value)
            antifling = Value
        end,
    })

    Tab:CreateToggle({
        Name = "Fake Run",
        CurrentValue = false,
        Flag = "FakeRun",
        Callback = function(Value)
            fakerun = Value
        end,
    })

    -- ループ処理を追加
    RunService.RenderStepped:Connect(function()
        -- Noclip 機能
        if noclip then
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
        
        -- WalkFling 機能
        if fling and character and humanoidRootPart then
            local velocity = humanoidRootPart.Velocity
            bodyVelocity.Velocity = Vector3.new(velocity.X * 5, 0, velocity.Z * 5)
            bodyVelocity.Parent = humanoidRootPart
        else
            bodyVelocity.Parent = nil
        end
        
        -- Optimization 機能
        if opt then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer then
                    local distance = (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and 
                        (player.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude) or math.huge
                    
                    if distance > range then
                        if player.Character then
                            for _, part in pairs(player.Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.LocalTransparencyModifier = 1
                                end
                            end
                        end
                    else
                        if player.Character then
                            for _, part in pairs(player.Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.LocalTransparencyModifier = 0
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    -- Infinite Jump 機能
    UserInputService.JumpRequest:Connect(function()
        if infjump and character and humanoid then
            humanoid:ChangeState("Jumping")
        end
    end)

    -- Anti-Fling 機能
    RunService.Stepped:Connect(function()
        if antifling and character and humanoidRootPart then
            humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            humanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
        end
    end)

    -- Fake Run 機能
    RunService.RenderStepped:Connect(function()
        if fakerun and character and humanoid then
            if humanoid.MoveDirection.Magnitude > 0 then
                humanoidRootPart.Velocity = humanoid.MoveDirection * 50
            end
        end
    end)

    -- キャラクター変更時の処理
    Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
        character = newChar
        humanoid = newChar:WaitForChild("Humanoid")
        humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
        
        -- スピードを再度設定
        if speed then
            humanoid.WalkSpeed = speed
        end
    end)

    -- 追加のボタン機能
    Tab:CreateButton({
        Name = "Reset Character",
        Callback = function()
            local char = Players.LocalPlayer.Character
            if char then
                char:BreakJoints()
            end
        end
    })

    Tab:CreateButton({
        Name = "Fly (Press E to toggle)",
        Callback = function()
            Rayfield:Notify({
                Title = "Fly Mode",
                Content = "Press E to toggle flying",
                Duration = 3
            })
            
            local flying = false
            local flySpeed = 50
            local bodyGyro = Instance.new("BodyGyro")
            local bodyVelocity = Instance.new("BodyVelocity")
            
            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.E then
                    flying = not flying
                    
                    if flying then
                        bodyGyro.Parent = humanoidRootPart
                        bodyVelocity.Parent = humanoidRootPart
                        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                        bodyGyro.P = 10000
                        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    else
                        bodyGyro.Parent = nil
                        bodyVelocity.Parent = nil
                    end
                end
            end)
            
            RunService.RenderStepped:Connect(function()
                if flying and humanoidRootPart then
                    local camera = workspace.CurrentCamera
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        moveDirection = moveDirection - Vector3.new(0, 1, 0)
                    end
                    
                    if moveDirection.Magnitude > 0 then
                        moveDirection = moveDirection.Unit * flySpeed
                    end
                    
                    bodyVelocity.Velocity = moveDirection
                    bodyGyro.CFrame = camera.CFrame
                end
            end)
        end
    })

    -- 追加のMM2機能
    Tab2:CreateButton({
        Name = "Get All Guns",
        Callback = function()
            Rayfield:Notify({
                Title = "MM2",
                Content = "Getting all guns...",
                Duration = 3
            })
            
            for _, tool in pairs(workspace:GetDescendants()) do
                if tool:IsA("Tool") and tool.Name == "Gun" then
                    tool:Clone().Parent = Players.LocalPlayer.Backpack
                end
            end
        end
    })

    Tab2:CreateButton({
        Name = "Get All Knives",
        Callback = function()
            Rayfield:Notify({
                Title = "MM2",
                Content = "Getting all knives...",
                Duration = 3
            })
            
            for _, tool in pairs(workspace:GetDescendants()) do
                if tool:IsA("Tool") and tool.Name == "Knife" then
                    tool:Clone().Parent = Players.LocalPlayer.Backpack
                end
            end
        end
    })

    -- Fred's House タブ機能
    Tab3:CreateButton({
        Name = "Teleport to Fred",
        Callback = function()
            Rayfield:Notify({
                Title = "Fred's House",
                Content = "Looking for Fred...",
                Duration = 3
            })
            
            for _, model in pairs(workspace:GetDescendants()) do
                if model:IsA("Model") and model.Name:lower():find("fred") then
                    humanoidRootPart.CFrame = model:GetPivot()
                    break
                end
            end
        end
    })

    -- PHONK EDIT TOWER タブ機能
    Tab4:CreateButton({
        Name = "Teleport to Top",
        Callback = function()
            Rayfield:Notify({
                Title = "Phonk Tower",
                Content = "Teleporting to top of tower...",
                Duration = 3
            })
            
            local highestPart = nil
            local highestY = -math.huge
            
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Position.Y > highestY then
                    highestY = part.Position.Y
                    highestPart = part
                end
            end
            
            if highestPart then
                humanoidRootPart.CFrame = CFrame.new(highestPart.Position + Vector3.new(0, 10, 0))
            end
        end
    })

    Tab4:CreateButton({
        Name = "Speed Run Mode",
        Callback = function()
            Rayfield:Notify({
                Title = "Phonk Tower",
                Content = "Activating speed run mode!",
                Duration = 3
            })
            
            humanoid.WalkSpeed = 100
            humanoid.JumpPower = 100
            
            -- 落下ダメージ無効化
            if humanoid:FindFirstChild("FallDamage") then
                humanoid.FallDamage:Destroy()
            end
        end
    })

    print("W112ND GUI Successfully Loaded!")
end
