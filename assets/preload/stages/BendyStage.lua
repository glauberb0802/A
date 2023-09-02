function onCreate()
	-- background shit
if not lowQuality then
	makeAnimatedLuaSprite('SammyBG','bendy/images/third/SammyBg',670,580)
	addAnimationByPrefix('SammyBG','dance','Sam instance 1',24,false)
	objectPlayAnimation('SammyBG','dance',false)
	scaleObject('SammyBG',1.1,1.1)

	makeAnimatedLuaSprite('JzBoy','bendy/images/third/JzBoy',100,580)
	addAnimationByPrefix('JzBoy','dance','Jack Copper Walk by instance 1',24,false)
	objectPlayAnimation('JzBoy','dance',false)
	end
	
	makeLuaSprite('BendyBG', 'bendy/images/BACKBACKgROUND',-220, -100);
	scaleObject('BendyBG',1,1)
    
	makeLuaSprite('BendyBG2', 'bendy/images/BackgroundwhereDEEZNUTSfitINYOmOUTH', -600, -150);
	scaleObject('BendyBG2',1,1)

	makeLuaSprite('BendyGround', 'bendy/images/MidGrounUTS', -600, -150);

	scaleObject('BendyGround',1,1)

    addLuaSprite('BendyBG', false);
    addLuaSprite('BendyBG2', false);
	addLuaSprite('SammyBG',false);
	addLuaSprite('BendyGround', false)
	
if not lowQuality and songName == 'Last-Reel' then
		makeAnimatedLuaSprite('ButcherGang','bendy/images/third/Butchergang_Bg',-600,1200)
		addAnimationByPrefix('ButcherGang','dance','Symbol 1 instance 1',24,false)
		setScrollFactor('ButcherGang',1.2,1)
		scaleObject('ButcherGang',2.6,2.6)
		setObjectOrder('ButcherGang',getObjectOrder('boyfriend') + 10)
		addLuaSprite('ButcherGang',true)
	end

end
function onUpdate(elapsed)
	if getProperty('JzBoy.animation.curAnim.finished') then
		removeLuaSprite('JzBoy',true)
	end
end

function onStepHit()


	
	if curStep == 986 and songName == 'Last-Reel' then
		addLuaSprite('JzBoy', false);
		setObjectOrder('JzBoy',getObjectOrder('BendyBG2'))
	end

	if curStep % 2 == 0 then
		if not lowQuality and songName == 'Last-Reel'then
				objectPlayAnimation('ButcherGang','dance',false)
		end
	 objectPlayAnimation('SammyBG','dance',false)
	
if curStep ==1664 and songName == 'Last-Reel' then
	removeLuaSprite('ButcherGang',false)
	end
end
end