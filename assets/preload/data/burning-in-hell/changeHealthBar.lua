function onCreate()

	makeLuaSprite('SansHealthBar', 'health_IC/sanshealthbar', 0, 0)
	setObjectCamera('SansHealthBar', 'hud')
	
	addLuaSprite('SansHealthBar', true)
end

function onCreatePost()
    setProperty('SansHealthBar.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

    setProperty('SansHealthBar.x', getProperty('healthBar.x') - 18)

    setProperty('SansHealthBar.angle', getProperty('healthBar.angle'))
    setProperty('SansHealthBar.y', getProperty('healthBar.y') - 6)
    setObjectOrder('SansHealthBar', 4)
	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.scale.x', 0.95)
	setProperty('healthBar.scale.y', 2)
	setProperty('healthBar.x', getProperty('healthBar.x') + 20)
	setProperty('health.y', getProperty('healthBar.y') + 10)
end

function onUpdate()
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.flipX', true)
end