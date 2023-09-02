function onCreate()
	-- background shit
    makeLuaSprite('PapyrusBG','sans/PapyrusBG',0,100)
	scaleObject('PapyrusBG',1.1,1.1)
	addLuaSprite('PapyrusBG', false);
end
function onCreatePost()
        setProperty('gf.visible',false)
        end