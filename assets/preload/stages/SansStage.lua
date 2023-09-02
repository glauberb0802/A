function onCreate()
	-- background shit
    if songName == 'Burning-In-Hell' then
		makeLuaSprite('SansBG','sans/halldark',0,100)
		scaleObject('SansBG',1.55,1.5)
		addLuaSprite('SansBG', false);
		makeLuaSprite('SansBattle','sans/battle',0,-800)
		scaleObejct('SansBattle',1.55,1.5)
		BfFly = false
	else
		makeLuaSprite('SansBG','sans/hall',0,100)
		scaleObject('SansBG',1.55,1.5)
		addLuaSprite('SansBG', false);
	end	
end

function onUpdate(elapsed)
	if BfFly == true then
	 songPos = getSongPosition()
	 local currentBeat = (songPos/1000)*(bpm/80)
	 doTweenY(dadTweenY, 'boyfriend', getProperty('boyfriend.y') + 50*math.sin((currentBeat*1)*math.pi),0.5)
	end
		  
	if songName == 'Burning-In-Hell' then
		if curStep == 378 or curStep == 1146 then
			addLuaSprite('SansBattle',false)
			removeLuaSprite('SansBG',false)
			BfFly = true;
			setProperty('defaultCamZoom',0.4)
			setProperty('dad.y',50)
		end

		if curStep == 896 or curStep == 1408 then
			removeLuaSprite('SansBattle',false)
			addLuaSprite('SansBG',false)
			BfFly = false;
			setProperty('defaultCamZoom',1)
			setProperty('dad.y',550)
		end
	end
end

function onStepHit()
	if curStep == 1791 then
		doTweenColor('bgColorTween', 'SansBG', 'FFFFFF', 1, 'linear')
	end
end

