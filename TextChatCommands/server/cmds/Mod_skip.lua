return function()
	local skip = game.ReplicatedStorage:WaitForChild("skip")
	skip.Value = not skip.Value
end
