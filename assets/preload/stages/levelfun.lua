function onCreate()
	
	-- background shit

	makeLuaSprite('stage', 'stages/SunkBG', -100, -150);
	scaleObject('stage', 0.8, 0.8);

	addLuaSprite('stage', false);
	
end

function onStepHit()

	if curStep == 69 then -- niceeee
		doTweenZoom('startzoom', 'camGame', 2.2, 4, 'linear');
	end

	if curStep == 96 then
		cancelTween('startzoom');
		setProperty('camGame.zoom', defaultCamZoom);
	end

	if curStep == 538 then
		triggerEvent('spagglebip');
	end

	if curStep == 2273 then
		triggerEvent('spagglebip');
	end
end