function onCreate()

    setPropertyFromClass('GameOverSubstate', 'characterName', 'Bendy_GameOver'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bendy/BendyGameOver'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'bendy/BendyHeartbeat'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'bendy/BendyClick');


    makeAnimatedLuaSprite('Piper','bendy/images/third/Piper',2500,getProperty('boyfriend.y') - 100)
    addAnimationByPrefix('Piper','Walking','pip walk instance 1',24,true)
    addAnimationByPrefix('Piper','Idle','Piperr instance 1',24,false)
    addAnimationByPrefix('Piper','Hurt','Piper gets Hit instance 1',24,false)
    addAnimationByPrefix('Piper','Dead','Piper ded instance 1',24,false)
    addAnimationByPrefix('Piper','Attack','PeepAttack instance 1',24,false)
    addAnimationByPrefix('Piper','Pre-Attack','PipAttack instance 1',24,false)
    scaleObject('Piper',1.8,1.8)
    
    makeAnimatedLuaSprite('Striker','bendy/images/third/Striker',-200,getProperty('boyfriend.y') - 60)
    addAnimationByPrefix('Striker','Walking','Str walk instance 1',24,true)
    addAnimationByPrefix('Striker','Hurt','Sticker  instance 1',24,false)
    addAnimationByPrefix('Striker','Dead','I ded instance 1',24,false)
    addAnimationByPrefix('Striker','Pre-Attack','PunchAttack_container instance 1',24,false)
    addAnimationByPrefix('Striker','Attack','regeg instance 1',24,false)
    addAnimationByPrefix('Striker','Idle','strrr instance 1',24,false)
    scaleObject('Striker',1.8,1.8)

    makeAnimatedLuaSprite('AttackButton','IC_Buttons',50,300)
    addAnimationByPrefix('AttackButton','Static','Attack instance 1',24,true)
    addAnimationByPrefix('AttackButton','NA','AttackNA instance 1',30,false)
    objectPlayAnimation('AttackButton','Static',true)
    setObjectCamera('AttackButton','hud')
    addLuaSprite('AttackButton',false)
    scaleObject('AttackButton',0.6,0.6)
    setProperty('AttackButton.alpha',0.5)

        if getProperty('boyfriend.curCharacter') == 'BF_Bendy_IC_Phase3' then
            makeAnimatedLuaSprite('BF_Bendy','characters/bendy/BoyFriend_3rdPhase',getProperty('boyfriend.x'),getProperty('boyfriend.y') - 13)
            addAnimationByPrefix('BF_Bendy','dodge','Dodge instance 1',24,false)
            addAnimationByPrefix('BF_Bendy','Attack','Attack instance 1',24,false)
        end
    
    makeLuaSprite('SplashScreen1','bendy/images/Damage01',0,0)
    scaleObject('SplashScreen1',0.7,0.7)

    makeLuaSprite('SplashScreen2','bendy/images/Damage02',0,0)
    scaleObject('SplashScreen2',0.7,0.7)

    makeLuaSprite('SplashScreen3','bendy/images/Damage03',0,0)
    scaleObject('SplashScreen3',0.7,0.7)

    makeLuaSprite('SplashScreen4','bendy/images/Damage04',0,0)
    scaleObject('SplashScreen4',0.7,0.7)

        setObjectCamera('SplashScreen1','hud')
        setObjectCamera('SplashScreen2','hud')
        setObjectCamera('SplashScreen3','hud')
        setObjectCamera('SplashScreen4','hud')

        if not lowQuality then
            makeLuaSprite('InkedShit','bendy/images/third/Ink_Shit',520,0)
            makeLuaSprite('InkedShit2','bendy/images/third/Ink_Shit',-240,0)
            makeLuaSprite('InkedShit3','bendy/images/third/Ink_Shit',-1000,0)
            makeAnimatedLuaSprite('Inked_Rain','bendy/images/third/InkRain',0,0)
            addAnimationByPrefix('Inked_Rain','Rain','erteyd instance 1',24,true)
            setObjectCamera('InkedShit','hud')
            setObjectCamera('InkedShit2','hud')
            setObjectCamera('InkedShit3','hud')
            setObjectCamera('Inked_Rain','hud')
        end

if difficulty ~= 1 then
         AttackEnable = true
        else
            AttackEnable = false
        end

        SplashDamage = 0;
        SplashEffect = 1;

        RandomSound = 0
        PiperX = false
        StrikerX = false
        PiperSpawn = 100
        StrikerSpawn = 200
        ScreenEffect = 5
        PiperAttack = 0
        StrikerAttack = 0
        PiperAttackTimeMax = 400
        StrikerAttackTimeMax = 400

        PiperAttacking = false
        Dodge1 = 0

        StrikerAttacking = false
        Dodge2 = 0
        
        PiperPosX = 1700
        

        PiperHP = 3
        StrikerHP = 3

        InkedEffect = 0
end

function onUpdate(elapsed)
if not lowQuality then
    setProperty('InkedShit.x',getProperty('InkedShit.x') + 2)
    setProperty('InkedShit2.x',getProperty('InkedShit2.x') + 2)
    setProperty('InkedShit3.x',getProperty('InkedShit3.x') + 2)

    setProperty('InkedShit.alpha',InkedEffect)
    setProperty('InkedShit2.alpha',InkedEffect)
    setProperty('InkedShit3.alpha',InkedEffect)
    setProperty('Inked_Rain.alpha',InkedEffect)


    if getProperty('InkedShit2.x') >= 520 then
        setProperty('InkedShit.x',520)
        setProperty('InkedShit2.x',-240)
        setProperty('InkedShit3.x',-1000)
    end
end

    if SplashDamage == 1 then
        addLuaSprite('SplashScreen1',true)
    end
   
    if SplashDamage == 2 then
        removeLuaSprite('SplashScreen1',false)
        addLuaSprite('SplashScreen2',true)
    end
   
    if SplashDamage == 3 then
        removeLuaSprite('SplashScreen2',false)
        addLuaSprite('SplashScreen3',true)
    end
   
    if SplashDamage == 4 then
        removeLuaSprite('SplashScreen3',false)
        addLuaSprite('SplashScreen4',true)
    end
   
    if SplashDamage >= 5 then
        removeLuaSprite('SplashScreen4',false)
        setProperty('health',-1)
    end
   
    if SplashEffect < 1 then
     SplashEffect = SplashEffect - 0.01
    end
   
    if SplashEffect <= 0 then
     SplashEffect = 1
     SplashDamage = 0
     removeLuaSprite('SplashScreen1',false)
     removeLuaSprite('SplashScreen2',false)
     removeLuaSprite('SplashScreen3',false)
     removeLuaSprite('SplashScreen4',false)
    end

    if curStep > 1664 and InkedEffect < 0.5 and curStep < 1792 then
        InkedEffect = InkedEffect + 0.02
    end

    if curStep > 1664 and getProperty('health') > 0.05 and curStep < 1792 then
        setProperty('health',getProperty('health') - 0.005)
    end

    if curStep > 1792 then
        InkedEffect = InkedEffect - 0.02
        if InkedEffect == 0 and not lowQuality then
            removeLuaSprite('InkedShit',true)
            removeLuaSprite('InkedShit2',true)
            removeLuaSprite('InkedShit3',true)
            removeLuaSprite('Inked_Rain',true)
        end
    end

    if getProperty('BF_Bendy.animation.curAnim.finished') == true then
            
        removeLuaSprite('BF_Bendy',false)
        setProperty('boyfriend.visible',true)
    end


    if AttackEnable == true then

        RandomSound = math.random(1,2)

        if PiperSpawn > 0 then
            PiperSpawn = PiperSpawn - 1
        end

        if StrikerSpawn > 0 then
            StrikerSpawn = StrikerSpawn - 1
        end


        if PiperSpawn == 0 then
            setProperty('Piper.x',2500)
            PiperHP = 2
            addLuaSprite('Piper',true)
            PiperX = false
            PiperSpawn = -1
            setProperty('Piper.y',getProperty('boyfriend.y') - 100)
        end

        if StrikerSpawn == 0 then
            addLuaSprite('Striker',true)
            setProperty('Striker.x',-750)
            StrikerHP = 2
            StrikerX = false
            StrikerSpawn = -1
        end

        if StrikerHP > 0 and StrikerX == true then
            if StrikerAttack < StrikerAttackTimeMax then
            StrikerAttack = StrikerAttack + 1
            end
            
            if StrikerAttack == StrikerAttackTimeMax and StrikerAttacking == false then
            Dodge2 = 2
            objectPlayAnimation('Striker','Pre-Attack',false)
            StrikerAttacking = true
            end
        end

        if PiperHP > 0 and PiperX == true and PiperAttacking == false then

            if PiperAttack < PiperAttackTimeMax then
                PiperAttack = PiperAttack + 1
            end

            if PiperAttack == PiperAttackTimeMax then
                Dodge1 = 2
                objectPlayAnimation('Piper','Pre-Attack',false)
                PiperAttacking = true
            end
        end



        if getProperty('Piper.x') > getProperty('boyfriend.x') + 300 and PiperX == false and curStep < 1664 then
            objectPlayAnimation('Piper','Walking',false)
            setProperty('Piper.x',getProperty('Piper.x') - 1)
        end

        if getProperty('Piper.x') <= getProperty('boyfriend.x') + 300 and PiperX == false and PiperHP > 1 and curStep < 1664 then
            PiperX = true
            objectPlayAnimation('Piper','Idle',false)
            PiperAttack = PiperAttackTimeMax
        end

        if getProperty('Striker.x') < getProperty('boyfriend.x') - 500 and StrikerX == false and StrikerHP > 1 and curStep < 1664 then
            objectPlayAnimation('Striker','Walking',false)
            setProperty('Striker.x',getProperty('Striker.x') + 3)
        end

        if getProperty('Striker.x') >= getProperty('boyfriend.x') - 500 and StrikerX == false  and curStep < 1664 then
            StrikerX = true
            objectPlayAnimation('Striker','Idle',false)
            StrikerAttack = StrikerAttackTimeMax
        end


        if PiperHP == 0 then
            playSound('bendy/butcherSounds/Dead')
            objectPlayAnimation('Piper','Dead',false)
            PiperX = false
            PiperHP = -1
        end

        if StrikerHP == 0 then
            playSound('bendy/butcherSounds/Dead')
            objectPlayAnimation('Striker','Dead',false)
            StrikerX = false
            StrikerHP = -1
        end
        if getProperty('AttackButton.animation.curAnim.name') == 'Static' or botplay then

            if keyPressed('left') and PiperX == false and StrikerX == true then

                objectPlayAnimation('AttackButton','NA',false)
                setProperty('AttackButton.y',getProperty('AttackButton.y') - 35)

                addLuaSprite('BF_Bendy',false)

                setProperty('boyfriend.visible',false)

                objectPlayAnimation('BF_Bendy','Attack',false)
                setProperty('BF_Bendy.x',getProperty('boyfriend.x') - 400)
                setProperty('BF_Bendy.y',getProperty('boyfriend.y') - 150)
                setProperty('BF_Bendy.flipX',false)

                if StrikerX == true then
                    objectPlayAnimation('Striker','Hurt',false)
                    StrikerAttacking = false
                    Dodge2 = 0
                    StrikerAttack = StrikerAttack - 100
                    StrikerHP = StrikerHP - 1
                    
                    playSound('bendy/butcherSounds/Hurt0'..RandomSound,50)
                end
            end
            if keyPressed('right') and StrikerX == false and PiperX == true then

                objectPlayAnimation('AttackButton','NA',false)
                setProperty('AttackButton.y',getProperty('AttackButton.y') - 35)

                addLuaSprite('BF_Bendy',false)

                setProperty('boyfriend.visible',false)

                objectPlayAnimation('BF_Bendy','Attack',false)
                setProperty('BF_Bendy.x',getProperty('boyfriend.x') + 50)
                setProperty('BF_Bendy.y',getProperty('boyfriend.y') - 150)
                setProperty('BF_Bendy.flipX',true)

                if PiperX == true then
                    PiperAttacking = false
                    Dodge1 = 0
                    PiperAttack = PiperAttack - 100
                    PiperHP = PiperHP - 1
                    objectPlayAnimation('Piper','Hurt',true)
                    playSound('bendy/butcherSounds/Hurt0'..RandomSound,50)
                end
            end
        end

        if keyJustPressed('down') and Dodge1 == 2 or Dodge1 == 2 and botPlay then
         Dodge1 = 1
        end

        
        if keyJustPressed('down') and Dodge2 == 2 or Dodge2 == 2 and botPlay then
            Dodge2 = 1
        end


        if getProperty('Piper.animation.curAnim.finished') == true then

            if getProperty('Piper.animation.curAnim.name') == 'Dead' then
                if curStep < 1664 then
                    if PiperSpawn == -1 then
                        PiperSpawn = math.random(600,800)
                    end
                    removeLuaSprite('Piper',false)
                else
                    removeLuaSprite('Piper',true)
                end
            end
        
            if getProperty('Piper.animation.curAnim.name') == 'Attack' then
                PiperAttacking = false
                objectPlayAnimation('Piper','Idle',false)
            end

            if  getProperty('Piper.animation.curAnim.name') == 'Hurt' then
                objectPlayAnimation('Piper','Idle',false)
            end

            if getProperty('Piper.animation.curAnim.name') == 'Pre-Attack' then
                PiperAttack = 0  
                objectPlayAnimation('Piper','Attack',false)


                if Dodge1 == 2 then
                    SplashDamage = SplashDamage + 1
                    playSound('bendy/inked')
                    characterPlayAnim('boyfriend','hurt',true)
                    setProperty('boyfriend.specialAnim',true)
                    runTimer('SplashDestroy',2)
                    SplashEffect = 1
                end
                if Dodge1 == 1 then
                    Dodge1 = 0
                    setProperty('BF_Bendy.x',getProperty('boyfriend.x'))
                    setProperty('BF_Bendy.y',getProperty('boyfriend.y') - 13)
                    setProperty('BF_Bendy.flipX',false)
                    addLuaSprite('BF_Bendy',false)
                    setProperty('boyfriend.visible',false)
                    objectPlayAnimation('BF_Bendy','dodge',true)
                end
            end
        end

        if getProperty('Striker.animation.curAnim.finished') == true then

            if getProperty('Striker.animation.curAnim.name') == 'Dead' then
                if curStep < 1664 then
                 removeLuaSprite('Striker',false)
                 if StrikerSpawn == -1 then
                    StrikerSpawn = math.random(600,800)
                 end
                else
                    removeLuaSprite('Striker',true)
                end

            end
        
            if getProperty('Striker.animation.curAnim.name') == 'Attack' then
                StrikerAttacking = false
                objectPlayAnimation('Striker','Idle',false)
            end

            if  getProperty('Striker.animation.curAnim.name') == 'Hurt' then
                objectPlayAnimation('Striker','Idle',false)
            end

            if getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' then
                StrikerAttack = 0
                objectPlayAnimation('Striker','Attack',false)
    
                if Dodge2 == 2 then
                 SplashDamage = SplashDamage + 1
                 playSound('bendy/inked')
                 characterPlayAnim('boyfriend','hurt',true)
                 setProperty('boyfriend.specialAnim',true)
                 runTimer('SplashDestroy',2)
                 SplashEffect = 1
                end

                if Dodge2 == 1 then
                    Dodge2 = 0
                    setProperty('BF_Bendy.x',getProperty('boyfriend.x'))
                    setProperty('BF_Bendy.y',getProperty('boyfriend.y') - 13)
                    setProperty('BF_Bendy.flipX',false)
                    addLuaSprite('BF_Bendy',false)
                    setProperty('boyfriend.visible',false)
                    objectPlayAnimation('BF_Bendy','dodge',true)
                end
            end
        end

        if getProperty('Piper.animation.curAnim.name') == 'Idle' then
            setProperty('Piper.x',getProperty('boyfriend.x') + 400)
            setProperty('Piper.y',getProperty('boyfriend.y') - 90)
        end

        if getProperty('Piper.animation.curAnim.name') == 'Attack' then
            setProperty('Piper.x',getProperty('boyfriend.x') + 20)
            setProperty('Piper.y',getProperty('boyfriend.y') - 310)
        end
        
        if getProperty('Piper.animation.curAnim.name') == 'Pre-Attack' then
            setProperty('Piper.x',getProperty('boyfriend.x') + 325)
            setProperty('Piper.y',getProperty('boyfriend.y') - 134)
        end

        if getProperty('Piper.animation.curAnim.name') == 'Hurt' then
            setProperty('Piper.x',getProperty('boyfriend.x') + 280)
            setProperty('Piper.y',getProperty('boyfriend.y') - 246)
        end


        
        if getProperty('Striker.animation.curAnim.name') == 'Idle' then
            setProperty('Striker.x',getProperty('boyfriend.x') - 450)
            setProperty('Striker.y',getProperty('boyfriend.y') - 40)
        end

        if getProperty('Striker.animation.curAnim.name') == 'Attack' then
            setProperty('Striker.x',getProperty('boyfriend.x') - 450)
            setProperty('Striker.y',getProperty('boyfriend.y')  - 40)
        end
        
        if getProperty('Striker.animation.curAnim.name') == 'Pre-Attack' then
            setProperty('Striker.x',getProperty('boyfriend.x') - 490)
            setProperty('Striker.y',getProperty('boyfriend.y') -47)
        end

        if getProperty('Striker.animation.curAnim.name') == 'Hurt' then
            setProperty('Striker.x',getProperty('boyfriend.x') - 600)
            setProperty('Striker.y',getProperty('boyfriend.y') - 120)
        end

        if getProperty('Striker.animation.curAnim.name') == 'Dead' then
            setProperty('Striker.x',getProperty('boyfriend.x') - 700)
            setProperty('Striker.y',getProperty('boyfriend.y') - 120)
        end
    end

    
    if getProperty('AttackButton.animation.curAnim.finished') == true then
        attackTimer = 0
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 35)
    end

    setProperty('SplashScreen1.alpha',SplashEffect)
    setProperty('SplashScreen2.alpha',SplashEffect)
    setProperty('SplashScreen3.alpha',SplashEffect)
    setProperty('SplashScreen4.alpha',SplashEffect)
