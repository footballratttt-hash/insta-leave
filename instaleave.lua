local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0, 140, 0, 45)
button.Position = UDim2.new(1, -150, 0, 20) -- top-right corner
button.AnchorPoint = Vector2.new(0, 0)
button.Text = "Leave"
button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.BorderSizePixel = 0

button.MouseButton1Click:Connect(function()
	player:Kick("INSTA LEAVE BY SAMI")
end)
