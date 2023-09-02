function onCreate()
	--Iterate over all notes

	
	SplashDamage = 0;
	SplashEffect = 1;
	RemoveSplahsEffect = true
		for i = 0, getProperty('unspawnNotes.length')-1 do
			--Check if the note is an Instakill Note
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BendySplashNote' then
		
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'bendy/images/BendySplashNoteAssets');--Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end

		makeLuaSprite('SplashScreen','bendy/images/Damage01',0,0)
		scaleObject('SplashScreen',0.7,0.7)

		makeLuaSprite('SplashScreen2','bendy/images/Damage02',0,0)
		scaleObject('SplashScreen2',0.7,0.7)

		makeLuaSprite('SplashScreen3','bendy/images/Damage03',0,0)
		scaleObject('SplashScreen3',0.7,0.7)

		makeLuaSprite('SplashScreen4','bendy/images/Damage04',0,0)
		scaleObject('SplashScreen4',0.7,0.7)

		setObjectCamera('SplashScreen','hud')
		setObjectCamera('SplashScreen2','hud')
		setObjectCamera('SplashScreen3','hud')
		setObjectCamera('SplashScreen4','hud')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BendySplashNote' and songName ~= 'Last-Reel' and songName ~= 'Despair'then
		-- put something here if you want
		playSound('bendy/inked')
		SplashDamage = SplashDamage + 1
		SplashEffect = 1
		RemoveSplashEffect = false
		runTimer('SplashDestroy',2)
	end
end

function onUpdate(elapsed)

		setProperty('SplashScreen.alpha',SplashEffect)
		setProperty('SplashScreen2.alpha',SplashEffect)
		setProperty('SplashScreen3.alpha',SplashEffect)
		setProperty('SplashScreen4.alpha',SplashEffect)

		if SplashDamage == 1 then
		 addLuaSprite('SplashScreen',true)
		end

		if SplashDamage == 2 then
		 removeLuaSprite('SplashScreen',false)
		 addLuaSprite('SplashScreen2',true)
		end

		if SplashDamage == 3 then
		 removeLuaSprite('SplashScreen2',false)
		 addLuaSprite('SplashScreen3',true)
	    end

		if SplashDamage == 4 then
		 removeLuaSprite('SplashScreen3',false)
		 addLuaSprite('SplashScreen4',true)
		end

		if SplashDamage >= 5 then
		 removeLuaSprite('SplashScreen4',false)
		 setProperty('health',-1)
		end

		if SplashEffect < 1 then
		 SplashEffect = SplashEffect - 0.01
		end

		if SplashEffect <= 0 and RemoveSplashEffect == true then
		 SplashEffect = 1
		 SplashDamage = 0
		 removeLuaSprite('SplashScreen',false)
		 removeLuaSprite('SplashScreen2',false)
		 removeLuaSprite('SplashScreen3',false)
		 removeLuaSprite('SplashScreen4',false)
   end
end

function onTimerCompleted(tag)
	if tag == 'SplashDestroy' then
   RemoveSplashEffect = true
		SplashEffect = SplashEffect - 0.1
	end
end


-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen