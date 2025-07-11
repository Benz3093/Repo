local TextChatService = game:GetService("TextChatService")
local player = game:GetService("Players").LocalPlayer
local cmdRemote = game.ReplicatedStorage.command
local displayRemote = game.ReplicatedStorage.displayMsg
local TextChatCommands = TextChatService:WaitForChild("cmds")

TextChatService.OnIncomingMessage = function(message)
	for _, v in ipairs(TextChatCommands:GetChildren()) do
		if v:IsA("TextChatCommand") then
			v.Triggered:Connect(function(player, message)
				cmdRemote:FireServer(message)
			end)
		end
	end
end