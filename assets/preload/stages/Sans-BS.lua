function onCreate()
	-- background shit



	makeAnimatedLuaSprite('SansBS-BG', 'sans/Nightmare Sans Stage',300,500);
	addAnimationByPrefix('SansBS-BG','BG1','Normal instance 1',24,true);
	addAnimationByPrefix('SansBS-BG','BG2','sdfs instance 1',24,true);
	objectPlayAnimation('SansBS-BG','BG1',false)

	addLuaSprite('SansBS-BG', false);
    if songName == 'Bad-Time' then
		BeatEffect = 0
		if not lowQuality and flashingLights then
			makeAnimatedLuaSprite('BeatSans', 'sans/Nightmare Sans Stage',0,170);
			addAnimationByPrefix('BeatSans','Beat','dd instance 1',24,true);
			objectPlayAnimation('BeatSans','Beat',false)
			setObjectCamera('BeatSans','hud')
			setBlendMode('BeatSans','add')
		end
	end

end

function onUpdate(elapsed)
	if songName == 'Bad-Time' then
		if curStep == 512 or curStep == 928 or curStep == 1440 then
			objectPlayAnimation('SansBS-BG','BG2')	
			BeatEffect = 1;	
		end
		if curStep == 768 or curStep == 1184 then
			objectPlayAnimation('SansBS-BG','BG1')	
			BeatEffect = 0	
			removeLuaSprite('BeatSans',false)
		end
	end


	if curBeat % 2 == 0 and BeatEffect == 1 then
		if not lowQuality and flashingLights then
			addLuaSprite('BeatSans',true)
			objectPlayAnimation('BeatSans','Beat',false)
		end
	end
end