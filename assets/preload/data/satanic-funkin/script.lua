function onCreate()
    precacheImage('characters/cuphead/Devil')
end

function onUpdate()
    if getProperty('dad.curCharacter') == 'Devil_Cup_Intro' and getProperty('dad.animation.curAnim.finished') == true then
        triggerEvent('Change Character','dad','Devil_Cup')
    end
end