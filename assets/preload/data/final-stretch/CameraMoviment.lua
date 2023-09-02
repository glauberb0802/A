                -- Script made by Washo789, please, if you use it or modify it, I would like you to give me credits.
				
local ofs = 40; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense -- This code is necessary for the script to work, don't even think about deleting it!


function onUpdate() -- The Main Code
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',getProperty('dad.x') * 2 + 50 - ofs,getProperty('dad.y') * 1.25)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',getProperty('dad.x') * 2 + 50 + ofs,getProperty('dad.y') * 1.25)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',getProperty('dad.x') * 2 + 50,getProperty('dad.y') * 1.25 - ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt'  then
                triggerEvent('Camera Follow Pos',getProperty('dad.x') * 2 + 50,getProperty('dad.y') * 1.25 + ofs)
            end
        else
            
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50 -ofs,getProperty('boyfriend.y'))
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50 +ofs,getProperty('boyfriend.y'))
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50,getProperty('boyfriend.y')-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 50,getProperty('boyfriend.y')+ofs)
            end
        end
end