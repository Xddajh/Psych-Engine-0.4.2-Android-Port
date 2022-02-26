local allowCountdown = false;
local darknotevisibility = false;

local usertimebar = '';
function onCreate()
    setProperty('gf.visible', false);

    makeLuaSprite('black', 'stages/intros/black', 0,0);
    setObjectCamera('black', 'camother');
    addLuaSprite('black', false);
    addCharacterToList('tailsdolldark', 'dad')

    usertimebar = getPropertyFromClass('ClientPrefs', 'timeBarType');

end

function onStartCountdown()
    if allowCountdown == false then
	    
        runTimer('wait1', 1, 1)

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

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'wait1' then
        removeLuaSprite('black', true);

        makeAnimatedLuaSprite('static', 'stages/tooslow/daSTAT', -640, -360);
        addAnimationByPrefix('static', 'stat', 'staticFLASH', 24, true);
        setObjectCamera('static', 'camother');        
        setProperty('static.alpha', 0.05);
        scaleObject('static', 8, 5);
        addLuaSprite('static', false);

        makeAnimatedLuaSprite('intro', 'stages/saturn/TDollStart', -1, 0);
        addAnimationByPrefix('intro', 'open', 'Start', 24, false);
        setObjectCamera('intro', 'camother');
        objectPlayAnimation('intro', 'open', true)
        addLuaSprite('intro', true);

        runTimer('wait2', 2, 1)
    end

	if tag == 'wait2' then
        removeLuaSprite('intro', true);

        setProperty('camOther.zoom', 0.5);

        playSound('ready', 1)
        makeLuaSprite('ready', 'stages/saturn/ready', 312, 178);
        setObjectCamera('ready', 'camother');
        addLuaSprite('ready', true);

        doTweenZoom('ready', 'camOther', 1, 0.9, 'linear');
        startCountdown()
    end
end

function onTweenCompleted(tag)
    if tag == 'ready' then
        setProperty('camOther.zoom', 0.5);

        removeLuaSprite('ready', true);

        playSound('set', 1)
        makeLuaSprite('set', 'stages/saturn/set', 289, 199);
        setObjectCamera('set', 'camother');
        addLuaSprite('set', true);

        doTweenZoom('set', 'camOther', 1, 0.9, 'linear');

        
    end

    if tag == 'set' then
        setProperty('camOther.zoom', 0.7);

        removeLuaSprite('set', true);

        playSound('go', 1)
        makeLuaSprite('go', 'stages/saturn/go', 361, 145);
        setObjectCamera('go', 'camother');
        addLuaSprite('go', true);

        doTweenZoom('go', 'camOther', 1, 0.9, 'linear');
    end

    if tag == 'go' then
        removeLuaSprite('go', true);
        setProperty('camOther.zoom', 1);
        scaleObject('static', 3.2, 2.5);
        setProperty('static.x', 0);
        setProperty('static.y', 0)
    end
end

function opponentNoteHit()
    if darknotevisibility == true then
        setPropertyFromGroup('strumLineNotes', 4, 'alpha', 0.5);
        setPropertyFromGroup('strumLineNotes', 5, 'alpha', 0.5);
        setPropertyFromGroup('strumLineNotes', 6, 'alpha', 0.5);
        setPropertyFromGroup('strumLineNotes', 7, 'alpha', 0.5);
    end
end

function onUpdate()

    if keyJustPressed('space') == true then
        debugPrint('setting: ', getPropertyFromClass('ClientPrefs', 'timeBarType'))
        debugPrint(usertimebar);
        -- debugPrint(getPropertyFromGroup('strumLineNotes', 4, 'x'));
        -- debugPrint(getPropertyFromGroup('strumLineNotes', 5, 'x'));
        -- debugPrint(getPropertyFromGroup('strumLineNotes', 6, 'x'));
        -- debugPrint(getPropertyFromGroup('strumLineNotes', 7, 'x'));
    end

    if darknotevisibility == true then
        if getPropertyFromGroup('strumLineNotes', 4, 'alpha') > 0 then
            setPropertyFromGroup('strumLineNotes', 4, 'alpha', getPropertyFromGroup('strumLineNotes', 4, 'alpha') - 0.02);
            setPropertyFromGroup('strumLineNotes', 5, 'alpha', getPropertyFromGroup('strumLineNotes', 5, 'alpha') - 0.02);
            setPropertyFromGroup('strumLineNotes', 6, 'alpha', getPropertyFromGroup('strumLineNotes', 6, 'alpha') - 0.02);
            setPropertyFromGroup('strumLineNotes', 7, 'alpha', getPropertyFromGroup('strumLineNotes', 7, 'alpha') - 0.02);

            setPropertyFromClass('Note', 'note.noteSplashDisabled', false);
            setProperty('comboSpr.visible', false);
            setProperty('rating.visible', false);
        end
    end
