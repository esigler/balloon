--[[
@title Balloon v3 camera
@param a Shooting interval, min
@default a 1
@param b ...sec
@default b 0
--]]

Interval = a*60000 + b*1000

function TakePicture()
	press("shoot_half")
    repeat sleep(50) until get_shooting() == true
	press("shoot_full")
	release("shoot_full")
	repeat sleep(50) until get_shooting() == false
    release "shoot_half"
end

-- Turn off flash
set_prop(143, 2)

-- Turn focus to infinity
set_prop(6, 3)

-- Main loop
repeat
	StartTick = get_tick_count()
	TakePicture()
	sleep(Interval - (get_tick_count() - StartTick))
until false
