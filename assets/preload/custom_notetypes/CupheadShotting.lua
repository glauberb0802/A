function onCreate()
 CupheadShotting = false;
 attack = 0;
 CardAnimation = 0;
 bf_visibleCuphead2 = 0;
 ShottingStyle = null
 GreenShotNumber = 0
 RandomSound = 0
BF_CupheadAttacking = false
 CardCrapY = 520

 GreenShotSound = 0

 makeAnimatedLuaSprite('Cardcrap', 'cup/Cardcrap',1000,CardCrapY + 100);
 addAnimationByPrefix('Cardcrap','Filled','Card Filled instance 1',24,false);
 addAnimationByPrefix('Cardcrap','Parry','PARRY Card Pop out  instance 1',24,false);
 addAnimationByPrefix('Cardcrap','Normal','Card Normal Pop out instance 1',24,false);
 addAnimationByPrefix('Cardcrap','Used','Card Used instance 1',24,false);
 addAnimationByPrefix('Cardcrap','Flipped','Card but flipped instance 1',1,true)
 objectPlayAnimation('Cardcrap','Flipped',true)
 setProperty('Cardcrap.scale.y',0)
 setObjectCamera('Cardcrap','hud');

 
makeAnimatedLuaSprite('attackbutton', 'IC_Buttons',  1079,  573);
	setProperty('attackbutton.scale.x', 1)
	setProperty('attackbutton.scale.y', 1)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', true)
	setProperty('attackbutton.alpha', 0.5)
	
	if downscroll then
    CardCrapY = -30
    setProperty('Cardcrap.y',CardCrapY - 100)
    setProperty('Cardcrap.angle',180)
 end
