function onCreate()

  makeLuaSprite('bendyBG','bendy/images/BonusSongs/dabg',-350,50)
  scaleObject('bendyBG',1.3,1.3)
  makeLuaSprite('Curtain1','bendy/images/BonusSongs/Curtain1',-300,-170)
  scaleObject('Curtain1',1.5,1.5)
  makeLuaSprite('Curtain2','bendy/images/BonusSongs/Curtain2',600,-170)
  scaleObject('Curtain2',1.5,1.5)
 
 if not lowQuality then
  makeAnimatedLuaSprite('BendyVideo', 'BendyVideo', -100, -100);
 scaleObject('BendyVideo', 0.9, 0.8);
addAnimationByPrefix('BendyVideo', 'idle', 'bendyVideo idle dance00', 24, true);
setProperty('BendyVideo.visible', false)
end
addLuaSprite('bendyBG',false)
  addLuaSprite('BendyVideo', false);
  addLuaSprite('Curtain1',false)
  addLuaSprite('Curtain2',false)
 
end

function onStepHit()

  if curStep==687 then
    makeLuaSprite('black','black',0,0)
    setObjectCamera('black','hud')
    addLuaSprite('black',true)
  end

  if curStep==698 then
    doTweenAlpha('black','black',0,1)
  end
  
  if curStep==700 then
   setProperty('BendyVideo.visible', true);
    doTweenX('Curtain1','Curtain2',1250,1)
    doTweenX('Curtain2','Curtain1',-950,1)
  end
end