function onCreate()

     makeLuaSprite('theSky','sky',-200,-200)
	 addLuaSprite('theSky',false) 
     setLuaSpriteScrollFactor('theSky', 0.2, 0.2);

     makeLuaSprite('theMountains','ground',-200,-400)
	 addLuaSprite('theMountains',false) 
     setLuaSpriteScrollFactor('theMountains', 0.3, 0.6);

	 makeAnimatedLuaSprite('theGround','ExeAnimatedBG_Assets',-600,-400)
	 addAnimationByPrefix('theGround','fire','ExeBGAnim',19,true)
	 addLuaSprite('theGround',false)
	 objectPlayAnimation('theGround','ExeBGAnim',true)

	 makeLuaSprite('theCorpse','TailsCorpse',450,430)
	 addLuaSprite('theCorpse',false) 
     setLuaSpriteScrollFactor('theCorpse', 1.0, 1.0);
	 
end

function onBeatHit( ... )--for every beat
    --body
end

function onStepHit( ... )-- for every step
    -- body
end

function onUpdate( ... )
	-- body
end