addLuaSprite('Cardcrap',true)


   
    


    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
        makeAnimatedLuaSprite('SmallShotCup', 'cup/bull/Cupheadshoot',getProperty('dad.x') + 400,getProperty('dad.y') - 130);
        addAnimationByPrefix('SmallShotCup','H-Tween','BulletFX_H-Tween_03 instance 1',24,false);
        objectPlayAnimation('SmallShotCup','H-Tween',false)

        makeAnimatedLuaSprite('SmallShotCup2', 'cup/bull/Cupheadshoot',getProperty('dad.x') + 400,getProperty('dad.y') - 130);
        addAnimationByPrefix('SmallShotCup2','H-Tween','BulletFX_H-Tween_03 instance 1',24,false);
        objectPlayAnimation('SmallShotCup2','H-Tween',false)

        makeAnimatedLuaSprite('SmallShotCup3', 'cup/bull/Cupheadshoot',getProperty('dad.x') + 400,getProperty('dad.y') - 135);
        addAnimationByPrefix('SmallShotCup3','H-Tween','BulletFX_H-Tween_03 instance 1',24,false);
        objectPlayAnimation('SmallShotCup3','H-Tween',false)

        makeAnimatedLuaSprite('SmallShotCup4', 'cup/bull/Cupheadshoot',getProperty('dad.x') + 400,getProperty('dad.y')- 125);
        addAnimationByPrefix('SmallShotCup4','H-Tween','BulletFX_H-Tween_03 instance 1',24,false);
        objectPlayAnimation('SmallShotCup4','H-Tween',false)

        makeAnimatedLuaSprite('SmallShotCup5', 'cup/bull/Cupheadshoot',getProperty('dad.x') + 400,getProperty('dad.y')- 130);
        addAnimationByPrefix('SmallShotCup5','H-Tween','BulletFX_H-Tween_03 instance 1',24,false);
        objectPlayAnimation('SmallShotCup5','H-Tween',false)

        --Load Green Shot

        makeAnimatedLuaSprite('GreenShit0', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit0','GreenShot0','GreenShit01',24,false);
        objectPlayAnimation('GreenShit0','GreenShot0',false)
    
        makeAnimatedLuaSprite('GreenShit1', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit1','GreenShot1','GreenShit02',24,false);
        objectPlayAnimation('GreenShit1','GreenShot1',false)
    
        makeAnimatedLuaSprite('GreenShit2', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit2','GreenShot2','GreenShit01',24,false);
        objectPlayAnimation('GreenShit2','GreenShot2',false)
    
        makeAnimatedLuaSprite('GreenShit3', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit3','GreenShot3','GreenShit02',24,false);
        objectPlayAnimation('GreenShit3','GreenShot3',false)

        makeAnimatedLuaSprite('GreenShit4', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit4','GreenShot4','GreenShit01',24,false);
        objectPlayAnimation('GreenShit4','GreenShot4',false)
    
        makeAnimatedLuaSprite('GreenShit5', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit5','GreenShot5','GreenShit02',24,false);
        objectPlayAnimation('GreenShit5','GreenShot5',false)
    
        makeAnimatedLuaSprite('GreenShit6', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit6','GreenShot6','GreenShit01',24,false);
        objectPlayAnimation('GreenShit6','GreenShot6',false)
    
        makeAnimatedLuaSprite('GreenShit7', 'cup/bull/GreenShit',getProperty('dad.x') + 360,getProperty('dad.y') + 50);
        addAnimationByPrefix('GreenShit7','GreenShot7','GreenShit02',24,false);
        objectPlayAnimation('GreenShit7','GreenShot7',false)

        for i = 0,7 do
            setBlendMode('GreenShit'..i,'add')
        end
    end

    if getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then

        --Load Blue Shot
        makeAnimatedLuaSprite('SmallShotCup1', 'cup/bull/NMcupheadBull',getProperty('dad.x') + 380,getProperty('dad.y') + 130);
        addAnimationByPrefix('SmallShotCup','H-Tween','Shot01 instance 1',24,false);
        objectPlayAnimation('SmallShotCup','H-Tween',false)
    
        makeAnimatedLuaSprite('SmallShotCup2', 'cup/bull/NMcupheadBull',getProperty('dad.x') + 380,getProperty('dad.y') + 135);
        addAnimationByPrefix('SmallShotCup2','H-Tween','Shot02 instance 1',24,false);
        objectPlayAnimation('SmallShotCup2','H-Tween',false)
    
        makeAnimatedLuaSprite('SmallShotCup3', 'cup/bull/NMcupheadBull',getProperty('dad.x') + 380,getProperty('dad.y') + 130);
        addAnimationByPrefix('SmallShotCup3','H-Tween','Shot03 instance 1',24,false);
        objectPlayAnimation('SmallShotCup3','H-Tween',false)
    
        makeAnimatedLuaSprite('SmallShotCup4', 'cup/bull/NMcupheadBull',getProperty('dad.x') + 380,getProperty('dad.y') + 125);
        addAnimationByPrefix('SmallShotCup4','H-Tween','Shot04 instance 1',24,false);
        objectPlayAnimation('SmallShotCup4','H-Tween',false)

        makeAnimatedLuaSprite('SmallShotCup5', 'cup/bull/NMcupheadBull',getProperty('dad.x') + 380,getProperty('dad.y') + 130);
        addAnimationByPrefix('SmallShotCup5','H-Tween','Shot05 instance 1',24,false);
        objectPlayAnimation('SmallShotCup5','H-Tween',false)
    end
    for i = 1,5 do
    setBlendMode('SmallShotCup1'..i,'add')
    end

end

function onEvent(name,value1,value2)

    if name == 'CupheadShotting' then
        
        if value1 == '' and value2 == '' then
            
            for j = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', j, 'noteType') == '' then
                    setPropertyFromGroup('notes', j, 'hitHealth', '0');
                end
            end

            runTimer('CupheadShot',0)
            ShottingStyle = null
        end

        if value1 ~= '' and value2 ~= 'False' or value1 ~= '' and value2 == '' then
            ShottingStyle = 1
        end

        if value2 == '' or value2 == 'True' then
            CupheadShotting = true;
        end
        if value2 ~= '' then
            CupheadShotting = false;
            ShottingStyle = null

            for j = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', j, 'noteType') == '' then
                    setPropertyFromGroup('notes', j, 'hitHealth', '0.023');
                end
            end
        end
    end
end



function onUpdate(elapsed)
    if getProperty('Cardcrap.scale.y') >= 1 and CardAnimation == -1 and getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' then
        CardAnimation = 1
        attack = 1
        setProperty('Cardcrap.scale.y',1)
        objectPlayAnimation('Cardcrap','Normal',true)
        setProperty('Cardcrap.y',CardCrapY)
    end
    RandomSound = math.random(1,3)


    if getProperty('SmallShotCup1.animation.curAnim.finished') == true then
        removeLuaSprite('SmallShotCup1',false)
    end

    if getProperty('SmallShotCup2.animation.curAnim.finished') == true then
        removeLuaSprite('SmallShotCup2',false)
    end

    if getProperty('SmallShotCup3.animation.curAnim.finished') == true then
        removeLuaSprite('SmallShotCup3',false)
    end

    if getProperty('SmallShotCup4.animation.curAnim.finished') == true then
        removeLuaSprite('SmallShotCup4',false)
    end

    if getProperty('SmallShotCup5.animation.curAnim.finished') == true then
        removeLuaSprite('SmallShotCup5',false)
    end

    if getProperty('GreenShit0.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit0',false)
    end

    if getProperty('GreenShit1.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit1',false)
    end

    if getProperty('GreenShit2.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit2',false)
    end

    if getProperty('GreenShit3.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit3',false)
    end

    if getProperty('GreenShit4.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit4',false)
    end

    if getProperty('GreenShit5.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit5',false)
    end

    if getProperty('GreenShit6.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit6',false)
    end

    if getProperty('GreenShit7.animation.curAnim.finished') == true then
        removeLuaSprite('GreenShit7',false)
    end

    if getProperty('Cardcrap.animation.curAnim.finished') == true then

        if getProperty('Cardcrap.animation.curAnim.name') == 'Used' then
            objectPlayAnimation('Cardcrap','Flipped',true)
            if not downscroll then
                setProperty('Cardcrap.y',CardCrapY + 100)
            else
                setProperty('Cardcrap.y',CardCrapY - 100)
            end
            setProperty('Cardcrap.scale.y',0)
            CardAnimation = -1
        else 

        if getProperty('Cardcrap.animation.curAnim.name') == 'Parry' then
            objectPlayAnimation('Cardcrap','Filled',false)
        end
    end

    end
   
    if attack == 1 then

        if CardAnimation == 0 then -- Add Card's sprite 
      
            objectPlayAnimation('Cardcrap','Parry',false)
            CardAnimation = 2
        end

if BF_CupheadAttacking == false then

        if getPropertyFromClass (getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) or botPlay and CupheadShotting == true and ShottingStyle ~= 1 then 
		       objectPlayAnimation('Cardcrap','Used',false)
                characterPlayAnim('boyfriend','attack',true)
                setProperty('boyfriend.specialAnim',true)
                runTimer('CupheadHurt',0.3)
                playSound('IC/Throw'..RandomSound)
                attack = 0
                CardAnimation = -1
                bf_visibleCuphead2 = 1
                BF_CupheadAttacking = true
            end
        end
    end
 
 if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'attack' and bf_visibleCuphead2 == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'attack' and bf_visibleCuphead2 == 1 then
        BF_CupheadAttacking = false
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        bf_visibleCuphead2 = 0
    end

    if bf_visibleCuphead2 == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
                end
        end
    end

    if GreenShotNumber > 7 then
        GreenShotNumber = 0
    end

    if GreenShotSound > 3 then
        GreenShotSound = 0
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'CupheadNote' then
		-- put something here if you want
		attack = 1;
		setProperty('Cardcrap.y',CardCrapY)
        setProperty('Cardcrap.scale.y',1)
        if CardAnimation == -1 then
        CardAnimation = 0
        end
	end
if noteType ~= 'CupheadNote' then
       
		-- put something here if you want
        if getProperty('Cardcrap.animation.curAnim.name') == 'Flipped' then
            setProperty('Cardcrap.scale.y',getProperty('Cardcrap.scale.y') + 0.01)
            if not downscroll then
              setProperty('Cardcrap.y',getProperty('Cardcrap.y') - 1)
            else
                setProperty('Cardcrap.y',getProperty('Cardcrap.y') + 1)
            end
        end
	end
end

local CupheadShotAnimations = {"pewLEFT","pewDOWN","pewUP","pewRIGHT"}

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if ShottingStyle == 1 and CupheadShotting == true and not isSustainNote then  -- Create the green shot
        characterPlayAnim('dad',CupheadShotAnimations[noteData + 1],true)
        setProperty('dad.specialAnim',true)
        addLuaSprite('GreenShit'..GreenShotNumber,true)
        objectPlayAnimation('GreenShit'..GreenShotNumber,'GreenShot'..GreenShotNumber,true)
        playSound('cup/chaser'..GreenShotSound)
        GreenShotNumber  = GreenShotNumber + 1
        GreenShotSound  = GreenShotSound + 1
    end
	if CupheadShotting == true and ShottingStyle ~= 1 then
		-- put something here if you want
		CupheadShotting = false;
        runTimer('CupheadShotDestroy',1)
	end
end

function onTimerCompleted(tag)
    
    if tag == 'CupheadShot' and ShottingStyle == null then
     runTimer('CupheadShot1',0.1)
    end

    if CupheadShotting == true and ShottingStyle == null then -- If Cuphead is Shotting,create the bullets

        if tag == 'CupheadShot1' then
            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);

            removeLuaSprite('SmallShotCup1',false)
            addLuaSprite('SmallShotCup1',true)
            objectPlayAnimation('SmallShotCup1','H-Tween',false)
            playSound('Cup/pea0')
            setProperty('health', getProperty('health')-0.05)
            runTimer('CupheadShot2',0.11)
        end

        if tag == 'CupheadShot2' then
            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);

            removeLuaSprite('SmallShotCup2',false)
            addLuaSprite('SmallShotCup2',true)
            objectPlayAnimation('SmallShotCup2','H-Tween',false)
            playSound('Cup/pea1')
            setProperty('health', getProperty('health')-0.05)
            runTimer('CupheadShot3',0.11)
        end

        if tag == 'CupheadShot3' then
            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);
            
            removeLuaSprite('SmallShotCup3',false)
            addLuaSprite('SmallShotCup3',true)
            objectPlayAnimation('SmallShotCup3','H-Tween',false)
            playSound('Cup/pea2')
            setProperty('health', getProperty('health')-0.05)
            runTimer('CupheadShot4',0.11)
        end

        if tag == 'CupheadShot4' then
            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);

            removeLuaSprite('SmallShotCup4',false)
            addLuaSprite('SmallShotCup4',true)
            objectPlayAnimation('SmallShotCup4','H-Tween',false)
            playSound('Cup/pea3')
            setProperty('health', getProperty('health')-0.05);
            runTimer('CupheadShot5',0.11)
        end

        if tag == 'CupheadShot5' then
            characterPlayAnim('dad','shotting', true)
            setProperty('dad.specialAnim', true);

            removeLuaSprite('SmallShotCup5',false)
            addLuaSprite('SmallShotCup5',true)
            objectPlayAnimation('SmallShotCup5','H-Tween',false)
            playSound('Cup/pea4')
            setProperty('health', getProperty('health')-0.05);
            runTimer('CupheadShot1',0.11)
        end
    end


    if tag == 'CupheadHurt' then
        if CupheadShotting == true then

            setProperty('health',getProperty('health') + 1)

            for j = 0,getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', j, 'noteType') == '' then
                    setPropertyFromGroup('notes', j, 'hitHealth', '0.023');
                end
            end

            if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then

             characterPlayAnim('dad','hurt',true)
             setProperty('dad.specialAnim',true);
             playSound('cup/CupHurt')

            else
                characterPlayAnim('dad','dodge',true)
                setProperty('dad.specialAnim',true);
                playSound('cup/CupDodge')
            end

            CupheadShotting = false;
        else
            if CupheadShotting == false or getProperty('dad.curCharacter') == 'Nightmare-Cuphead' then

             characterPlayAnim('dad','dodge',true)
             setProperty('dad.specialAnim',true);
             playSound('cup/CupDodge')

        end
        end
    end
    
if tag == 'CupheadShotDestroy' then
        removeLuaSprite('SmallShotCup1',false)
        removeLuaSprite('SmallShotCup2',false)
        removeLuaSprite('SmallShotCup3',false)
        removeLuaSprite('SmallShotCup4',false)
        removeLuaSprite('SmallShotCup5',false)
    end    
end