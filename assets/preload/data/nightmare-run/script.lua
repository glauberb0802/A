function onCreate() 
    BfFrames = 0
    DadFrames = 0
    
    setPropertyFromClass('GameOverSubstate', 'characterName', 'Bendy_GameOver'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bendy/BendyGameOver'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'bendy/BendyHeartbeat'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'bendy/BendyClick'); --put in mods/music/
end

function onUpdate(elapsed)

    BfFrames = BfFrames + 0.45
    DadFrames = DadFrames + 0.45


    

        if curStep > 416 and curStep < 543 or curStep > 1055 and curStep < 1311 or curStep > 1680 and curStep < 1937 then
            for j = 0,getProperty('notes.length') -1 do

                if getPropertyFromGroup('notes', j, 'noteType') ~= 'BendySplashNote' and getPropertyFromGroup('notes', j, 'noteType') ~= 'BendyShadowNote' then
                    setPropertyFromGroup('notes', j, 'texture','')
                end
                if getPropertyFromGroup('notes', j, 'noteType') == 'BendyShadowNote' then
                    setPropertyFromGroup('notes', j, 'texture','bendy/images/BendyShadowNoteDark')
                 end
            end
            
        if curStep == 543 or curStep == 1311 or curStep == 1937 then
            for j = 0,getProperty('notes.length') -1 do
                if getPropertyFromGroup('notes', j, 'noteType') ~= 'BendySplashNote' and getPropertyFromGroup('notes', j, 'noteType') ~= 'BendyShadowNote' then
                    setPropertyFromGroup('notes', j, 'texture','')
                end
                if getPropertyFromGroup('notes', j, 'noteType') == 'BendyShadowNote' then
                    setPropertyFromGroup('notes', j, 'texture','bendy/images/BendyShadowNote')
                end
            end
        end
end
        setProperty('boyfriend.animation.curAnim.frameRate',0)
        setProperty('dad.animation.curAnim.frameRate',0)

        setProperty('boyfriend.animation.curAnim.curFrame',math.min(math.floor(BfFrames),11))
        setProperty('dad.animation.curAnim.curFrame',math.min(math.floor(DadFrames),9))
        if math.floor(BfFrames) > 11 then
            BfFrames = 0
        end
        if math.floor(DadFrames) > 9 then
            DadFrames = 0
        end
        
        if curStep < 780 or curStep > 1055 then
        setProperty('dad.x',defaultOpponentX - getProperty('health') * 100)
        end

        if curStep < 780 or curStep > 1312 then
            if getProperty('health') * 100 < 70 then
                setProperty('defaultCamZoom',1.2 - getProperty('health') /2)
            else
                setProperty('defaultCamZoom',0.75)
            end
        end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.4 then
        setProperty('health', getProperty('health') - 0.010)
    end
end