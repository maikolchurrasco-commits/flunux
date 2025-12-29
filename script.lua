local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- HUMANOID
local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

-- GUI
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
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
title.TextXAlignment = Left

-- CERRAR
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(170,0,0)
close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

-- MINIMIZAR
local mini = Instance.new("TextButton", frame)
mini.Size = UDim2.new(0,30,0,30)
mini.Position = UDim2.new(1,-70,0,5)
mini.Text = "-"
mini.BackgroundColor3 = Color3.fromRGB(80,80,80)
mini.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", mini).CornerRadius = UDim.new(1,0)

-- VELOCIDAD BOTON
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Size = UDim2.new(0,150,0,40)
speedBtn.Position = UDim2.new(0.05,0,0.35,0)
speedBtn.Text = "Velocidad"
speedBtn.BackgroundColor3 = Color3.fromRGB(0,120,255)
speedBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0,8)

-- VELOCIDAD CUADRO
local speedBox = Instance.new("TextBox", frame)
speedBox.Size = UDim2.new(0,90,0,40)
speedBox.Position = UDim2.new(0.55,0,0.35,0)
speedBox.PlaceholderText = "Ej: 50"
speedBox.Text = ""
speedBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.ClearTextOnFocus = false
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0,8)

-- SALTO BOTON
local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Size = UDim2.new(0,150,0,40)
jumpBtn.Position = UDim2.new(0.05,0,0.6,0)
jumpBtn.Text = "Salto"
jumpBtn.BackgroundColor3 = Color3.fromRGB(0,200,120)
jumpBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", jumpBtn).CornerRadius = UDim.new(0,8)

-- SALTO CUADRO
local jumpBox = Instance.new("TextBox", frame)
jumpBox.Size = UDim2.new(0,90,0,40)
jumpBox.Position = UDim2.new(0.55,0,0.6,0)
jumpBox.PlaceholderText = "Ej: 120"
jumpBox.Text = ""
jumpBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
jumpBox.TextColor3 = Color3.new(1,1,1)
jumpBox.ClearTextOnFocus = false
Instance.new("UICorner", jumpBox).CornerRadius = UDim.new(0,8)

-- CIRCULO
local circle = Instance.new("TextButton", gui)
circle.Size = UDim2.new(0,60,0,60)
circle.Position = UDim2.new(0.05,0,0.5,0)
circle.Text = "◉"
circle.Visible = false
circle.BackgroundColor3 = Color3.fromRGB(0,170,255)
circle.TextColor3 = Color3.new(1,1,1)
circle.Active = true
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)

-- DRAG
local function drag(f)
	local d, start, pos
	f.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			d = true
			start = i.Position
			pos = f.Position
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if d and i.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = i.Position - start
			f.Position = UDim2.new(pos.X.Scale, pos.X.Offset+delta.X, pos.Y.Scale, pos.Y.Offset+delta.Y)
		end
	end)
	UIS.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			d = false
		end
	end)
end

drag(frame)
drag(circle)

-- FUNCIONES
speedBtn.MouseButton1Click:Connect(function()
	local v = tonumber(speedBox.Text) or 50
	getHumanoid().WalkSpeed = v
end)

jumpBtn.MouseButton1Click:Connect(function()
	local j = tonumber(jumpBox.Text) or 120
	getHumanoid().JumpPower = j
end)

mini.MouseButton1Click:Connect(function()
	frame.Visible = false
	circle.Visible = true
end)

circle.MouseButton1Click:Connect(function()
	frame.Visible = true
	circle.Visible = false
end)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
