function onCreate()
   attack = 0
   attackTimer = 0;
   changedNotes = false;
   SoundToPlay = 1;

   makeLuaSprite('SansBattle','sans/battle',0,-800)
   scaleObejct('SansBattle',1.55,1.5)

   makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  1079,  573);
	setProperty('attackbutton.scale.x', 1)
	setProperty('attackbutton.scale.y', 1)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', true)

	setProperty('attackbutton.alpha', 0.5)
end

function onUpdate(elapsed)

    if getPropertyFromClass (getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) and curStep< 780 and attackTimer == 0 then
        attack = 1
        objectPlayAnimation('attackbutton', 'attackclick')
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
end

function onUpdatePost()
    if attack == 0 then
        for j = 0, getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', j, 'noteType') == 'OrangeBoneNote' then
                setPropertyFromGroup('notes', j, 'texture', '');
                setPropertyFromGroup('notes', j, 'noteType', '');
            end

            if getPropertyFromGroup('notes', j, 'noteType') == 'BlueBoneNote' then
                removeFromGroup('notes', j,false);
            end
        end
    end
end