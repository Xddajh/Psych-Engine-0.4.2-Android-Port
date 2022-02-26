local oppx = 436.5;
local oppy = 145;
local bfx = 1144.5;
local bfy = 557.5;
local camoffs = 50;
local followchars = true;

local healthDrop = 0.0000001;
local healthshouldbe = 2;
local ccap = 0;

function onCreate()
	
	-- background shit

	makeLuaSprite('sky', 'stages/blacksun/sky', -500, -425);
	makeLuaSprite('trees1', 'stages/blacksun/backtrees', -500, -425);
	makeLuaSprite('trees2', 'stages/blacksun/trees', -500, -425);
	makeLuaSprite('ground', 'stages/blacksun/ground', -500, -425);
	makeAnimatedLuaSprite('grass', 'stages/blacksun/ExeAnimatedBG_Assets', -440, -440);
	addAnimationByPrefix('grass', 'idle', 'ExeBGAnim', 24, true)

	makeLuaSprite('extracrispy', 'stages/blacksun/TailsCorpse', 665, 390);

	setScrollFactor('sky', 0.8, 0.8);
	setScrollFactor('ground', 0.9, 0.9);
	
	addLuaSprite('sky', false);
	addLuaSprite('trees1', false);
	addLuaSprite('trees2', false);
	addLuaSprite('ground', false);
	addLuaSprite('grass', false);
	addLuaSprite('extracrispy', false);

	makeLuaSprite('vgblack', 'stages/blacksun/black_vignette', 0, 0);
	setObjectCamera('vgblack', 'camother');
	addLuaSprite('vgblack', true);
	setProperty('vgblack.alpha', 0);

	makeLuaSprite('tentas', 'stages/blacksun/tentacles_black', 0, 0);
	setObjectCamera('tentas', 'camother');
	addLuaSprite('tentas', true);
	setProperty('tentas.alpha', 0);

	setProperty('health', healthshouldbe)

end

function onNoteMiss(id, direction, noteType, isSustainNote)
	
end

function onUpdate()

	--debugPrint(healthshouldbe)

	ccap = getProperty('combo');
	if getProperty('combo') > 40 then
		ccap = 40
	end
	
	setProperty('tentas.alpha', 1 - (getProperty('health') / 2));
	setProperty('vgblack.alpha', 1 - (getProperty('health') / 2));

	healthshouldbe = healthshouldbe - (healthDrop * (500 / (ccap + 1) / 8) * ((getProperty('songMisses') + 1) / 0.0633))
	setProperty('health', healthshouldbe)

	
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
