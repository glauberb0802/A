function onCreate()

    makeLuaSprite('Black','sans/white',0,0)
    setObjectCamera('Black','hud')
    addLuaSprite('Black',true)
    doTweenColor('WhiteToBlackBendy','Black','000000',0.01,'linear')
    
    addLuaSprite('Black',true)

end

function onUpdate(elapsed)

    if curStep < 682 then
        setProperty('Black.alpha',0)
    end
    
    if curStep >= 683 and curStep < 704 then
        setProperty('Black.alpha',getProperty('Black.alpha') + 0.02)
    end
    if curStep == 704 then
        triggerEvent('Change Character','dad','Bendy_DAPhase2')
        removeLuaSprite('Black',true)
    end

    if curStep > 704 then
         songPos = getSongPosition()
         local currentBeat = (songPos/1000)*(bpm/80)
         doTweenY(dadTweenY, 'dad', 50 + 50*math.sin((currentBeat*1)*math.pi),0.5)
    end

end