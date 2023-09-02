function onCreate()
    DodgeDevil = 0;
    DodgeDevilCreated = 0
    SmallDevilSpeedX = 0

    makeAnimatedLuaSprite('SmallDevil','cup/BonusSongs/That Annoying Bitch',0,getProperty('boyfriend.y') - 50)
    addAnimationByPrefix('SmallDevil','Running','BoiRun instance 1',24,true)
    
makeAnimatedLuaSprite('dodgebutton', 'IC_Buttons',  0, 506);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)
	
	
	makeAnimatedLuaSprite('dodgebutton1', 'Notmobilegameanymore',  1079,  505);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton1', 'hud')
	addAnimationByPrefix('dodgebutton1', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton1', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton1', true)
end


function onUpdate(elapsed)
    
    setProperty('SmallDevil.x',getProperty('SmallDevil.x') + SmallDevilSpeedX)



        if getProperty('SmallDevil.x') > getProperty('boyfriend.x') - getProperty('boyfriend.width')/4 and getProperty('SmallDevil.x') < getProperty('boyfriend.x') + getProperty('boyfriend.width') /5 then

            if DodgeDevil == 2 then

                if DodgeDevilCreated == 0 then
                    setProperty('health',getProperty('health') - 1)
                    cameraShake('game',0.035,0.15)
                    playSound('cup/CupHurt')
                    DodgeDevil = 0
                    characterPlayAnim('boyfriend','hurt',true)
                    setProperty('boyfriend.specialAnim',true)
                else
                    DodgeDevil = 0
                end
            end
        end
    

    if ((getMouseX('camHUD') > 0 and getMouseX('camHUD') < 209) and (getMouseY('camHUD') > 506 and getMouseY('camHUD') < 1280 and mouseClicked('left')) or (getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) and DodgeDevilCreated == 0 )or (getProperty('SmallDevil.x') > getProperty('boyfriend.x') - getProperty('boyfriend.width')/4 and getProperty('SmallDevil.x') < getProperty('boyfriend.x') + getProperty('boyfriend.width') /5 and DodgeDevilCreated == 0 )then
     DodgeDevilCreated = 1
     characterPlayAnim('boyfriend','dodge',false)
     setProperty('boyfriend.specialAnim',true)
     objectPlayAnimation('dodgebutton', 'dodgeclick')
     objectPlayAnimation('dodgebutton1', 'dodgeclick')
    end

    if DodgeDevilCreated == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', true)
            end
        end
    end

    if getProperty('boyfriend.animation.curAnim.finished') and getProperty('boyfriend.animation.curAnim.name') == 'dodge' and DodgeDevilCreated == 1 or getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' and DodgeDevilCreated == 1 then
        for i = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == true then
                setPropertyFromGroup('notes', i, 'noAnimation', false)
            end
        end
        DodgeDevilCreated = 0
    end

    if getProperty('SmallDevil.x') > screenWidth + getProperty('SmallDevil.width') * 2 and SmallDevilSpeedX > 0 or getProperty('SmallDevil.x') < 0 - getProperty('SmallDevil.width') * 2 and SmallDevilSpeedX < 0 then
        removeLuaSprite('SmallDevil',false)
        SmallDevilSpeedX = 0
    end
end

function onEvent(name)

    if name == 'Devil Dodge' then
        addLuaSprite('SmallDevil',true)
        if mustHitSection then
            setProperty('SmallDevil.x',screenWidth + getProperty('SmallDevil.width') * 2.5)
            setProperty('SmallDevil.flipX',true)
            SmallDevilSpeedX = -20
        else
            setProperty('SmallDevil.x',0 - getProperty('SmallDevil.width') * 2)
            setProperty('SmallDevil.flipX',false)
            SmallDevilSpeedX = 20
        end
        DodgeDevil = 2
    end
end

