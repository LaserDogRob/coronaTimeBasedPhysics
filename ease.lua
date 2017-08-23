local ease = {}

function ease:create(initalNumber)

	local deltatime = require "plugin.deltatime";

	-- CREATE NUMBER
	local number = {

		-- TRACKS THE ACTUAL POSITION ON OBJECTS
		actual = initalNumber,

		-- VAR TO BE SMOOTHED
		eased = initalNumber,
	}

	function number:ease(amount)

		-- GET DELTA TIME
		-- As we're tracking a physics object, I believe this should
		-- be the physics engine's delta time, not from "enterFrame"
		local dt = (deltatime.multiplier() or 1);

		-- WORK OUT HOW MUCH TO ADD TO THE SMOOTHED VAR
		local easeAmount = ((number.actual - number.eased)*amount)*dt;

		-- SMOOTH
		number.eased = number.eased + (easeAmount);
	end

	return number;
end

return ease;