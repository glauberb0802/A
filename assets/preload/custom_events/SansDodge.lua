function onCreate()
    Dodge = 0;
    Color = 0
    RandomColor = 0;
    
makeAnimatedLuaSprite('dodgebutton', 'IC_Buttons',  0, 506);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)
	
    makeAnimatedLuaSprite('DodgeAlert2','sans/Sans_Shit_NM',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 50)

    addAnimationByPrefix('DodgeAlert2','alertBlue','AlarmBlue instance 1',24,false)
    addAnimationByPrefix('DodgeAlert2','alertOrange','AlarmOrange instance 1',24,false)

    addAnimationByPrefix('DodgeAlert2','attackBlue','Bones boi instance 1',24,false)
    addAnimationByPrefix('DodgeAlert2','attackOrange','Bones Orange instance 1',24,false)
    setBlendMode('DodgeAlert2','add')
    
    scaleObject('DodgeAlert2',0.8,0.8)

    if getProperty('boyfriend.curCharacter') ~= 'BF_Sans_Chara' and getProperty('boyfriend.curCharacter') ~= 'BF_Sans_IC' and getProperty('boyfriend.curCharacter') ~= 'BF_Sans_Chara' then
        makeAnimatedLuaSprite('DodgeAlert','sans/Bone',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        scaleObject('DodgeAlert',0.8,0.8)
    end


    if songName == 'Burning-In-Hell' then
        makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') - 30)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        scaleObject('DodgeAlert',0.8,0.8)
    end

    if songName == 'Whoopee' or songName == 'Sansational' then
        makeAnimatedLuaSprite('DodgeAlert','sans/DodgeMechs',getProperty('boyfriend.x') - 100,getProperty('boyfriend.y') + 50)
        addAnimationByPrefix('DodgeAlert','alert','Alarm instance 1',24,false)
        addAnimationByPrefix('DodgeAlert','attack','Bones boi instance 1',24,false)
        scaleObject('DodgeAlert',0.8,0.8)
        
    end

    if getProperty('boyfriend.curCharacter') == 'BF_Sans_Chara' then
        makeAnimatedLuaSprite('BFSansDodge','sans/Cardodge',getProperty('boyfriend.x') + 5,getProperty('boyfriend.y') + 70)
        addAnimationByPrefix('BFSansDodge','dodge','Dodge instance 1',24,false)
    end

    if getProperty('boyfriend.curCharacter') == 'BF_Sans_IC' then
        makeAnimatedLuaSprite('BFSansDodge','sans/DodgeMechs',getProperty('boyfriend.x') - 10,getProperty('boyfriend.y') - 8)
        addAnimationByPrefix('BFSansDodge','dodge','Dodge instance 1',24,false)
    end
end


function onUpdate(elapsed)
    
  if Dodge == 2 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) and not botPlay or Dodge == 2 and Color == 'Orange' and botPlay or Dodge == 2 and botPlay and Color == 0 then
    playSound('sans/dodge')
         Dodge = 1;
        objectPlayAnimation('dodgebutton', 'dodgeclick')
        end
        

        if getProperty('BFSansDodge.animation.curAnim.finished') then
            setProperty('boyfriend.visible',true)
            removeLuaSprite('BFSansDodge',false)
        end

        

        if getProperty('DodgeAlert.animation.curAnim.finished') and getProperty('DodgeAlert.animation.curAnim.name') == 'attack' then
            triggerEvent('Camera Follow Pos','','')
            removeLuaSprite('DodgeAlert',false)
            objectPlayAnimation('DodgeAlert','alert',false)
        end

        if getProperty('DodgeAlert2.animation.curAnim.finished') and getProperty('DodgeAlert2.animation.curAnim.name') == 'attackOrange' or getProperty('DodgeAlert2.animation.curAnim.finished') and getProperty('DodgeAlert2.animation.curAnim.name') == 'attackBlue' then
            triggerEvent('Camera Follow Pos','','')
            removeLuaSprite('DodgeAlert2',false)
            objectPlayAnimation('DodgeAlert2','alert2',false)
            Color = 0
        end
