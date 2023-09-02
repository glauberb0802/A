function onCreate()
pacifist = true;
genocide = false;
reguler = false;
precacheImage('BBONE_assets')
precacheImage('OBONE_assets')
	if pacifist == true then 
	for i = 0, getProperty('unspawnNotes.length')-1 do
	if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blue Bone Note' then
	setPropertyFromGroup('unspawnNotes', i, 'texture', 'none');
	end
end
	for i = 0, getProperty('unspawnNotes.length')-1 do
	if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Orange Bone Note' then
	setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
			end
		end
	end
end
function onUpdate()
if (getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) and curStep < 780 then
pacifist = false
genocide = true
if genocide == true then
	for i = 0, getProperty('unspawnNotes.length')-1 do
	if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blue Bone Note' then
	setPropertyFromGroup('unspawnNotes', i, 'texture', 'BBONE_assets');
	end
end
	for i = 0, getProperty('unspawnNotes.length')-1 do
	if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Orange Bone Note' then
	setPropertyFromGroup('unspawnNotes', i, 'texture', 'OBONE_assets');
			end
		end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Blue Bone Note' then
    setProperty('health', -2);
    end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'Orange Bone Note' then
    setProperty('health', -2);
 end
end
	end
end
end
function onEndSong()
local allowCountdownEnd = false;
local allowCountdown = false;

if genocide == true and not allowEnd and isStoryMode then
loadSong('burning-in-hell', hard);
allowEnd = true;
return Function_Stop;
end

if pacifist == true and not allowEnd and isStoryMode then
loadSong('final-stretch', hard);
allowEnd = true;
return Function_Stop;
end
end