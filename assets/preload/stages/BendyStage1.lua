function onCreate()
	-- background shit

	
	makeLuaSprite('BG', 'bendy/images/first/BG01', -800, 300);

	makeLuaSprite('Pillar', 'bendy/images/first/Pillar', 1400, 0);
	setScrollFactor('Pillar',1.5,1)

	makeAnimatedLuaSprite('MusicBox','bendy/images/first/MusicBox',500,850)
	addAnimationByPrefix('MusicBox','dance','Music box thingy instance 1',24,false)
	objectPlayAnimation('MusicBox','dance',false)
	

	addLuaSprite('BG', false);
    addLuaSprite('MusicBox', false);
	addLuaSprite('BendySprite',false)
	addLuaSprite('Pillar', true);

	if not lowQuality then
		makeAnimatedLuaSprite('Light','bendy/images/first/Light(Add-Blend)',getProperty('boyfriend.x'),400)
		addAnimationByPrefix('Light','Light','fezt instance 1',24,true)
		objectPlayAnimation('Light','Light',true)
		scaleObject('Light',1,1)
		addLuaSprite('Light', true);
		setObjectOrder('Light', getObjectOrder('Pillar') - 1 )
	end
end

function onUpdate(elapsed)
	if songName == 'imminent-demise' and curStep < 935 then
		setProperty('dad.visible',false)
	end
end

function onStepHit()
	if curStep %2 == 0 then
	 objectPlayAnimation('MusicBox','dance',false)
	end
end