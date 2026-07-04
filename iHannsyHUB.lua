local CollectRemote = game:GetService("ReplicatedStorage").Paper.Remotes.__remoteevent
local FolderEggs = workspace:WaitForChild("Eggs")
local LocalPlayer = game:GetService("Players").LocalPlayer

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

local StandardRemoteFunc = game:GetService("ReplicatedStorage").Paper.Remotes.__remotefunction
local MergeRemote = GetNilRemote("__remotefunction", "1_18021")

_G.AutoEggPasti = false
_G.AutoDeposit = false
_G.AutoBuyChicken = false
_G.AutoCollectCash = false
_G.AutoMergeChicken = false
_G.AutoUpgradeProcess = false
_G.AutoClaimGuild = false
_G.ChickenAmount = 1 

task.wait(0.2)

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleEggBtn = Instance.new("TextButton")
local ToggleDepositBtn = Instance.new("TextButton")
local ToggleChickenBtn = Instance.new("TextButton")
local ToggleCashBtn = Instance.new("TextButton")
local ToggleMergeBtn = Instance.new("TextButton")
local ToggleUpgradeBtn = Instance.new("TextButton")
local ToggleGuildBtn = Instance.new("TextButton")
local DropdownBtn = Instance.new("TextButton")
local DropdownFrame = Instance.new("Frame")
local Credit = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "ManualControlUltimateHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.1, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 470)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "MANUAL CONTROL HUB 🕹️"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

ToggleEggBtn.Parent = MainFrame
ToggleEggBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleEggBtn.Position = UDim2.new(0.05, 0, 0.11, 0)
ToggleEggBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleEggBtn.Font = Enum.Font.SourceSansBold
ToggleEggBtn.Text = "AUTO EGG: OFF"
ToggleEggBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleEggBtn.TextSize = 12

ToggleDepositBtn.Parent = MainFrame
ToggleDepositBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleDepositBtn.Position = UDim2.new(0.05, 0, 0.19, 0)
ToggleDepositBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleDepositBtn.Font = Enum.Font.SourceSansBold
ToggleDepositBtn.Text = "AUTO DEPOSIT: OFF"
ToggleDepositBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleDepositBtn.TextSize = 12

ToggleChickenBtn.Parent = MainFrame
ToggleChickenBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleChickenBtn.Position = UDim2.new(0.05, 0, 0.27, 0)
ToggleChickenBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleChickenBtn.Font = Enum.Font.SourceSansBold
ToggleChickenBtn.Text = "AUTO CHICKEN: OFF"
ToggleChickenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleChickenBtn.TextSize = 12

ToggleCashBtn.Parent = MainFrame
ToggleCashBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleCashBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
ToggleCashBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleCashBtn.Font = Enum.Font.SourceSansBold
ToggleCashBtn.Text = "AUTO CASH: OFF"
ToggleCashBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleCashBtn.TextSize = 12

ToggleMergeBtn.Parent = MainFrame
ToggleMergeBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleMergeBtn.Position = UDim2.new(0.05, 0, 0.43, 0)
ToggleMergeBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleMergeBtn.Font = Enum.Font.SourceSansBold
ToggleMergeBtn.Text = "AUTO MERGE: OFF"
ToggleMergeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleMergeBtn.TextSize = 12

ToggleUpgradeBtn.Parent = MainFrame
ToggleUpgradeBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleUpgradeBtn.Position = UDim2.new(0.05, 0, 0.51, 0)
ToggleUpgradeBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleUpgradeBtn.Font = Enum.Font.SourceSansBold
ToggleUpgradeBtn.Text = "AUTO UPGRADE PROCESS: OFF"
ToggleUpgradeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleUpgradeBtn.TextSize = 12

ToggleGuildBtn.Parent = MainFrame
ToggleGuildBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
ToggleGuildBtn.Position = UDim2.new(0.05, 0, 0.59, 0)
ToggleGuildBtn.Size = UDim2.new(0.9, 0, 0, 30)
ToggleGuildBtn.Font = Enum.Font.SourceSansBold
ToggleGuildBtn.Text = "AUTO CLAIM GUILD: OFF"
ToggleGuildBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleGuildBtn.TextSize = 12

DropdownBtn.Parent = MainFrame
DropdownBtn.BackgroundColor3 = Color3.fromRGB(45, 52, 54)
DropdownBtn.Position = UDim2.new(0.05, 0, 0.72, 0)
DropdownBtn.Size = UDim2.new(0.9, 0, 0, 30)
DropdownBtn.Font = Enum.Font.SourceSansBold
DropdownBtn.Text = "JUMLAH BELI AYAM: 1 ▼"
DropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.TextSize = 12

DropdownFrame.Parent = MainFrame
DropdownFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DropdownFrame.Position = UDim2.new(0.05, 0, 0.80, 0)
DropdownFrame.Size = UDim2.new(0.9, 0, 0, 35)
DropdownFrame.Visible = false
DropdownFrame.ZIndex = 5

