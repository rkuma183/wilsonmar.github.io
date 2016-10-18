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

<amp-youtube data-videoid="RQ5Qer38E3o" layout="responsive" width="480" height="270"></amp-youtube>

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

Another use is reminders for taking pills.

Although this is classified among "Health and Medicine" offerings,
we can image other situations which can benefit from a 
<strong>physical reminder</strong> system
to ensure that important tasks get done every night.

The more general solution is called a 
<a target="_blank" href="http://lifehacker.com/how-i-keep-myself-accountable-using-dead-man-s-snitch-1785949377?">
Dead man's snitch</a>.

This can be useful especially in a <strong>team environment</strong>
where each person may think it's another person's responsibility.

Anything that absolutely positively must be done each night.



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

> If you want one for your team or company,
let me know and I'll come to set it up in your office.


## Scenario story #

<amp-img alt="iot-reminders-cloud-v02-650x375-100kb.jpg" width="650" height="375" src="https://cloud.githubusercontent.com/assets/14143059/19495386/64d1af7a-9540-11e6-9c18-2a3a32778e2d.jpg"></amp-img>


0. Our iOS app is downloaded and installed from the Apple Store
   onto each individual user's iPhone or iPad.

0. Our <a href="#AndroidApp">Android app</a> is downloaded and installed from the Google Play Store
   onto each individual user's Samsung smartphone or tablet.

0. The app on mobile device run in the background to obtain battery conditions
   which the app sends to a Cloud metric receiver
   on a <strong>schedule</strong> set in the app's Preferences.

0. Optionally, the <strong>GPS location</strong> of the device, if available
   is also sent so that actions are more appropriate.

0. Additional metrics and alerts from other systems
   may also be sent into that same receiver,
   such as predictions of bad weather or
   freezers not having power anymore.

0. When conditions and preferences allow,
   a <strong>Dispatch program</strong> 
   send out a signal to IoT devices it can communicate with.

0. Notification can start with a <a href="#TextMessage">text message</a> 
   to the phone,
   which is ideal because the owner would then be able to take immediate action
   of plugging the phone in.

   The sound of text message tones on phones are usually too low to hear,
   so that's one reason people wear a smart watch.
   But that can run out of battery as well.

0. After a certain amount of time, the Dispatcher may 
   <strong>call the phone</strong> with a recorded message.

0. If that doesn't get attention, a <strong>smart bulb</strong> 
   can be lit up with a color and pattern of lighting set by the owner.

0. Individual preferences for being alerted, 
   and the <a href="#escalation">sequence of escalation</a> preferred,
   are set in a 
   <strong>dispatch</strong> program GUI.

   For example, those hard of hearing may prefer lights.

0. Alternately, a recorded sound, recorded speech, or 
   text-to-speech artificial voice
   may also be emitted.

0. If a response is not received within a set time,
   an annoying <strong>alarm</strong> could sound.

0. Additional actuators can be added, such as 
   <a href="#Vibrators">vibrating devices</a>. 

0. Since the condition of the device continues to be monitored, simply
   plugging the device in for charging would stop repeats of alerting.

0. Optionally, press a <strong>Flic</strong>, Amazon Dash, or other 
   button to have the Dispatcher program alter its alerting:

   * One press to remind me again in 10 minutes (a kind of snooze button)
   * Two presses to <a href="#CallPhone">call the phone</a> (so I can find it), or a
   * Long press and hold to ignore (let the battery drain)
   <br /><br />

   Thus, a button can control the lights, the speakers, and the alarm.

   ### Locally run server #

   <amp-img alt="iot-reminders-local-v02-650x371-131kb.jpg" width="650" height="371" src="https://cloud.githubusercontent.com/assets/14143059/19495395/6810d8e6-9540-11e6-8587-d7c604d9e575.jpg"></amp-img>

0. Instead of running on a public cloud, there is an edition of our software that runs on a 
   <strong>local machine</strong> in your home or office.

   Let's now look into componets of that software.

0. The cross-platform software 
   can be downloaded from the Apple Mac store, Microsoft app store, 
   or directly by scripts for any platform pulling from GitHub and Docker.

0. A long-running <strong>polling</strong> program 
   (or gateway) occassionally 
   extracts device data from the Cloud
   and stores the data in a database for analysis of <strong>trends</strong> over time.

   <!-- 
   This is necessary because currently the ARTIK Cloud
   doesn't push information,
   it only receives and stores information.
   -->

   The program also manages the <strong>archival and deletion</strong> 
   of data to stay within storage limits and thus costs.

0. Trends are calculated and displayed by an 
   <strong>analysis</strong> program.

0. A long-running <strong>alerting</strong> program 
   determines when actions</strong> need to be triggered, based on a
   <a href="#Rules">set of logical rules</a>.

   For example, the program determines whether 
   the battery is steadily declining
   or is being charged, and notifies the
   <a href="#Dispatch">Dispatch program</a>
   listening for trigger requests.

Recap:

   <amp-img alt="iot-reminders_v01-650x279-125kb.jpg" width="650" height="279" src="https://cloud.githubusercontent.com/assets/14143059/19448610/cdcb8794-945f-11e6-8c98-667fda7d0a82.jpg"></amp-img>
   <br /><br />

> If you want this for yourself, 
let me know and I'll get one to your home or office.


### Building blocks #

The choice of tools for building these mobile and local apps focus on several considerations: 

Cross-platform (Mac, Linux, Windows). All JavaScript based.

   React Native for mobile communicating using GraphQL (instead of REST API).

   GitHub Electron for desktop apps.

   D3.js for painting graphs.

<a name="TextMessage"></a> 

### Text message #

SMS text messages can be sent via an API hosted by Twilio.


### Protocol #

Line protocol used may be HTTP or 
   <a href="#XMPP">XMPP</a> for more secure communications.

For IoT, encrypted payloads by 
   <a target="_blank" href="http://strophe.im/strophejs/">
   http://strophe.im/strophejs</a>
   uses Bidirectional-streams Over Synchronous HTTP (BOSH) to emulate a 
   persistent, stateful, two-way connection to an XMPP server because JavaScript has no facilities for persistent TCP connections over WebSockets. (XEP 124) 

   converse.js examples here:
   http://www.xmpp-iot.org/tutorials/

PowerShell scripts for DevOps.

Use pm2 to restart the server when memory goes to a max_memory_restart limit 

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



<a name="Alerting"></a>

### Alerting program #

<a name="Rules"></a> 

#### Rules #

Rules are algorithms such as
project how much time is remaining based on actual usage.



## Summary of Implementation #

0. <a target="_blank" href="https://eclipse-che.readme.io/docs/samsung-artik-ide-getting-started">
   Samsung's Android IDE</a>, 
   <a target="_blank" href="http://www.eclipse.org/che/extend/artik/">
   powered by Eclipse Che</a>.


<a name="Dispatch"></a>

### Dispatch program #



### Create App in #

In https://developer.artik.cloud

Smack library for Java, 

and aSmack for Android




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

## Out of Scope #


0. Android app in the Amazon App store 


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}

   and whether the battery is plugged in for charging.
