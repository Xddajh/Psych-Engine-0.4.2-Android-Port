local floaty = 0;
local tailscircle = '';

function onCreate()
	
	-- background shit

	makeLuaSprite('stage', 'stages/saturn/TailsBG', -250, -150);
	scaleObject('stage', 1.3, 1.2);
	setScrollFactor('stage', 0.91, 0.91);

	addLuaSprite('stage', false);
	
end

function onTweenCompleted(tag)
	if tag == 'daddefaultx' then
		tailscircle = 'hovering';
		floaty = 41.82;
	end
end

function onStepHit()
	if curStep == 64 then
		tailscircle = 'hovering';
	end
	if curStep == 128 then
		tailscircle = 'circling';
	end
	if curStep == 256 then
		doTweenX('daddefaultx', 'dad', 350, 0.2, 'linear');
		doTweenX('daddefaulty', 'dad', 200, 0.2, 'linear');
	end
	if curStep == 319 then
		tailscircle = 'circling';
	end
	if curStep == 575 then
		doTweenX('daddefaultx', 'dad', 350, 0.2, 'linear');
		doTweenX('daddefaulty', 'dad', 200, 0.2, 'linear');
	end
	if curStep == 866 then
		tailscircle = 'circling';
	end
	
end

function onUpdate()

	if tailscircle == 'hovering' then
        setProperty('dad.y', getProperty('dad.y') + math.sin(floaty) * 1.3);
		floaty = floaty + 0.03
    end
    if tailscircle == 'circling' then
        setProperty('dad.y', getProperty('dad.y') + math.sin(floaty) * 1.3);
        setProperty('dad.x', getProperty('dad.x') + math.cos(floaty) * 1.3);
		floaty = floaty + 0.03
    end
end