end

function onEvent(name,value1)
        if name == "SansDodge" then
            runTimer('SansAttack',0.8)
            playSound('sans/notice')
            setProperty('DodgeAlert.y',getProperty('boyfriend.y') - 50)
            setProperty('DodgeAlert2.y',getProperty('boyfriend.y') - 50)
            triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50,getProperty('boyfriend.y'))
            Dodge = 2

            if value1 ~= '' then 
                addLuaSprite('DodgeAlert2',true)
                Color = 1
            end

            if value1 == '' then
                addLuaSprite('DodgeAlert',true)
                objectPlayAnimation('DodgeAlert','alert')
                Color = 0
            end

            if Color == 1 then
            
                if RandomColor == 1 then
                Color = 'Blue'
                objectPlayAnimation('DodgeAlert2','alertBlue')
                else
                Color = 'Orange'
                objectPlayAnimation('DodgeAlert2','alertOrange')
                
                end
            end
        end
end

function onTimerCompleted(tag)
    if tag == 'SansAttack' then
      playSound('sans/sansattack')
      setProperty('DodgeAlert.y',getProperty('DodgeAlert.y') + 50)
      setProperty('DodgeAlert2.y',getProperty('DodgeAlert2.y') + 50)
      cameraShake('game',0.01,0.2)

 
        if Color ~= null then
            objectPlayAnimation('DodgeAlert2','attack'..Color,false)


                if Dodge == 1 and Color == 'Orange' then
                 characterPlayAnim('boyfriend','dodge',true)
                 setProperty('boyfriend.specialAnim',true);
                 Dodge = 0
                 playSound('sans/dodge')
                 Color = 0
                end
         
 
             if Dodge == 2 and Color == 'Orange' or Dodge == 1 and Color == 'Blue' then
             characterPlayAnim('boyfriend','hurt',true)
             setProperty('boyfriend.specialAnim',true);

                if (getProperty('health') - 0.6) < -0.1 then
                    setProperty('health',getProperty('health') - 2)
                else
                    runTimer('GameOver',0.35)
                end
            end
        end
 
         if Color == 0 then
             objectPlayAnimation('DodgeAlert','attack')
             if getProperty('boyfriend.curCharacter') == 'BF_Sans_Chara' or getProperty('boyfriend.curCharacter') == 'BF_Sans_IC' and Dodge == 1 then
                 setProperty('BF_Attack.visible',false)
                 setProperty('BFSansDodge.visible',true)
                 setProperty('boyfriend.visible',false)
                 addLuaSprite('BFSansDodge',true)
                 objectPlayAnimation('BFSansDodge','dodge')
             end
             if getProperty('boyfriend.curCharacter') ~= 'BF_Sans_Chara' and getProperty('boyfriend.curCharacter') ~= 'BF_Sans_IC' and getProperty('boyfriend.curCharacter') ~= 'BF_Sans_Chara' then
                characterPlayAnim('boyfriend','dodge',true)
                setProperty('boyfriend.specialAnim',true)
             end
 
             if Dodge == 2 then
                characterPlayAnim('boyfriend','hurt',true)
                setProperty('boyfriend.specialAnim',true);

                if getProperty('boyfriend.curCharacter') == 'BF_Sans_IC' then
                    characterPlayAnim('boyfriend','singUPmiss',true)
                    setProperty('boyfriend.specialAnim',true)
                end

                if (getProperty('health') - 0.6) > -0.1 then

                    setProperty('health',getProperty('health') - 2)
                    Dodge = 0
                end
                if (getProperty('health') - 0.6) < -0.1 then
                    runTimer('GameOver',0.35)
                    Dodge = 0
                end
             end
         end
     end
    if tag == 'GameOver' then
     setProperty('health', -1);
    end
end

function onStepHit()
    RandomColor = math.random(0,1)
end


