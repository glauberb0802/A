
function onCreate()
    

    makeLuaSprite('BlackFade','sans/white',0,0)
    setObjectCamera('BlackFade','hud')
    addLuaSprite('BlackFade',true)
    doTweenColor('WhiteToBlack','BlackFade','000000',0.01,'LinearOut')


    setProperty('skipCountdown',true)
    makeLuaSprite('TextIntro','bendy/images/introductiondespair',320,280)

    setObjectCamera('TextIntro','hud')
    addLuaSprite('TextIntro',true)

    runTimer('textSongDestroy',2)
    CountTextCompleted = false
    scaleEffect = 1;
    alphaEffect = 1;
end

function onUpdate()
     scaleEffect = scaleEffect + 0.001
     scaleObject('TextIntro',scaleEffect,scaleEffect)
     setProperty('TextIntro.x',getProperty('TextIntro.x') - 0.25)
     setProperty('TextIntro.y',getProperty('TextIntro.y') - 0.1)

        if alphaEffect < 1 then
         setProperty('BlackFade.alpha',alphaEffect)
         alphaEffect = alphaEffect - 0.01
        end
        if alphaEffect < 0 then
         removeLuaSprite('TextIntro',false)
         alphaEffect = null
        end
    setProperty('TextIntro.alpha',alphaEffect)
end

local allowCountdown = false
function onStartCountdown() --pls countdown
	if allowCountdown == false then
		return Function_Stop;
	end
 
	return Function_Continue;
end

function onTimerCompleted(tag)
	if tag == 'textSongDestroy' then
		CountTextCompleted = true
		alphaEffect = alphaEffect - 0.01
        allowCountdown = true
        startCountdown()
	end
end
