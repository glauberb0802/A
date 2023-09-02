function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'Bendy_GameOver'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bendy/BendyGameOver'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'bendy/BendyHeartbeat'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'bendy/BendyClick');

	makeLuaSprite('BendyBG', 'bendy/images/BACKBACKgROUND',-220, -100);
	scaleObject('BendyBG',1,1)
    
	makeLuaSprite('BendyBG2', 'bendy/images/BackgroundwhereDEEZNUTSfitINYOmOUTH', -600, -150);
	scaleObject('BendyBG2',1,1)

	makeLuaSprite('BendyGround', 'bendy/images/MidGrounUTS', -600, -150);

	scaleObject('BendyGround',1,1)
end

function onStepHit()
    if curStep == 936 then
        startVideo('bendy/bendy1')
        addLuaSprite('BendyBG',false)
        setProperty('inCutscene',false)
        addLuaSprite('BendyBG2',false)
        addLuaSprite('BendyGround',false)
        removeLuaSprite('BG',true)
        removeLuaSprite('BendySprite',true)
        removeLuaSprite('Pillar',true)
        setProperty('boyfriend.x',1250)
        setProperty('boyfriend.y',1205)
        setProperty('dad.x',0)
        setProperty('dad.y',1205)
        setProperty('dad.visible',true)
        triggerEvent('Change Character','bf','BF_Bendy_IC_Phase2')
        triggerEvent('Change Character','dad','Bendy_IC')
        removeLuaSprite('Light',true)
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.4 then
        setProperty('health', getProperty('health') - 0.015)
    end
end