function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Fire note' then
			setPropertyFromGroup('unspawnNotes',i,'noAnimation',true) --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_fire'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.45)
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true)

			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);

			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes')
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end
	