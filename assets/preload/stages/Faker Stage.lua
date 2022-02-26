function onCreate()

     makeLuaSprite('theSky','sky',-100,-200)
	 addLuaSprite('theSky',false) 
     setLuaSpriteScrollFactor('theSky', 0.2, 0.2);
    
     makeLuaSprite('theCity','mountains',-100,-400)
	 addLuaSprite('theCity',false) 
     setLuaSpriteScrollFactor('theCity', 0.3, 0.6);

	 makeLuaSprite('theGround','grass',-150,-400)
	 addLuaSprite('theGround',false) 
     setLuaSpriteScrollFactor('theGround', 1.0, 1.0);

	 makeLuaSprite('theHalfPipe','trees',-600,-400)
	 addLuaSprite('theHalfPipe',false) 
     setLuaSpriteScrollFactor('theHalfPipe', 1.0, 1.0);

	 makeLuaSprite('thePillars','pillars',-600,-400)
	 addLuaSprite('thePillars',false) 
     setLuaSpriteScrollFactor('thePillars', 1.0, 1.0);

	 makeLuaSprite('thePipe','plants',-500,-400)
	 addLuaSprite('thePipe',false) 
     setLuaSpriteScrollFactor('thePipe', 1.0, 1.0);
end

function onBeatHit( ... )--for every beat
    -- body
end

function onStepHit( ... )-- for every step
    -- body
end

function onUpdate( ... )
	-- body
end