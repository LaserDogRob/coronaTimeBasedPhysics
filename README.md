# Time Based Physics Camera Repro

In this project I have a very simple "camera" that smoothly tracks a bouncing ball.

If you set the physics engine to **time based** rather than **frame based**, you will see the camera stutter and appear to lag.

I am using "delta time" to ensure that the smoothing effect is actually smooth, but I believe that time based physics works on a different frame time.

On line 22 of "ease.lua", this is where I set the deltatime variable.