end
    
    
function onStepHit()
    if curStep >= 112 and curStep < 128 then
        cameraShake('camGame', 0.05, 0.05);
        cameraShake('camHud', 0.02, 0.05);
    end
    if curStep % 2 == 0 then
        if getProperty('Piper.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Piper','Idle',false)
        end
        if getProperty('Striker.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Striker','Idle',false)
        end
    end
end

function opponentNoteHit()
    cameraShake('camGame', 0.01, 0.5);
    cameraShake('camHud', 0.001, 0.01);
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BendySplashNote' then
		-- put something here if you want
		playSound('bendy/inked')
		SplashDamage = SplashDamage + 1
		SplashEffect = 1
		runTimer('SplashDestroy',2)
	end
end

function onTimerCompleted(tag)
	if tag == 'SplashDestroy' then
		SplashEffect = SplashEffect - 0.1
	end
end

function onStepHit()
    if curStep %2 == 0 then
        if getProperty('Piper.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Piper','Idle',false)
        end
        if getProperty('Striker.animation.curAnim.name') == 'Idle' then
            objectPlayAnimation('Striker','Idle',false)
        end
    end


     if curStep == 1664 and difficulty ~= 1 then
        PiperHP = 0
        StrikerHP = 0
        AttackEnable = false
    if getProperty('Piper.visible',true) then
         playSound('bendy/butcherSounds/Dead')
            objectPlayAnimation('Piper','Dead',false)
            end
          if getProperty('Striker.visible',true) then
            playSound('bendy/butcherSounds/Dead')
            objectPlayAnimation('Striker','Dead',false)
                 if not lowQuality then
        addLuaSprite('InkedShit',false)
        addLuaSprite('InkedShit2',false)
        addLuaSprite('InkedShit3',false)
        addLuaSprite('Inked_Rain',true)
        end
            end
            end
    end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.4 then
        setProperty('health', getProperty('health') - 0.010)
    end
end