function onEvent(name, value1, value2)

    if name == "dadspin" then
		if getProperty('dad.curCharacter') ~= 'fleetway' then
		doTweenAngle('dadspin', 'dad', getProperty('dad.angle') + (360 * value1), value2, 'linear')
		end
	end
end