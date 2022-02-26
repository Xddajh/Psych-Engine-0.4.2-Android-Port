local oppx = 798;
local oppy = 488.5;
local bfx = 1239.5;
local bfy = 577.5;
local camoffs = 20;
local followchars = true;

function onCreate()
	
	-- background shit

	makeLuaSprite('floor', 'stages/tooslow/FLOOR1', 25, -100);
	makeLuaSprite('floor2', 'stages/tooslow/FLOOR2', 0, -135);
	makeLuaSprite('grass', 'stages/tooslow/frontgrass', 25, -100);
	makeLuaSprite('egg', 'stages/tooslow/EGGMAN', -10, -100);
	makeLuaSprite('tail', 'stages/tooslow/TAIL', -110, -100);
	makeLuaSprite('knuckle', 'stages/tooslow/KNUCKLE', 650, -200);
	makeLuaSprite('hills', 'stages/tooslow/HILLS', 25, -100);
	makeLuaSprite('sky', 'stages/tooslow/SKY', 25, -100);
	makeAnimatedLuaSprite('tailsspike', 'stages/tooslow/TailsSpikeAnimated', 225, 140);
	addAnimationByPrefix('tailsspike', 'anim', 'Tails Spike Animated instance 1', 8, true);

	makeAnimatedLuaSprite('static', 'stages/tooslow/screenstatic', 0, 0);
	addAnimationByPrefix('static', 'stat', 'screenSTATIC', 24, true);
	setObjectCamera('static', 'camother')
	setProperty('static.alpha', 0.25);

	makeLuaSprite('jumpimage', 'stages/tooslow/simplejump', -20, 0);-- 85^2
	setObjectCamera('jumpimage', 'camother')
	scaleObject('jumpimage', 0.75, 0.75);

	makeAnimatedLuaSprite('sonicscare', 'stages/tooslow/sonicJUMPSCARE', 50, 15);
	addAnimationByPrefix('sonicscare', 'boo', 'sonicSPOOK', 24, false);
	setObjectCamera('sonicscare', 'camother')

	scaleObject('tailsspiked', 1.75, 1.75);

	setScrollFactor('floor2', 0.95, 0.95);
	setScrollFactor('hills', 0.9, 0.9);
	setScrollFactor('sky', 0.85, 0.85);

	addLuaSprite('sky', false);
	addLuaSprite('hills', false);
	addLuaSprite('floor2', false);
	addLuaSprite('floor', false);
	addLuaSprite('grass', false);
	addLuaSprite('egg', false);
	addLuaSprite('knuckle', false);
	addLuaSprite('tailsspike', false);
	addLuaSprite('tail', false);

	addLuaSprite('jumpimage', true);
	setProperty('jumpimage.alpha', 0);

	addLuaSprite('static', true);
	setProperty('static.alpha', 0);


	
end

function onEvent(name, value1, value2)

	if name == 'static' then
		setProperty('static.alpha', 0.25);
		playSound('staticBUZZ', 0.50);
		objectPlayAnimation('static', 'stat');
		runTimer('removestatic', 0.2, 1);
	end

	if name == 'simplejump' then
		playSound('sppok', 1);
		setProperty('jumpimage.alpha', 1);
		runTimer('removejump', 0.2);
		triggerEvent('static', 0, 0);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'removejump' then
		setProperty('jumpimage.alpha', 0);
	end

	if tag == 'removestatic' then
		setProperty('static.alpha', 0);
	end
end

function onUpdate()

	-- if keyJustPressed('space') == true then
	-- 	debugPrint(getProperty('camFollow.x'), getProperty('camFollow.y'))
	-- end

	if followchars == true then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',oppx,oppy);
			end
		else
			triggerEvent('Camera Follow Pos','','');
		end
	else
		triggerEvent('Camera Follow Pos','','');
	end
end

function onBeatHit()

	if curBeat == 326 then
		doTweenAlpha('hudalpha', 'camHUD', 0, 0.3, 'linear');
	end

	if curBeat == 358 then
		doTweenAlpha('hudalpha', 'camHUD', 1, 0.3, 'linear');
	end
end

function onStepHit()

	if curStep == 27 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 130 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 265 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 450 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 645 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 765 then
		cameraFlash('camother', '0000', 4, true)
	end

	if curStep == 800 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 855 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 889 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 921 then
		triggerEvent('simplejump', 0, 0);
	end

	if curStep == 938 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 981 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1030 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1065 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1105 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1123 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1178 then
		triggerEvent('simplejump', 0, 0);
	end

	if curStep == 1245 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1337 then
		triggerEvent('simplejump', 0, 0);

	end

	if curStep == 1362 then
		cameraShake(game, 0.005, 0.6)
		cameraShake(hud, 0.002, 0.6)
	end

	if curStep == 1345 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1432 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1454 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1495 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1521 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1558 then
		triggerEvent('static', 0, 0);
	end
	
	if curStep == 1578 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1599 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1618 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1647 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1657 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1692 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1713 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1723 then
		addLuaSprite('sonicscare', true);
		objectPlayAnimation('sonicscare', 'boo', true);
		playSound('datOneSound', 1)
	end

	if curStep == 1738 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1747 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1761 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1785 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1806 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1816 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1832 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1849 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1868 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1887 then
		triggerEvent('static', 0, 0);
	end

	if curStep == 1909 then
		triggerEvent('static', 0, 0);
	end
end
