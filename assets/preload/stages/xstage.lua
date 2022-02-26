local oppx = 717;
local oppy = 180;
local bfx = 1219.5;
local bfy = 337.5;
local camoffs = 50;
local followchars = true;

function onCreate()
	
	makeLuaSprite('sky', 'stages/xstage/sky', -650, -910);
	scaleObject('sky', 0.8, 0.8);
	makeLuaSprite('hills', 'stages/xstage/hills1', -650, -850);
	scaleObject('hills', 0.8, 0.8);
	makeLuaSprite('ground', 'stages/xstage/floor', -750, -400);
	scaleObject('ground', 0.85, 0.55);
	makeLuaSprite('tree', 'stages/xstage/tree', -825, -880);
	scaleObject('tree', 0.8, 0.8);

	scaleObject('flower1', 0.6, 0.6);
	makeLuaSprite('flower2', 'stages/xstage/smallflowe2', -175, -450);
	scaleObject('flower2', 0.6, 0.6);
	makeLuaSprite('flower3', 'stages/xstage/smallflower', -175, -450);
	scaleObject('flower3', -0.6, 0.6);

	makeAnimatedLuaSprite('notknuckles', 'stages/xstage/NotKnuckles_Assets', 550, -325);
	addAnimationByPrefix('notknuckles', 'idle', 'Notknuckles', 24, true);
	scaleObject('notknuckles', 0.5, 0.5);

	makeAnimatedLuaSprite('eyeflower', 'stages/xstage/WeirdAssFlower_Assets', 125, -200);
	addAnimationByPrefix('eyeflower', 'idle', 'flower', 24, true);
	scaleObject('eyeflower', 0.8, 0.8);

	setScrollFactor('hills', 0.85, 0.85);
	setScrollFactor('sky', 0.75, 0.75);

	addLuaSprite('sky', false);
	addLuaSprite('hills', false);
	addLuaSprite('ground', false);
	addLuaSprite('eyeflower', false);
	addLuaSprite('flower1', false);
	addLuaSprite('flower2', false);
	addLuaSprite('flower3', false);
	addLuaSprite('tree', false);
	addLuaSprite('notknuckles', false);

	setProperty('gf.visible', false);
	
end

function onStepHit()
	if curStep == 320 then
		setProperty('defaultCamZoom', 0.9);
	end

	if curStep == 1103 then
		setProperty('defaultCamZoom', 0.8);
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