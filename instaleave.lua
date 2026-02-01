--[[
	INSTA LEAVE
	By Sami
	Version 1.1 (Movable Button)
]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "InstaLeaveGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Create button
local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0, 140, 0, 45)
button.Position = UDim2.new(1, -150, 0, 20) -- top-right start
button.AnchorPoint = Vector2.new(0, 0)
button.Text = "Leave"
button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.BorderSizePixel = 0

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

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Leave function
button.MouseButton1Click:Connect(function()
	player:Kick("INSTA LEAVE BY SAMI")
end)
