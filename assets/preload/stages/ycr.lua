function onCreate()
	makeLuaSprite('sky', 'stages/ycr/sky', -15, -130);
	
	makeLuaSprite('backtrees', 'stages/ycr/backtrees', -15, -130);
	makeLuaSprite('trees', 'stages/ycr/trees', -15, -130);
	makeLuaSprite('ground', 'stages/ycr/ground', -15, -130);

	makeLuaSprite('border', 'stages/ycr/RedVG', 0, 0);
	setObjectCamera('border', 'camother');

	setScrollFactor('trees', 0.9, 0.9);
	setScrollFactor('backtrees', 0.8, 0.8);
	setScrollFactor('sky', 0.7, 0.7);

	addLuaSprite('sky', false);
	addLuaSprite('backtrees', false);
	addLuaSprite('trees', false);
	addLuaSprite('ground', false);

	addLuaSprite('border');
	setProperty('border.alpha', 0);
end

function onStepHit()
	if curStep == 521 then 
		makeAnimatedLuaSprite('static', 'stages/tooslow/', 0, 0);
		addAnimationByPrefix('static', 'stat', 'screenSTATIC', 24, true);
		setObjectCamera('static', 'camother');
		addLuaSprite('static', true);
		setProperty('static.alpha', 0);
		doTweenAlpha('staticalpha', 'static', 1, 0.6, 'quadIn');
		setProperty('isCameraOnForcedPos', true);
	end

	if curStep == 527 then
		makeLuaSprite('greenhill', 'stages/ycr/GreenHill', 1135, 415);
		setProperty('greenhill.antialiasing', false);
		addLuaSprite('greenhill', false);

		triggerEvent('Change Character', '1', 'ycrsonicpix');
		triggerEvent('Change Character', '2', 'gfpix');
		triggerEvent('Change Character', '0', 'bfpix');

		setProperty('dad.x', 1210);
		setProperty('dad.y', 503);
		setProperty('boyfriend.x', 1268);
		setProperty('boyfriend.y', 510);
		setProperty('gf.x', 1230);
		setProperty('gf.y', 477);
		setProperty('camGame.zoom', 10);
		setProperty('defaultCamZoom', 10);

		setProperty('isCameraOnForcedPos', false);

		cancelTween('bordervis');
		cancelTween('borderinvis');
		setProperty('border.alpha', 0);
	end

	if curStep == 781 then
		doTweenAlpha('staticalpha', 'static', 1, 0.6, 'quadIn');
	end
end

function onBeatHit()
	if curBeat == 20 then
		doTweenAlpha('bordervis','border', 1, 0.85, 'quadInOut');
	end

	if curBeat == 196 then
		removeLuaSprite('greenhill', false);
		setProperty('camGame.zoom', 0.9);
		setProperty('defaultCamZoom', 0.9);

		
		triggerEvent('Change Character', '1', 'ycrsonic');
		triggerEvent('Change Character', '2', 'gf');
		triggerEvent('Change Character', '0', 'bf');
		doTweenAlpha('bordervis','border', 1, 0.85, 'quadInOut');
		-- setProperty('camFollow.x', getProperty('gf.x'));
		-- setProperty('camFollow.y', getProperty('gf.y'));
		-- setProperty('isCameraOnForcedPos', true);
		
	end
end

function onTweenCompleted(tag)
	if tag == 'bordervis' then
		doTweenAlpha('borderinvis','border', 0, 0.85, 'quadInOut');
	end

	if tag == 'borderinvis' then
		doTweenAlpha('bordervis','border', 1, 0.85, 'quadInOut');
	end

	if tag == 'staticalpha' then
		doTweenAlpha('staticalpha2', 'static', 0, 0.1, 'quadIn');
	end
end
