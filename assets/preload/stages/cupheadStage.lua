function onCreate()
	-- background shit
    makeLuaSprite('Cup-BG-Ground', 'cup/Cup-BG-Ground', -600, -100);
	scaleObject('Cup-BG-Ground',4,4)

    addLuaSprite('Cup-BG-Ground', false);
	if not lowQuality then

		makeAnimatedLuaSprite('CupheqdShid', 'cup/CUpheqdshid',-350,-193);
		addAnimationByPrefix('CupheqdShid','dance','Cupheadshit_gif instance 1',24,true);
		objectPlayAnimation('CupheqdShid','Cupheadshit_gif instance',false)
		scaleObject('CupheqdShid',1.6,1.6)
		setLuaSpriteScrollFactor('CupheqdShid', 0, 0);
	
		makeAnimatedLuaSprite('Grain', 'cup/Grainshit',-350,-193);
		addAnimationByPrefix('Grain','dance','Geain instance 1',24,true);
		objectPlayAnimation('Grain','Geain instance 1',false)
		scaleObject('Grain',1.6,1.6)
		setLuaSpriteScrollFactor('Grain', 0, 0);
	
		addLuaSprite('CupheqdShid', true);
		addLuaSprite('Grain',true)
		end

end