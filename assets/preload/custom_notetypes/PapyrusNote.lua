function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length') - 1 do
		sus = getPropertyFromGroup('unspawnNotes', i, 'isSustainNote')
		mustPress = getPropertyFromGroup('unspawnNotes', i, 'mustPress')
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'PapyrusNote' then

			setPropertyFromGroup('unspawnNotes', i,'texture','sans/PapyrusNote')
			if not sus then
				oFX = getPropertyFromGroup('unspawnNotes', i, 'offsetX')
			else
				susFX = getPropertyFromGroup('unspawnNotes', i, 'offsetX')
			end
			if mustPress then
				setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') - 640)
			else
				setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') + 640)
			end
        end
    end
	playingSound = 0
end

function onUpdatePost(el)


    songPos = getSongPosition()
	local currentBeat = (getSongPosition() / 1000)*(bpm/60)



    for a = 0, getProperty('notes.length') - 1 do
    


        if getPropertyFromGroup('notes', a, 'noteType') == 'PapyrusNote' then

          

			strumTime = getPropertyFromGroup('notes', a, 'strumTime')
			sus = getPropertyFromGroup('notes', a, 'isSustainNote')

			if sus then
				setPropertyFromGroup('notes', a, 'offsetX', getPropertyFromGroup('notes', a, 'offsetX') + 3 * math.cos((currentBeat + a * 0.15) * math.pi))
			end
            if not sus then
			 noteTypeData = a
			end
            
			if playingSound ~= noteTypeData and (strumTime - songPos) >= (1100 / scrollSpeed - 10) and (strumTime - songPos) < (1100 / scrollSpeed) and not sus then
			    playSound('sans/ping')
				playingSound = noteTypeData
			end
			if (strumTime - songPos) < (1100 - 10 / scrollSpeed) or (strumTime - songPos) >= (1100 / scrollSpeed) and not sus then
				playingSound = -1
				noteTypeData = -1
			end


			if (strumTime - songPos) < 1100 / scrollSpeed and not sus then




				if getPropertyFromGroup('notes', a, 'offsetX') ~= oFX then
					setPropertyFromGroup('notes', a, 'offsetX', lerp(getPropertyFromGroup('notes', a, 'offsetX'), oFX, boundTo(el * 10, 0, 1)))

				elseif getPropertyFromGroup('notes', a, 'offsetX') <= oFX then
					setPropertyFromGroup('notes', a, 'offsetX', oFX)
				end

			elseif (strumTime - songPos) < 1150 / scrollSpeed and sus then

				if getPropertyFromGroup('notes', a, 'offsetX') ~= susFX + 3 then
					
	
					setPropertyFromGroup('notes', a, 'offsetX', lerp(getPropertyFromGroup('notes', a, 'offsetX'), susFX + 3, boundTo(el * 7, 0, 1)))
				elseif getPropertyFromGroup('notes', a, 'offsetX') <= susFX + 3 then
					setPropertyFromGroup('notes', a, 'offsetX', susFX + 3)
				end
			end
        end

    end

end

function lerp(a, b, ratio)
  return math.floor(a + ratio * (b - a))
end

function boundTo(value, min, max)
	return math.max(min, math.min(max, value))
end
