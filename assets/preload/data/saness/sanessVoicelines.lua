finishedGameover = false;
startedPlaying = false;
random_saness_sound = math.random(1,4)

function onGameOverStart()
	runTimer('playVoiceline', 2.7);
	setPropertyFromClass('flixel.FlxG', 'music.volume', 0.2);
	return Function_Continue;
end

function onGameOverConfirm(reset)
	finishedGameover = true;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if not finishedGameover and tag == 'playVoiceline' then
	    soundFadeIn(nil, 4, 0.2, 0.2);
		soundName = string.format('SanessVoiceline-%i', math.random(1,10));
		playSound('sans/saness/SanessVoiceLine'..random_saness_sound, 2, 'VoicelineSND');
		startedPlaying = true;
	end
end

function onSoundFinished(tag)
	if tag == 'VoicelineSND' and not finishedGameover then
		soundFadeIn(nil, 4, 0.2, 1);
	end
end