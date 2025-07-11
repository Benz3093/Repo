local module = {}

function module.getPlayer(targ)
	if typeof(targ) ~= "string" then return end
	for _, player in ipairs(game.Players:GetPlayers()) do
		if player.Name:lower():sub(1, #targ) == targ:lower() then
			return player
		end
	end
end

function module.getPlayers()
	return game.Players:GetPlayers()
end

function module.string(str)
	if typeof(str) == "string" then
		return str
	end
end

return module