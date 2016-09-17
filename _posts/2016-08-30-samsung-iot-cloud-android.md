---
layout: post
title: "My IoT Cloud Android Mash-up"
excerpt: "The annoying IoT mash-up I really need in my life"
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

This is a design of ways to allieviate annoyances living with mobile phones.

{% include _intro.html %}

<hr />

## My mash-up #

This design is so I don't go to sleep while 
battery-dependent devices are left to drain overnight.

0. An <a href="#AndroidApp">Android app</a> (running in the background) 
   continuously monitors battery condition, 
   and whether the battery is plugged in for charging.

   These conditions are sent to the Cloud
   on a schedule set in the app's Preferences.

   Optionally, the GPS location of the device is also sent, if available.

0. A long-running program occassionally polls the Cloud for information from devices.

   This is necessary because currently the ARTIK Cloud
   doesn't push information,
   it only receives and stores information.

0. A long-running <a href="#Rules">complex set of rules (below)</a> 
   running on an app server determines when actions need to be triggered.

   For example, determine battery life is steadily declining.
   Recognize the usual pattern.

0. The color and pattern of lighting is set by the app server.

0. When appropriate, a signal is sent to 
   a <strong>light bult</strong> 
   to light up in the bedroom.

   For example, projection that battery life is not going to last throug the night.

0. Press a Flic button to control the alerts:

   * One press to remind me again in 10 minutes (a kind of snooze button)
   * Two presses to call the phone (so I can find it)
   * Long hold to ignore (let the battery drain)

0. If a response is not received within a set time,
   an annoying <strong>alarm</strong> sounds in the home.

   Thus, the Flic button controls both the light and the alarm.

> If you want this for yourself, 
let me know and I'll come to set it up in your house.


### Use Case Extensions #

This is a actually an over-engineered geeky solution that I don't really
need because I have extra batteries that I keep charged using 
a wall charger that charges each battery separately from the phone.

But this capability will be useful as the base for other (industrial) 
applications not described here.

> If you want an extension for your company,
let me know and I'll come to set it up in your office.

<hr />

## MVP phases of implementation #

It's good business to build one aspect at a time,
in a sequence that yields some value at each phase.
Basically, it's generally backwards from the use case sequence above.

0. The Philips Hue light is turned on 
   by an Ardiuno the same time each day 
   when I normally sleep.

0. The Arduino would need to keep an accurate clock for this,
   so I don't have to calibrate it occassionally.

0. I press a button on the Arduino to turn it off for that day
   (instead of reseting the light manually).

0. Alter the schedule for weekends, when it's OK for batteries to die overnight.

0. Write an app for the occassional alarm to sound on my Android app.

0. Have the ARTIK cloud trigger the alarm.

0. Have the ARTIK cloud trigger the light.

0. Update the Android app to detect battery conditions.

0. Update the Android app to send battery conditions to the ARTIK cloud.

0. Add Flic button.

0. Notice when I enter the house
   and issue a voice reminder if the device is not plugged in within a set time.


<a name="#Rules"></a> 

## Rules #

0. If the 




## Summary of Implementation #

0. <a target="_blank" href="https://eclipse-che.readme.io/docs/samsung-artik-ide-getting-started">
   Samsung's Android IDE</a>, 
   <a target="_blank" href="http://www.eclipse.org/che/extend/artik/">
   powered by Eclipse Che</a>.


## Create App in #

In https://developer.artik.cloud




http://api-console-dev.artik.cloud/

## Samsung's Java Library #

It helps if you have already absorbed the tutorial about 
[IoT ideas](/iot-ideas/) and [Samsung IoT cloud](/samsung-iot-cloud/).

You don't need to download (git clone)
<a target="_blank" href="https://github.com/artikcloud/artikcloud-java">
   Samsung Native SDK for Android/Java</a> from among
   <a target="_blank" href="https://developer.artik.cloud/documentation/tools/native-sdks.html">Samsung's SDKs for cloud</a>.

Just add the XML to pom.xml file and Maven
will download it as a dependency automatically.


## Library build process #

In the Gradle file, add a line to compile the ARTIK Java library:

   <pre>
   compile "cloud.artik:artikcloud-java:2.0.9"
   </pre>


## Sample Apps #

0. <a target="_blank" href="https://github.com/artikcloud/sample-iot-weatherstation/">
   https://github.com/artikcloud/sample-iot-weatherstation</a>
   supercedes the equivalent "SAMI" (the predecessor of ARTIK) at<br />
   <a target="_blank" href="https://developer.artik.cloud/documentation/samples/">
   https://developer.artik.cloud/documentation/samples/</a>
   Samsung's app sample code</a> 
   which don't work anymore.



## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
