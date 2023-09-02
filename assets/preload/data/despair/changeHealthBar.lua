function onCreate()

	makeLuaSprite('BendyHealthBar', 'health_IC/bendyhealthbar', 0, 0)
	setObjectCamera('BendyHealthBar', 'hud')
	
	addLuaSprite('BendyHealthBar', true)
end

function onCreatePost()
    setProperty('BendyHealthBar.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

    setProperty('BendyHealthBar.x', getProperty('healthBar.x') - 25)

    setProperty('BendyHealthBar.angle', getProperty('healthBar.angle'))
    setProperty('BendyHealthBar.y', getProperty('healthBar.y') - 87)
    setObjectOrder('BendyHealthBar', 4)
	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.scale.y', 2.2)
	setObjectOrder('BendyHealthBar', 4)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 2)
	setProperty('healthBar.x', getProperty('healthBar.x') + 20)
	setProperty('health.y', getProperty('healthBar.y') + 10)

end