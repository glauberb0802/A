function onCreate()
   attackTimer = 0;
   SoundToPlay = 1;
   bf_visibleSans = 0

   
   makeAnimatedLuaSprite('SansDodge','characters/sans/Sans_IC',getProperty('dad.x') - 125,getProperty('dad.y') - 20)
   addAnimationByPrefix('SansDodge','Dodge','SansDodge instance 1',24,false)
   objectPlayAnimation('SansDodge','Dodge',false)

   makeAnimatedLuaSprite('BF_Attack','characters/sans/BoyFriend_CRshader',getProperty('boyfriend.x') - 1100,getProperty('boyfriend.y') + 10)
   addAnimationByPrefix('BF_Attack','attack','0BF attack instance 1',24,false)


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

 if getPropertyFromClass (getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) and curStep< 780 and attackTimer == 0 then
        addLuaSprite('BF_Attack',true)
        objectPlayAnimation('BF_Attack','attack',false)
        setProperty('boyfriend.visible',false)
        setProperty('BF_Attack.visible',true)
        playSound('sans/Throw3')
        attackTimer = 1
        runTimer('SansDodge',0.3)
        objectPlayAnimation('AttackButton','NA',false)
        setProperty('AttackButton.y',getProperty('AttackButton.y') - 20)
        setProperty('BFSansDodge.visible',false)
        bf_visibleSans = 1
        objectPlayAnimation('attackbutton', 'attackclick')
    end

    if bf_visibleSans == 1 then
        setProperty('boyfriend.visible',false)
        if getProperty('BF_Attack.animation.curAnim.finished') then
            setProperty('boyfriend.visible',true)
            removeLuaSprite('BF_Attack',false)
            bf_visibleSans = 0
        end
    end

    if getProperty('AttackButton.animation.curAnim.finished') == true then
        attackTimer = 0
        objectPlayAnimation('AttackButton','Static',true)
        setProperty('AttackButton.y',getProperty('AttackButton.y')+ 20)
    end

    if curStep == 775 and attack == 1 then
        triggerEvent('Play Animation','snap','dad')
        triggerEvent('Camera Follow Pos',getProperty('dad.x') + 485,getProperty('dad.y') + 200)
        runTimer('eyeSound',0.1)
        
    end

    if curStep == 782 and attack == 1 then
        removeLuaSprite('AttackButton',true)
        removeLuaSprite('SansBG',true)
        addLuaSprite('SansBattle',false)
        triggerEvent('Change Character','dad','UT-Sans')
        triggerEvent('Change Character','bf','UT-BF')
        triggerEvent('Add Camera Zoom',0.35,0.35)
        BfFly = true;
        setProperty('defaultCamZoom',0.4)
        setProperty('dad.y',50)
        triggerEvent('Camera Follow Pos','','')
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
        setProperty('health',getProperty('health') + 0.25)
     playSound('sans/dodge')
     setProperty('dad.visible',false)
     addLuaSprite('SansDodge',true)
     objectPlayAnimation('SansDodge','Dodge',false)
    end
end