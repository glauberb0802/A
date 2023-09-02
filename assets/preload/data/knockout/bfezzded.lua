function onCreate()
    attack = 0
    CardAnimation = 0;

    makeAnimatedLuaSprite('MugMan','cup/Mugman Fucking dies',2000,1300)
    addAnimationByPrefix('MugMan','Walking','Mugman instance 1',24,false)
    addAnimationByPrefix('MugMan','Dead','MUGMANDEAD YES instance 1',24,false)

    makeAnimatedLuaSprite('KnockOutText','cup/knock',125,200)
    addAnimationByPrefix('KnockOutText','Knock','A KNOCKOUT!',28,false)
    setObjectCamera('KnockOutText','hud')
    scaleObject('KnockOutText',0.9,0.9)
end

function onUpdate(elapsed)   
 Random = math.random(0,1)


    if getProperty('KnockOutText.animation.curAnim.finished') then
        doTweenAlpha('KnockBye','KnockOutText',0,1,'LinearOut')
    end
end

function onStepHit()
    if curStep == 1150 then
        addLuaSprite('MugMan',true)
    end
    if curStep == 1174 then
        objectPlayAnimation('MugMan','Dead',false)
        playSound('Cup/CupHurt')
        playSound('Cup/knockout')
        addLuaSprite('KnockOutText',true)
    end
end



