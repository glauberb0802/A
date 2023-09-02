function onCreate()

	makeLuaSprite('CupheadHealthBar', 'health_IC/cuphealthbar', 0, 0)
	setObjectCamera('CupheadHealthBar', 'hud')
	
	addLuaSprite('CupheadHealthBar', true)
end

function onCreatePost()
    setProperty('CupheadHealthBar.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

    setProperty('CupheadHealthBar.x', getProperty('healthBar.x'))

    setProperty('CupheadHealthBar.angle', getProperty('healthBar.angle'))
    setProperty('CupheadHealthBar.y', getProperty('healthBar.y') - 18)
    setObjectOrder('CupheadHealthBar', 4)
	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.scale.y', 2)
	setObjectOrder('CupheadHealthBar', 4)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 2)
	setProperty('healthBar.x', getProperty('healthBar.x') + 20)
	setProperty('health.y', getProperty('healthBar.y') + 10)

end
function onUpdate()
	setProperty('CupheadHealthBar.alpha',getProperty('healthBar.alpha'))
end