end

function onDestroy()
        setPropertyFromClass('ClientPrefs', 'timeBarType', usertimebar)
end

function onStepHit()
    if curStep == 588 then
        setPropertyFromClass('ClientPrefs', 'timeBarType', 'Song Name')
        
        triggerEvent('Change Character', '1', 'tailsdolldark');
        setProperty('defaultCamZoom', 1.3);
        setProperty('stage.alpha', 0);
        setProperty('boyfriend.visible', false);
        setProperty('healthBar.visible', false);
        setProperty('healthBarBG.visible', false);
        -- setProperty('timeBar.visible', false);
        -- setProperty('timeBarBG.visible', false);
        setProperty('timeTxt.visible', false);
        setProperty('iconP1.visible', false);
        setProperty('iconP2.visible', false);
        setProperty('scoreTxt.visible', false);

        noteTweenX('left', 0, -2000, 0.01, 'linear');
        noteTweenX('down', 1, -2000, 0.01, 'linear');
        noteTweenX('up', 2, -2000, 0.01, 'linear');
        noteTweenX('right', 3, -2000, 0.01, 'linear');

        setPropertyFromGroup('strumLineNotes', 4, 'x', 412);
        setPropertyFromGroup('strumLineNotes', 5, 'x', 524);
        setPropertyFromGroup('strumLineNotes', 6, 'x', 636);
        setPropertyFromGroup('strumLineNotes', 7, 'x', 748);
        setPropertyFromGroup('strumLineNotes', 4, 'alpha', 0.5);
        setPropertyFromGroup('strumLineNotes', 5, 'alpha', 0.5);
        setPropertyFromGroup('strumLineNotes', 6, 'alpha', 0.5);
        setPropertyFromGroup('strumLineNotes', 7, 'alpha', 0.5);

        darknotevisibility = true;
        
        
    end

    if curStep == 860 then
            setPropertyFromClass('ClientPrefs', 'timeBarType', usertimebar)

        triggerEvent('Change Character', '1', 'tailsdoll');
        setProperty('defaultCamZoom', 0.9);
        setProperty('stage.alpha', 1);
        setProperty('boyfriend.visible', true);
        setProperty('healthBar.visible', true);
        setProperty('healthBarBG.visible', true);
        -- setProperty('timeBar.visible', true);
        -- setProperty('timeBarBG.visible', true);
        setProperty('timeTxt.visible', true);
        setProperty('iconP1.visible', true);
        setProperty('iconP2.visible', true);
        setProperty('scoreTxt.visible', true);

        noteTweenX('left', 0, defaultOpponentStrumX0, 0.01, 'linear');
        noteTweenX('down', 1, defaultOpponentStrumX1, 0.01, 'linear');
        noteTweenX('up', 2, defaultOpponentStrumX2, 0.01, 'linear');
        noteTweenX('right', 3, defaultOpponentStrumX3, 0.01, 'linear');

        setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('strumLineNotes', 4, 'alpha', 1);
        setPropertyFromGroup('strumLineNotes', 5, 'alpha', 1);
        setPropertyFromGroup('strumLineNotes', 6, 'alpha', 1);
        setPropertyFromGroup('strumLineNotes', 7, 'alpha', 1);

        darknotevisibility = false;
    end
    
    -- lyric shit, once again i am yanderedev
    -- plz add arrays
    -- if you didnt already know, these are the actual lyrics to the song sunshine is referencing
    -- yes i know its not in the original mod, this is my port i can add the details i want and i think this is fucking cool
    -- cry about it

    if curStep == 592 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'can');
    end

    if curStep == 596 then
        setProperty('timeTxt.text', 'can you');
    end

    if curStep == 600 then
        setProperty('timeTxt.text', 'can you feel');
    end

    if curStep == 604 then
        setProperty('timeTxt.text', 'can you feel the');
    end

    if curStep == 606 then
        setProperty('timeTxt.text', 'can you feel the sun');
    end

    if curStep == 610 then
        setProperty('timeTxt.text', 'can you feel the sunshine');
    end

    if curStep == 616 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 618 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'does');
    end

    if curStep == 620 then
        setProperty('timeTxt.text', 'does it');
    end

    if curStep == 624 then
        setProperty('timeTxt.text', 'does it brigh');
    end

    if curStep == 628 then
        setProperty('timeTxt.text', 'does it brighten');
    end

    if curStep == 632 then
        setProperty('timeTxt.text', 'does it brighten up');
    end

    if curStep == 636 then
        setProperty('timeTxt.text', 'does it brighten up your');
    end

    if curStep == 638 then
        setProperty('timeTxt.text', 'does it brighten up your day');
    end

    if curStep == 650 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 656 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'dont');
    end

    if curStep == 660 then
        setProperty('timeTxt.text', 'dont you');
    end

    if curStep == 664 then
        setProperty('timeTxt.text', 'dont you feel');
    end

    if curStep == 668 then
        setProperty('timeTxt.text', 'dont you feel like');
    end

    if curStep == 670 then
        setProperty('timeTxt.text', 'dont you feel like some');
    end

    if curStep == 674 then
        setProperty('timeTxt.text', 'dont you feel like sometimes');
    end

    if curStep == 680 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 682 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'you');
    end

    if curStep == 684 then
        setProperty('timeTxt.text', 'you just');
    end

    if curStep == 688 then
        setProperty('timeTxt.text', 'you just need');
    end

    if curStep == 692 then
        setProperty('timeTxt.text', 'you just need to');
    end

    if curStep == 696 then
        setProperty('timeTxt.text', 'you just need to run');
    end

    if curStep == 700 then
        setProperty('timeTxt.text', 'you just need to run a');
    end

    if curStep == 704 then
        setProperty('timeTxt.text', 'you just need to run away');
    end

    if curStep == 712 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 720 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'reach');
    end

    if curStep == 724 then
        setProperty('timeTxt.text', 'reach out');
    end

    if curStep == 728 then
        setProperty('timeTxt.text', 'reach out for');
    end

    if curStep == 732 then
        setProperty('timeTxt.text', 'reach out for the');
    end

    if curStep == 734 then
        setProperty('timeTxt.text', 'reach out for the sun');
    end

    if curStep == 738 then
        setProperty('timeTxt.text', 'reach out for the sunshine');
    end

    if curStep == 746 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 748 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'for');
    end

    if curStep == 752 then
        setProperty('timeTxt.text', 'forget');
    end

    if curStep == 756 then
        setProperty('timeTxt.text', 'forget a');
    end

    if curStep == 760 then
        setProperty('timeTxt.text', 'forget about');
    end

    if curStep == 764 then
        setProperty('timeTxt.text', 'forget about the');
    end

    if curStep == 766 then
        setProperty('timeTxt.text', 'forget about the rain');
    end

    if curStep == 778 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 784 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'just');
    end

    if curStep == 788 then
        setProperty('timeTxt.text', 'just think');
    end

    if curStep == 790 then
        setProperty('timeTxt.text', 'just think a');
    end

    if curStep == 792 then
        setProperty('timeTxt.text', 'just think about');
    end

    if curStep == 796 then
        setProperty('timeTxt.text', 'just think about the');
    end

    if curStep == 798 then
        setProperty('timeTxt.text', 'just think about the good');
    end

    if curStep == 802 then
        setProperty('timeTxt.text', 'just think about the good times');
    end

    if curStep == 808 then
        setProperty('timeTxt.visible', false);
    end

    if curStep == 810 then
        setProperty('timeTxt.visible', true);
        setProperty('timeTxt.text', 'and');
    end

    if curStep == 812 then
        setProperty('timeTxt.text', 'and they');
    end

    if curStep == 816 then
        setProperty('timeTxt.text', 'and they will');
    end

    if curStep == 820 then
        setProperty('timeTxt.text', 'and they will come');
    end

    if curStep == 824 then
        setProperty('timeTxt.text', 'and they will come back');
    end

    if curStep == 828 then
        setProperty('timeTxt.text', 'and they will come back a');
    end

    if curStep == 832 then
        setProperty('timeTxt.text', 'and they will come back again');
    end

    if curStep == 840 then
        setProperty('timeTxt.visible', false);
    end
end