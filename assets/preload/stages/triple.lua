local dad = 1;
local oppx1 = 1099;
local oppy1 = 556;
local oppx2 = 997.5;
local oppy2 = 407;
local oppx3 = 1914;
local oppy3 = 547.5;
local oppx4 = 1862.5;
local oppy4 = 407;
local oppx5 = 841;
local oppy5 = 442;
local camoffs = 30;
local followchars = true;

function onCreate()
	
	makeLuaSprite('sky', 'stages/tt/Glitch', -100, -325);

	makeAnimatedLuaSprite('glitchSky', 'stages/tt/NewTitleMenuBG', -100, -50);
	addAnimationByPrefix('glitchSky', 'lsd', 'TitleMenuSSBG instance 1', 24, true);
	scaleObject('glitchSky', 12, 11);
	setScrollFactor('sky', 0.7, 0.7);
	
	makeLuaSprite('backtrees', 'stages/tt/Trees', -15, -250);
	makeLuaSprite('trees', 'stages/tt/Trees2', -15, -250);
	makeLuaSprite('ground', 'stages/tt/Grass', -15, -130);

	setScrollFactor('trees', 0.9, 0.9);
	setScrollFactor('backtrees', 0.8, 0.8);
	setScrollFactor('sky', 0.7, 0.7);

	addLuaSprite('sky', false);

	addLuaSprite('glitchSky', false);
	setProperty('glitchSky.alpha', 0);

	addLuaSprite('backtrees', false);
	addLuaSprite('trees', false);
	addLuaSprite('ground', false);

	makeAnimatedLuaSprite('p3static', 'stages/tt/Phase3Static', 0, 0);
	addAnimationByPrefix('p3static', 'creep', 'Phase3Static instance 1', 24, false);
	setObjectCamera('p3static', 'camother');
	setProperty('p3static.alpha', 0.5);
	scaleObject('p3static', 3.5, 3.5);

	makeAnimatedLuaSprite('static', 'stages/tooslow/screenstatic', 0, 0);
	addAnimationByPrefix('static', 'stat', 'screenSTATIC', 24, true);
	setObjectCamera('static', 'camother');
	setProperty('static.alpha', 0);
	addLuaSprite('static', true);

	addCharacterToList('bfperspective', 'dad')
	addCharacterToList('beastsonic', 'dad')
	addCharacterToList('knuckles', 'dad')
	addCharacterToList('eggman', 'dad')
	
end

function onEvent(name, value1, value2)

	if name == 'p3stat' then
		objectPlayAnimation('p3static', 'creep', true);
	end

	if name == 'tailsjump' then
		makeLuaSprite('jumpimage', 'stages/tt/scares/Tails', 0, 0);
		setObjectCamera('jumpimage', 'camother');
		addLuaSprite('jumpimage', false);

		playSound('P3Jumps/TailsScreamLOL', 0.1)
		runTimer('removejump', 0.2, 1);
		triggerEvent('static', 0, 0);

		cameraShake(0.0025, 0.50);
	end

	if name == 'knuxjump' then
		makeLuaSprite('jumpimage', 'stages/tt/scares/Knuckles', 0, 0);
		setObjectCamera('jumpimage', 'camother');
		addLuaSprite('jumpimage', false);

		playSound('P3Jumps/KnucklesScreamLOL', 0.1);
		runTimer('removejump', 0.2, 1);
		triggerEvent('static', 0, 0);

		cameraShake(0.0025, 0.50);
	end

	if name == 'eggjump' then
		makeLuaSprite('jumpimage', 'stages/tt/scares/Eggman', 0, 0);
		setObjectCamera('jumpimage', 'camother');
		addLuaSprite('jumpimage', false);

		playSound('P3Jumps/EggmanScreamLOL', 0.1);
		runTimer('removejump', 0.2, 1);
		triggerEvent('static', 0, 0);
		
		cameraShake(0.0025, 0.50);
	end

	if name == 'static' then
		setProperty('static.alpha', 0.25);
		playSound('staticBUZZ', 0.50);
		objectPlayAnimation('static', 'stat');
		runTimer('removestatic', 0.2, 1);
	end

end

function onTimerCompleted(tag)

	if tag == 'removejump' then
		removeLuaSprite('jumpimage');
	end

	if tag == 'removestatic' then
		setProperty('static.alpha', 0);
	end
end

