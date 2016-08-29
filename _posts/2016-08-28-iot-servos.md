---
layout: post
title: "IoT Servo projects"
excerpt: "Just do it!"
tags: [Clouds, IoT]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

Here is a description of how I made it happen, so you can, too.

{% include _intro.html %}

<hr />

## Drop stuff from the ceiling #

There are several reasons why someone would want to drop stuff from the ceiling.
Balloons at a celebration.
Red liquid at a "Carrie" movie remake.
Or hay for animals in a barn.

I have a barn for two donkeys.
My wife gets up before dawn each morning to feed them,
or they will make annoying noises.

We can't leave a lot of food laying around 
because they eat everything in sight.

So I would like to have a box above the animals.

(BTW, she's against all this automation because she says she has to get to for other
chores for the chickens and ducks, etc. :)
Anyway, I'm undeterred by practicality.


## How the thing works #

   0. The shelf is raised and lowered by four ropes,
   one on each corner. 

   0. During the dumping (feed) operation, 
   only one side is fully lowered so whatever is on it slides off.

   0. We may need a <a href="#Release">release</a> if a vertical door is needed
   to hold enough stuff without spilling over.

   0. We use two sets of <a href="#Pulleys">pulleys</a>, one for each side.
   Pulleys enable a smaller motor to be used.

   0. There would be <strong>safety cables</strong> 
   to keep the shelf from crashing to the floor.

   0. Like a garage door, <strong>lasers</strong> sense whether there is something in the
   way before the platform is lowered.

   0. <a href="#StepperMotors">Two stepper motor</a> controls each of 2 sides of the platform.
   Both would operate to raise or lower. Only one would operate to dump contents.
   
   0. For safety, a bell sounds before the food is dumped.

   0. <a href="#Sensors">Sensors</a> identify if conditions are safe - 
   the position of the various parts (motor) 
   and whether each is still working.

   0. There would be <a href="#Logic">logic</a> on the Ardunio board that 
   to not do something if sensors indicate.

   0. In "productive mode", when it's time (5 minutes before dawn each day),
   the shelf is emptied automatically.

   0. There should be a <strong>manual alternative</strong>
   to lower the shelf and open the door. That's in case of loss of electricity
   or when the computer part doesn't work.

   0. In "test mode", we would press a button to raise it; another button to lower it;
   and a third button to dump the food.
   This could be a multi-purpose button where one tap raises,
   two taps lowers it, and a long press to dump from above.

## Parts #

  <a name="Platform"></a>

For the platform, we would need enough space to hold enough 
for a single meal for two donkeys. Maybe 3. the calculation:

   - [__] Buy a sheet of 3/4 inch plywood,
   Cut it in half for the shelf.
   
   - [__] Use the other half of the plywood for the 3 sides plus the door.

   - [__] Attach the walls to the base using <strong>L brackets</strong> on 3 sides.

   - [__] Drill a hole on each of 4 corners.

   - [__] Put in 2 inch bolts with eye rings on the top of the sides.

  <a name="Release"></a>

   - [__] Hinges for the door.

   - [__] Install the door release with a cable to the Arduino.

  <a name="Pulleys"></a>

   A hoist for a bicycle of about 100 lbs. is
   <a target="_blank" href="https://www.amazon.com/dp/B003VOX1XU?psc=1">
   $20 from Amazon</a>. Two sets should support 200 lbs, right?
   But that may not be enough for the platform.

   - [__] 4 sets of pulleys for the 1/2 inch diameter size rope.
   <a target="_blank" href="https://www.amazon.com/Generic-Pulley-Block-Tackle-Hoist/dp/B001Z0WELC">$21 each from Amazon</a>.

   The four wheels provides 7:1 lifting ratio power for 2 tons of working load capacity.

   - [__] <strong>Bolts</strong> on the ceiling to hold the pulleys
   should be braced to support that.

   Additional bracing may be needed for your ceiling.

   Check with a construction specialist.

   - [__] 4 ropes to lower the platform almost to the ground.
   Although the height is about 10 feet each,
   about 4 times that is needed to go through the pulleys.
   So we get a standard size rope of 100 feet (30.48 meters).

   The 1/2 inch climber ropes are about $30 used, $40 new 
   <a target="_blank" href="http://www.ebay.com/bhp/rock-climbing-rope">
   on Ebay</a>

   - Measure the weight of the platform with ropes 
   at maximum load. The estimate is 100 pounds max.

   <a name="StepperMotors"></a>

   How to move the rope electronically?

   - [__] TODO: Stepper motors sized to handle the weight.

   

   <a name="Sensors"></a>

   -[__] Sensors to detect slippage.

   -[__] Notification

   -[__] Arduino board to signal the stepper motor.

   -[__] Power supply.


## Breadboard #

The construction of this should be viewed as supplemental to manual operation.

Research:

   https://www.youtube.com/watch?v=RakXequOrSY

   and

   https://www.youtube.com/watch?v=WKdyBZvlFXk

0. Blue wire DC-   



