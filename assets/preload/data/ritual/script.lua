function onCreate() 
    setPropertyFromClass('GameOverSubstate', 'characterName', 'Bendy_GameOver'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bendy/BendyGameOver'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'bendy/BendyHeartbeat'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'bendy/BendyClick'); --put in mods/music/

    makeLuaSprite('BlackRitual','sans/white',0,0)
    setObjectCamera('BlackRitual','hud')
    doTweenColor('BlackToWhiteRitual','BlackRitual','000000',0.01,'linear')
    addLuaSprite('BlackRitual',true)
end

function onUpdate()
    if curStep > 58 and curStep < 85 and getProperty('BlackRitual.alpha') < 1 or curStep > 1310 then
        setProperty('BlackRitual.alpha',getProperty('BlackRitual.alpha') + 0.02)
        addLuaSprite('BlackRitual',true)
    end
    if curStep <= 58 then
        setProperty('BlackRitual.alpha',0)
    end
    
    if curStep >= 86 and curStep < 1310 then
        setProperty('BlackRitual.alpha',getProperty('BlackRitual.alpha') - 0.01)

        if getProperty('BlackRitual.alpha') < 0 then
            removeLuaSprite('BlackRitual')
        end
        
    end
end