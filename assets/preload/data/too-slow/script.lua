local allowCountdown = false;
function onCreate()

    makeLuaSprite('black', 'stages/intros/black', 0,0);
    setObjectCamera('black', 'camother');
    addLuaSprite('black', false);

    makeLuaSprite('circle', 'stages/intros/CircleTooSlow', 1280,0);
    setObjectCamera('circle', 'camother');
    addLuaSprite('circle', true);

    makeLuaSprite('text', 'stages/intros/TextTooSlow', -1280,0);
    setObjectCamera('text', 'camother');
    addLuaSprite('text', true);

end

function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
	    runTimer('lowEnd', 2, 1);
        setProperty('camHUD.visible', false);
        setProperty('camGame.visible', false);

        allowCountdown = true
	    return Function_Stop;
    end
    return Function_Continue;

end

function onSongStart()
    doTweenX('circlemove', 'circle', 0, 1, 'linear');
    doTweenX('textmove', 'text', 0, 1, 'linear');
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
        runTimer('wait', 0.5, 1)
    end
end

function onTimerCompleted(tag)

	if tag == 'wait' then
        doTweenAlpha('circlealpha', 'circle', 0, 1, 'linear');
        doTweenAlpha('textalpha', 'text', 0, 1, 'linear');
        doTweenAlpha('blackalpha', 'black', 0, 1, 'linear');
    end

    if tag == 'lowEnd' then
        startVideo('tooslowcutscene1');
        setProperty('camHUD.visible', true);
        setProperty('camGame.visible', true);
    end
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('tooslowcutscene2')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end

local xx = 780;
local yy = 450;
local xx2 = 1030;
local yy2 = 510;
local ofs = 100;
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
