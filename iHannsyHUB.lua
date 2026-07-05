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
    _G.ChickenAmount = 1

    local Window = WindUI:CreateWindow({
        Title = "iHannsyHUB",
        Author = "iHannsy A.K.A MasPakan",
        Folder = "iHannsyHUB",
        Icon = "rbxassetid://110043383622723",
        Theme = "Sky",
        KeySystem = {
            Key = { "PAKAN" },
            Note = "Join Discord for Key: discord.gg/8wM2tNhUdB",
            URL = "https://discord.gg/8wM2tNhUdB",
            SaveKey = false, -- Enforce manual entry each run as requested
        },
        OpenButton = {
            Enabled = true,
            Title = "Open iHannsyHUB",
            Draggable = true,
        },
    })

    local MainTab = Window:Tab({
        Title = "Main Automation",
        Icon = "play",
    })

    local ChickenTab = Window:Tab({
        Title = "Chicken Automation",
        Icon = "bird",
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
        Title = "Game Support: Chicken Farm!",
        TextSize = 18,
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
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "iHannsyHUB",
        Text = "Script tidak didukung di map ini!",
        Duration = 5
    })
end
