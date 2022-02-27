local ffi = require("ffi")  -- LuaJIT Extension
local user32 = ffi.load("user32")   -- LuaJIT User32 DLL Handler Function

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
	MB_OKCANCEL = 0x00000001L,
    MB_ABORTRETRYIGNORE = 0x00000002L,
    MB_YESNOCANCEL = 0x00000003L,
    MB_YESNO = 0x00000004L,
    MB_RETRYCANCEL = 0x00000005L,
    MB_CANCELTRYCONTINUE = 0x00000006L,
    MB_ICONINFORMATION = 0x00000040L,
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
int MessageBoxW(HWND, LPCSTR, LPCSTR, UINT);
]])

local xx = 460;
local yy = 460;
local xx2 = 900;
local yy2 = 520;
local ofs = 25;
local ofs2 = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local gurg = 0

function onCreate()
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true
	
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled')
	setProperty('cameraSpeed', 1.5)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');
	setPropertyFromClass('PlayState', 'introSoundsSuffix', '-bruh');

	makeLuaSprite('hills_exe','EXE_HILLS',-300,0)
	makeLuaSprite('sky_exe','EXE_SKY',-300,0)
	makeLuaSprite('floor2_exe','EXE_FLOOR2',-300,-100)
	makeLuaSprite('floor1_exe','EXE_FLOOR1',-300,-100)
	makeLuaSprite('knuckle','exe_KNUCKLE',200,-200)
	makeLuaSprite('egghead','EXE_EGGMAN',-215,-150)
	makeLuaSprite('tail','EXE_TAIL',-400,-150)
	makeLuaSprite('floor3_exe','exe_frontgrass',-300,-100)
	makeLuaSprite('readthefiletitlelol', 'makeGraphicsucks', 0, 0);
	makeLuaSprite('introcircle', 'CircleTooSlow', 900, 0);
	makeLuaSprite('introtext', 'TextTooSlow', -900, 0);
	makeAnimatedLuaSprite('tailspike_exe','Exe_TailsSpikeAnimated',-100,-100)
	addAnimationByPrefix('tailspike_exe','Tails_pike','Tails Spike Animated instance 1',12,true)
	scaleObject('tailspike_exe',1.2,1.2)
	scaleObject('readthefiletitlelol', 6.0, 6.0);
	setObjectCamera('readthefiletitlelol', 'other');
	setObjectCamera('introcircle', 'other');
	setObjectCamera('introtext', 'other');
	setScrollFactor('sky_exe', 0.75, 1.0);
	setScrollFactor('hills_exe', 0.9, 1.0);

	addLuaSprite('hills_exe',false)
	addLuaSprite('sky_exe',false)
	addLuaSprite('floor2_exe',false)
	addLuaSprite('floor1_exe',false)
	addLuaSprite('tailspike_exe',false)
	addLuaSprite('knuckle',false)
	addLuaSprite('egghead',false)
	addLuaSprite('tail',false)
	addLuaSprite('floor3_exe',false)
	addLuaSprite('readthefiletitlelol', true);
	addLuaSprite('introcircle', true);
	addLuaSprite('introtext', true);
	

end

function onSongStart()
	doTweenX('circleTween', 'introcircle', -100, 2, 'quintOut')
	doTweenX('textTween', 'introtext', 100, 2, 'quintOut')
	runTimer('weeb2',2)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'weeb2' then
		doTweenAlpha('graphicAlpha', 'readthefiletitlelol', 0, 0.4, 'linear');
		doTweenAlpha('circleAlpha', 'introcircle', 0, 0.4, 'linear');
		doTweenAlpha('textAlpha', 'introtext', 0, 0.4, 'linear');
		runTimer('savespace',2)
	end
	if tag == 'savespace' then
		removeLuaSprite('introtext', true)
		removeLuaSprite('introcircle', true)
		removeLuaSprite('readthefiletitlelol', true)
	end
end

function onUpdate()
	gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/84))

    if curStep >= 789 and curStep < 922 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 + 5 * math.sin((gurg + i*0.25) * math.pi), i)
		end
	end
	
    if curStep >= 923 and curStep < 1048 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 - 5 * math.sin((gurg + i*0.25) * math.pi), i)
		end
    end
	
    if curStep >= 1049 and curStep < 1176 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1)
			setPropertyFromGroup('playerStrums', i, 'x', defaultPlayerStrumX0 + i * defaultPlayerStrumX0/7 + 2 * math.sin((gurg + i*0.25) * math.pi), i)
			setPropertyFromGroup('opponentStrums', i, 'x', defaultOpponentStrumX0 + i * defaultOpponentStrumX0*1.15 + 2 * math.sin((gurg + i*0.25) * math.pi), i)
		end
	end

    if curStep >= 1177 and curStep < 1959 then
 		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('playerStrums', i, 'x', defaultPlayerStrumX0 + i * defaultPlayerStrumX0/7 - 6 * math.sin((gurg + i*0.25) * math.pi), i)
			setPropertyFromGroup('opponentStrums', i, 'x', defaultOpponentStrumX0 + i * defaultOpponentStrumX0*1.15 - 6 * math.sin((gurg + i*0.25) * math.pi), i)
		end
    end

	if getProperty('curBeat') < 327 or getProperty('curBeat') > 357 then
	if followchars == true then
		
        if mustHitSection == false then
           
			setProperty('defaultCamZoom', 1.0)
            if getProperty('dad.animation.curAnim.name') == 'Immagetya' then
                triggerEvent('Camera Follow Pos',xx,yy)
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

			if getProperty('dad.animation.curAnim.name') == 'laugh' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end

            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			
			
        else
           
			setProperty('defaultCamZoom', 1.2)
            if getProperty('boyfriend.animation.curAnim.name') == 'Immagetya' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end

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
	end
    
end

function onGameOver()
	setProperty('camHUD.alpha', 0);
	
	user32.MessageBoxA(nil, "  got you.", " ", ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
	
	if ffi.C.MB_OK then
	   os.exit()
	end
	
	return Function_Stop;
end