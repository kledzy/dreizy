--// STEAL A BRAINROT Loading Screen + FAILED UI (Fixed Order + Smooth Progressive Motion)
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

pcall(function()
    StarterGui:SetCore("TopbarEnabled", false) -- hides the top bar (settings, 3 lines)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false) -- hides chat
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false) -- hides leaderboard
end)

    -- extra loop to ensure permanent removal
    while task.wait(2) do
        pcall(function()
            StarterGui:SetCore("TopbarEnabled", false)
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
        end)
    end
end)

-- Cleanup
if CoreGui:FindFirstChild("LoadingGui") then CoreGui.LoadingGui:Destroy() end
if CoreGui:FindFirstChild("FailedGui") then CoreGui.FailedGui:Destroy() end

------------------
-- FAILED SCREEN --
------------------
local function showFailedUI()
	local FailedGui = Instance.new("ScreenGui")
	FailedGui.Name = "FailedGui"
	FailedGui.IgnoreGuiInset = true
	FailedGui.ResetOnSpawn = false
	FailedGui.Parent = CoreGui

	local FailedBg = Instance.new("Frame")
	FailedBg.Size = UDim2.new(1, 0, 1, 0)
	FailedBg.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
	FailedBg.BorderSizePixel = 0
	FailedBg.Parent = FailedGui

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, 0, 0, 100)
	Title.Position = UDim2.new(0, 0, 0.35, 0)
	Title.BackgroundTransparency = 1
	Title.Text = "❌ FAILED ❌"
	Title.TextColor3 = Color3.fromRGB(255, 0, 0)
	Title.Font = Enum.Font.Arcade
	Title.TextSize = 60
	Title.TextStrokeTransparency = 0.2
	Title.TextStrokeColor3 = Color3.fromRGB(100, 0, 0)
	Title.Parent = FailedBg

	local Sub = Instance.new("TextLabel")
	Sub.Size = UDim2.new(1, 0, 0, 50)
	Sub.Position = UDim2.new(0, 0, 0.47, 0)
	Sub.BackgroundTransparency = 1
	Sub.Text = "Please Rejoin and Try Again."
	Sub.TextColor3 = Color3.fromRGB(255, 150, 150)
	Sub.Font = Enum.Font.Arcade
	Sub.TextSize = 26
	Sub.TextStrokeTransparency = 0.3
	Sub.TextStrokeColor3 = Color3.fromRGB(100, 0, 0)
	Sub.Parent = FailedBg
end

--------------------------
-- GREEN LOADING SCREEN --
--------------------------
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "LoadingGui"
LoadingGui.IgnoreGuiInset = true
LoadingGui.ResetOnSpawn = false
LoadingGui.Parent = CoreGui

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(5, 10, 5)
Background.BorderSizePixel = 0
Background.Parent = LoadingGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 70)
Title.Position = UDim2.new(0, 0, 0.3, 0)
Title.BackgroundTransparency = 1
Title.Text = "🧠 STEAL A BRAINROT"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.Font = Enum.Font.Arcade
Title.TextSize = 42
Title.TextStrokeTransparency = 0.2
Title.TextStrokeColor3 = Color3.fromRGB(0, 100, 0)
Title.Parent = Background

-- Anti Cheat Message
local AntiCheatMsg = Instance.new("TextLabel")
AntiCheatMsg.Size = UDim2.new(1, 0, 0, 30)
AntiCheatMsg.Position = UDim2.new(0, 0, 0.42, 0)
AntiCheatMsg.BackgroundTransparency = 1
AntiCheatMsg.Text = "Bypassing Anti Cheat, Please wait for a while..."
AntiCheatMsg.TextColor3 = Color3.fromRGB(180, 255, 180)
AntiCheatMsg.Font = Enum.Font.Arcade
AntiCheatMsg.TextSize = 22
AntiCheatMsg.TextStrokeTransparency = 0.4
AntiCheatMsg.TextStrokeColor3 = Color3.fromRGB(0, 80, 0)
AntiCheatMsg.Parent = Background

-- Bar Container
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0, 600, 0, 40)
Container.Position = UDim2.new(0.5, -300, 0.5, 0)
Container.BackgroundColor3 = Color3.fromRGB(20, 30, 20)
Container.BorderSizePixel = 0
Container.ClipsDescendants = true
Container.Parent = Background

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Container

-- Loading Bar
local LoadingBar = Instance.new("Frame")
LoadingBar.Size = UDim2.new(0, 0, 1, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
LoadingBar.BorderSizePixel = 0
LoadingBar.Parent = Container

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 12)
BarCorner.Parent = LoadingBar

-- Gradient Glow
local Glow = Instance.new("UIGradient")
Glow.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 255, 120)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
}
Glow.Rotation = 0
Glow.Parent = LoadingBar

-- Percentage Text
local Percent = Instance.new("TextLabel")
Percent.Size = UDim2.new(1, 0, 1, 0)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.TextColor3 = Color3.fromRGB(255, 255, 255)
Percent.Font = Enum.Font.Arcade
Percent.TextSize = 22
Percent.TextStrokeTransparency = 0.3
Percent.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Percent.Parent = Container

-- Status Text
local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 30)
StatusText.Position = UDim2.new(0, 0, 0.58, 0)
StatusText.BackgroundTransparency = 1
StatusText.TextColor3 = Color3.fromRGB(150, 255, 150)
StatusText.Font = Enum.Font.Arcade
StatusText.TextSize = 20
StatusText.TextStrokeTransparency = 0.3
StatusText.TextStrokeColor3 = Color3.fromRGB(0, 80, 0)
StatusText.Text = "Connecting to server..."
StatusText.Parent = Background

-- Messages
local statusMessages = {
	"Connecting to server",
	"Initializing Script",
	"Loading resources",
	"Initializing components",
	"Syncing data",
	"Optimizing performance",
	"Almost ready",
	"Finalizing setup"
}
local currentStatus = 1

-- Animated Dots
task.spawn(function()
	local dots = 1
	while LoadingGui.Parent do
		dots = (dots % 3) + 1
		StatusText.Text = statusMessages[currentStatus] .. string.rep(".", dots)
		task.wait(0.5)
	end
end)

-- Moving Glow
task.spawn(function()
	while LoadingGui.Parent do
		for i = 0, 1, 0.01 do
			Glow.Offset = Vector2.new(i, 0)
			task.wait(0.03)
		end
	end
end)

-- Progressive easing
local function easeOutQuad(x)
	return 1 - (1 - x) * (1 - x)
end

-- 5 minutes total (300s)
task.spawn(function()
	local totalDuration = 300
	local totalSteps = 100
	local stepTime = totalDuration / totalSteps
	local changeEvery = totalSteps / #statusMessages

	for i = 1, totalSteps do
		local progress = easeOutQuad(i / totalSteps)
		local newWidth = UDim2.new(progress, 0, 1, 0)
		TweenService:Create(LoadingBar, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {Size = newWidth}):Play()

		local percentValue = math.floor(progress * 100)
		Percent.Text = percentValue .. "%"

		if i % changeEvery < 1 and currentStatus < #statusMessages then
			currentStatus += 1
		end
		task.wait(stepTime)
	end

	Percent.Text = "100% - Loaded!"
	StatusText.Text = "Load complete ✅"
	AntiCheatMsg.Text = "Anti Cheat bypassed successfully!"

	task.wait(1)
	showFailedUI()
end)
