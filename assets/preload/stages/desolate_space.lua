local xx = 560;
local yy = 475;
local xx2 = 900;
local yy2 = 520;
local ofs = 25;
local ofs2 = 25;
local yourmom = 0;
local followchars = true;
local del = 0;
local del2 = 0;
local rings = 0

function onCreate()
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true

	setProperty('cameraSpeed', 2.0)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');

	makeAnimatedLuaSprite('p3_Glitch', 'p3_Glitch', -1000, -500);
	addAnimationByPrefix('p3_Glitch','batic','Glitch static',24,true)
	makeAnimatedLuaSprite('p3_Stats', 'P3_SonicStat', -400, 0);
	addAnimationByPrefix('p3_Stats','busk','TitleMenuSSBG instance 1',24,true)
	makeAnimatedLuaSprite('batic1', 'P3_Stat', 0, 0);
	addAnimationByPrefix('batic1', 'lanlubber', 'Phase3Static instance 1', 36, false);
	makeLuaSprite('p3_floor', 'p3_Grass', -700, -200)
	makeLuaSprite('p3_trs', 'p3_Trees2', -700, 0)
	makeLuaSprite('p3_tree', 'p3_Trees', -700, 0)
	makeLuaSprite('nono', 'makeGraphicsucks', 0, 0);
	makeLuaSprite('introcircle1', 'CircleTripleTrouble', 900, 0);
	makeLuaSprite('introtext1', 'TextTripleTrouble', -1000, 0);
	makeLuaSprite('Ring_Counter', 'Counter',5,590)
	scaleObject('nono', 6.0, 6.0);
	scaleObject('p3_Glitch', 2.0, 2.0);
	scaleObject('p3_Stats', 5.0, 5.0);
	scaleObject('batic1', 5.0, 5.0);
	setObjectCamera('nono', 'other');
	setObjectCamera('introcircle1', 'other');
	setObjectCamera('introtext1', 'other');
	setObjectCamera('batic1', 'other');
    setObjectCamera('Ring_Counter', 'other')
	setScrollFactor('p3_Glitch', 0.9, 0.9);
	setScrollFactor('p3_tree', 1.05, 1.0);
	setScrollFactor('p3_trs', 1.025, 1.0);
	setScrollFactor('batic1', 0, 0);

	setScrollFactor('ring', 0, 0);
    makeLuaText('rings', 'Rings: '..rings, 1000, 80, 570)
    setObjectCamera('rings', 'other')
	addLuaText('rings')
    setTextFont('rings', 'EurostileTBla.ttf')
    setTextSize('rings', 72.0)
    setTextBorder('rings', 4, 'CC6600')
    setTextColor('rings', 'FFCC33')
    setTextAlignment('rings', 'left')

	addLuaSprite('p3_Glitch', false)
	addLuaSprite('p3_Stats', false)
	addLuaSprite('p3_trs', false)
	addLuaSprite('p3_tree', false)
	addLuaSprite('p3_floor', false)
	addLuaSprite('Ring_Counter',true)
	addLuaSprite('batic1',true)
	addLuaSprite('nono', true);
	addLuaSprite('introcircle1', true);
	addLuaSprite('introtext1', true);

	setProperty('batic1.visible', false)
	setProperty('p3_Stats.visible', false)
	setTextString('rings', ''..rings)
end

function onSongStart()
	setProperty('batic1.alpha', 0.65);
	doTweenX('circle1Tween', 'introcircle1', -100, 1.5, 'quintOut')
	doTweenX('text1Tween', 'introtext1', 100, 1.5, 'quintOut')
	runTimer('weeb1',1.5)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'weeb1' then
		doTweenAlpha('graphicAlpha', 'nono', 0, 0.4, 'linear');
		doTweenAlpha('circleAlpha', 'introcircle1', 0, 0.4, 'linear');
		doTweenAlpha('textAlpha', 'introtext1', 0, 0.4, 'linear');
		removeLuaSprite('introtext1',false)
		removeLuaSprite('introcircle1',false)
	end
	if tag == 'statfin' then
		setProperty('batic1.visible', false)
	end
end

function noteMiss(id, noteData, noteType)
	if not sussy then -- I do not know what this sussy variable does
        if data == 2 then
            setProperty('songMisses', getProperty('songMisses') - 1)
			setTextString('rings', ''..rings)
        else
            if rings > 0 then
                rings = rings - 1
                setProperty('songMisses', getProperty('songMisses') - 1)
			setTextString('rings', ''..rings)
            else
				setProperty('health', getProperty('health') - 100);
            end
        end
    end
end

function goodNoteHit(id, data, type, sussy)
    if not sussy and data == 2 then
        rings = rings + 1
        playSound('Kaching',1)
		setTextString('rings', ''..rings)
    end
end

function onStepHit()
	if curStep == 1029 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1040 then
		setProperty('p3_Stats.visible', true)
	end
	if curStep == 1094 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1221 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1285 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 1296 then
		setProperty('p3_Stats.visible', false)
	end
	if curStep == 2308 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 2320 then
		setProperty('p3_Stats.visible', true)
	end
	if curStep == 2820 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 2824 then
		setProperty('p3_Stats.visible', false)
	end
	if curStep == 3204 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 3460 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 4100 then
		setProperty('batic1.visible', true)
		runTimer('statfin',1.15)
		objectPlayAnimation('batic1', 'lanlubber', false);
	end
	if curStep == 4112 then
		setProperty('p3_Stats.visible', true)
	end

	if followchars == true then
		
        if mustHitSection == false then
           
			setProperty('defaultCamZoom', 0.9)
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
			
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end

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

            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			
        else
           
			setProperty('defaultCamZoom', 1.2)
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
           
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end

            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	end
	setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
end

function onEvent(name, value1, value2)
    if name == 'Invert Strum Position' then
        xx = 900
		xx2 = 560
    end
    if name == 'Reset Strum Position' then
        xx = 560
		xx2 = 900
    end
end