local allowCountdown = false;
function onCreate()
    setProperty('gf.visible', false);

    makeLuaSprite('black', 'stages/intros/black', 0, 0);
    setObjectCamera('black', 'camother');
    addLuaSprite('black', false);

    makeLuaSprite('circle', 'stages/intros/Sunky', 0, 720);
    setObjectCamera('circle', 'camother');
    setProperty('circle.alpha', 0);
    scaleObject('circle', 1, 1);
    addLuaSprite('circle', true);

end

function onStartCountdown()
    if allowCountdown == false then
        runTimer('wait', 0.5, 1);
        
        allowCountdown = true
	    return Function_Stop;
    end
    return Function_Continue;

end

function onCountdownTick(counter)
    if counter == 0 then
        playSound('intro3', 1);
    end
    if counter == 1 then
        setProperty('countdownReady.x', -5000);
        playSound('intro2', 1);
    end
    if counter == 2 then
        setProperty('countdownSet.x', -5000);
        playSound('intro1', 1);
    end
    if counter == 3 then
        setProperty('countdownGo.x', -5000);
        playSound('introGo', 1);
    end
end

function onTweenCompleted(tag)

    if tag == 'circlescale' then
        runTimer('wait2', 0.7, 1);
        startCountdown();
    end
end

function onTimerCompleted(tag)

	if tag == 'wait' then
        setProperty('circle.alpha', 1);
	    doTweenY('circlescale', 'circle', 0, 0.2, 'elasticInOut');
        playSound('flatBONK', 1);
    end

    if tag == 'wait2' then
        doTweenAlpha('circlealpha', 'circle', 0, 1, 'linear');
        doTweenAlpha('blackalpha', 'black', 0, 1, 'linear');
        
    end

    if tag == 'hidesurgilbrrap' then
        removeLuaSprite('splurgleborp', false);
        setProperty('dad.visible', true);
    end
end

function onEvent(name)

	if name == 'spagglebip' then
        -- ah hell nah thems made the splurgleborp do the sunkidffrg en da lvelfn
		makeLuaSprite('splurgleborp', 'stages/SpingeBinge', getProperty('dad.x') + 275, getProperty('dad.y') + 250);
        addLuaSprite('splurgleborp', true);
        setProperty('dad.visible', false);
        runTimer('hidesurgilbrrap', 0.7, 1)
	end
end

local xx = 760;
local yy = 470;
local xx2 = 1020;
local yy2 = 470;
local ofs = 90;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
