local allowEndSong = false
local seenEndCutscene = false
function onEndSong()
	if not allowEndSong and isStoryMode and not seenEndCutscene then --Block the first countdown
		startVideo('cup/cuphead4');
		allowEndSong = true;
		return Function_Stop;
	end
	return Function_Continue;
end