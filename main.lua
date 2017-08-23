----------------------------------------------------------------
-- INCLUDES
----------------------------------------------------------------

local physics = require("physics");
local deltatime = require "plugin.deltatime"
local ease = require("ease");

----------------------------------------------------------------
-- SETTINGS
----------------------------------------------------------------

local _W = display.contentWidth - display.screenOriginX*2
local _H = display.contentHeight - display.screenOriginY*2
local _C = { x = display.contentWidth/2, y = display.contentHeight/2 }

----------------------------------------------------------------
-- INIT
----------------------------------------------------------------

deltatime.start()
physics.start();
physics.setGravity(0,15);

----------------------------------------------------------------
-- SET TO TIME BASED PHYSICS
----------------------------------------------------------------

physics.setTimeStep(0);

----------------------------------------------------------------
-- CAMERA GROUP
----------------------------------------------------------------

local camera = display.newGroup();

----------------------------------------------------------------
-- CAMERA EASED VALUES
----------------------------------------------------------------

local cameraPos = {
	x = ease:create(0),
	y = ease:create(0),
}

----------------------------------------------------------------
-- FLOOR
----------------------------------------------------------------

local floor = display.newRect(camera,_C.x,_H,_W*2,20);
physics.addBody(floor,"static",{bounce=.5});

----------------------------------------------------------------
-- BALL
----------------------------------------------------------------

local ball = display.newCircle(camera,_C.x,_C.y,10);
physics.addBody(ball,"dynamic",{bounce=.5});

----------------------------------------------------------------
-- CAMERA MANAGER
----------------------------------------------------------------

local manager = function()

	-- SET THE ACTUAL POSITION
	cameraPos.x.actual = (-ball.x)+_C.x;
	cameraPos.y.actual = (-ball.y)+_C.y;

	-- SMOOTH THE VALUES
	local smoothAmount = .1;
	cameraPos.x:ease(smoothAmount);
	cameraPos.y:ease(smoothAmount);

	-- SET CAMERA POS
	camera.x,camera.y = cameraPos.x.eased,cameraPos.y.eased;

	-- CENTER THE FLOOR UNDER THE BALL
	floor.x = ball.x;

end
Runtime:addEventListener("enterFrame",manager);

----------------------------------------------------------------
-- TIMER TO MOVE THE BALL
----------------------------------------------------------------

timer.performWithDelay( 2000, function() 
	ball:setLinearVelocity( 350,-350);
end,-1);















