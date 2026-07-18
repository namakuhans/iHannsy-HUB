if game.PlaceId == 137233438285284 then
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

    -- Initialize Globals
    _G.AutoEggPasti = false
    _G.AutoDeposit = false
    _G.AutoBuyChicken = false
    _G.AutoCollectCash = false
    _G.AutoMergeChicken = false
    _G.AutoUpgradeProcess = false
    _G.AutoClaimGuild = false
    _G.AntiAFK = false
    _G.WalkSpeedValue = 16
    _G.JumpPowerValue = 50
    _G.ChickenAmount = 1

    local Window = WindUI:CreateWindow({
        Title = "iHannsyHUB",
        Author = "iHannsy A.K.A MasPakan",
        Folder = "iHannsyHUB",
        Icon = "rbxassetid://110043383622723",
        Theme = "Sky",
        KeySystem = {
            Key = { "PAKAN" },
            Note = "Dapatkan key dengan bergabung ke Discord melalui tombol di bawah!",
            URL = "https://discord.gg/8wM2tNhUdB",
            SaveKey = false,
        },
        OpenButton = {
            Enabled = true,
            Title = "Open iHannsyHUB",
            Draggable = true,
        },
    })

    local FPSTag = Window:Tag({
        Title = "0 FPS",
        Color = Color3.fromHex("#00d4ff"),
    })

    local VersionTag = Window:Tag({
        Title = "v0.1.1",
        Icon = "github",
        Color = Color3.fromHex("#00d4ff"),
    })

    local RunService = game:GetService("RunService")

    local LastTime = tick()

    local FrameCount = 0

    task.spawn(function()
        while true do
            task.wait(1)
            local CurrentTime = tick()
            local FPS = math.round(FrameCount / (CurrentTime - LastTime))
            FPSTag:SetTitle(FPS .. " FPS")
            FrameCount = 0
            LastTime = CurrentTime
        end
    end)

    RunService.RenderStepped:Connect(function()
        FrameCount = FrameCount + 1
    end)

    local MainTab = Window:Tab({
        Title = "Main Automation",
        Icon = "play",
    })

    local ChickenTab = Window:Tab({
        Title = "Chicken Automation",
        Icon = "bird",
    })

    local MiscTab = Window:Tab({
        Title = "Misc",
        Icon = "box",
    })

    local SettingsTab = Window:Tab({
        Title = "Settings",
        Icon = "settings",
    })

    local AboutTab = Window:Tab({
        Title = "About",
        Icon = "info",
    })

    -- Main Automation Elements
    MainTab:Image({
        Image = "rbxassetid://110043383622723",
        AspectRatio = "1:1",
        Radius = 9,
    })

    MainTab:Section({
        Title = "General Automation",
    })

    MainTab:Toggle({
        Title = "Auto Egg",
        Value = _G.AutoEggPasti,
        Flag = "AutoEggPasti",
        Callback = function(v)
            _G.AutoEggPasti = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Egg Dinyalakan" or "Auto Egg Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Deposit",
        Value = _G.AutoDeposit,
        Flag = "AutoDeposit",
        Callback = function(v)
            _G.AutoDeposit = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Deposit Dinyalakan" or "Auto Deposit Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Collect Cash",
        Value = _G.AutoCollectCash,
        Flag = "AutoCollectCash",
        Callback = function(v)
            _G.AutoCollectCash = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Collect Cash Dinyalakan" or "Auto Collect Cash Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Upgrade Process",
        Value = _G.AutoUpgradeProcess,
        Flag = "AutoUpgradeProcess",
        Callback = function(v)
            _G.AutoUpgradeProcess = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Upgrade Process Dinyalakan" or "Auto Upgrade Process Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Claim Guild",
        Value = _G.AutoClaimGuild,
        Flag = "AutoClaimGuild",
        Callback = function(v)
            _G.AutoClaimGuild = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Claim Guild Dinyalakan" or "Auto Claim Guild Dimatikan",
                Duration = 2,
            })
        end,
    })

    -- Chicken Automation Elements
    ChickenTab:Section({
        Title = "Chicken Management",
    })

    ChickenTab:Toggle({
        Title = "Auto Buy Chicken",
        Value = _G.AutoBuyChicken,
        Flag = "AutoBuyChicken",
        Callback = function(v)
            _G.AutoBuyChicken = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Buy Chicken Dinyalakan" or "Auto Buy Chicken Dimatikan",
                Duration = 2,
            })
        end,
    })

    ChickenTab:Toggle({
        Title = "Auto Merge Chicken",
        Value = _G.AutoMergeChicken,
        Flag = "AutoMergeChicken",
        Callback = function(v)
            _G.AutoMergeChicken = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Merge Chicken Dinyalakan" or "Auto Merge Chicken Dimatikan",
                Duration = 2,
            })
        end,
    })

    ChickenTab:Dropdown({
        Title = "Jumlah Beli Ayam",
        Values = {"1", "5", "25", "100"},
        Value = "1",
        Flag = "ChickenAmount",
        Callback = function(v)
            _G.ChickenAmount = tonumber(v)
        end,
    })

    -- Misc Elements
    MiscTab:Section({
        Title = "Player Utilities",
    })

    MiscTab:Slider({
        Title = "WalkSpeed",
        Desc = "Ubah kecepatan jalan karakter",
        Value = { Min = 16, Max = 200, Default = 16 },
        Flag = "WalkSpeedSlider",
        Callback = function(v)
            _G.WalkSpeedValue = v
            local char = game:GetService("Players").LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = v
            end
        end,
    })

    MiscTab:Slider({
        Title = "JumpPower",
        Desc = "Ubah kekuatan lompatan karakter",
        Value = { Min = 50, Max = 500, Default = 50 },
        Flag = "JumpPowerSlider",
        Callback = function(v)
            _G.JumpPowerValue = v
            local char = game:GetService("Players").LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.UseJumpPower = true
                char.Humanoid.JumpPower = v
            end
        end,
    })

    MiscTab:Toggle({
        Title = "Anti-AFK",
        Desc = "Mencegah diskoneksi otomatis",
        Value = _G.AntiAFK,
        Flag = "AntiAFK",
        Callback = function(v)
            _G.AntiAFK = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Anti-AFK Dinyalakan" or "Anti-AFK Dimatikan",
                Duration = 2,
            })
        end,
    })

    MiscTab:Section({
        Title = "Server Management",
    })

    MiscTab:Button({
        Title = "Rejoin Server",
        Desc = "Masuk kembali ke server ini",
        Icon = "refresh-cw",
        Callback = function()
            local ts = game:GetService("TeleportService")
            local p = game:GetService("Players").LocalPlayer
            ts:Teleport(game.PlaceId, p)
        end,
    })

    MiscTab:Button({
        Title = "Server Hop",
        Desc = "Pindah ke server lain",
        Icon = "external-link",
        Callback = function()
            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local PlaceId = game.PlaceId
            local Players = game:GetService("Players")

            local function hop()
                local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100")).data
                for _, server in pairs(servers) do
                    if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        TeleportService:TeleportToPlaceInstance(PlaceId, server.id, Players.LocalPlayer)
                        break
                    end
                end
            end
            hop()
        end,
    })

    -- Settings Management
    SettingsTab:Section({
        Title = "Config Management",
    })

    local ConfigManager = Window.ConfigManager
    local ConfigName = "default"

    SettingsTab:Input({
        Title = "Nama Config",
        Value = ConfigName,
        Callback = function(v)
            ConfigName = v
        end,
    })

    SettingsTab:Button({
        Title = "Simpan Config",
        Justify = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:Config(ConfigName)
            if Window.CurrentConfig:Save() then
                WindUI:Notify({
                    Title = "Config Tersimpan",
                    Content = "Konfigurasi '" .. ConfigName .. "' berhasil disimpan",
                    Duration = 3,
                })
            end
        end,
    })

    SettingsTab:Button({
        Title = "Muat Config",
        Justify = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:CreateConfig(ConfigName)
            if Window.CurrentConfig:Load() then
                WindUI:Notify({
                    Title = "Config Dimuat",
                    Content = "Konfigurasi '" .. ConfigName .. "' berhasil dimuat",
                    Duration = 3,
                })
            end
        end,
    })

    -- About & Discord
    AboutTab:Section({
        Title = "Script Info",
    })

    AboutTab:Section({
        Title = "Supported Games:",
        TextSize = 18,
    })

    AboutTab:Section({
        Title = "- Chicken Farm!",
        TextSize = 14,
    })

    AboutTab:Section({
        Title = "- Throw a Coin",
        TextSize = 14,
    })

    AboutTab:Section({
        Title = "Other games coming soon...",
        TextTransparency = 0.5,
        TextSize = 14,
    })

    AboutTab:Section({
        Title = "Discord Community",
    })

    AboutTab:Button({
        Title = "Join Discord",
        Desc = "Click to copy link: discord.gg/8wM2tNhUdB",
        Icon = "link",
        Callback = function()
            if setclipboard then
                setclipboard("https://discord.gg/8wM2tNhUdB")
                WindUI:Notify({
                    Title = "Discord iHannsyHUB",
                    Content = "Link berhasil disalin!",
                    Duration = 3,
                })
            else
                WindUI:Notify({
                    Title = "Discord iHannsyHUB",
                    Content = "https://discord.gg/8wM2tNhUdB",
                    Duration = 5,
                })
            end
        end,
    })

    -- Game Logic Init (Background)
    task.spawn(function()
        local CollectRemote = game:GetService("ReplicatedStorage").Paper.Remotes.__remoteevent
        local FolderEggs = workspace:WaitForChild("Eggs")
        local StandardRemoteFunc = game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local VirtualUser = game:GetService("VirtualUser")

        local function GetNilRemote(Name, DebugId)
            for _, Object in getnilinstances() do
                if Object.Name == Name and Object:GetDebugId() == DebugId then
                    return Object
                end
            end
            for _, Object in getnilinstances() do
                if Object.Name == Name and Object:IsA("RemoteFunction") then
                    return Object
                end
            end
        end

        local MergeRemote = GetNilRemote("__remotefunction", "1_18021")

        -- Anti-AFK Logic
        LocalPlayer.Idled:Connect(function()
            if _G.AntiAFK then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        end)

        -- Keep WalkSpeed/JumpPower persistent on respawn
        LocalPlayer.CharacterAdded:Connect(function(char)
            local hum = char:WaitForChild("Humanoid")
            hum.WalkSpeed = _G.WalkSpeedValue
            hum.UseJumpPower = true
            hum.JumpPower = _G.JumpPowerValue
        end)

        -- Background Loops
        task.spawn(function()
            while true do
                task.wait(0.2)
                if _G.AutoEggPasti then
                    for _, telur in pairs(FolderEggs:GetChildren()) do
                        if telur and _G.AutoEggPasti then
                            CollectRemote:FireServer("Collect Egg", telur.Name)
                            telur:Destroy()
                        end
                    end
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(5)
                if _G.AutoDeposit then
                    pcall(function()
                        StandardRemoteFunc:InvokeServer("Deposit Eggs")
                    end)
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(2)
                if _G.AutoBuyChicken then
                    pcall(function()
                        StandardRemoteFunc:InvokeServer("Buy Chickens", _G.ChickenAmount)
                    end)
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(1)
                if _G.AutoCollectCash then
                    pcall(function()
                        StandardRemoteFunc:InvokeServer("Collect Cash")
                    end)
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(2.5)
                if _G.AutoMergeChicken then
                    pcall(function()
                        if not MergeRemote then
                            MergeRemote = GetNilRemote("__remotefunction", "1_18021")
                        end
                        MergeRemote:InvokeServer("Merge Chickens")
                    end)
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(3)
                if _G.AutoUpgradeProcess then
                    pcall(function()
                        StandardRemoteFunc:InvokeServer("Upgrade Process Level")
                    end)
                end
            end
        end)

        task.spawn(function()
            while true do
                if _G.AutoClaimGuild then
                    pcall(function()
                        StandardRemoteFunc:InvokeServer("Claim Group Reward")
                    end)
                end
                task.wait(600)
            end
        end)
    end)
