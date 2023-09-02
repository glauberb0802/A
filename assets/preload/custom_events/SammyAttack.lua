local InstaKillSammy = false
local DodgeSammy = 0;

function onCreate()
    makeAnimatedLuaSprite('Axe', 'characters/SammyRemastered',800,900);
	addAnimationByPrefix('Axe','Attack','Axe attack instance 1',24,false);
    objectPlayAnimation('Axe','Attack',true)
    scaleObject('Axe',3,3)
    
    makeAnimatedLuaSprite('dodgebutton', 'IC_Buttons',  0, 506);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)

end

function onEvent(name,value1,value2)
    if name == "SammyAttack" then
        characterPlayAnim('dad','End1', true)
        setProperty('dad.specialAnim', true);
        runTimer('AxeAttackTime',0.6)
        playSound('bendy/Sammy/sammyAxeThrow')
        DodgeSammy = 3
        if value2 ~= '' then
            InstaKillSammy = true
        else
            InstaKillSammy = false
        end
    end
end



function onUpdate(elapsed)
    if DodgeSammy == 3 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) then
        DodgeSammy = 2;
        objectPlayAnimation('dodgebutton', 'dodgeclick')
    end
    if DodgeSammy == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end
    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and DodgeSammy == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and DodgeSammy == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        DodgeSammy = 0
    end
end

function onTimerCompleted(tag)
    
   if tag == 'AxeAttackTime' then
        addLuaSprite('Axe',true)
        runTimer('AxeGroundSound',0.3)
        

        if DodgeSammy == 2 then
        characterPlayAnim('boyfriend','dodge',true)
        setProperty('boyfriend.specialAnim',true);
        DodgeSammy = 1
        end

        if DodgeSammy == 3 then
            characterPlayAnim('boyfriend','hurt',false)
            setProperty('boyfriend.specialAnim',true);
            if (getProperty('health') - 1) > -0.01 and not InstaKillSammy then
                setProperty('health',getProperty('health') - 2)
            
            elseif (getProperty('health') - 1) <= -0.01 or InstaKillSammy then
                runTimer('GameOver',0.35)
            end
        end
    end
    if tag == 'GameOver' then
        setProperty('health', -500);
    end
    if tag == 'AxeGroundSound' then
        playSound('bendy/Sammy/sammyAxeGround')
    end
end