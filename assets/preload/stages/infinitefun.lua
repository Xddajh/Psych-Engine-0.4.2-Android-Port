local oppx = 813;
local oppy = 633;
local bfx = 1112.5;
local bfy = 686;
local camoffs = 30;
local followchars = false;

function onCreate()
	
	-- background shit

	makeLuaSprite('sky', 'stages/majin/sonicFUNsky', -50, 0);
	makeLuaSprite('bushback', 'stages/majin/Bush2', -150, 400);
	
	if not lowQuality then
	followchars = true;
	makeAnimatedLuaSprite('backboppers', 'stages/majin/Majin Boppers Back', 300, -125);
	addAnimationByPrefix('backboppers', 'bop', 'MajinBop2 instance 1', 24, false);

	makeLuaSprite('bushfront', 'stages/majin/Bush 1', -75, 573);
	end

	makeAnimatedLuaSprite('frontboppers', 'stages/majin/Majin Boppers Front', 50, -150);
	addAnimationByPrefix('frontboppers', 'bop', 'MajinBop1 instance 1', 24, false);

	makeLuaSprite('ground', 'stages/majin/floor BG', -35, 773);

	if not lowQuality then
	makeAnimatedLuaSprite('fgbopperleft', 'stages/majin/majin FG2', 0, 950);
	addAnimationByPrefix('fgbopperleft', 'bop', 'majin front bopper2', 24, false);

	makeAnimatedLuaSprite('fgbopperright', 'stages/majin/majin FG1', 1400, 950);
	addAnimationByPrefix('fgbopperright', 'bop', 'majin front bopper', 24, false);
	end

	addLuaSprite('sky', false);
	setScrollFactor('sky', 0.6, 0.6)
	addLuaSprite('bushback', false);
	setScrollFactor('bushboppers', 0.7, 0.7);
	addLuaSprite('backboppers', false);
	setScrollFactor('backboppers', 0.75, 0.75);
	addLuaSprite('bushfront', false);
	setScrollFactor('bushboppers', 0.9, 0.9);
	addLuaSprite('frontboppers', false);
	setScrollFactor('frontboppers', 0.95, 0.95);
	addLuaSprite('ground', false);

	addLuaSprite('fgbopperleft', true);
	setScrollFactor('fgbopperleft', 1.2, 1.2);
	addLuaSprite('fgbopperright', true);
	setScrollFactor('fgbopperright', 1.2, 1.2);
	
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

	objectPlayAnimation('backboppers', 'bop', true);
	objectPlayAnimation('frontboppers', 'bop', true);
	objectPlayAnimation('fgbopperleft', 'bop', true);
	objectPlayAnimation('fgbopperright', 'bop', true);

	if not lowQuality then
		if curBeat == 222 then
			makeLuaSprite('three', 'stages/majin/three', 260, 60);
			setObjectCamera('three', 'camother');
			addLuaSprite('three', true);
			setProperty('three.alpha', 0.5);

			doTweenY('threemove', 'three', 0, 0.4, 'cubeOut')
			doTweenAlpha('threealpha', 'three', 0, 0.4, 'cubeOut')
			doTweenZoom('zoom', 'camGame', getProperty('camGame.zoom') + 0.3, 0.7, 'cubeInOut')
		end

		if curBeat == 223 then
			makeLuaSprite('two', 'stages/majin/two', 260, 60);
			setObjectCamera('two', 'camother');
			addLuaSprite('two', true);
			setProperty('two.alpha', 0.5);

			doTweenY('twomove', 'two', 0, 0.4, 'cubeOut')
			doTweenAlpha('twoalpha', 'two', 0, 0.4, 'cubeOut')
			doTweenZoom('zoom', 'camGame', getProperty('camGame.zoom') + 0.3, 0.7, 'cubeInOut')
		end

		if curBeat == 224 then
			makeLuaSprite('one', 'stages/majin/one', 260, 60);
			setObjectCamera('one', 'camother');
			addLuaSprite('one', true);
			setProperty('one.alpha', 0.5);

			doTweenY('onemove', 'one', 0, 0.4, 'cubeOut')
			doTweenAlpha('onealpha', 'one', 0, 0.4, 'cubeOut')
			doTweenZoom('zoom', 'camGame', getProperty('camGame.zoom') + 0.3, 0.7, 'cubeInOut')
		end

		if curBeat == 225 then
			makeLuaSprite('go', 'stages/majin/gofun', 260, 60);
			setObjectCamera('go', 'camother');
			addLuaSprite('go', true);
			setProperty('go.alpha', 0.5);

			doTweenY('gomove', 'go', 0, 0.4, 'cubeOut')
			doTweenAlpha('goalpha', 'go', 0, 0.4, 'cubeOut')
			doTweenZoom('zoom', 'camGame', 0.9, 0.7, 'cubeInOut')
		end

		if curBeat == 226 then
			removeLuaSprite('three', true);
			removeLuaSprite('two', true);
			removeLuaSprite('one', true);
			removeLuaSprite('go', true);
		end
	end
end

function onStepHit()

	if curStep == 10 then
		playSound('majin/laugh1', 0.7)
	end

	--spin timings please add array support god im fucking yandere dev

	if curStep == 272 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 276 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 336 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 340 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 400 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 404 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 464 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 468 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 528 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 532 then
		triggerEvent('notespin', 0, 0)
	end
	
	if curStep == 528 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 532 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 592 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 596 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 656 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 660 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 720 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 724 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 784 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 788 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 848 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 852 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 912 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 916 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 976 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 980 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 1040 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 1044 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 1104 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 1108 then
		triggerEvent('notespin', 0, 0)
	end

	-- pain

	if curStep == 1424 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 1428 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 1488 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 1492 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 1552 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 1556 then
		triggerEvent('notespin', 0, 0)
	end

	if curStep == 1616 then
		triggerEvent('notespin', 0, 0)
	end
	if curStep == 1620 then
		triggerEvent('notespin', 0, 0)
	end
	
end