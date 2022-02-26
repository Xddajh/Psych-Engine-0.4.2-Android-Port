local allowCountdown = false;
function onCreate()
    setProperty('gf.visible', false);

    makeLuaSprite('black', 'stages/intros/black', 0,0)
    setObjectCamera('black', 'camother')
    addLuaSprite('black', false)

    makeLuaSprite('circle', 'stages/intros/CircleTripleTrouble', 1280,0)
    setObjectCamera('circle', 'camother')
    addLuaSprite('circle', true)

    makeLuaSprite('text', 'stages/intros/TextTripleTrouble', -1280,0)
    setObjectCamera('text', 'camother')
    addLuaSprite('text', true)

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

function onEvent(name)

    if name == 'switchnotes1' then
        noteTweenX('leftx', 4, defaultOpponentStrumX0, 0.01, 'easeInOut');
        noteTweenX('downx', 5, defaultOpponentStrumX1, 0.01, 'easeInOut')
        noteTweenX('upx', 6, defaultOpponentStrumX2, 0.01, 'easeInOut')
        noteTweenX('rightx', 7, defaultOpponentStrumX3, 0.01, 'easeInOut')

        noteTweenX('oppleftx', 0, defaultPlayerStrumX0, 0.01, 'easeInOut');
        noteTweenX('oppdownx', 1, defaultPlayerStrumX1, 0.01, 'easeInOut')
        noteTweenX('oppupx', 2, defaultPlayerStrumX2, 0.01, 'easeInOut')
        noteTweenX('opprightx', 3, defaultPlayerStrumX3, 0.01, 'easeInOut')
    end

    if name == 'switchnotes2' then
        noteTweenX('leftx', 4, defaultPlayerStrumX0, 0.01, 'easeInOut');
        noteTweenX('downx', 5, defaultPlayerStrumX1, 0.01, 'easeInOut')
        noteTweenX('upx', 6, defaultPlayerStrumX2, 0.01, 'easeInOut')
        noteTweenX('rightx', 7, defaultPlayerStrumX3, 0.01, 'easeInOut')

        noteTweenX('oppleftx', 0, defaultOpponentStrumX0, 0.01, 'easeInOut');
        noteTweenX('oppdownx', 1, defaultOpponentStrumX1, 0.01, 'easeInOut')
        noteTweenX('oppupx', 2, defaultOpponentStrumX2, 0.01, 'easeInOut')
        noteTweenX('opprightx', 3, defaultOpponentStrumX3, 0.01, 'easeInOut')
    end
end

function onTweenCompleted(tag)

    if tag == 'circlemove' then
        runTimer('wait', 1, 1)
        startCountdown()
    end
end

function onTimerCompleted(tag)

	if tag == 'wait' then
        doTweenAlpha('circlealpha', 'circle', 0, 1, 'linear')
        doTweenAlpha('textalpha', 'text', 0, 1, 'linear')
        doTweenAlpha('blackalpha', 'black', 0, 1, 'linear')
    end
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('soundtestcodes')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end