---
layout: post
title: "IoT Clouds"
excerpt: "The value of IoT is the wisdom from analytics and notifications"
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

This page aims to provide a way to <strong>compare</strong> (in a hands-on way)
the various cloud services catering data from IoT devices.

This assumes that you have absorbed the tutorial about 
[Intel IoT devices](/intel-iot/).

## The list #

Cloud services for IoT is fiercely contested market.

0. <a target="_blank" href="https://software.intel.com/en-us/articles/connecting-to-amazon-web-services-aws-iot-using-mqtt">
   Connecting to Amazon Web Services* (AWS*) IoT Using MQTT</a>

   [See my presentation about the AWS IoT Button](/iot-aws/)

0. <a target="_blank" href="https://software.intel.com/en-us/articles/connecting-intel-iot-gateways-to-ibm-watson">
   Connecting an Intel® IoT Gateway to IBM Watson</a>

0. <a target="_blank" href="https://software.intel.com/en-us/articles/using-microsoft-azure-iot-suite-with-intel-iot-devices-and-gateways">
   Using Microsoft Azure* IoT Suite with Intel® IoT Technology</a>

0. As for Google Compute Cloud,
   <a target="_blank" href="http://www.cloudwedge.com/agosto-leverages-mqtt-to-create-high-performance-open-source-message-broker-for-iot-496652/">
   Agosto's IoT connection broker is a component of and gateway into Google’s Pub/Sub service, as well as the company’s IoT (M2M) Accelerator</a>

0. GE Predix began their 
  <a target="_blank" href="https://www.predix.io/resources/tutorials/journey.html?environment=workshop#1838">
   https://www.predix.io/resources/tutorials/journey.html?environment=workshop#1838</a><br />
   Predix Transform Workshops
   using <a target="_blank" href="https://www.predix.io/resources/tutorials/tutorial-details.html?tutorial_id=1839&tag=1838&journey=Predix%20Transform%20Workshop&environment=workshop&resources=1849,1839,1853">
   set up a new Intel Edison board</a>

   [See my presentation about Predix](/predix-basics/)

0. ATT M2X cloud

0. <a href="#Samsung">Samsung's ARTIK cloud</a>
   SAMI is platform agnostic. 
   It takes data from any type of device - FitBit, smart lightbulb, connected washing machine, etc.

0. <a target="_blank" href="http://trustedanalytics.org/">
   Trusted Analytics Platform (TAP)</a> open source platform for data scientists,
   based on Cloud Foundry. <a target="_blank" href="https://www.youtube.com/watch?v=R8LxuxsSSwM&list=PLA0ztWy2qcuKIBiGtSpeSs4sEiLyEOtNZ">
    Their playlist of videos on YouTube</a>


0. <a href="#Ubidots">
   Ubidots</a>

0. <a href="#Particle">Particle</a>
   has a cloud integrated with its IDE and devices. 

0. <a href="#Losant">Losant.com</a>
   has a Cloud integrated with its IDE and devices from others.


<hr />

<a name="Particle"></a>

## Particle # 

<a href="#Particle">Particle</a>
<a target="_blank" href="https://www.particle.io/">Particle.io</a>
   has a Cloud integrated with its IDE and devices. 

Particle sells two boards with an onboard cellular antenna that connects to their cloud.
This reduces the hassle of using a custom cellular breakout board

   * http://makezine.com/product-review/particle-electron/

   * $19 http://makezine.com/product-review/particle-photon/



<hr />

<a name="Ubidots"></a>

## Ubidots # 

* <a target="_blank" href="https://www.hackster.io/ubidots/products/ubidots">
   Ubidots</a> has a demo that collects Temp data and displays it as a line graph.

* <a target="_blank" href="https://github.com/drejkim/particle-weather-station">
   Particle Photon Weather Station</a>
   Ubidots
   by Esther Kim


* <a target="_blank" href="https://www.hackster.io/AgustinP/logging-sensor-data-using-intel-edison-amp-python-d6cccc">
   Logging sensor data using Intel Edison and Python and Ubidots</a>


