function onCreate()
	-- background shit
	makeLuaSprite('nightmarecupbg', 'nightmarecupbg', 200, 0);
        setProperty('nightmarecupbg.scale.x',1.6)
        setProperty('nightmarecupbg.scale.y',1.6)
        setBlendMode('nightmarecupbg','add')
        makeLuaSprite('nightmarecupbg1', 'nightmarecupbg', 200, 0);
        makeAnimatedLuaSprite('NMClight','NMClight',0,200)
        addAnimationByPrefix('NMClight','rgrrr instance','rgrrr instance',24,true)
        objectPlayAnimation('NMClight','rgrrr instance',false)
        
if not lowQuality then
        makeAnimatedLuaSprite('Grainshit','Grainshit',0,0)
        addAnimationByPrefix('Grainshit','Cupheadshit_gif instance','Cupheadshit_gif instance',24,true)
        objectPlayAnimation('Grainshit','Geain instance',false)
        setObjectCamera('Grainshit','other')
        setBlendMode('Grainshit','lighten')
end
        addLuaSprite('nightmarecupbg', false);
        addLuaSprite('NMClight', false);
        addLuaSprite('Grainshit', true)
        makeLuaSprite('healthbarlol','cuphealthbar',0,0)
        addLuaSprite('healthbarlol',false)
        setObjectCamera('healthbarlol','camHUD')
end
function onCreatePost()
        setProperty('gf.visible',false)
        setProperty('healthBarBG.visible',false)
        setProperty('healthBar.scale.y',1.5)
        setProperty('timeBar.color',getColorFromHex('CC2BF7'))
        setProperty('healthbarlol.x',getProperty('healthBar.x')-20)
        setObjectOrder('healthbarlol',getObjectOrder('healthBar'))
        setProperty('healthbarlol.y',getProperty('healthBar.y')-20)
        setProperty('iconP2.y',getProperty('iconP2.y') - 8)
end
local allowCountdown = false
local stops = 0;
function onStartCountdown()
-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
if not allowCountdown and not isStoryMode and not seenCutscene then
    
    setProperty('inCutscene', true);
    
    if stops == 0 then
            setProperty('camFollowPos.x',1150)
            setProperty('camFollowPos.y',200)
                    playSound('boo',1)
        setProperty('camHUD.alpha',0)
        doTweenZoom('www','camGame',1.5,0.8,'quadOut')
        runTimer('startC',2.5)
                    playSound('boo',1)
        
    
    end
    if stops == 1 then
    
    setProperty('camHUD.alpha',1)
    runTimer('startDialogue', 0.2);
    allowCountdown = true;
    
    end
    stops = stops + 1
    return Function_Stop;
end
return Function_Continue;
end

function lerp(a,b,t) return a * (1-t) + b * t
end