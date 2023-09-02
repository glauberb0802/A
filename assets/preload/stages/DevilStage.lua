function onCreate()
  --background
  makeLuaSprite('BG','cup/BonusSongs/devil',-1000,-1050)
  setScrollFactor('BG',1.0,1.0)
  scaleObject('BG',2.3,2.3)
  addLuaSprite('BG',false)

  if not lowQuality then
    makeAnimatedLuaSprite('CupheqdShid', 'cup/CUpheqdshid',-350,-193);
    addAnimationByPrefix('CupheqdShid','dance','Cupheadshit_gif instance 1',24,true);
    objectPlayAnimation('CupheqdShid','Cupheadshit_gif instance',false)
    scaleObject('CupheqdShid',1.6,1.6)
    setLuaSpriteScrollFactor('CupheqdShid', 0, 0);
    setObjectCamera('CupheqdShid','hud');
      
    
    makeAnimatedLuaSprite('Grain', 'cup/Grainshit',-350,-193);
    addAnimationByPrefix('Grain','dance','Geain instance 1',24,true);
    objectPlayAnimation('Grain','Geain instance 1',false)
    scaleObject('Grain',1.6,1.6)
    setLuaSpriteScrollFactor('Grain', 0, 0);
    setObjectCamera('Grain','hud');

    addLuaSprite('CupheqdShid',true)
    addLuaSprite('Grain',true)
    end
end