<hr />

<a name="Losant"></a>

## Losant # 

<a target="_blank" href="https://www.losant.com/">losant.com</a>
(<a target="_blank" href="https://twitter.com/losanthq/">@LosantHQ</a>)
   has a Cloud integrated with its IDE and devices. 

   <a target="_blank" href="https://www.losant.com/blog/getting-started-with-aws-iot-button-losant">
   It accepts AWS IoT Dash buttons as input</a>.

   <a target="_blank" href="https://www.losant.com/blog/aws-lambda-and-losant-workflows">
   It can invoke AWS Lambda function from its workflow</a>,
   defined in a JSON file.

   <a target="_blank" href="https://store.losant.com/">
   <img align="right" alt="iot lorent moisture sensor 80x79-i29" width="80" height="79" src="https://cloud.githubusercontent.com/assets/14143059/17669334/8e0e24de-62ca-11e6-8e01-ad17a9517056.png">
   Losant's device shopping mart</a> has a
   <a target="_blank" href="https://store.losant.com/collections/losant-kits/products/losant-moisture-sensor-kit/">
   $19 internet-powered moisture senor kit</a>
   that's ideal for classroom experiments.

   The kit requires some assembly on a <strong>breadboard</strong> with loose wires
   which is more complicated but has more options than Grove boards and connectors.
   
   But Losant provides
   <a target="_blank" href="https://docs.losant.com/getting-started/losant-iot-dev-kits/moisture-sensor-kit/">
   step-by-step instructions</a> with their
   <a target="_blank" href="https://docs.losant.com/">
   documentation</a>.

### Losant Software #

This picks up after XDK is used to create the "Blinking LED" project.

