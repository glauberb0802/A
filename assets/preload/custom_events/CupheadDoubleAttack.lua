    function onCreate()
    Dodge = 0;
    BigShotMove = false;
    BigShotX = 700;
    DoubleAttackMoviment = 0;
    bf_visibleCuphead3 = 0
     
  if not downscroll then

        makeAnimatedLuaSprite('CupAlert','cup/mozo',500,340)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    else
        makeAnimatedLuaSprite('CupAlert','cup/gay',500,110)
        addAnimationByPrefix('CupAlert','Alert','YTJT instance 1',24,false)
        setObjectCamera('CupAlert','hud')
    end

 makeAnimatedLuaSprite('dodgebutton', 'IC_Buttons',  0, 506);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)
	
    if getProperty('dad.curCharacter') ~= 'Nightmare-Cuphead' then
     makeAnimatedLuaSprite('Roundabout', 'cup/bull/Roundabout',1200,1250);
	 addAnimationByPrefix('Roundabout','Roundabout','Roundabout instance 1',24,true);
	 objectPlayAnimation('Roundabout','Roundabout',true)
     scaleObject('Roundabout',1.3,1.3)
    else
        makeAnimatedLuaSprite('Roundabout', 'cup/bull/NMcupheadAttacks',1200,1250);
        addAnimationByPrefix('Roundabout','Roundabout','DeathRoundabout instance 1',24,true);
        objectPlayAnimation('Roundabout','Roundabout',true)
        scaleObject('Roundabout',1,0.9)
    end
    setBlendMode('Roundabout','add')
end

function onEvent(name,value1)

    if name == "CupheadDoubleAttack" then
        if value1 ~= '' then
            addLuaSprite('CupAlert',true)
            playSound('Cup/fuckyoumoro')
            objectPlayAnimation('CupAlert','Alert',true)
        end

     Dodge = 2
     characterPlayAnim('dad', 'big shot', false);
     setProperty('dad.specialAnim', true);
     runTimer('CupheadDoubleAttack',0.6)
     playSound('Cup/CupPre_shoot')
    end
end

function onUpdate(elapsed) 
if getProperty('CupAlert.animation.curAnim.finished') then
        removeLuaSprite('CupAlert',false)
    end

 if Dodge == 2 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) and not botPlay or Dodge == 2 and botPlay then 
         Dodge = 1;
        objectPlayAnimation('dodgebutton', 'dodgeclick')
        end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and bf_visibleCuphead3 == 1 or bf_visibleCuphead3 == 1 and getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        bf_visibleCuphead3 = 0
    end

    if bf_visibleCuphead3 == 1 then

        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end
        



end


function onTimerCompleted(tag)


    if tag == 'CupheadDoubleAttack' then

     removeLuaSprite('Roundabout', false)
     addLuaSprite('Roundabout',true)
     setObjectOrder('Roundabout',6)
     setProperty('Roundabout.x',1200)
     doTweenX('Roundabout','Roundabout',2500, 1, 'QuadOut');
     runTimer('RoundaboutTime',0.7);
     playSound('cup/CupShoot');
     setObjectOrder('Roundabout',getObjectOrder('boyfriendGroup') - 1)

       if Dodge == 1 then
            characterPlayAnim('boyfriend','dodge',true)
            setProperty('boyfriend.specialAnim',true)
            bf_visibleCuphead3 = 1
            playSound('cup/CupDodge',1)
		end

        if Dodge == 2 then
            characterPlayAnim('boyfriend','hurt',false);
            setProperty('boyfriend.specialAnim',true);
            if getProperty('health') - 1.2 > 0 then
             setProperty('health',getProperty('health') - 1.2)
            else
             runTimer('GameOver',0.3);
            end
            objectPlayAnimation('BigShotCuphead','Burst',false)
            setProperty('BigShotCuphead.x','boyfriend.x' + 150)
		end
    end

    if tag == 'Dodge' then
        if Dodge == 1 then
         setObjectOrder('Roundabout',getObjectOrder('boyfriendGroup') + 1)
         characterPlayAnim('boyfriend','dodge',true)
         setProperty('boyfriend.specialAnim',true)
         bf_visibleCuphead3 = 1
         playSound('cup/CupDodge',1)
		end


        if Dodge == 2 then
          characterPlayAnim('boyfriend','hurt',false);
          setProperty('boyfriend.specialAnim',true);
          if getProperty('health') - 1.2 > 0 then
            setProperty('health',getProperty('health') - 1.2)
           else
            runTimer('GameOver',0.3);
           end
          setProperty('BigShotCuphead.x','boyfriend.x' + 150)
        end
    end

    if tag == 'GameOver' then
     removeLuaSprite('BigShotCuphead', false)
     setProperty('health', -1);
    end
    
    if tag == 'RoundaboutTime' then
        doTweenX('Roundabout','Roundabout',-300, 1.5, 'QuadIn');
        runTimer('RoundaboutDestroy',2)
        Dodge = 2;
        runTimer('Dodge',0.5)
        setObjectOrder('Roundabout',7)
    end

    if tag == 'RoundaboutDestroy' then
     removeLuaSprite('Roundabout',false)
    end


end
