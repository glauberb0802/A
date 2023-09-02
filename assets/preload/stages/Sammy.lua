function onCreate()
	-- background shit

	
	makeLuaSprite('SammyBG', 'bendy/images/SammyS', -600, -150);
	scaleObject('SammyBG',1,1)
    addLuaSprite('SammyBG', false);

    if not lowQuality then
	 makeAnimatedLuaSprite('Candle', 'bendy/images/Candles',600,1470);
	 addAnimationByPrefix('Candle','Candles','Candless instance 1',24,true);
	 objectPlayAnimation('Candle','Candles',true)
	 scaleObject('Candle',2.6,2.6)
	 makeAnimatedLuaSprite('CandleLight', 'bendy/images/Candles',370,1280);
	 addAnimationByPrefix('CandleLight','Light','Lights instance 1',24,true);
	 objectPlayAnimation('CandleLight','Light',true)
 	 scaleObject('CandleLight',2.6,2.6)

	 addLuaSprite('Candle', true);
	 addLuaSprite('CandleLight', true);
	end
end