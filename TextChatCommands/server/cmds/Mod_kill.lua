local fetchTarg = require(script.Parent.Parent:WaitForChild("Mod_fetchTarg"))

return function(source, args)
	local v1 = args[1]
	local plr = fetchTarg.getPlayer(v1)
	if plr then
		local char = plr.Character
		if char then
			local hum = char:FindFirstChild("Humanoid")
			hum.Health = 0
		end
	end
end