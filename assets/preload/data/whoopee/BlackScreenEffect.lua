function onCreate()
        BendyEffect = 1
        makeLuaSprite('Black?','sans/white',0,0)
        setObjectCamera('Black?','hud')
        doTweenColor('WhiteToBlackEffect','Black?','1C1C1C',0.01,'LinearOut')
        setBlendMode('Black?','SUBTRACT')
        addLuaSprite('Black?',true)
        AlphaEffect = 0
        AlphaEffect2 = 0
        AlphaEffectSpeed = 0
end

function onUpdate()

    if BendyEffect == 1 then

     setProperty('Black?.alpha',AlphaEffect)

     AlphaEffect = AlphaEffect + AlphaEffectSpeed
        
        if AlphaEffect2 == 1 and AlphaEffectSpeed < 0.005 and AlphaEffect < 1 then
            AlphaEffectSpeed = AlphaEffectSpeed + 0.0002
        end

        if AlphaEffect2 == -1 and AlphaEffectSpeed > -0.005 and AlphaEffect > 0 then
            AlphaEffectSpeed = AlphaEffectSpeed - 0.0005
        end
        if AlphaEffect > 1 then
            AlphaEffect = 1
            AlphaEffectSpeed = 0
        end
        if AlphaEffect < 0 and curStep > 159 then
            removeLuaSprite('Black?',true)
        end
    end
end
function onStepHit()

    if BendyEffect == 1 then

        if curStep == 16 then
                AlphaEffect2 = 1
        end

        if curStep == 159 then
            AlphaEffect2 = -1
        end
    end
end