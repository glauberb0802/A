function onCreate()
    Dodge = 0;
    BigShotSpeedX = 0;
    BigShotMove = false;
    bf_visibleCuphead = 0
    bf_characterFound = false
    BigShotYOffset = 0

    makeAnimatedLuaSprite('dodgebutton', 'IC_Buttons',  0, 506);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)

    DodgeTimer = 0
    DodgeTimer = (getProperty('boyfriend.x') - getProperty('dad.x')) / 10200
    
       if not downscroll then

        makeAnimatedLuaSprite('CupAlert','cup/mozo',500,340)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    else
        makeAnimatedLuaSprite('CupAlert','cup/gay',500,110)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    end


    
   if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
    makeAnimatedLuaSprite('BigShotCuphead', 'cup/bull/Cuphead Hadoken',getProperty('dad.x') - 200,getProperty('dad.y') - 50);
	addAnimationByPrefix('BigShotCuphead','Burst','BurstFX instance 1',24,false);
    addAnimationByPrefix('BigShotCuphead','Hadolen','Hadolen instance 1',24,true);
	objectPlayAnimation('BigShotCuphead','Hadolen',true)
    BigShotYOffset = -50
    
   end

   if getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then
    makeAnimatedLuaSprite('BigShotCuphead', 'cup/bull/NMcupheadAttacks',getProperty('dad.x') - 200,getProperty('dad.y') + 100);
    addAnimationByPrefix('BigShotCuphead','Hadolen','DeathBlast instance 1',24,true);
	objectPlayAnimation('BigShotCuphead','Hadolen',true)
    scaleObject('BigShotCuphead',1.2,1.2)
    BigShotYOffset = 100
   end
   setBlendMode('BigShotCuphead','add')

end

function onEvent(name)

    if name == "CupheadAttack" then
        BigShotY = getProperty('dad.y') + BigShotYOffset
        if value1 ~= '' then
            addLuaSprite('CupAlert',true)
            playSound('Cup/fuckyoumoro')
        end
    Dodge = 2
    characterPlayAnim('dad', 'big shot', false);
    setProperty('dad.specialAnim', true);
    runTimer('CupheadAttack',0.6)
    playSound('Cup/CupPre_shoot')
    end
end

function onUpdate(elapsed)



        if getProperty('CupAlert.animation.curAnim.finished') then
        removeLuaSprite('CupAlert',false)
        objectPlayAnimation('CupAlert','Alert',true)
    end
    if BigShotMove == true then
     setProperty('BigShotCuphead.x',getProperty('BigShotCuphead.x') + 25)
    end

    if getProperty('BigShotCuphead.animation.curAnim.finished') == true and getProperty('BigShotCuphead.animation.curAnim.name') == 'Burst' then
        removeLuaSprite('BigShotCuphead',false)
    end
 
    if Dodge == 2 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) and not botPlay or Dodge == 2 and botPlay then 
         Dodge = 1;
        objectPlayAnimation('dodgebutton', 'dodgeclick')
        end
    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and bf_visibleCuphead == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and bf_visibleCuphead == 1 then
        if bf_visibleCuphead == 1 then
            bf_visibleCuphead = 0
        end
        for i = 0,getProperty('notes.length')-1 do
            
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
    end
    if bf_visibleCuphead == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end
    if getProperty('BigShotCuphead.x') > screenWidth + getProperty('BigShotCuphead.width') then
        removeLuaSprite('BigShotCuphead',false)
    end

end
function onTimerCompleted(tag)


    if tag == 'CupheadAttack' then
     setProperty('BigShotCuphead.x',getProperty('dad.x') - 200,getProperty('dad.y') - 50)
     BigShotSpeedX = 0
     BigShotMove = true;
     removeLuaSprite('BigShotCuphead', false)
     addLuaSprite('BigShotCuphead',true)
     setProperty('BigShotCuphead.y',BigShotY)
     objectPlayAnimation('BigShotCuphead','Hadolen',true)
     playSound('cup/CupShoot')
     if songName ~=  'Devils-Gambit' then
     runTimer('dodgeCupAttack',DodgeTimer)
     else
        runTimer('dodgeCupAttack',0.1)
     end

    end

if tag == 'dodgeCupAttack' then
        if Dodge == 1 then
            characterPlayAnim('boyfriend','dodge',false)
            setProperty('boyfriend.specialAnim',true)
            playSound('cup/CupDodge',1)
            bf_visibleCuphead = 1
            Dodge = 0
        end
   
        if Dodge == 2 then
         characterPlayAnim('boyfriend','hurt',false);
         setProperty('boyfriend.specialAnim',true);
            if getProperty('health') - 1.4 > 0 then
             setProperty('health',getProperty('health') - 1.4)
            else
             runTimer('GameOver',0.3);
            end
            if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
             objectPlayAnimation('BigShotCuphead','Burst',false)    
             setProperty('BigShotCuphead.y',BigShotY - 500)
             BigShotMove = false
            end
        end
   
 
    end

    if tag == 'GameOver' then
     removeLuaSprite('BigShotCuphead', false)
     setProperty('health', -500);
    end
end
function onStepHit()

    if curStep == 1174 and songName == 'Knockout' then
        BigShotMove = false
        objectPlayAnimation('BigShotCuphead','Burst',false)    
        setProperty('BigShotCuphead.y',getProperty('BigShotCuphead.y') - 500)   
    end
end