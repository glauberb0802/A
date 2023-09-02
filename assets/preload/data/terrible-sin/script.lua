function onCreate()
  setPropertyFromClass('GameOverSubstate', 'characterName', 'Bendy_GameOver'); --Character json file for the death animation
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bendy/BendyGameOver'); --put in mods/sounds/
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'bendy/BendyHeartbeat'); --put in mods/music/
  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'bendy/BendyClick');
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.4 then
        setProperty('health', getProperty('health') - 0.015)
    end
end
