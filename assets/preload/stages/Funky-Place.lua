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
local xx2 = 950;
local yy2 = 520;
local ofs = 25;
local ofs2 = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local CZ = 0

function onCreate()
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true
	
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled')
	setProperty('cameraSpeed', 1.8)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');
	setPropertyFromClass('PlayState', 'introSoundsSuffix', '-bruh');

	makeLuaSprite('readthefiletitlelol', 'makeGraphicsucks', 0, 0);
	makeLuaSprite('introcircle', 'CircleCycles', 900, 0);
	makeLuaSprite('introtext', 'TextCycles', -900, 0);
	
	makeLuaSprite('seemslikefarmland', 'Cycles/floor', -400, -250);
	makeLuaSprite('sharpcrap', 'Cycles/hills1', -400, -250);
	makeLuaSprite('ppsky', 'Cycles/sky', -400, -200);
	makeLuaSprite('yummy', 'Cycles/tree', -500, -200);
	makeLuaSprite('thing1', 'Cycles/smallflower', -900, -100);
	
	makeAnimatedLuaSprite('defnotknux', 'Cycles/NotKnuckles_Assets', 300, -50);
	addAnimationByPrefix('defnotknux', 'hans', 'Notknuckles', 24, true);
	makeAnimatedLuaSprite('BruhFlower', 'Cycles/WeirdAssFlower_Assets', -200, 50);
	addAnimationByPrefix('BruhFlower', 'staring', 'flower', 24, true);

	scaleObject('readthefiletitlelol', 6.0, 6.0);
	scaleObject('defnotknux', 0.5, 0.5);
	scaleObject('BruhFlower', 0.8, 0.8);
	scaleObject('ppsky', 0.4, 0.4);
	scaleObject('seemslikefarmland', 0.6, 0.6);
	scaleObject('sharpcrap', 0.6, 0.6);
	scaleObject('yummy', 0.6, 0.6);
	scaleObject('thing1', 0.6, 0.6);

	setScrollFactor('ppsky', 0.9, 0.9);
	setScrollFactor('sharpcrap', 0.8, 0.8);

	setObjectCamera('readthefiletitlelol', 'other');
	setObjectCamera('introcircle', 'other');
	setObjectCamera('introtext', 'other');

	addLuaSprite('ppsky', false)
	addLuaSprite('sharpcrap', false)
	addLuaSprite('seemslikefarmland', false)
	addLuaSprite('yummy', false)
	addLuaSprite('BruhFlower', false)
	addLuaSprite('thing1', false)
	addLuaSprite('defnotknux', false)
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

function onBeatHit()
	if getProperty('curBeat') == 80 then
		CZ = 0.15
	end
	if getProperty('curBeat') == 276 then
		CZ = 0
	end
end
function onUpdate()

	if followchars == true then
		
        if mustHitSection == false then
           
			setProperty('defaultCamZoom', 0.8 + CZ)
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
           
			setProperty('defaultCamZoom', 1.0 + CZ)
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

function onGameOver()
	setProperty('camHUD.alpha', 0);
	
	user32.MessageBoxA(nil, "  got you.", " ", ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
	
	if ffi.C.MB_OK then
	   os.exit()
	end
	
	return Function_Stop;
end