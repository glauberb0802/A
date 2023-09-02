function HadoukeWosh()
    makeAnimatedLuaSprite('Hadoken', 'bull/NMcupheadAttacks', getProperty('dad.x')-400, getProperty('dad.y')+300);
    addAnimationByPrefix('Hadoken', 'burstfx', 'DeathBlast instance', 25, true);
    addAnimationByPrefix('Hadoken', 'burstfxreal', 'DeathBlast instance', 25, false);
    objectPlayAnimation('Hadoken', 'burstfx');
    addLuaSprite('Hadoken', true); 
    doTweenX('wee1', 'Hadoken', 2000, 1.1, 'sineInOut')
end

function onCreate()
    precacheImage('bull/NMcupheadAttacks')
    precacheImage('bull/NMcupheadBull')
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
end

function onEvent(name, value1, value2)
    if name == "hadouken" then
    --Get Dodge time
    DodgeTime = (0.55);
	
    --Make Dodge Sprite
	HadoukeWosh()
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) then
   
        Dodged = true;
        
        -- removeLuaSprite('spacebar');
        canDodge = false

        objectPlayAnimation('dodgebutton', 'dodgeclick')

   setProperty('boyfriend.specialAnim', true);
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   characterPlayAnim('boyfriend', 'dodge', true);
   Dodged = false
   end
end

function onTweenCompleted(tag)
    if tag == 'wee1' then
        removeLuaSprite('Hadoken');
    end
end