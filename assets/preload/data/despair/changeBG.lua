function onCreate()
    setProperty('dad.visible', false)
end

function onStepHit()
    if curStep == 48 then
        setProperty('dad.visible',true)
        characterPlayAnim('dad','Intro',false)
        setProperty('dad.specialAnim',true)
        playSound('bendy/nmbendy_land')
        cameraShake('game',0.06,0.3)
    end
end

function opponentNoteHit()
    cameraShake('game',0.02,0.1)
    cameraShake('hud',0.01,0.1)
end