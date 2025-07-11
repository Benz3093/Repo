local TowerGenerator = require(game.ServerScriptService.ServerHandler.TowerGenerator)

return function(source, args)
	local v1 = args[1]
	TowerGenerator:AddSection(v1)
end