local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('cup/cuphead1');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local allowEndSong = false
local seenEndCutscene = false
function onEndSong()
	if not allowEndSong and isStoryMode and not seenEndCutscene then --Block the first countdown
		startVideo('cup/cuphead2');
		allowEndSong = true;
		seenEndCutscene = true
		return Function_Stop;
	end
	return Function_Continue;
end