Credit.Parent = MainFrame
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0, 0, 0.94, 0)
Credit.Size = UDim2.new(1, 0, 0, 20)
Credit.Font = Enum.Font.SourceSansItalic
Credit.Text = "Full Script Hub Rewritten"
Credit.TextColor3 = Color3.fromRGB(130, 130, 130)
Credit.TextSize = 11

local options = {1, 5, 25, 100}
local listLayout = Instance.new("UIListLayout")
listLayout.Parent = DropdownFrame
listLayout.FillDirection = Enum.FillDirection.Horizontal
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

for i, val in ipairs(options) do
    local optBtn = Instance.new("TextButton")
    optBtn.Parent = DropdownFrame
    optBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    optBtn.Size = UDim2.new(0.25, 0, 1, 0)
    optBtn.Font = Enum.Font.SourceSansBold
    optBtn.Text = tostring(val)
    optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    optBtn.TextSize = 11
    optBtn.ZIndex = 6
    
    optBtn.MouseButton1Click:Connect(function()
        _G.ChickenAmount = val
        DropdownBtn.Text = "JUMLAH BELI AYAM: " .. tostring(val) .. " ▼"
        DropdownFrame.Visible = false
    end)
end

DropdownBtn.MouseButton1Click:Connect(function()
    DropdownFrame.Visible = not DropdownFrame.Visible
end)

local function updateUI()
    ToggleEggBtn.Text = _G.AutoEggPasti and "AUTO EGG: ACTIVE" or "AUTO EGG: OFF"
    ToggleEggBtn.BackgroundColor3 = _G.AutoEggPasti and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)

    ToggleDepositBtn.Text = _G.AutoDeposit and "AUTO DEPOSIT: ACTIVE" or "AUTO DEPOSIT: OFF"
    ToggleDepositBtn.BackgroundColor3 = _G.AutoDeposit and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)

    ToggleChickenBtn.Text = _G.AutoBuyChicken and "AUTO CHICKEN: ACTIVE" or "AUTO CHICKEN: OFF"
    ToggleChickenBtn.BackgroundColor3 = _G.AutoBuyChicken and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)

    ToggleCashBtn.Text = _G.AutoCollectCash and "AUTO CASH: ACTIVE" or "AUTO CASH: OFF"
    ToggleCashBtn.BackgroundColor3 = _G.AutoCollectCash and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)

    ToggleMergeBtn.Text = _G.AutoMergeChicken and "AUTO MERGE: ACTIVE" or "AUTO MERGE: OFF"
    ToggleMergeBtn.BackgroundColor3 = _G.AutoMergeChicken and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)

    ToggleUpgradeBtn.Text = _G.AutoUpgradeProcess and "AUTO UPGRADE PROCESS: ACTIVE" or "AUTO UPGRADE PROCESS: OFF"
    ToggleUpgradeBtn.BackgroundColor3 = _G.AutoUpgradeProcess and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)

    ToggleGuildBtn.Text = _G.AutoClaimGuild and "AUTO CLAIM GUILD: ACTIVE" or "AUTO CLAIM GUILD: OFF"
    ToggleGuildBtn.BackgroundColor3 = _G.AutoClaimGuild and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
end

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

ToggleEggBtn.MouseButton1Click:Connect(function()
    _G.AutoEggPasti = not _G.AutoEggPasti
    updateUI()
end)

ToggleDepositBtn.MouseButton1Click:Connect(function()
    _G.AutoDeposit = not _G.AutoDeposit
    updateUI()
end)

ToggleChickenBtn.MouseButton1Click:Connect(function()
    _G.AutoBuyChicken = not _G.AutoBuyChicken
    updateUI()
end)

ToggleCashBtn.MouseButton1Click:Connect(function()
    _G.AutoCollectCash = not _G.AutoCollectCash
    updateUI()
end)

ToggleMergeBtn.MouseButton1Click:Connect(function()
    _G.AutoMergeChicken = not _G.AutoMergeChicken
    updateUI()
end)

ToggleUpgradeBtn.MouseButton1Click:Connect(function()
    _G.AutoUpgradeProcess = not _G.AutoUpgradeProcess
    updateUI()

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Egg Hub",
        Text = _G.AutoUpgradeProcess and "Auto Upgrade Process Dinyalakan" or "Auto Upgrade Process Dimatikan",
        Duration = 1.5
    })
end)

ToggleGuildBtn.MouseButton1Click:Connect(function()
    _G.AutoClaimGuild = not _G.AutoClaimGuild
    updateUI()

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Egg Hub",
        Text = _G.AutoClaimGuild and "Auto Claim Guild Dinyalakan" or "Auto Claim Guild Dimatikan",
        Duration = 1.5
    })
end)
