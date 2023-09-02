function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'OrangeBoneNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'sans/OrangeNote_assets'); --Change texture
		end
	end
end


function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'OrangeBoneNote' then
         setProperty('health',getProperty('health') - 0.4)
	end
end




-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false


-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen