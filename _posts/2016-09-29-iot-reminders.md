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

<amp-youtube data-videoid="8KBlVxaVtzY" layout="responsive" width="480" height="270"></amp-youtube>

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

## Personas #

We designed our solution for people who don't have a lot of technical experience.

So we made it easy to setup and use even though
we use advanced security techniques 
(XMPP and SPARQL with PKI security certificates).

With our package, you don't need to have your laptop running all the time.

Nevertheless, we can arrange
for local <strong>technical experts</strong> 
to travel to you for installation.

> If you want one for your team or company,
let me know and I'll come to set it up in your office.




## Scenario story #

Let's now look at elements of the cloud offering:

<amp-img alt="iot-reminders-basics-v03-650x326-91kb.jpg" width="650" height="326" src="https://cloud.githubusercontent.com/assets/14143059/19570625/0f236aea-96b8-11e6-8143-a8e797b32b00.jpg"></amp-img>

0. Our iOS app is downloaded and installed from the Apple Store
   onto each individual user's iPhone or iPad.

0. From the Google Play Store each user downloads and installs 
   our <a href="#AndroidApp">Android app</a>.

0. On either platform, the first time you open the app,
   create an account. The app then sends battery condition
   <a href="#BatteryMetrics">measurements</a> to a
   <strong>cloud server</strong> in one of several locations around the world. ***

0. In the app's Preferences,
   you can control how often measurements are sent. ***

0. In the app you can also pre-configure the
   <strong>black box</strong> you'll be getting with
   secure encryption. ***

0. Your <a href="#SentryBox">black box</a> is
   not like a laptop or mobile phone because
   you leave it constantly plugged in a power outlet and it never goes to sleep. ***

   BTW, we recommend that you use an Uninterruptable Power Supply ***
   
0. The first time you plug it in,
   you give it your network password and 
   it downloads the latest software for itself.

0. Just like a Roku box, you register your device 
   to establish a secure encrypted connection between the 
   cloud and your black box. ***

0. After you set your mobile phone on the same wi-fi network as the box,
   you can claim ownership of
   devices it communicates with. 
   (The box has its own <strong>web server</strong>) ***

0. You can also configure <strong>preferences</strong> for how the system works. ***



0. In the box, what we call <strong>receiver</strong> software 
   periodically retrieves data from the cloud.

0. When conditions and preferences allow,
   the <strong>Dispatch program</strong> 
   sends out a signal to IoT devices it can communicate with.

0. Notification can start with a <a href="#TextMessage">text message</a> 
   to the phone,
   which is ideal because the owner would then be able to take immediate action
   of plugging the phone in.

   The sound of text message tones on phones are usually too low to hear,
   so that's one reason people wear a smart watch.
   But that can run out of battery as well.

0. So the Dispatcher may 
   <strong>call the phone</strong> with a recorded message.

0. Alternately, a recorded sound, recorded speech, or 
   text-to-speech artificial voice
   may also be emitted from a speaker device.

0. If a response is not received within a set time,
   an annoying (attention grabbing) <strong>alarm</strong> speaker could sound. ***

0. Individual preferences for being alerted, 
   and the <a href="#escalation">sequence of escalation</a> preferred,
   are set in the
   <strong>dispatch</strong> web page.

0. For example, those hard of hearing may prefer that
   a <strong>smart bulb</strong> 
   be lit up with a color and pattern of lighting set by the owner.

   This owner personal control of notifications is what provides great value from this solution.

0. Additional actuators can be added, such as 
   <a href="#Vibrators">vibrating devices</a>. 


0. Since the condition of the mobile device continues to be monitored, 
   simply
   plugging the device in for charging would stop repeats of alerting.

0. Optionally, press a <strong>Flic</strong>, Amazon Dash, or other 
   button to have the Dispatcher program alter its alerting:

   * One press to remind me again in 10 minutes (a kind of snooze button)
   * Two presses to <a href="#CallPhone">call the phone</a> (so I can find it), or a
   * Long press and hold to ignore (let the battery drain)
   <br /><br />

   Thus, a button can control the lights, the speakers, and the alarm.

   ### Inside the Sentry box #

   <amp-img alt="iot-reminders-ext-v03-650x325-120kb.jpg" width="650" height="325" src="https://cloud.githubusercontent.com/assets/14143059/19570634/13f11e5a-96b8-11e6-90b3-38a94fe53a26.jpg"></amp-img>

   Now let's look further into components of the Sentry box. 

0. Data retrieved is stored in a 
   database containing trend information over time.

   The receiver program also manages the 
   <strong>archival and deletion</strong> 
   of data to stay within storage limits.


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


   ### Extensions #

   A low-battery alert is one in a whole set of use cases
   for individually customizable physical alerting.

0. One extension of this system would interact with various <strong>calendars</strong>
   associated with the user.

   This design is classified among "Health and Medicine" offerings
   because it can also be applied to 
   remind people to <strong>take pills</strong> before going to bed.

0. Optionally, the <strong>GPS location</strong> of the device, if available,
   can also be sent so the machine knows if you leave your house without doing what needs to be done.

0. Additional metrics from other sensors and alerts from other systems
   may also be sent into that same receiver,
   such as predictions of bad weather or
   freezers not having power anymore.

0. When this system is configured with an <strong>API</strong> (Application Programming Interface)
   to receive messages from other systems
   such as Jenkins or other continuous integration servers,
   the owner can receive those alerts in a manner of his or her preference.


   ### Industrial extensions #

   We can imagine several other uses for a generalized
   <strong>physical reminder</strong> system like this
   to ensure that important tasks get done.

   This solution can also be useful in a <strong>team environment</strong>
   where each person may think it's another person's responsibility.

   This is for almost any task that must be done by a certain time.
   
   NOTE: The more general solution is called a 
   <a target="_blank" href="http://lifehacker.com/how-i-keep-myself-accountable-using-dead-man-s-snitch-1785949377?">
   Dead man's snitch</a>, 
   as in "a copy of this will be released to the press if my people don't hear back from me the end of this hour".

> If you want this for yourself, 
let me know and I'll get one to your home or office.

<!--
### Building blocks #

   <a name="SentryBox"></a>

   ## Sentry Box #
   Techncially, it's a Raspberry Pi or Samsung ARTIK 10 computer on a board.

   <a name="BatteryMetrics">battery measuments</a> 



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

-->


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}

   and whether the battery is plugged in for charging.
