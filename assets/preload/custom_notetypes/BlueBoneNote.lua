function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BlueBoneNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'sans/BlueNote_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Change texture
		end
	end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BlueBoneNote' then
	 setProperty('health',getProperty('health') - 0.4)
	end
end