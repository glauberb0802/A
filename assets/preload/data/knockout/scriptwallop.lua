function onCreate()
    setProperty('skipCountdown', true)
    makeAnimatedLuaSprite('CupTitle','cup/ready_wallop',-600,-150)
    addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
    objectPlayAnimation('CupTitle','Ready?',false)
    setLuaSpriteScrollFactor('CupTitle',0,0)
   
       if not lowQuality then
           makeAnimatedLuaSprite('CupThing','cup/the_thing2.0',-345,-200)
           setLuaSpriteScrollFactor('CupThing',0,0)
           addAnimationByPrefix('CupThing','BOO','BOO instance 1',20,false)
           objectPlayAnimation('CupThing','BOO',false)
           scaleObject('CupThing',1.6,1.6)
           addLuaSprite('CupThing',true)
           setObjectCamera('CupThing', 'hud');
       
       end
       runTimer('CupReady',0.5)
   end
   function onUpdate(elapsed)
   
    Random = math.random(0,1)
   end
   
   function onTimerCompleted(tag)
       if tag == 'CupReady' then
           if Random == 0 then
               playSound('cup/intros/angry/0')
           end
           if Random == 1 then
               playSound('cup/intros/angry/1')
           end
      addLuaSprite('CupTitle',true)
           runTimer('CupTitleDestroy',4)
end
       if tag == 'CupTitleDestroy' then
           removeLuaSprite('CupTitle',false)
           removeLuaSprite('CupThing')
       end
end