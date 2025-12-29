-- SERVICIOS
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- SCREEN GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.DisplayOrder = 999999
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- FRAME
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,300,0,350)
frame.Position = UDim2.new(0.5,-150,0.35,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Active = true
frame.ZIndex = 10
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

-- TÍTULO
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,-80,0,30)
title.Position = UDim2.new(0,10,0,5)
title.Text = "SCRIPT GUI"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 11

-- BOTÓN CERRAR
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(180,60,60)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.ZIndex = 11
Instance.new("UICorner", close)

-- BOTÓN MINIMIZAR
local minimize = Instance.new("TextButton", frame)
minimize.Size = UDim2.new(0,30,0,30)
minimize.Position = UDim2.new(1,-70,0,5)
minimize.Text = "-"
minimize.BackgroundColor3 = Color3.fromRGB(70,70,70)
minimize.TextColor3 = Color3.new(1,1,1)
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 22
minimize.ZIndex = 11
Instance.new("UICorner", minimize)

-- FUNCIÓN LABEL + BOX
local function labelBox(text,y,placeholder)
	local l = Instance.new("TextLabel", frame)
	l.Size = UDim2.new(0,260,0,20)
	l.Position = UDim2.new(0,20,0,y)
	l.Text = text
	l.TextColor3 = Color3.new(1,1,1)
	l.BackgroundTransparency = 1
	l.Font = Enum.Font.Gotham
	l.TextSize = 14
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.ZIndex = 11

	local b = Instance.new("TextBox", frame)
	b.Size = UDim2.new(0,260,0,30)
	b.Position = UDim2.new(0,20,0,y+20)
	b.PlaceholderText = placeholder
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.ClearTextOnFocus = false
	b.ZIndex = 11
	Instance.new("UICorner", b)
	return b
end

local speedBox = labelBox("Velocidad",45,"Ej: 50")
local jumpBox = labelBox("Salto",145,"Ej: 120")

-- BOTÓN VELOCIDAD (TOGGLE)
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Size = UDim2.new(0,260,0,35)
speedBtn.Position = UDim2.new(0,20,0,100)
speedBtn.Text = "Velocidad DESACTIVADA"
speedBtn.BackgroundColor3 = Color3.fromRGB(180,60,60)
speedBtn.TextColor3 = Color3.new(1,1,1)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 15
speedBtn.ZIndex = 11
Instance.new("UICorner", speedBtn)

-- BOTÓN SALTO (TOGGLE)
local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Size = UDim2.new(0,260,0,35)
jumpBtn.Position = UDim2.new(0,20,0,200)
jumpBtn.Text = "Salto DESACTIVADO"
jumpBtn.BackgroundColor3 = Color3.fromRGB(180,60,60)
jumpBtn.TextColor3 = Color3.new(1,1,1)
jumpBtn.Font = Enum.Font.GothamBold
jumpBtn.TextSize = 15
jumpBtn.ZIndex = 11
Instance.new("UICorner", jumpBtn)

-- BOTÓN NOCLIP
local noclipBtn = Instance.new("TextButton", frame)
noclipBtn.Size = UDim2.new(0,260,0,35)
noclipBtn.Position = UDim2.new(0,20,0,255)
noclipBtn.Text = "Noclip DESACTIVADO"
noclipBtn.BackgroundColor3 = Color3.fromRGB(180,60,60)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextSize = 15
noclipBtn.ZIndex = 11
Instance.new("UICorner", noclipBtn)

-- CÍRCULO FLOTANTE
local floating = Instance.new("TextButton", gui)
floating.Size = UDim2.new(0,50,0,50)
floating.Position = UDim2.new(0.1,0,0.5,0)
floating.Text = "◉"
floating.Font = Enum.Font.GothamBold
floating.TextSize = 24
floating.BackgroundColor3 = Color3.fromRGB(80,80,80)
floating.TextColor3 = Color3.new(1,1,1)
floating.Visible = false
floating.Active = true
floating.ZIndex = 12
Instance.new("UICorner", floating).CornerRadius = UDim.new(1,0)

-- DRAG
local function drag(o)
	local d,sp,si
	o.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			d=true si=i.Position sp=o.Position
		end
	end)
	o.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then d=false end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if d and i.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = i.Position-si
			o.Position = UDim2.new(sp.X.Scale,sp.X.Offset+delta.X,sp.Y.Scale,sp.Y.Offset+delta.Y)
		end
	end)
end

drag(frame)
drag(floating)

-- CERRAR / MINIMIZAR
close.MouseButton1Click:Connect(function() gui:Destroy() end)
minimize.MouseButton1Click:Connect(function()
	frame.Visible=false
	floating.Visible=true
end)
floating.MouseButton1Click:Connect(function()
	frame.Visible=true
	floating.Visible=false
end)

-- TOGGLES
local speedOn=false
local jumpOn=false
local noclip=false

speedBtn.MouseButton1Click:Connect(function()
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	speedOn = not speedOn
	if speedOn then
		hum.WalkSpeed = tonumber(speedBox.Text) or 50
		speedBtn.BackgroundColor3 = Color3.fromRGB(60,200,100)
		speedBtn.Text = "Velocidad ACTIVADA"
	else
		hum.WalkSpeed = 16
		speedBtn.BackgroundColor3 = Color3.fromRGB(180,60,60)
		speedBtn.Text = "Velocidad DESACTIVADA"
	end
end)

jumpBtn.MouseButton1Click:Connect(function()
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	jumpOn = not jumpOn
	if jumpOn then
		hum.JumpPower = tonumber(jumpBox.Text) or 120
		jumpBtn.BackgroundColor3 = Color3.fromRGB(60,200,100)
		jumpBtn.Text = "Salto ACTIVADO"
	else
		hum.JumpPower = 50
		jumpBtn.BackgroundColor3 = Color3.fromRGB(180,60,60)
		jumpBtn.Text = "Salto DESACTIVADO"
	end
end)

noclipBtn.MouseButton1Click:Connect(function()
	noclip = not noclip
	if noclip then
		noclipBtn.BackgroundColor3 = Color3.fromRGB(60,200,100)
		noclipBtn.Text = "Noclip ACTIVADO"
	else
		noclipBtn.BackgroundColor3 = Color3.fromRGB(180,60,60)
		noclipBtn.Text = "Noclip DESACTIVADO"
	end
end)

RunService.Stepped:Connect(function()
	if noclip and player.Character then
		for _,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide=false
			end
		end
	end
end)
