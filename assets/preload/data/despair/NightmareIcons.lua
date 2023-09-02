function onCreate(elapsed)

    makeAnimatedLuaSprite('icon-nightmare','icons/icon-nightmare-bendy(animated)',getProperty('iconP2.x') - 50,getProperty('iconP2.y') - 70)
    addAnimationByPrefix('icon-nightmare','Normal','nightmare bendy normal',24,true)
    addAnimationByPrefix('icon-nightmare','Losing','loss',24,true)
    objectPlayAnimation('icon-nightmare','Normal',true)
    setObjectCamera('icon-nightmare','hud')
    addLuaSprite('icon-nightmare',true)
    setProperty('iconP2.alpha',0)
end



function onUpdate(elapsed)
    setProperty('icon-nightmare.x',getProperty('iconP2.x'))
    setProperty('icon-nightmare.y',getProperty('iconP2.y'))
end