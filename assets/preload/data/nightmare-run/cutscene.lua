local allowCountdown=false;
local allowCountdownEnd=false;

function onStartCountdown()
  if not allowCountdown and isStoryMode and not seenCutscene then
    startVideo('Bendy/4');
    allowCountdown=true;
    return Function_Stop;
  end
  return Function_Continue;
  end

function onEndSong()
    if not allowCountdownEnd and isStoryMode and not seenCutscene then
        startVideo('Bendy/5');   
        allowCountdownEnd = true;
        return Function_Stop;
    end
    return Function_Continue;
end