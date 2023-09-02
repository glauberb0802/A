function onCreate()
   attack = 0
   attackTimer = 0;
   changedNotes = false;
   SoundToPlay = 1;
   bf_visibleSans2 = 0
   RandomSound = 0
   AttackEnable = true
   
   makeAnimatedLuaSprite('BF_Attack','characters/sans/Chara',getProperty('boyfriend.x') - 1100,getProperty('boyfriend.y') + 10)
   addAnimationByPrefix('BF_Attack','attack','0BF attack copy instance 1',24,false)
   
   makeAnimatedLuaSprite('SansDodge','characters/sans/Sans_Phase_3',getProperty('dad.x') - 125,getProperty('dad.y') - 20)
   addAnimationByPrefix('SansDodge','Dodge','SansDodge instance 1',24,false)
   objectPlayAnimation('SansDodge','Dodge',false)




   makeAnimatedLuaSprite('AttackButton','IC_Buttons',50,300)
   addAnimationByPrefix('AttackButton','Static','Attack instance 1',24,true)
   addAnimationByPrefix('AttackButton','NA','AttackNA instance 1',30,false)
   objectPlayAnimation('AttackButton','Static',true)
   setObjectCamera('AttackButton','hud')
   addLuaSprite('AttackButton',false)
   scaleObject('AttackButton',0.7,0.7)
   setProperty('AttackButton.alpha',0.5)
   makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  1079,  573);
	setProperty('attackbutton.scale.x', 1)
	setProperty('attackbutton.scale.y', 1)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', true)

	setProperty('attackbutton.alpha', 0.5)


   makeLuaSprite('SansBattle','sans/battle',0,-800)
   scaleObejct('SansBattle',1.55,1.5)


end

function onUpdate(elapsed)

    RandomSound = math.random(1,3)

    if getPropertyFromClass(getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) and AttackEnable == true and attackTimer == 0 then
        characterPlayAnim('boyfriend','attack',true)
        setProperty('boyfriend.specialAnim',true)
        setProperty('boyfriend.visible',false)
        setProperty('BF_Attack.visible',true)
        playSound('IC/Throw'..RandomSound)
        attack = 1
        attackTimer = 1
        runTimer('SansDodge',0.3)
        objectPlayAnimation('AttackButton','NA',false)
        setProperty('AttackButton.y',getProperty('AttackButton.y') - 20)
        setProperty('BFSansDodge.visible',false)
        bf_visibleSans2 = 1
        objectPlayAnimation('attackbutton', 'attackclick')
    end

    if bf_visibleSans2 == 1 then
        setProperty('boyfriend.visible',false)
        if getProperty('BF_Attack.animation.curAnim.finished') then
            setProperty('boyfriend.visible',true)
            removeLuaSprite('BF_Attack',false)
            bf_visibleSans2 = 0
        end
    end

    if getProperty('AttackButton.animation.curAnim.finished') == true then
        attackTimer = 0
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 20)
    end

    if AttackEnable == false and getProperty('AttackButton.alpha') > 0 then
        setProperty('AttackButton.alpha',getProperty('AttackButton.alpha') - 0.01)
    end
    if AttackEnable == true and getProperty('AttackButton.alpha') < 0.5 then
        setProperty('AttackButton.alpha',getProperty('AttackButton.alpha') + 0.01)
    end

    if BfFly == true then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/80)
   
        doTweenY(boyfriendTweenY, 'boyfriend', 700 + 300 *math.sin((currentBeat *1) * math.pi),10)         
    end

    if getProperty('SansDodge.animation.curAnim.finished') then
        removeLuaSprite('SansDodge',false)
        setProperty('dad.visible',true)
    end
end

function onTimerCompleted(tag)
    if tag == 'eyeSound' then
        playSound('sans/eye')
    end
    if tag == 'SansDodge' then
     playSound('sans/dodge')
     setProperty('dad.visible',false)
     addLuaSprite('SansDodge',true)
     setProperty('health',getProperty('health') + 0.5)
     objectPlayAnimation('SansDodge','Dodge',false)
    end
end

function onStepHit()
    if curStep >=  379 and curStep < 896 or curStep >= 1146 and curStep < 1408 then
        AttackEnable = false
    end
    if curStep ==  896 or curStep == 1408 then
        AttackEnable = true
    end
end