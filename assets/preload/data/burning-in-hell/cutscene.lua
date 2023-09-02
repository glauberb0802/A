local allowCountdown=false;
local allowCountdownEnd=false;

function onStartCountdown()
if not continue and isStoryMode and not seenCutscene then
    startVideo('sans/3b');
    continue = true;
    return Function_Stop;
  end
  return Function_Continue;
  end

function onEndSong()
    if not allowCountdownEnd and not seenCutscene then
        startVideo('sans/4b');   
        allowCountdownEnd = true;
        return Function_Stop;
    end
    return Function_Continue;
end