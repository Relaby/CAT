--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local UserInputService = game:GetService("UserInputService");
local Players = game:GetService("Players");
local loopActive = false;
local screenGui = Instance.new("ScreenGui");
screenGui.Name = "DBUGui";
screenGui.ResetOnSpawn = false;
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui");
local button = Instance.new("TextButton");
button.Name = "ToggleButton";
button.Size = UDim2.new(0, 120, 0, 50);
button.Position = UDim2.new(0, 20, 0, 20);
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
button.TextColor3 = Color3.fromRGB(255, 255, 255);
button.TextSize = 18;
button.Font = Enum.Font.GothamBold;
button.Text = "DBU: OFF";
button.Parent = screenGui;
local function executeRemotes()
	local args = {game:GetService("ReplicatedStorage"):WaitForChild("Datas"):WaitForChild("9573331835"),2327854100};
	game:GetService("ReplicatedStorage").Events.BuySpinsWZeni:FireServer(unpack(args));
	game:GetService("ReplicatedStorage").Events.Spin:FireServer();
end
local function updateButton()
	if loopActive then
		button.BackgroundColor3 = Color3.fromRGB(0, 255, 0);
		button.Text = "DBU: ON";
	else
		button.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
		button.Text = "DBU: OFF";
	end
end
button.MouseButton1Click:Connect(function()
	loopActive = not loopActive;
	updateButton();
end);
task.spawn(function()
	while true do
		if loopActive then
			executeRemotes();
		end
		task.wait(5);
	end
end);
