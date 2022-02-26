local allowCountdown = false;
function onCreate()

    makeLuaSprite('black', 'stages/intros/black', 0,0)
    setObjectCamera('black', 'camother')
    addLuaSprite('black', false)

    makeLuaSprite('circle', 'stages/intros/CircleYouCantRun', 1280,0)
    setObjectCamera('circle', 'camother')
    addLuaSprite('circle', true)

    makeLuaSprite('text', 'stages/intros/TextYouCantRun', -1280,0)
    setObjectCamera('text', 'camother')
    addLuaSprite('text', true)

end

function onSongStart()
    doTweenX('circlemove', 'circle', 0, 1, 'linear')
    doTweenX('textmove', 'text', 0, 1, 'linear')
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
        doTweenAlpha('circlealpha', 'circle', 0, 1, 'linear')
        doTweenAlpha('textalpha', 'text', 0, 1, 'linear')
        doTweenAlpha('blackalpha', 'black', 0, 1, 'linear')
    end
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('youcantruncutscene2')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end