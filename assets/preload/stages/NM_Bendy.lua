function onCreate()
	-- background shit

	makeLuaSprite('NM_BG', 'bendy/images/inky depths',-150, -500);
	scaleObject('NM_BG',1.8,1.8)
	addLuaSprite('NM_BG',false)
	
if not lowQuality then
makeLuaSprite('Fire','bendy/images/Fyre',600,800)
	scaleObject('Fire',1.7,1.7)
	addLuaSprite('Fire',false)
	end
	
	makeLuaSprite('BendyGround', 'bendy/images/nightmareBendy_foreground',-220, -100);
	scaleObject('BendyGround',2,2)
addLuaSprite('BendyGround', false);

	BGFade = 0
	BGFadeIn = false

end
function onUpdate()

	setProperty('NM_BG.alpha',BGFade)
	 if BGFade < 1 and BGFadeIn == true then
		BGFade = BGFade + 0.05
	end
	if BGFade > 0 and BGFadeIn == false then
		BGFade = BGFade - 0.05
	end
end
function onStepHit()
	if curStep == 1297 or curStep == 2064 then

	 BGFadeIn = true
	end
	if curStep == 1860 then
	 BGFadeIn = false
	end
if not lowQuality then
	if curStep == 3216 then
		doTweenY('FireUp', 'Fire',-100, 10, 'QuartOut')
end
	end
end