local allowCountdown = false;
function onCreate()
    setProperty('gf.visible', false);

    makeLuaSprite('black', 'stages/intros/black', 0,0);
    setObjectCamera('black', 'camother');
    addLuaSprite('black', false);

    makeLuaSprite('circle', 'stages/intros/CircleMajin', 1280,0);
    setObjectCamera('circle', 'camother');
    addLuaSprite('circle', true);

    makeLuaSprite('text', 'stages/intros/TextMajin', -1280,0);
    setObjectCamera('text', 'camother');
    addLuaSprite('text', true);

end

function onStartCountdown()
    if allowCountdown == false then
	    doTweenX('circlemove', 'circle', 0, 1, 'linear')
        doTweenX('textmove', 'text', 0, 1, 'linear')

        allowCountdown = true
	    return Function_Stop;
    end
    return Function_Continue;

end

function onCountdownTick(counter)
    if counter == 0 then
        playSound('intro3', 1)
    end
    if counter == 1 then
        setProperty('countdownReady.x', -5000);
        playSound('intro2', 1)
    end
    if counter == 2 then
        setProperty('countdownSet.x', -5000);
        playSound('intro1', 1)
    end
    if counter == 3 then
        setProperty('countdownGo.x', -5000);
        playSound('introGo', 1)
    end
end

function onTweenCompleted(tag)

    if tag == 'circlemove' then
        runTimer('wait', 1, 1)
        startCountdown()
    end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'wait' then
        doTweenAlpha('circlealpha', 'circle', 0, 1, 'linear');
        doTweenAlpha('textalpha', 'text', 0, 1, 'linear');
        doTweenAlpha('blackalpha', 'black', 0, 1, 'linear');
    end

    if tag == '45degspin' then

        setPropertyFromGroup('strumLineNotes', 0, 'angle', getPropertyFromGroup('strumLineNotes', 0, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 1, 'angle', getPropertyFromGroup('strumLineNotes', 1, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 2, 'angle', getPropertyFromGroup('strumLineNotes', 2, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 3, 'angle', getPropertyFromGroup('strumLineNotes', 3, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 4, 'angle', getPropertyFromGroup('strumLineNotes', 4, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 5, 'angle', getPropertyFromGroup('strumLineNotes', 5, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 6, 'angle', getPropertyFromGroup('strumLineNotes', 6, 'angle') + 45)
        setPropertyFromGroup('strumLineNotes', 7, 'angle', getPropertyFromGroup('strumLineNotes', 7, 'angle') + 45)

        if loopsLeft == 0 then
            setPropertyFromGroup('strumLineNotes', 0, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 1, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 2, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 3, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 4, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 5, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 6, 'angle', 0)
            setPropertyFromGroup('strumLineNotes', 7, 'angle', 0)
        end
    end
end

function onEvent(name)

    if name == 'notespin' then

        runTimer('45degspin', 0.025, 8)
    end
end

local xx = 710;
local yy = 620;
local xx2 = 1080;
local yy2 = 710;
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
