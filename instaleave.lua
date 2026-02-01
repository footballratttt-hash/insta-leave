--[[
	Sami Insta Leave UI
	By Sami
	Version 3.1 (Draggable, Stylish, Close Button, Click Animations)
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SamiInstaLeaveGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Create main frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 180, 0, 120)
frame.Position = UDim2.new(1, -200, 0, 30)
frame.AnchorPoint = Vector2.new(0,0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.ZIndex = 2

-- Rounded corners
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

-- Shadow
local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
shadow.BackgroundTransparency = 0.5
shadow.ZIndex = 1
shadow.Parent = frame
local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadow

-- Title label
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "Sami Insta Leave"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.ZIndex = 2

-- Leave button
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0, 140, 0, 40)
button.Position = UDim2.new(0.5, -70, 0, 60)
button.Text = "Leave"
button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.BorderSizePixel = 0
button.AutoButtonColor = false
button.Font = Enum.Font.GothamBold
button.ZIndex = 2

-- Rounded corners & gradient
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 12)
buttonCorner.Parent = button

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,120,100)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255,70,60))
}
gradient.Rotation = 45
gradient.Parent = button

-- Hover effect
button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.15), {BackgroundTransparency = 0.2}):Play()
end)
button.MouseLeave:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
end)

-- Click animation
button.MouseButton1Click:Connect(function()
	local tween = TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {Size = UDim2.new(0,130,0,36)})
	tween:Play()
	tween.Completed:Wait()
	button.Size = UDim2.new(0,140,0,40)
	player:Kick("INSTA LEAVE BY SAMI")
end)

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = frame
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.BorderSizePixel = 0
closeBtn.ZIndex = 3

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0,12)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- Make frame draggable
local dragging = false
local dragInput, mousePos, framePos

local function update(input)
	local delta = input.Position - mousePos
	frame.Position = UDim2.new(0, framePos.X + delta.X, 0, framePos.Y + delta.Y)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		mousePos = input.Position
		framePos = Vector2.new(frame.Position.X.Offset, frame.Position.Y.Offset)
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Leave function
button.MouseButton1Click:Connect(function()
	player:Kick("INSTA LEAVE BY SAMI")
end)
