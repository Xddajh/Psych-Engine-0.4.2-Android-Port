function onCreate()
	-- background shit
	makeLuaSprite('Wall', 'fleet/Wall', -900, -600);
	setScrollFactor('Wall', 0.9, 0.9);
	
	makeLuaSprite('Floor', 'Fleet/Floor', -650, 600);
	setScrollFactor('Floor', 0.9, 0.9);
	scaleObject('Floor', 0.9, 0.9);


	makeLuaSprite('FleetwayBGshit', 'fleet/FleetwayBGshit', -3400, -1650);
	setScrollFactor('FleetwayBGshit', 0.9, 0.9);
	scaleObject('FleetwayBGshit', 1, 1);
	
	makeAnimatedLuaSprite('Emerald Beam Charged', 'fleet/Emerald Beam Charged', -870,-1200);
	addAnimationByPrefix('Emerald Beam Charged', 'start', 'Emerald Beam Charged instance', 3, true);
	setScrollFactor('Emerald Beam Charged', 0.9, 0.9);
	scaleObject('Emerald Beam Charged', 0.7, 0.7);
	
	makeAnimatedLuaSprite('Emeralds', 'fleet/Emeralds', -400,-300);
	addAnimationByPrefix('Emeralds', 'start', 'TheEmeralds instance', 30, true);
	setScrollFactor('Emeralds', 0.9, 0.9);
	scaleObject('Emeralds', 0.7, 0.7);
	
	
	
	makeLuaSprite('The Chamber', 'Fleet/The Chamber', -950, 550);
	setScrollFactor('The Chamber', 0.9, 0.9);
	scaleObject('The Chamber', 0.7, 0.7);
	
	makeLuaSprite('pebles', 'Fleet/pebles', -550, 800);
	setScrollFactor('pebles', 0.9, 0.9);
	scaleObject('pebles', 0.7, 0.7);
	


	addLuaSprite('Wall', false);
	addLuaSprite('Floor', false);
	addLuaSprite('FleetwayBGshit', false);
	addLuaSprite('Emerald Beam Charged', false);
	addLuaSprite('Emeralds', false);
	addLuaSprite('The Chamber', false);
	addLuaSprite('pebles', false);


	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end