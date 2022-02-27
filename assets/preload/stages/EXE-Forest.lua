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
local yy = 375;
local xx2 = 850;
local yy2 = 520;
local ofs = 25;
local ofs2 = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local shaking = true;
local pixel = 0;

function onCreate()
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled')
	setProperty('cameraSpeed', 1.8)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');

	makeLuaSprite('YCR_sky', 'p2_sky', -1000, -500);
	makeLuaSprite('YCR_floor', 'p2_ground', -500, 0)
	makeLuaSprite('YCR_trees', 'p2_trees', -500, 0)
	makeLuaSprite('YCR_backtrees', 'p2_backtrees', -500, 0)
	makeLuaSprite('YCR_greenhill', 'GreenHill', -300,-500)
	makeLuaSprite('nono', 'makeGraphicsucks', 0, 0);
	makeLuaSprite('introcircle1', 'CircleYouCantRun', 900, 0);
	makeLuaSprite('introtext1', 'TextYouCantRun', -900, 0);
	makeLuaSprite('sussyred','RedVG',0,0)
	scaleObject('nono', 6.0, 6.0);
	scaleObject('YCR_greenhill', 2.5, 2.5);
	scaleObject('YCR_sky', 2.0, 2.0);
	setObjectCamera('nono', 'other');
	setObjectCamera('introcircle1', 'other');
	setObjectCamera('introtext1', 'other');
	setScrollFactor('YCR_sky', 0.9, 0.9);
	setProperty('YCR_greenhill.visible', false)
	setObjectCamera('sussyred', 'other');
	setScrollFactor('sussyred', 0, 0)
	setProperty('sussyred.alpha', 0);
	setScrollFactor('YCR_backtrees', 1.05, 1.0);
	setScrollFactor('YCR_trees', 1.025, 1.0);

	addLuaSprite('YCR_sky', false)
	addLuaSprite('YCR_floor', false)
	addLuaSprite('YCR_backtrees', false)
	addLuaSprite('YCR_trees', false)
	addLuaSprite('YCR_greenhill', false)
	addLuaSprite('sussyred',true)
	addLuaSprite('nono', true);
	addLuaSprite('introcircle1', true);
	addLuaSprite('introtext1', true);

end

function onSongStart()
	doTweenX('circle1Tween', 'introcircle1', -100, 1.8, 'quintOut')
	doTweenX('text1Tween', 'introtext1', 100, 1.8, 'quintOut')
	runTimer('weeb',2)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'weeb' then
		doTweenAlpha('graphicAlpha', 'nono', 0, 0.4, 'linear');
		doTweenAlpha('circleAlpha', 'introcircle1', 0, 0.4, 'linear');
		doTweenAlpha('textAlpha', 'introtext1', 0, 0.4, 'linear');
	end

	if tag == 'vrug' then
		runTimer('vrug2', 1.2)
		doTweenAlpha('sussyredAlpha', 'sussyred', 0, 1.0, 'quintIn')
	end

	if tag == 'vrug2' then
		runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 1.0, 'quintOut')
	end
end

function onBeatHit()

	if getProperty('curBeat') == 19 then
		runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 0.95, 'quintOut')
	end

	if getProperty('curBeat') == 132 then
		setProperty('YCR_greenhill.visible', true)
		setProperty('sussyred.visible', false)
		pixel = 1
		setPropertyFromGroup('playerStrums', 0, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'PIXEL_NOTE_assets');
		yy = 520
		xx2 = 700
		shaking = false
	end
end

function onStepHit()

	if getProperty('curStep') == 783 then
		setProperty('YCR_greenhill.visible', false)
		setProperty('sussyred.visible', true)
		setPropertyFromGroup('playerStrums', 0, 'texture', 'NOTE_assets');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'NOTE_assets');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'NOTE_assets');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'NOTE_assets');
		yy = 375
		xx2 = 850
		shaking = true
		pixel = 0
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if shaking == true then
		triggerEvent('Screen Shake', '0.02, 0.01', '0, 0');
	end
end

function onUpdate()
	--trollll

	if followchars == true then
		
        if mustHitSection == false then
           
		    if pixel == 1 then
					setProperty('defaultCamZoom', 1.0)
				else
					setProperty('defaultCamZoom', 0.9)
			end
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
           
		    if pixel == 1 then
					setProperty('defaultCamZoom', 1.0)
				else
					setProperty('defaultCamZoom', 1.2)
			end
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
function onEndSong()

	return Function_Continue;
	
end

function onGameOver()
	setProperty('camHUD.alpha', 0);
	setProperty('nono.alpha', 1.0);
	
	user32.MessageBoxA(nil, "  got you.", " ", ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
	
	if ffi.C.MB_OK then
	   os.exit()
	end
	
	return Function_Stop;
end