elseif game.PlaceId == 115681808123944 or game.GameId == 115681808123944 then
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

    -- Initialize Globals
    _G.SafeFarmActive = false
    _G.AutoSellActive = false
    _G.AutoValueActive = false
    _G.AutoLuckActive = false
    _G.WalkSpeedValue = 16
    _G.JumpPowerValue = 50
    _G.AntiAFK = false

    local Window = WindUI:CreateWindow({
        Title = "iHannsyHUB",
        Author = "iHannsy A.K.A MasPakan",
        Folder = "iHannsyHUB",
        Icon = "rbxassetid://110043383622723",
        Theme = "Sky",
        KeySystem = {
            Key = { "PAKAN" },
            Note = "Dapatkan key dengan bergabung ke Discord melalui tombol di bawah!",
            URL = "https://discord.gg/8wM2tNhUdB",
            SaveKey = false,
        },
        OpenButton = {
            Enabled = true,
            Title = "Open iHannsyHUB",
            Draggable = true,
        },
    })

    local FPSTag = Window:Tag({
        Title = "0 FPS",
        Color = Color3.fromHex("#00d4ff"),
    })

    local VersionTag = Window:Tag({
        Title = "v0.1.1",
        Icon = "github",
        Color = Color3.fromHex("#00d4ff"),
    })

    local RunService = game:GetService("RunService")

    local LastTime = tick()

    local FrameCount = 0

    task.spawn(function()
        while true do
            task.wait(1)
            local CurrentTime = tick()
            local FPS = math.round(FrameCount / (CurrentTime - LastTime))
            FPSTag:SetTitle(FPS .. " FPS")
            FrameCount = 0
            LastTime = CurrentTime
        end
    end)

    RunService.RenderStepped:Connect(function()
        FrameCount = FrameCount + 1
    end)

    local MainTab = Window:Tab({
        Title = "Main Automation",
        Icon = "play",
    })

    local MiscTab = Window:Tab({
        Title = "Misc",
        Icon = "box",
    })

    local SettingsTab = Window:Tab({
        Title = "Settings",
        Icon = "settings",
    })

    local AboutTab = Window:Tab({
        Title = "About",
        Icon = "info",
    })

    -- Main Automation Elements
    MainTab:Image({
        Image = "rbxassetid://110043383622723",
        AspectRatio = "1:1",
        Radius = 9,
    })

    MainTab:Section({
        Title = "General Automation",
    })

    MainTab:Toggle({
        Title = "Auto Farm",
        Value = _G.SafeFarmActive,
        Flag = "AutoFarm",
        Callback = function(v)
            _G.SafeFarmActive = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Farm Dinyalakan" or "Auto Farm Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Sell",
        Value = _G.AutoSellActive,
        Flag = "AutoSell",
        Callback = function(v)
            _G.AutoSellActive = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Sell Dinyalakan" or "Auto Sell Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Upgrade Value",
        Value = _G.AutoValueActive,
        Flag = "AutoUpgradeValue",
        Callback = function(v)
            _G.AutoValueActive = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Upgrade Value Dinyalakan" or "Auto Upgrade Value Dimatikan",
                Duration = 2,
            })
        end,
    })

    MainTab:Toggle({
        Title = "Auto Upgrade Luck",
        Value = _G.AutoLuckActive,
        Flag = "AutoUpgradeLuck",
        Callback = function(v)
            _G.AutoLuckActive = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Auto Upgrade Luck Dinyalakan" or "Auto Upgrade Luck Dimatikan",
                Duration = 2,
            })
        end,
    })

    -- Misc Elements
    MiscTab:Section({
        Title = "Player Utilities",
    })

    MiscTab:Slider({
        Title = "WalkSpeed",
        Desc = "Ubah kecepatan jalan karakter",
        Value = { Min = 16, Max = 200, Default = 16 },
        Flag = "WalkSpeedSlider",
        Callback = function(v)
            _G.WalkSpeedValue = v
            local char = game:GetService("Players").LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = v
            end
        end,
    })

    MiscTab:Slider({
        Title = "JumpPower",
        Desc = "Ubah kekuatan lompatan karakter",
        Value = { Min = 50, Max = 500, Default = 50 },
        Flag = "JumpPowerSlider",
        Callback = function(v)
            _G.JumpPowerValue = v
            local char = game:GetService("Players").LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.UseJumpPower = true
                char.Humanoid.JumpPower = v
            end
        end,
    })

    MiscTab:Toggle({
        Title = "Anti-AFK",
        Desc = "Mencegah diskoneksi otomatis",
        Value = _G.AntiAFK,
        Flag = "AntiAFK",
        Callback = function(v)
            _G.AntiAFK = v
            WindUI:Notify({
                Title = "iHannsyHUB",
                Content = v and "Anti-AFK Dinyalakan" or "Anti-AFK Dimatikan",
                Duration = 2,
            })
        end,
    })

    MiscTab:Section({
        Title = "Server Management",
    })

    MiscTab:Button({
        Title = "Rejoin Server",
        Desc = "Masuk kembali ke server ini",
        Icon = "refresh-cw",
        Callback = function()
            local ts = game:GetService("TeleportService")
            local p = game:GetService("Players").LocalPlayer
            ts:Teleport(game.PlaceId, p)
        end,
    })

    MiscTab:Button({
        Title = "Server Hop",
        Desc = "Pindah ke server lain",
        Icon = "external-link",
        Callback = function()
            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local PlaceId = game.PlaceId
            local Players = game:GetService("Players")

            local function hop()
                local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100")).data
                for _, server in pairs(servers) do
                    if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        TeleportService:TeleportToPlaceInstance(PlaceId, server.id, Players.LocalPlayer)
                        break
                    end
                end
            end
            hop()
        end,
    })

    -- Settings Management
    SettingsTab:Section({
        Title = "Config Management",
    })

    local ConfigManager = Window.ConfigManager
    local ConfigName = "default"

    SettingsTab:Input({
        Title = "Nama Config",
        Value = ConfigName,
        Callback = function(v)
            ConfigName = v
        end,
    })

    SettingsTab:Button({
        Title = "Simpan Config",
        Justify = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:Config(ConfigName)
            if Window.CurrentConfig:Save() then
                WindUI:Notify({
                    Title = "Config Tersimpan",
                    Content = "Konfigurasi '" .. ConfigName .. "' berhasil disimpan",
                    Duration = 3,
                })
            end
        end,
    })

    SettingsTab:Button({
        Title = "Muat Config",
        Justify = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:CreateConfig(ConfigName)
            if Window.CurrentConfig:Load() then
                WindUI:Notify({
                    Title = "Config Dimuat",
                    Content = "Konfigurasi '" .. ConfigName .. "' berhasil dimuat",
                    Duration = 3,
                })
            end
        end,
    })

    -- About & Discord
    AboutTab:Section({
        Title = "Script Info",
    })

    AboutTab:Section({
        Title = "Supported Games:",
        TextSize = 18,
    })

    AboutTab:Section({
        Title = "- Chicken Farm!",
        TextSize = 14,
    })

    AboutTab:Section({
        Title = "- Throw a Coin",
        TextSize = 14,
    })

    AboutTab:Section({
        Title = "Other games coming soon...",
        TextTransparency = 0.5,
        TextSize = 14,
    })

    AboutTab:Section({
        Title = "Discord Community",
    })

    AboutTab:Button({
        Title = "Join Discord",
        Desc = "Click to copy link: discord.gg/8wM2tNhUdB",
        Icon = "link",
        Callback = function()
            if setclipboard then
                setclipboard("https://discord.gg/8wM2tNhUdB")
                WindUI:Notify({
                    Title = "Discord iHannsyHUB",
                    Content = "Link berhasil disalin!",
                    Duration = 3,
                })
            else
                WindUI:Notify({
                    Title = "Discord iHannsyHUB",
                    Content = "https://discord.gg/8wM2tNhUdB",
                    Duration = 5,
                })
            end
        end,
    })

    -- Game Logic Init (Background)
    task.spawn(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local VirtualUser = game:GetService("VirtualUser")

        -- Non-blocking or deferred event finding to ensure fast load of UI
        local Assets = ReplicatedStorage:WaitForChild("Assets")
        local Events = Assets:WaitForChild("Events")
        local CoinThrowEvent = Events:WaitForChild("CoinThrow")
        local CoinLandedEvent = Events:WaitForChild("CoinLanded")
        local SellAllEvent = Events:WaitForChild("SellAll")
        local UpgradeEvent = Events:WaitForChild("RequestUpgrade")
        local targetPosition = Vector3.new(-1168.9798583984, 0.72600001096725, -168.94018554688)

        -- Anti-AFK Logic
        LocalPlayer.Idled:Connect(function()
            if _G.AntiAFK then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        end)

        -- Keep WalkSpeed/JumpPower persistent on respawn
        LocalPlayer.CharacterAdded:Connect(function(char)
            local hum = char:WaitForChild("Humanoid")
            hum.WalkSpeed = _G.WalkSpeedValue
            hum.UseJumpPower = true
            hum.JumpPower = _G.JumpPowerValue
        end)

        -- Background Loops
        -- Loop Auto Farm
        task.spawn(function()
            while true do
                if _G.SafeFarmActive then
                    pcall(function()
                        CoinThrowEvent:FireServer("Fortune Coin", targetPosition)
                    end)
                    task.wait(0.2)
                    if _G.SafeFarmActive then
                        pcall(function()
                            CoinLandedEvent:FireServer(2, targetPosition, "Fortune Coin", nil, nil)
                        end)
                    end
                    task.wait(0.5)
                else
                    task.wait(0.5)
                end
            end
        end)

        -- Loop Auto Sell
        task.spawn(function()
            while true do
                if _G.AutoSellActive then
                    pcall(function()
                        SellAllEvent:FireServer()
                    end)
                    task.wait(3.5)
                else
                    task.wait(0.5)
                end
            end
        end)

        -- Loop Auto Upgrade Value
        task.spawn(function()
            while true do
                if _G.AutoValueActive then
                    pcall(function()
                        UpgradeEvent:FireServer("Value Multiplier")
                    end)
                    task.wait(1.5)
                else
                    task.wait(0.5)
                end
            end
        end)

        -- Loop Auto Upgrade Luck
        task.spawn(function()
            while true do
                if _G.AutoLuckActive then
                    pcall(function()
                        UpgradeEvent:FireServer("Luck Multiplier")
                    end)
                    task.wait(1.5)
                else
                    task.wait(0.5)
                end
            end
        end)
    end)
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "iHannsyHUB",
        Text = "Script tidak didukung di map ini!",
        Duration = 5
    })
end
