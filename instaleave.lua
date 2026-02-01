--[[
	INSTA LEAVE
	By Sami
	Version 2.0 (Stylish Movable Button)
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "InstaLeaveGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Create button frame
local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0, 160, 0, 50)
button.Position = UDim2.new(1, -180, 0, 30)
button.AnchorPoint = Vector2.new(0, 0)
button.Text = "Leave"
button.BackgroundColor3 = Color3.fromRGB(255, 100, 80)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.BorderSizePixel = 0
button.AutoButtonColor = false -- we handle hover manually
button.ZIndex = 2
button.Font = Enum.Font.GothamBold

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = button

-- Shadow
local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
shadow.BackgroundTransparency = 0.5
shadow.ZIndex = 1
shadow.Parent = button
local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadow

-- Gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255,120,100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255,70,60))}
gradient.Rotation = 45
gradient.Parent = button

-- Hover effect
button.MouseEnter:Connect(function()
	button.BackgroundTransparency = 0.2
end)
button.MouseLeave:Connect(function()
	button.BackgroundTransparency = 0
end)

-- Make button draggable
local dragging = false
local dragInput, mousePos, framePos

local function update(input)
	local delta = input.Position - mousePos
	button.Position = UDim2.new(0, framePos.X + delta.X, 0, framePos.Y + delta.Y)
end

button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		mousePos = input.Position
		framePos = Vector2.new(button.Position.X.Offset, button.Position.Y.Offset)
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

button.InputChanged:Connect(function(input)
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
