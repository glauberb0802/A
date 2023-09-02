
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 420.95;
local yy = 313;
local xx2 = 952.9;
local yy2 = 350;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	-- background shit

	
	makeLuaSprite('bg', 'bg', -416.7, -358);
	setLuaSpriteScrollFactor('bg', 0.9, 0.9);

	makeLuaSprite('bgg', 'bgg', -345.85, -318.1);
	setLuaSpriteScrollFactor('bgg', 0.6, 0.6);
	

	makeAnimatedLuaSprite('spill', 'spill', 383.15, 616.5);
	addAnimationByPrefix('spill','spill','spill',24,false);

	makeAnimatedLuaSprite('agent1', 'agent', 401.35, 8.75);
	setLuaSpriteScrollFactor('agent1', 0.8, 0.8);
	makeAnimatedLuaSprite('agent2', 'agent', 550.65, 11.9);
	setLuaSpriteScrollFactor('agent2', 0.8, 0.8);
	makeAnimatedLuaSprite('agent3', 'agent', 649.65, 17.55);
	setLuaSpriteScrollFactor('agent3', 0.8, 0.8);
	makeAnimatedLuaSprite('agent4', 'agent', 817.9, 11.9);
	setLuaSpriteScrollFactor('agent4', 0.8, 0.8);
	makeAnimatedLuaSprite('agent5', 'agent', 972.55, 11.9);
	setLuaSpriteScrollFactor('agent5', 0.8, 0.8);
			setProperty('spill.visible',false);

	addLuaSprite('bgg', false);
	for i=1,5,1 do
		addAnimationByIndices('agent' .. i,'hide','agent','23',1);
		addAnimationByIndices('agent' .. i,'spawn','agent','0,1,2,3,4,5,6,7,8',24);
		addAnimationByIndices('agent' .. i,'shot','agent','9,10,11,12,13,14,15,16,17,18,19,20,21,22,23',24);
		addAnimationByIndices('agent' .. i,'bop','agent','24,25,26,27,28',24);
		addAnimationByIndices('agent' .. i,'shoott','agent','29,30,31,32,33',24);
	

		objectPlayAnimation('agent' .. i,'hide',false);
	

		addLuaSprite('agent' .. i, false);
	end
	addLuaSprite('bg', false);
	addLuaSprite('spill', false);
	
    
    xx = 420.95;
    yy = 313;
    
end




function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',1.2)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',0.9)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function onBeatHit()
	health = getProperty('health')
	if getProperty('health') > 0.1 then
		setProperty('health', health- 0.015);
	end

	if curBeat == 120 then
		objectPlayAnimation('agent3','shoott',true);
	end
	if curBeat == 328 then
        setProperty('defaultCamZoom',0.9)
		followchars = false;
	end
	if curBeat == 344 then
			objectPlayAnimation('agent2', 'shot', true);

			characterPlayAnim('gf', 'duck', true)
	end

	for i=1,5,1 do
		if getProperty('agent' .. i ..'.animation.curAnim.name') == 'spawn' or getProperty('agent' .. i ..'.animation.curAnim.name') == 'bop' then
			objectPlayAnimation('agent' .. i,'bop',false);
		end
	end
end


function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == 'spill' then
			setProperty('spill.visible',true);
			objectPlayAnimation('spill', 'spill', true);
		end
		if value1 == 'shoot' and del == 0 then
			del = 3
			objectPlayAnimation('agent' .. agent, 'shot', true);
			agent = agent - 1;

			characterPlayAnim('gf', 'duck', true)
		end
	end
	if name == 'BG Freaks Expression' then
	
		objectPlayAnimation('agent' .. agent, 'shoott', true);
		agent = agent - 1;

		characterPlayAnim('gf', 'duck', true)
	end
	if name == 'Trigger BG Ghouls' then
		if del2 > 0 then
			agent = value1;
			if value2 == '' then
				
			else
				agent = value2;
			end
			objectPlayAnimation('agent' .. value1, 'spawn', true);
		end
		del2 = 3
	end

end

