local isfaker = false;

function onCreate()
	
	-- background shit

	makeLuaSprite('sky', 'stages/faker/sky', -500, -425);
	makeLuaSprite('mountains', 'stages/faker/mountains', -500, -425);
	makeLuaSprite('grass', 'stages/faker/grass', -500, -425);
	makeLuaSprite('plant', 'stages/faker/plant', -500, -425);
	
	if not lowQuality then
		makeLuaSprite('tree1', 'stages/faker/tree1', -500, -425);
		makeLuaSprite('tree2', 'stages/faker/tree2', -500, -425);
		makeLuaSprite('flower1', 'stages/faker/flower1', -500, -425);
		makeLuaSprite('flower2', 'stages/faker/flower2', -500, -425);
	end

	makeLuaSprite('pillar1', 'stages/faker/pillar1', -500, -425);
	makeLuaSprite('pillar2', 'stages/faker/pillar2', -500, -425);
	
	addLuaSprite('sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('grass', false);
	addLuaSprite('plant', false);
	addLuaSprite('tree1', false);
	addLuaSprite('tree2', false);
	addLuaSprite('pillar1', false);
	addLuaSprite('pillar2', false);
	addLuaSprite('flower1', false);
	addLuaSprite('flower2', false);

	setScrollFactor('sky', 0.8, 0.8);
	setScrollFactor('mountains', 0.9, 0.9);

	makeAnimatedLuaSprite('static', 'stages/tooslow/screenstatic', 0, 0);
	addAnimationByPrefix('static', 'stat', 'screenSTATIC', 24, true);
	setObjectCamera('static', 'camother');
	addLuaSprite('static', true);
	setProperty('static.alpha', 0);

	precacheImage('stages/faker/Faker_Transformation');
	makeAnimatedLuaSprite('fakertransform', 'stages/faker/Faker_Transformation', 50, 0);
	addAnimationByPrefix('fakertransform', '1', 'TransformationRIGHT instance 1', 24, true);
	addAnimationByPrefix('fakertransform', '2', 'TransformationLEFT instance 1', 24, true);
	addAnimationByPrefix('fakertransform', '3', 'TransformationUP instance 1', 24, true);
	addAnimationByPrefix('fakertransform', '4', 'TransformationDOWN instance 1', 24, true);
	addLuaSprite('fakertransform', true);
	setProperty('fakertransform.alpha', 0);

	

	
	
end

function onEvent(name, value1, value2)

	if name == 'static' then
		setProperty('static.alpha', 1);
		playSound('staticBUZZ', 0.50);
		objectPlayAnimation('static', 'stat');
		runTimer('removestatic', 0.2, 1);
	end

	
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'removestatic' then
		setProperty('static.alpha', 0);
	end
end

function onStepHit()

	if curStep == 1 then
		if getProperty('curSong') == 'faker' then
			isfaker = true;
		end
	end

	if isfaker == true then
		if curStep == 768 then
			doTweenAlpha('hudalpha', 'camHUD', 0, 1, 'linear');
		end

		if curStep == 787 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 795 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 800 then
			triggerEvent('static', 0, 0);
			setProperty('isCameraOnForcedPos', true);
			setProperty('dad.y', getProperty('dad.y') + 1000);
			setProperty('fakertransform.alpha', 1);
			setProperty('fakertransform.x', 50);
			setProperty('fakertransform.y', 0);
		end

		if curStep == 811 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 819 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 823 then
			triggerEvent('static', 0, 0);
			objectPlayAnimation('fakertransform', '2', true);
			setProperty('fakertransform.x', getProperty('fakertransform.x') + 47);
			setProperty('fakertransform.y', getProperty('fakertransform.y') - 25);
		end

		if curStep == 827 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 832 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 835 then
			triggerEvent('static', 0, 0);
			objectPlayAnimation('fakertransform', '3', true);
			setProperty('fakertransform.x', getProperty('fakertransform.x') + 76);
			setProperty('fakertransform.y', getProperty('fakertransform.y') - 136);
		end

		if curStep == 839 then
			triggerEvent('static', 0, 0);
		end

		if curStep == 847 then
			triggerEvent('static', 0, 0);
			objectPlayAnimation('fakertransform', '4', true);
			setProperty('fakertransform.x', getProperty('fakertransform.x') - 110);
			setProperty('fakertransform.y', getProperty('fakertransform.y') + 318);
		end

		if curStep == 858 then
			setProperty('static.alpha', 1);
		end

		if curStep == 884 then
			setProperty('static.alpha', 0);
			makeLuaSprite('black', 'stages/intros/black', 0,0);
			setObjectCamera('black', 'camother');
			addLuaSprite('black', false);
		end

		if curStep == 902 then
			triggerEvent('static', 0, 0);
		end
	end
end