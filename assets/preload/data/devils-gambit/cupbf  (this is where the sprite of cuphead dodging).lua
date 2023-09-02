-- Script made by Catbrother Everything with help by NardBruh. Credit is not needed but would be nice! :)
function onCreate()
	makeAnimatedLuaSprite('bfthing','characters/cuphead/BoyFriend_NM',getProperty('boyfriend.x'),getProperty('boyfriend.y'));
	makeAnimatedLuaSprite('cupthing','characters/cuphead/Nightmare_Cuphead',getProperty('dad.x'),getProperty('dad.y'));
	addAnimationByPrefix('bfthing', 'attack', '0BF attack instance 1', 24, false);
	addAnimationByPrefix('bfthing', 'idle', '0BF attack instance 1', 24, false);
	addAnimationByPrefix('bfthing', 'dodge', 'boyfriend dodge instance', 24, false); -- Change to characters idle in XML
    addAnimationByPrefix('cupthing', 'shoot', 'Beamm Instance', 24, false); -- Change to characters leftnote in XML
    addAnimationByPrefix('cupthing', 'dodge', 'Dodgez instance', 24, false); -- Change to characters downnote in XML
    addAnimationByPrefix('cupthing', 'boom', 'Hadouken or Roundabout instance', 24, false); -- Change to characters upnote in XML
	addAnimationByPrefix('cupthing', 'idle', 'Beamm Instance', 24, false); -- Change to characters leftnote in XML
	setProperty('cupthing.alpha',0)
	setProperty('bfthing.alpha',0)
	addLuaSprite('bfthing',true);
	setProperty('cupthing.scale.x',getProperty('dad.scale.x'))
	setProperty('bfthing.scale.x',getProperty('boyfriend.scale.x'))
	setProperty('cupthing.scale.y',getProperty('dad.scale.y'))
	setProperty('bfthing.scale.y',getProperty('boyfriend.scale.y'))
	objectPlayAnimation('bfthing','idle',true)
	objectPlayAnimation('cupthing','idle',true)
	addLuaSprite('cupthing', true); -- false = add behind characters, true = add over characters
end
