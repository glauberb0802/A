local canDodgeroundabout = false;
local canDodgeroundabout2 = false;

function onCreate()
    makeAnimatedLuaSprite('roundaboutinvisible', 'bull/Roundabout', getProperty('dad.x'), getProperty('dad.y'));
    addAnimationByPrefix('roundaboutinvisible', 'burstfx', 'Roundabout instance 1', 25, true);
    objectPlayAnimation('roundaboutinvisible', 'burstfx');
    addLuaSprite('roundaboutinvisible', true); 
    setProperty('roundaboutinvisible.alpha', 0)

    makeAnimatedLuaSprite('roundaboutinvisible2', 'bull/Roundabout', getProperty('boyfriend.x') + 500, getProperty('dad.y'));
    addAnimationByPrefix('roundaboutinvisible2', 'burstfx', 'Roundabout instance 1', 25, true);
    objectPlayAnimation('roundaboutinvisible2', 'burstfx');
    addLuaSprite('roundaboutinvisible2', true); 
    setProperty('roundaboutinvisible2.alpha', 0)
end

function onEvent(n,v1,v2)
    if n == 'roundabout' then
        setProperty('dad.specialAnim', true);
        characterPlayAnim('dad', 'roundabout', true);
        runTimer('doeventroundabout', 0.6, 1)
        canDodgeroundabout = true;
        Dodgedroundabout = false
        -- runTimer('goback', 0.5, 1)
    end
end


function onTimerCompleted(t, l, ll) 
    if t == 'doeventroundabout' then
        makeAnimatedLuaSprite('roundabout', 'bull/Roundabout', getProperty('dad.x'), getProperty('dad.y'));
        addAnimationByPrefix('roundabout', 'burstfx', 'Roundabout instance 1', 25, true);
        objectPlayAnimation('roundabout', 'burstfx');
        addLuaSprite('roundabout', true); 
        setProperty('roundaboutinvisible.x', getProperty('dad.x') - 400)
        doTweenX('weeeeeroundabout1', 'roundabout', getProperty('boyfriend.x') + 500, 1.3, 'sineInOut')
        doTweenX('weeeeeroundabout2', 'roundaboutinvisible', getProperty('boyfriend.x') + 500, 0.6, 'sineInOut')
        runTimer('dodgeroundabout', 0.4, 1)
        -- playSound('shoot', 1)
    end
    if t == 'dodgeroundabout' then
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'dodge', true);
    end
end

function onUpdate()
    if getProperty('roundaboutinvisible.x') == getProperty('boyfriend.x') + 500 then
      if not Dodgedroundabout then
      if getProperty('cpuControlled') == false then
      setProperty('health', 0);
      end
      end
    --   characterPlayAnim('boyfriend', 'dodge', true);
    setProperty('roundaboutinvisible.x', getProperty('dad.x') - 400)
      
    --   runTimer('goback', 0.3, 1)
    end

    if getProperty('roundaboutinvisible2.x') == getProperty('boyfriend.x') + 500 - 200 then
        if not Dodgedroundabout2 then
        if getProperty('cpuControlled') == false then
        setProperty('health', 0);
        end
        end
      --   characterPlayAnim('boyfriend', 'dodge', true);
        setProperty('roundaboutinvisible2.x', getProperty('boyfriend.x') + 500)
      --   runTimer('goback', 0.3, 1)
      end
    if canDodgeroundabout == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) then
   
        Dodgedroundabout = true;
        
        -- removeLuaSprite('spacebar');
        canDodgeroundabout = false

        objectPlayAnimation('dodgebutton', 'dodgeclick')
        
    end

    if canDodgeroundabout2 == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) then
   
        Dodgedroundabout2 = true;
        
        -- removeLuaSprite('spacebar');
        canDodgeroundabout2 = false

        objectPlayAnimation('dodgebutton', 'dodgeclick')
        
    end
end


function onUpdatePost()
    if getProperty('roundabout.y') == getProperty('dad.y') then
        doTweenY('roundabout', 'roundabout', getProperty('dad.y') - 100, 0.3, 'quadInOut')
    end
    if getProperty('roundabout.y') == getProperty('dad.y') - 100 then
        doTweenY('roundabout', 'roundabout', getProperty('dad.y'), 0.3, 'quadInOut')
    end
end

function onTweenCompleted(t) 
   if t == 'weeeeeroundabout1' then
    canDodgeroundabout2 = true;
    Dodgedroundabout2 = false
    doTweenX('weeeeeroundabout3', 'roundabout', getProperty('roundabout.x') - 3000, 2, 'sineInOut')
    doTweenX('weeeeeroundabout4', 'roundaboutinvisible2', getProperty('boyfriend.x') + 500 - 200, 0.3, 'sineInOut')
   end
   if t == 'weeeeeroundabout3' then
      removeLuaSprite('roundabout', false)
   end
   -- dont ask i got lazy okay
end