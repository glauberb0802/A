function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Warning Rosie' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTEWarning Rosie_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '500'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '-500'); --Default value is: 0.0475, health lost on miss
			end
		end
	end
	--debugPrint('Script started!')

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Warning Rosie' then
		-- put something here if you want
		playSound('Rosie_shoot', 1);
		characterPlayAnim('dad', 'shot', true);
		characterPlayAnim('bf','dodge',true);
		cameraShake('camGame', 0.01, 0.2);
		setProperty('boyfriend.specialAnim', true);
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	-- put something here if you want
	if noteType == 'Warning Rosie' then
	characterPlayAnim('bf','hurt', true);
	characterPlayAnim('dad','shot', true);
	setProperty('health', -500);
	playSound('Rosie_shoot', 1);
	end
end