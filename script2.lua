-- SERVICIOS
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- HUMANOID
local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = PlayerGui
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999

-- FRAME
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 260)
frame.Position = UDim2.new(0.5, -160, 0.4, -110)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

-- TITULO
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -80, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Boost Menu"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left

-- BOTONES
local function button(text, pos, color)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(0,150,0,40)
	b.Position = pos
	b.Text = text
	b.BackgroundColor3 = color
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
	return b
end

local speedBtn = button("Velocidad", UDim2.new(0.05,0,0.35,0), Color3.fromRGB(0,120,255))
local jumpBtn  = button("Salto",     UDim2.new(0.05,0,0.6,0),  Color3.fromRGB(0,200,120))

local function box(pos)
	local b = Instance.new("TextBox", frame)
	b.Size = UDim2.new(0,90,0,40)
	b.Position = pos
	b.PlaceholderText = "Ej"
	b.ClearTextOnFocus = false
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
	return b
end

local speedBox = box(UDim2.new(0.55,0,0.35,0))
local jumpBox  = box(UDim2.new(0.55,0,0.6,0))

-- FUNCIONES
speedBtn.MouseButton1Click:Connect(function()
	getHumanoid().WalkSpeed = tonumber(speedBox.Text) or 50
end)

jumpBtn.MouseButton1Click:Connect(function()
	getHumanoid().JumpPower = tonumber(jumpBox.Text) or 120
end)

warn("BOTONES CREADOS CORRECTAMENTE")