function onStepHit()

	if curStep == 1 then
		dad = 1;
		addLuaSprite('p3static', true)
		doTweenZoom('startzoom', 'camGame', 1.1, 2, 'cubeOut');
		setProperty('defaultCamZoom', 1.1);
	end

	if curStep == 96 then
		setProperty('dad.nonanimated', true)
		characterPlayAnim('dad', 'hey', true);
	end

	if curStep == 144 then
		triggerEvent('tailsjump', 0, 0);
	end

	if curStep == 1024 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 1040 then
		dad = 2;
		triggerEvent('Change Character', '1', 'beastsonic')
		triggerEvent('Change Character', '0', 'bfperspective')

		setProperty('boyfriend.x', 1350);
		setProperty('boyfriend.y', 500);

		setProperty('glitchSky.alpha', 1);
		setProperty('defaultCamZoom', 0.9);

	end

	if curStep == 1088 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 1216 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 1280 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 1296 then
		dad = 3;
		triggerEvent('switchnotes1', 0, 0);

		triggerEvent('Change Character', '1', 'knucklesmirror');
		triggerEvent('Change Character', '0', 'bfmirror');

		setProperty('dad.x', 1925);

		setProperty('glitchSky.alpha', 0);
		setProperty('defaultCamZoom', 1.1);
		triggerEvent('knuxjump', 0, 0);
		
	end

	if curStep == 2320 then
		dad = 4;
		triggerEvent('Change Character', '1', 'beastsonicmirror');
		triggerEvent('Change Character', '0', 'bfperspectivemirror');

		setProperty('glitchSky.x', 350)
		setProperty('dad.x', 1725);
		setProperty('boyfriend.x', 1050);
		setProperty('boyfriend.y', 500);

		setProperty('glitchSky.alpha', 1);
		setProperty('defaultCamZoom', 0.9);
	
	end

	if curStep == 2305 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 2810 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 2823 then
		dad = 5;
		triggerEvent('switchnotes2', 0, 0);

		triggerEvent('Change Character', '1', 'eggman');
		triggerEvent('Change Character', '0', 'bf');

		setProperty('dad.x', 450);

		setProperty('glitchSky.alpha', 0);
		setProperty('defaultCamZoom', 1.1);
		triggerEvent('eggjump', 0, 0);
		
	end

	if curStep == 3199 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 4096 then
		triggerEvent('p3stat', 0, 0);
	end

	if curStep == 4111 then
		dad = 2;
		triggerEvent('Change Character', '1', 'beastsonic')
		triggerEvent('Change Character', '0', 'bfperspective')

		setProperty('glitchSky.x', -100)
		setProperty('boyfriend.x', 1350);
		setProperty('boyfriend.y', 500);

		setProperty('glitchSky.alpha', 1);
		setProperty('defaultCamZoom', 0.9);

	end
	
end

function onUpdate()
	-- if keyJustPressed('space') == true then
	-- 	debugPrint(getProperty('camFollow.x'), ' ', getProperty('camFollow.y'))
	-- end
	
	if followchars == true then
		if mustHitSection == false then
			if dad == 1 then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',oppx1-camoffs,oppy1)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',oppx1+camoffs,oppy1)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',oppx1,oppy1-camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',oppx1,oppy1+camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',oppx1,oppy1);
				end
			end
			if dad == 2 then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',oppx2-camoffs,oppy2)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',oppx2+camoffs,oppy2)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',oppx2,oppy2-camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',oppx2,oppy2+camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',oppx2,oppy2);
				end
			end
			if dad == 3 then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',oppx3-camoffs,oppy3)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',oppx3+camoffs,oppy3)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',oppx3,oppy3-camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',oppx3,oppy3+camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',oppx3,oppy3);
				end
			end
			if dad == 4 then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',oppx4-camoffs,oppy4)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',oppx4+camoffs,oppy4)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',oppx4,oppy4-camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',oppx4,oppy4+camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',oppx4,oppy4);
				end
			end
			if dad == 5 then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',oppx5-camoffs,oppy5)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',oppx5+camoffs,oppy5)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',oppx5,oppy5-camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',oppx5,oppy5+camoffs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',oppx5,oppy5);
				end
			end
		else
			triggerEvent('Camera Follow Pos','','');
		end
	else
		triggerEvent('Camera Follow Pos','','');
	end
end
