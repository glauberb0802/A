function onCreate()
	-- background shit
	
	 makeAnimatedLuaSprite('BendyBGRun', 'bendy/images/run/hallway', -13050, 400);
	 addAnimationByPrefix('BendyBGRun','Loop1','Loop01 instance 1',70,true);
	 addAnimationByPrefix('BendyBGRun','Loop2','Loop02 instance 1',70,true);
	 addAnimationByPrefix('BendyBGRun','Loop3','Loop03 instance 1',70,true);
	 addAnimationByPrefix('BendyBGRun','Loop4','Loop03 instance 1',70,true);
	 addAnimationByPrefix('BendyBGRun','Loop5','Loop03 instance 1',70,true);
	 addAnimationByPrefix('BendyBGRun','Tunnel','Tunnel instance 1',70,true);
	 objectPlayAnimation('BendyBGRun','Loop1',true);
	 scaleObject('BendyBGRun',2.3,2.3);
	 setLuaSpriteScrollFactor('BendyBGRun',0,1)
	 addLuaSprite('BendyBGRun',false);

	 makeAnimatedLuaSprite('BendyBGRunDark', 'bendy/images/dark/hallway_but_Dark', -300, 650);
	 addAnimationByPrefix('BendyBGRunDark','Loop1','RunLol Hallway instance 1',50,true);
	 objectPlayAnimation('BendyBGRunDark','Loop1',true);
	 scaleObject('BendyBGRunDark',1.6,1.6);
	 setLuaSpriteScrollFactor('BendyBGRunDark',0,1)
 
	 makeAnimatedLuaSprite('Transition', 'bendy/images/dark/Trans',-250, -150);
	 addAnimationByPrefix('Transition','Trans','beb instance 1',30,false);
	 objectPlayAnimation('Transition','Trans',false);
	 setLuaSpriteScrollFactor('Transition',0,0)
	 scaleObject('Transition',1.4,1.4);
	 setObjectCamera('Transition', 'hud');

	 makeLuaSprite('StairsBG', 'bendy/images/stairs/scrollingBG',-700, -500);
	 setLuaSpriteScrollFactor('StairsBG',0,0)
	 scaleObject('StairsBG',1.4,1.4);

	 makeLuaSprite('StairsBG2', 'bendy/images/stairs/scrollingBG',-700, -3283);
	 setLuaSpriteScrollFactor('StairsBG2',0,0)
	 scaleObject('StairsBG2',1.4,1.4);

	makeLuaSprite('stairs', 'bendy/images/stairs/stairs',-700, -150);
	setLuaSpriteScrollFactor('stairs',0,0)
	scaleObject('stairs',1.8,1.8);

	makeLuaSprite('GayBG', 'bendy/images/gay/C_00',-700, -600);
	setLuaSpriteScrollFactor('GayBG',0,0)
	scaleObject('GayBG',1.5,1.5);

	makeLuaSprite('GayBGGround', 'bendy/images/gay/C_01',-1500,0);
	setLuaSpriteScrollFactor('GayBGGround',0,1)
	scaleObject('GayBGGround',1.8,1.8);

	makeLuaSprite('GayBGGround2', 'bendy/images/gay/C_01',1950,0);
	setLuaSpriteScrollFactor('GayBGGround2',0,1)
	scaleObject('GayBGGround2',1.8,1.8);
	
    BGY = -1000
	stairsY = -2200;
	playerX = -400;
	platformX = -500;

end

function onUpdate(elapsed)

	if curStep == 415 then
		objectPlayAnimation('BendyBGRun','Tunnel',true);
		setProperty('defaultCamZoom',0.65)
	end

	if curStep == 543 then
		objectPlayAnimation('BendyBGRun','Loop2',true);
		setProperty('defaultCamZoom',0.75)
	end

	if curStep == 410 or curStep == 537 or curStep == 777 or curStep == 1050 or curStep == 1306 or curStep == 1675 or curStep == 1931 then
     addLuaSprite('Transition',false)
	 objectPlayAnimation('Transition','Trans',true);
	 runTimer('TransitionDestroy',1.5)
	end

	if curStep == 783 then
		removeLuaSprite('BendyBGRun',false)	
		addLuaSprite('StairsBG',false);
		addLuaSprite('StairsBG2',false);
		addLuaSprite('stairs',true)
		setProperty('defaultCamZoom',0.6)
	end

	
	if curStep >= 783 and curStep <=1055 then
		setProperty('StairsBG.y',BGY)
		setProperty('StairsBG2.y',BGY - 2093)
		setProperty('stairs.y',stairsY)
		setProperty('boyfriend.x',playerX)
		setProperty('boyfriend.y',stairsY + 2100 - (playerX/2.3 + 150))
		setProperty('dad.x',playerX - 1040)
		setProperty('dad.y',stairsY + 2000 - (playerX/2.3 + 50))
		triggerEvent('Camera Follow Pos',1500,1000)
   
		BGY = BGY + 2
		stairsY = stairsY + 18
		playerX = playerX + 22
	   end

	if curStep == 1056 then
	 removeLuaSprite('StairsBG',false)
     removeLuaSprite('StairsBG2',false)
	 removeLuaSprite('gradient',false)
	 removeLuaSprite('stairs',false)
	 
     addLuaSprite('GayBG',false)
	 addLuaSprite('GayBGGround',true)
	 addLuaSprite('GayBGGround2',true)
 
	 setProperty('defaultCamZoom',0.5)
	end

	if curStep >= 1056 and curStep <= 1310 then
       platformX = platformX - 20
	   setProperty('boyfriend.x',1800)
	   setProperty('boyfriend.y',1330)
	   setProperty('dad.x',460)
	   setProperty('dad.y',1100)

	   setProperty('GayBG.x',getProperty('GayBG.x') - 0.3)
	   setProperty('GayBGGround.x',platformX)
	   setProperty('GayBGGround2.x',platformX + 2200)
	end

	if curStep == 1311 then
		removeLuaSprite('GayBGGround',true);
		removeLuaSprite('GayBGGround2',true);
		removeLuaSprite('GayBG',true);
		setProperty('boyfriend.x',1800)
		setProperty('boyfriend.y',1330)
		setProperty('dad.x',460)
		setProperty('dad.y',1100)
		addLuaSprite('BendyBGRun',false)
		triggerEvent('Camera Follow Pos','','')
   
		setProperty('defaultCamZoom',0.75)
	end

	if curStep >= 1311 then
		setProperty('boyfriend.x',1800)
		setProperty('boyfriend.y',1330)
		setProperty('dad.x',460)
		setProperty('dad.y',1100)

	end

	if curStep == 1680 then
		objectPlayAnimation('BendyBGRun','Tunnel',true);
		setProperty('defaultCamZoom',0.65)
	end

	if curStep == 1937 then
		objectPlayAnimation('BendyBGRun','Loop3',true);
		setProperty('defaultCamZoom',0.75)
	end

	if stairsY >= 2000 then
		stairsY = -2200
		playerX = -400
	end

	if platformX <= -2000 then
		platformX = -1600
	end

	if BGY >= 1600 then 
		BGY = -1000
	end
end

function onTimerCompleted(tag)
	if tag == 'TransitionDestroy' then
		removeLuaSprite('Transition',false)
	end
end