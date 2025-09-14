
local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "MeowGui"


local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
MainFrame.BorderSizePixel = 0


local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 128)
TitleBar.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 0, 0, 0)
TitleText.Text = "meowgui v1 by 4b3l"
TitleText.TextScaled = true
TitleText.BackgroundTransparency = 1

local MinBtn = Instance.new("TextButton", TitleBar)
MinBtn.Size = UDim2.new(0, 40, 1, 0)
MinBtn.Position = UDim2.new(1, -40, 0, 0)
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)


local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, 0, 1, -40)
ContentFrame.Position = UDim2.new(0, 0, 0, 40)
ContentFrame.BackgroundTransparency = 1


local MiniFrame = Instance.new("Frame", ScreenGui)
MiniFrame.Size = UDim2.new(0, 250, 0, 40)
MiniFrame.Position = UDim2.new(0.5, -125, 0.5, -20)
MiniFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 128)
MiniFrame.Visible = false

local MiniLabel = Instance.new("TextLabel", MiniFrame)
MiniLabel.Size = UDim2.new(1, -40, 1, 0)
MiniLabel.Text = "meowgui v1 by 4b3l"
MiniLabel.TextScaled = true
MiniLabel.BackgroundTransparency = 1

local PlusBtn = Instance.new("TextButton", MiniFrame)
PlusBtn.Size = UDim2.new(0, 40, 1, 0)
PlusBtn.Position = UDim2.new(1, -40, 0, 0)
PlusBtn.Text = "+"
PlusBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)


MinBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	MiniFrame.Visible = true
end)

PlusBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	MiniFrame.Visible = false
end)



local function createButton(text, pos, size, parent, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Text = text
	btn.Size = size
	btn.Position = pos
	btn.BackgroundColor3 = Color3.fromRGB(255, 255, 128)
	btn.MouseButton1Click:Connect(callback)
	return btn
end



local DecalBox = Instance.new("TextBox", ContentFrame)
DecalBox.Size = UDim2.new(0, 200, 0, 30)
DecalBox.Position = UDim2.new(0, 10, 0, 10)
DecalBox.PlaceholderText = "rbxassetid://..."

local WalkBox = Instance.new("TextBox", ContentFrame)
WalkBox.Size = UDim2.new(0, 100, 0, 30)
WalkBox.Position = UDim2.new(0, 10, 0, 50)
WalkBox.PlaceholderText = "Walkspeed"

local MsgBox = Instance.new("TextBox", ContentFrame)
MsgBox.Size = UDim2.new(0, 200, 0, 30)
MsgBox.Position = UDim2.new(0, 10, 0, 90)
MsgBox.PlaceholderText = "Message / PlayerName"

local AvatarBox = Instance.new("TextBox", ContentFrame)
AvatarBox.Size = UDim2.new(0, 200, 0, 30)
AvatarBox.Position = UDim2.new(0, 10, 0, 130)
AvatarBox.PlaceholderText = "Avatar rbxassetid://"



createButton("Spam decal", UDim2.new(0, 220, 0, 10), UDim2.new(0, 120, 0, 30), ContentFrame, function()
	for i = 1, 10 do
		local d = Instance.new("Decal")
		d.Texture = DecalBox.Text
		d.Parent = workspace.Terrain
	end
end)

createButton("Set skybox", UDim2.new(0, 350, 0, 10), UDim2.new(0, 120, 0, 30), ContentFrame, function()
	local sky = Instance.new("Sky", game.Lighting)
	sky.SkyboxBk = DecalBox.Text
	sky.SkyboxDn = DecalBox.Text
	sky.SkyboxFt = DecalBox.Text
	sky.SkyboxLf = DecalBox.Text
	sky.SkyboxRt = DecalBox.Text
	sky.SkyboxUp = DecalBox.Text
end)

createButton("Bring player", UDim2.new(0, 480, 0, 10), UDim2.new(0, 120, 0, 30), ContentFrame, function()
	local target = game.Players:FindFirstChild(MsgBox.Text)
	if target and target.Character then
		target.Character:MoveTo(player.Character.HumanoidRootPart.Position)
	end
end)

createButton("Kill", UDim2.new(0, 220, 0, 50), UDim2.new(0, 80, 0, 30), ContentFrame, function()
	if player.Character then player.Character:BreakJoints() end
end)

createButton("Kill all", UDim2.new(0, 310, 0, 50), UDim2.new(0, 80, 0, 30), ContentFrame, function()
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr.Character then plr.Character:BreakJoints() end
	end
end)

createButton("Fakechat", UDim2.new(0, 400, 0, 50), UDim2.new(0, 80, 0, 30), ContentFrame, function()
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[Fake]: " .. MsgBox.Text,
		Color = Color3.fromRGB(0, 255, 255)
	})
