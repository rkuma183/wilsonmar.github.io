---
layout: post
title: "IoT reminders prevent dead mobile battery"
excerpt: "The annoying mobile-IoT-cloud mash-up we actually need"
tags: [Clouds, IoT]
image:
#bow green reminder 1900x500-318kb
  feature: https://cloud.githubusercontent.com/assets/14143059/19455432/3bc1c67c-947a-11e6-9dcf-3e7fd9a65be9.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

## Our annoyance/problem #

<!--<amp-img alt="iphone dead battery 451x232-36kb.jpg" width="451" height="232" src="https://cloud.githubusercontent.com/assets/14143059/19445403/527cf5d6-9451-11e6-845b-aa54d21f20df.jpg"></amp-img>
-->

It's a <strong>hassle</strong> to start your day with a dead battery.

<amp-youtube
    data-videoid="RQ5Qer38E3o"
    layout="responsive"
    width="480" height="270"></amp-youtube>
    <br /><br />


<!-- <amp-img alt="iphone-steve-jobs-dead-468x340-83kb.jpg" width="468" height="340" src="https://cloud.githubusercontent.com/assets/14143059/19445612/3faba5c8-9452-11e6-8f53-1a923b98056d.jpg"></amp-img>
-->

This is especially relevant to owners of iPhones, iPads, and other devices which
do not have replaceable batteries.

But even though many Samsung and other Android phones batteries are replaceable,
some of us still need help remembering to plug them in to charge.


## Solution #

This project provides several ways to be <strong>reminded</strong> 
so that we don't go to sleep while 
battery-dependent devices are left to drain overnight.

Although this is classified among "Health and Medicine" offerings,
we can image other situations which can benefit from a physical reminder system
to ensure that important tasks get done every night.

## Personas #

Because this can be adapted to solve a problem encountered by many,
we want the widest possible adoption.

Thus, the target persona are those who do not have much technical experience.

The challenge of this project is to make the whole system easy to install and operate
-- ideally a plug-and-play install.

However, user-specific security settings (such as generating certificates) may require
expertise from a <strong>technical installer</strong> 
from a local Best Buy store Geek Squad or cable installer
who can travel to homes for installation.


## Scenario #

<amp-img alt="iot-reminders_v01-650x279-125kb.jpg" width="650" height="279" src="https://cloud.githubusercontent.com/assets/14143059/19448610/cdcb8794-945f-11e6-8c98-667fda7d0a82.jpg"></amp-img>
<br /><br />

0. An iOS app created on a Mac using the XCode IDE 
   is placed in the Apple Store
   and downloaded onto an individual user's iPhone or iPad.

0. An <a href="#AndroidApp">app</a> created using Android Studio 
   is placed in the Google Play Store
   and downloaded onto an individual user's Samsung smartphone.

0. Optionally, the Android app is placed in the Amazon App store 
   and downloaded.

0. The app runs in the background to occassionally monitor battery condition, 
   and whether the battery is plugged in for charging.

0. Optionally, the <strong>GPS location</strong> of the device is also sent, if available
   so that actions are more appropriate.

0. Device conditions are sent to a Cloud metric receiver
   on a <strong>schedule</strong> set in the app's Preferences.

0. Additional metrics may also be sent into that same cloud.

0. A long-running <strong>polling</strong> program on a <strong>local machine</strong>
   (or gateway) occassionally 
   extracts device data from the Cloud
   and stores the data in a database for analysis of <strong>trends</strong> over time.

   This is necessary because currently the ARTIK Cloud
   doesn't push information,
   it only receives and stores information.

   The program also manages the archival and deletion of data to keep within storage limits.

   The protocol used may be HTTP or XMPP for more secure communications.

0. Trends are calculated by an <strong>analysis</strong> program.

0. A long-running <strong>alerting</strong> program 
   determines when actions</strong> need to be triggered, based on a
   <a href="#Rules">set of logical rules</a>.

   For example, the program determines whether the battery is steadily declining
   or is being charged.

0. Individual preferences for being alerted, such as the color and pattern of lighting,
   are set in a 
   <strong>dispatch</strong> program GUI.

0. The Dispatch program
   listens for triggers from the alerting program.

0. When conditions and preferences allow,
   the Dispatcher sends a signal to 
   a <strong>smart bulb</strong> 
   to light up.

0. Alternately, a recorded sound, recorded speech, or 
   text-to-speech artificial voice
   may also be emitted.

0. If a response is not received within a set time,
   an annoying <strong>alarm</strong> could sound.

   This escalation can be customized in the Dispatcher GUI.

0. Since the condition of the device continues to be monitored, simply
   plugging the device in for charging would stop repeats of alerting.

0. Optionally, press a <strong>Flic</strong>, Amazon Dash, or other 
   button to signal the Dispatcher program to alter alerting:

   * One press to remind me again in 10 minutes (a kind of snooze button)
   * Two presses to call the phone (so I can find it), or a
   * Long press and hold to ignore (let the battery drain)
   <br /><br />

   Thus, a button can control the lights, the speakers, and the alarm.

Recap:

   <amp-img alt="iot-reminders_v01-650x279-125kb.jpg" width="650" height="279" src="https://cloud.githubusercontent.com/assets/14143059/19448610/cdcb8794-945f-11e6-8c98-667fda7d0a82.jpg"></amp-img>
   <br /><br />

> If you want this for yourself, 
let me know and I'll get one to your home or office.


### Use Case Extensions #

There are uses for this that goes beyond personal mobile devices.

BTW, many don't really need this if they have extra batteries that are kept charged using 
a wall charger which charges each battery separately from the phone.

But I built this capability because it can be useful as the base for 
<strong>other (industrial) </strong>
applications not described here -- especially in a <strong>team environment</strong>
where each person thinks it's another person's responsibility.

The more general solution is called a 
<a target="_blank" href="http://lifehacker.com/how-i-keep-myself-accountable-using-dead-man-s-snitch-1785949377?">
Dead man's snitch</a>.

Reminder for taking pills.

Anything that absolutely positively must be done each night.

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


<a name="Rules"></a> 

## Rules #

Rules are a proprietary Machine Learning algorithm that 
projects how much time is remaining based on actual usage.



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
