local fetchTarg = require(script.Parent.Parent:WaitForChild("Mod_fetchTarg"))

return function(source, args)
	local v1 = args[1]
	local v2 = table.concat(args, " ", 2)
	local plr = fetchTarg.getPlayer(v1)
	if plr then
		plr:Kick(v2 ~= "" and v2 or "kicked by: " .. source.Name)
	end
end