end)

createButton("Fly", UDim2.new(0, 490, 0, 50), UDim2.new(0, 80, 0, 30), ContentFrame, function()
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.Velocity = Vector3.new(0, 500, 0)
	end
end)

createButton("Clear workspace", UDim2.new(0, 220, 0, 90), UDim2.new(0, 150, 0, 30), ContentFrame, function()
	for _, obj in pairs(workspace:GetChildren()) do
		if not obj:IsA("Terrain") then obj:Destroy() end
	end
end)

createButton("Disco", UDim2.new(0, 380, 0, 90), UDim2.new(0, 80, 0, 30), ContentFrame, function()
	spawn(function()
		while true do
			game.Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
			wait(0.2)
		end
	end)
end)

createButton("Kick", UDim2.new(0, 470, 0, 90), UDim2.new(0, 60, 0, 30), ContentFrame, function()
	local target = game.Players:FindFirstChild(MsgBox.Text)
	if target then target:Kick("You were kicked by MeowGui") end
end)

createButton("Ban", UDim2.new(0, 540, 0, 90), UDim2.new(0, 60, 0, 30), ContentFrame, function()
	local target = game.Players:FindFirstChild(MsgBox.Text)
	if target then target:Kick("You were banned by MeowGui") end
end)

createButton("Set Walkspeed", UDim2.new(0, 220, 0, 130), UDim2.new(0, 120, 0, 30), ContentFrame, function()
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if humanoid and tonumber(WalkBox.Text) then
		humanoid.WalkSpeed = tonumber(WalkBox.Text)
	end
end)

createButton("Global Msg", UDim2.new(0, 350, 0, 130), UDim2.new(0, 120, 0, 30), ContentFrame, function()
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[Global]: " .. MsgBox.Text,
		Color = Color3.fromRGB(255, 200, 0)
	})
end)

createButton("Set Avatar", UDim2.new(0, 480, 0, 130), UDim2.new(0, 120, 0, 30), ContentFrame, function()
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid:ApplyDescription(game.Players:GetHumanoidDescriptionFromUserId(tonumber(AvatarBox.Text)))
	end
end)


local LoadGui = Instance.new("Frame", ScreenGui)
LoadGui.Size = UDim2.new(0, 300, 0, 200)
LoadGui.Position = UDim2.new(0.5, -150, 0.5, -100)
LoadGui.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
LoadGui.Visible = false

local LoadBox = Instance.new("TextBox", LoadGui)
LoadBox.Size = UDim2.new(1, -20, 1, -60)
LoadBox.Position = UDim2.new(0, 10, 0, 40)
LoadBox.Text = "type loadstring here"
LoadBox.ClearTextOnFocus = false
LoadBox.TextWrapped = true
LoadBox.MultiLine = true

createButton("Execute", UDim2.new(0, 200, 0, 10), UDim2.new(0, 80, 0, 30), LoadGui, function()
	local func, err = loadstring(LoadBox.Text)
	if func then
		func()
	else
		warn("Error: " .. err)
	end
end)

createButton("Run localscript", UDim2.new(0, 10, 0, 170), UDim2.new(0, 150, 0, 30), ContentFrame, function()
	LoadGui.Visible = true
end)
