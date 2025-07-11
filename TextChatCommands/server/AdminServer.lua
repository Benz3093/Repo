local cmdsFolder = script:WaitForChild("cmds")
local allowedModule = require(script:WaitForChild("Mod_allowed"))

local commandRemote = game.ReplicatedStorage.command
local displayRemote = game.ReplicatedStorage.displayMsg
local prefix = "/"

function buildCommands()
	local TextChatCommandsFolder = game.TextChatService:WaitForChild("cmds")
	if not TextChatCommandsFolder then return end

	for _, v in ipairs(cmdsFolder:GetChildren()) do
		local TextChatCommand = Instance.new("TextChatCommand")
		TextChatCommand.Name = v.Name
		TextChatCommand.PrimaryAlias = prefix .. v.Name
		TextChatCommand.Parent = TextChatCommandsFolder
	end
end

function SendMessage(player, message)
	displayRemote:FireClient(player, message)
end

function Commands(player, message)
	local allowed = allowedModule.allowed[player.UserId]
	
	if allowed then
		local words = {}
		for word in string.gmatch(message, "%S+") do
			table.insert(words, word)
		end

		if #words == 0 then
			return
		end

		local commandName = words[1]:lower()
		local args = {}
		for i = 2, #words do
			table.insert(args, words[i])
		end
		
		print(args)

		for _, cmdModule in ipairs(cmdsFolder:GetChildren()) do
			if commandName == prefix .. cmdModule.Name:lower() then
				local command = require(cmdModule)
				command(player, args)
				return
			end
		end
	end
end

commandRemote.OnServerEvent:Connect(Commands)
buildCommands()