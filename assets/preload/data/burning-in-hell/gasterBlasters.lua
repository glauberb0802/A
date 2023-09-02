function onCreate()
    InvincibleTime = 0;
	DamageEnable = false;
	DamageEnable2 = false;
	RandomAngle = 0;
	FlipX = 0
	FlipX2 = false
    SansAttack = false


    
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'sans/gameovernormal'); --put in mods/music/

	makeAnimatedLuaSprite('ray','sans/Gaster_blasterss',-2500,400);
	addAnimationByPrefix('ray','Attack1','fefe instance 1',24,false)
	objectPlayAnimation('ray','Attack1',false)

	makeAnimatedLuaSprite('ray2','sans/Gaster_blasterss',-2500,400);
	addAnimationByPrefix('ray2','Attack1','fefe instance 1',24,false)
	objectPlayAnimation('ray2','Attack1',false)

	makeLuaSprite('HeartSans','sans/heart',990,850)



	SansAttack = false
end

function onUpdate(elapsed)

	if SansAttack == true then

		RandomAngle = math.random(0,30)

		if FlipX == 0 then
			FlipX2 = false
		else
			FlipX2 = true
		end
		







		if SansAttack == true then

			triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') - 340,getProperty('boyfriend.y'))

			if getProperty('HeartSans.alpha') < 1 then
				setProperty('HeartSans.alpha',getProperty('HeartSans.alpha') + 0.02)
			end

			if getProperty('boyfriend.alpha') > 0.5 then
				setProperty('boyfriend.alpha',getProperty('boyfriend.alpha') - 0.02)
			end


			if keyPressed('left') and getProperty('HeartSans.x') >218 then
				setProperty('HeartSans.x',getProperty('HeartSans.x') - 6.5)
			end

			if keyPressed('right') and getProperty('HeartSans.x') <1662 then
				setProperty('HeartSans.x',getProperty('HeartSans.x') + 6.5)
			end

			if keyPressed('up') and getProperty('HeartSans.y') >442 then
				setProperty('HeartSans.y',getProperty('HeartSans.y') - 6.5)
			end

			if keyPressed('down') and getProperty('HeartSans.y') <1110 then
				setProperty('HeartSans.y',getProperty('HeartSans.y') + 6.5)
			end
			
			if InvincibleTime == 0  then

				if getProperty('HeartSans.y') > (getProperty('ray.y') + 10) and getProperty('HeartSans.y') < (getProperty('ray.y') - 10) + getProperty('ray.height')/2 and DamageEnable == true or getProperty('HeartSans.y') > (getProperty('ray2.y') + 10)  and getProperty('HeartSans.y') < (getProperty('ray2.y')- 10) + getProperty('ray2.height') / 2 and DamageEnable2 == true or objectsOverlap('HeartSans','ray') and DamageEnable == true or objectsOverlap('HeartSans','ray2') and DamageEnable2 == true  then
					InvincibleTime = 300
					playSound('sans/heart_hurt')
					setProperty('health',getProperty('health') - 1)
					playSound('bendy/inked')
				end
			end
		end
    end

	if InvincibleTime > 0 then
		InvincibleTime = InvincibleTime - 1
	end

	if SansAttack == false then
		if getProperty('HeartSans.alpha') > 0 then
			setProperty('HeartSans.alpha',getProperty('HeartSans.alpha') - 0.02)
		end
		if getProperty('boyfriend.alpha') < 1 then
			setProperty('boyfriend.alpha', getProperty('boyfriend.alpha') + 0.02)
		end
	end

	if getProperty('ray.animation.curAnim.finished') == true then
		removeLuaSprite('ray',false)
		
	end

	if getProperty('ray2.animation.curAnim.finished') == true then
		removeLuaSprite('ray2',false)
	end
	if curStep == 1904 then
		for i = 0,7 do
			noteTweenAlpha('noteAlpha'..i, i, 0, 3, 'linear')
		end
	end

	if curStep == 408 or curStep == 662 then
		SansAttack = true
		runTimer('SansAttack1',1)
		addLuaSprite('HeartSans',true)
		setProperty('HeartSans.alpha',0)
		
	end

	if curStep == 508 or curStep == 761 then 
		SansAttack = false
	end
end

function onTimerCompleted(tag)
	if SansAttack == true then
		if tag == 'SansAttack1' then
			runTimer('gasSound',1.1)
			addLuaSprite('ray',true)
			objectPlayAnimation('ray','Attack1')
			setProperty('ray.flipX',FlipX2)
			setProperty('ray.y',getProperty('HeartSans.y')- 170)
			setProperty('ray.angle',RandomAngle)
			updateHitbox('ray')
			playSound('sans/readygas')
			runTimer('SansAttack2',1)
			runTimer('SansHitBox',1.1)
			
		end

		if tag == 'SansAttack2' then
			runTimer('gasSound2',1.1)
			addLuaSprite('ray2',true)
			objectPlayAnimation('ray2','Attack1')
			setProperty('ray2.flipX',FlipX2)
			setProperty('ray2.y',getProperty('HeartSans.y')- 170)
			setProperty('ray2.angle',RandomAngle)
			updateHitbox('ray2')
			playSound('sans/readygas')
			runTimer('SansAttack1',2)
			runTimer('SansHitBox2',1.1)
		end
    end

	if tag == 'gasSound' or tag == 'gasSound2' then
		playSound('sans/shootgas')
	end

	if tag == 'SansHitBox' then
		DamageEnable = true
		runTimer('DisableHitBox',0.5)
	end
	
	if tag == 'SansHitBox2' then
		DamageEnable2 = true
		runTimer('DisableHitBox2',0.5)
	end
	if tag == 'DisableHitBox'then
		DamageEnable = false
	end
	if tag == 'DisableHitBox2'then
		DamageEnable2 = false
	end
end

function onStepHit()
	FlipX = math.random(0,1)
end


  