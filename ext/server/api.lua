local g_Replayers = {}

Events:Subscribe('br:load', function(id, data)
	g_Replayers[id] = Replayer(deserializeRecordingDataFromBase64(data))
end)

Events:Subscribe('br:play', function(id)
	if g_Replayers[id] == nil then
		error('Replay with id "' .. id .. '" is not loaded.')
		return
	end

	g_Replayers[id]:play()
end)

Events:Subscribe('br:stop', function(id)
	if g_Replayers[id] == nil then
		error('Replay with id "' .. id .. '" is not loaded.')
		return
	end

	g_Replayers[id]:stop()
end)