0. Install a local git program and Node (if you haven't already).
0. Open a Terminal shell window to globally install https://github.com/Losant/losant-mqtt-js
   to connect the Edison to the Losant platform.

   npm install -g losant-mqtt

0. PROTIP: Create a "subject" folder where git creates folders during cloning.

0. Edit the package.json file to add dependency: 

  <pre>
  "dependencies": {
    "losant-mqtt" : "^1.0.0"
  }
  </pre>


   https://github.com/Losant/losant-mqtt-js

### Losant Data Explorer #

   Their <a target="_blank" href="https://www.losant.com/blog/introducing-the-data-explorer">
   Data Explorer</a> is good for learning simple visual statistical inference
   without the complex setup and costs of industrial systems.

   Despite its low cost, Lorant offers sophisticated implementations of features not offered by some of its bigger competitors:
   recipies of devices to save time, 
   <a target="_blank" href="https://docs.losant.com/getting-started/walkthrough/">virtual devices</a>, 
   device tags, 
   and device attributes.

   Lorant partners with Microsoft.

   http://opendatadepot.org/media/examples_img/OpenDataDepot_42.png


### Losant Social media #

   <a target="_blank" href="https://forums.losant.com/">
   User forums</a> can go for days with activity because the offering is still young.

   * <a target="_blank" href="https://itunes.apple.com/us/podcast/what-is-losant/id984131621?i=1000367996937&mt=2">
   "What is Losant" Podcast on iTunes</a>
   says their front-end is built on React with Node backend software
   running in Google Compute Engine (but not Google services).
   They switched from MongoDB to
   <a target="_blank" href="https://influxdata.com/">
   InfluxDB</a> for time-series data.

<hr />

<a name="Intel"></a>

## Intel #

Intel lists its cloud services affiliations at<br />
<a target="_blank" href="https://software.intel.com/en-us/iot/cloud-analytics">
https://software.intel.com/en-us/iot/cloud-analytics</a>.


<hr />

<a name="Samsung"></a>

## Samsung #

Samsung calls the ARTIK Cloud 
a "data exchange platform that enables any device or sensor to push its data to the cloud".

   <a target="_blank" href="http://bit.ly/ACHackJJ">
   Samsung's Challenge</a>
   sends participants $100 to sign up

{% include _intro.html %}

0. <a target="_blank" href="https://artik.cloud">
   <strong>https://artik.cloud</strong></a>
   is the Samsung's home product page.

0. Type your email to Sign up for their newsletters.

0. Click PRICING to see that Hobbyists get free access, but data is kept only 3 months.

   PROTIP: Part of the design and task of any system is analytics over time.
   I suggest that you extract the information for display on 
   Tableau.

0. Click <a target="_blank" href="https://artik.cloud">
   SIGN-UP</a>.

0. In a new tab/window, look at<br /><a target="_blank" href="https://www.artik.io/overview/">
   <strong>https://www.artik.io/overview</strong></a><br />
   which sells developers into writing ARTIK modules.

   And this is not the last website.


   ### Add Samsung device #

0. In a new tab/window, open<br /><a target="_blank" href="https://artik.cloud/my/new_device">
   <strong>https://artik.cloud/my/new_device</strong></a>
   to look at the many devices ARTIK supports.

0. Scroll to select <strong>SAMI Gear Fit</strong>.

   The device is used in<br /><a target="_blank" href="https://developer.artik.cloud/documentation/introduction/hello-world.html">
   https://developer.artik.cloud/documentation/introduction/hello-world.html</a><br />
   which steps you through connecting a "SAMI Gear Fit" device
   even though one doesn't need a physical device.

0. PROTIP: Add a number in the name. You may have more than one, 
   or want different variations.

0. Click CONNECT DEVICE...

   This takes you to<br /><a target="_blank" href="https://artik.cloud/my/devices">
   <strong>https://artik.cloud/my/devices</strong></a>


   ### Samsung API console #

0. Open yet another tab/window<br /><a target="_blank" 
   href="https://developer.artik.cloud/api-console/">
   <strong>https://developer.artik.cloud/api-console</strong></a><br />

0. Click "Accept" to allow Samsung the permissions listed:

   <pre>
The application API Console is requesting the following permissions to be granted:
&nbsp;
Read all your data.
Write and modify all your data.
Read data from devices of types:
Send data to devices of types:
Read your profile information
Internal use only. Edit your profile information
   </pre>

0. Click "Accept" to dismiss the cookie message at the bottom.

   <a name="APIdomains"></a>

   Notice the rich set of objects among the granular API calls:

   * users and their devices and device types and properties
   * devices and their tokens
   * devicetypes of manifests with versions and properties
   * messages
   * messages export
   * notifications by subscription
   * rules
   * trials for applications
   * trial devices and devicetypes
   * trial invitations to participants by administrators
   <br /><br />

   ### Get Samsung user access token #

0. Click the "GET" associated with /users/self.

0. Click TRY IT! button for the website to issue a request using the
   <strong>API endpoint</strong> shown:

   <pre><strong>
   https://api.artik.cloud/v1.1/users/self
   </strong></pre>

   The request's HTTP header contains the OAuth2 calculated by the client JavaScript:

   <pre>
    "Content-Type": "application/json",
    "Authorization": "Bearer 471dd09f20f140888a650f3aeec70xxx"
   </pre>

   QUESTION: How long does the 32-character token live?

   The response HTTP header contains HATEOS?

   <pre>
   {
    "allow": "*",
    "content-type": "application/json; charset=utf-8",
    "x-rate-limit-limit": "100/1000",
    "x-rate-limit-reset": "1472315008/1472342400",
    "x-rate-limit-remaining": "99/999",
    "access-control-allow-origin": "*",
    "access-control-allow-headers": "Origin, X-Requested-With, Content-Type, Accept, Referer, User-Agent, Authorization",
    "access-control-allow-methods": "POST, GET, PUT, DELETE, OPTIONS",
    "date": "Sat, 27 Aug 2016 16:22:28 GMT",
    "content-length": "249",
    "connection": "close"
    }
   </pre>

   The response HTTP body returns information about the user:

   <pre>
{
    "data": {
        "id": "075fddff2a984cda87f2d718f4d04xxx",
        "name": "sa4fb30b78564a73884af4e03dcc40xx",
        "email": "wilsonmar@gmail.com",
        "fullName": "WILSON MAR",
        "saIdentity": "pigg1dynic",
        "accountType": "SAMSUNG",
        "createdOn": 1470056152000,
        "modifiedOn": 1470056152000
    }
}
   </pre>

   The "createdOn" and "modifiedOn" are the number of seconds since 1/1/1970.

0. Copy the id's value from the response.

   ### Samsung Device Simulator #

0. Download Samsung's Device Simulator Java program from</br/>
    <a target="_blank" href="https://developer.artik.cloud/documentation/downloads/device-simulator.jar">
    https://developer.artik.cloud/documentation/downloads/device-simulator.jar</a>

0. Open a new Terminal window, navigate to the Downloads folder to 
   construct the command, pasting the 32-character Bearer token copied earlier:

   <tt><strong>
   cd ~/Downloads<br />
   java -jar device-simulator.jar -token=<br />
   java -jar device-simulator.jar -token=471dd09f20f140888a650f3aeec70xxx
   </strong></tt>

   The response begins with this ASCII art:

   <pre>
    _         _   _ _  __   ____ _                 _ 
   / \   _ __| |_(_) |/ /  / ___| | ___  _   _  __| |
  / _ \ | '__| __| | ' /  | |   | |/ _ \| | | |/ _` |
 / ___ \| |  | |_| | . \  | |___| | (_) | |_| | (_| |
/_/   \_\_|   \__|_|_|\_\  \____|_|\___/ \__,_|\__,_|
Welcome to ArtiK Cloud Device Simulator console
   </pre>   

   An example of the rest of the response:

   <pre>
Hello sa4fb30b78564a73884af4e03dcc40xx! your UID is 075fddff2a984cda87f2d718f4d04xxx and your email is wilsonmar@gmail.com :)
Please enter a valid command or ? for help.
java.io.UnsupportedEncodingException: utf-
  at sun.nio.cs.StreamEncoder.forOutputStreamWriter(StreamEncoder.java:61)
  at java.io.OutputStreamWriter.<init>(OutputStreamWriter.java:100)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:231)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:221)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:209)
  at simulator.Console.init(Console.java:64)
  at simulator.Main.main(Main.java:14)
   </pre>

   QUESTION: If the "data: id" token was entered,
   the response is:

   <pre>
cloud.artik.client.ApiException: Unauthorized
  at cloud.artik.client.ApiClient.handleResponse(ApiClient.java:838)
  at cloud.artik.client.ApiClient.execute(ApiClient.java:773)
  at cloud.artik.api.UsersApi.getSelfWithHttpInfo(UsersApi.java:115)
  at cloud.artik.api.UsersApi.getSelf(UsersApi.java:102)
  at simulator.Console.whoami(Console.java:203)
  at simulator.Console.init(Console.java:59)
  at simulator.Main.main(Main.java:14)
The access token is not valid or expired.
Please enter a valid command or ? for help.
java.io.UnsupportedEncodingException: utf-
  at sun.nio.cs.StreamEncoder.forOutputStreamWriter(StreamEncoder.java:61)
  at java.io.OutputStreamWriter.<init>(OutputStreamWriter.java:100)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:231)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:221)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:209)
  at simulator.Console.init(Console.java:64)
  at simulator.Main.main(Main.java:14)
macs-MacBook-Pro-4:Downloads mac$ 
   </pre>

0. https://github.com/artikcloud/tutorial-android-your-first-app

   ### Samsung Define Rules #

   ### Samsung View charts #

   ### Samsung Export from ARTIK

talented and wonderful
https://www.linkedin.com/in/yujingwu
Dr. Yujing Wu (@yujingwu)

has a 
   <a target="_blank" href="https://www.hackster.io/monica/getting-started-with-artik-cloud-grove-weather-station-e0b4e3?ref=part&ref_id=9403&offset=0">
   demo on hackster.io</a>

### Samsung Social #

Email: developer@artik.cloud

https://www.artik.io/blog/cloud/



## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
