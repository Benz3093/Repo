local gearFolder = game.ReplicatedStorage.gears
local fetchTarg = require(script.Parent.Parent:WaitForChild("Mod_fetchTarg"))

return function(source, args)
	local v1 = args[1]
	local plr  = fetchTarg.getPlayer(v1)
	local v2 = args[2]
	for i, v in ipairs(gearFolder:GetChildren()) do
		if v:IsA("Tool") then
			if v.Name == v2 then
				v:Clone().Parent = plr.Backpack
			elseif v2 == "all" then
				v:Clone().Parent = plr.Backpack
			end
		end
	end
end