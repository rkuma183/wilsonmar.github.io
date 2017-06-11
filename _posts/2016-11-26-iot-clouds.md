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

0. [Samsung's ARTIK cloud](/samsung-iot-cloud/)
   claims to be platform agnostic. 
   It takes data from any type of device - 
   FitBit, smart lightbulb, connected washing machine, Twitter, etc.

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

0. <a href="#Adafruit">Adafruit.io</a>
   provides a simple cloud to collect and display sensor feeds.

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

<a name="Microsoft"></a>

## Microsoft Azure IoT Hub # 

This section was written based on the combination (re-combination) of these
classes:

<a target="_blank" href="https://mva.microsoft.com/en-US/training-courses/introduction-to-azure-iot-17611?l=uxXUIs4rD_606218965">
   Microsoft Virtual Academy's Introduction to Azure IoT</a>
   by Jeremy Foster

   1. Introduction to Azure IoT
   2. Introduction to IoT Hub
   3. Creating a Hub, Pricing, and Scale
   4. Device Registry
   5. Protocols and Security - aka.ms/iotarch, 
      
   6. D2C and C2D Messaging
   7. Devices and Kits
   8. Accessing the GPIO
   9. The Gateway SDK
   10. Device Management
   11. Stream Analytics and Routing
   12. Storage and Virtualization

   aka.ms/iotbestpractices

<a target="_blank" href="https://www.edx.org/course/developing-iot-solutions-azure-iot-microsoft-dev225x">
   EdX 4-month course</a>

   This is free unless you want verification for $99.

   Instructors are Geoffrey Morgan (<a target="_blank" href="https://twitter.com/geoffmmorgan"> @geoffmmorgan</a>) of <a target="_blank" href="https://www.crank211.com/">
   Crank211.com</a>
   and Chris Howd, Engineer and Software Developer, Microsoft

0. Get an Azure account. See https://azure.microsoft.com/en-us/free/free-account-faq/

   After trial period, each month Azure provides
   8,000 free messages (of .5 KB each) a day.
   <a target="_blank" href="https://azure.microsoft.com/en-us/pricing/details/iot-hub/"> 
   The first paid tier</a> of
   400,000 messages per month / $50 = 0.000125 per message (about 1 cent).

0. Visit <a target="_blank" href="http://azure.com/iotdev">
   http://azure.com/iotdev</a> - the "Azure IoT Developer Center"

  * https://internetofyourthings.com
  * https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-security-deployment
  * https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-security-ground-up
  * https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-security-best-practices
  * https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-security-architecture
  * https://www.enisa.europa.eu/publications/etl2015 - mindmap of threats

0. Install a <strong>Simulator</strong> in C#.

0. Order an Intel Edison or Raspberry Pi IoT Devices at:

   <a target="_blank" href="https://catalog.azureiotsuite.com/kits">
   https://catalog.azureiotsuite.com/kits</a> =  https://aka.ms/edx-dev225x-az1

   * Assembled Adafruit BME280 Temperature, Pressure & Humidity sensor
   * Photo cell (CdS photoresistor)
   * 2x 560 ohm 5% 1/4W Resistor (striped green, blue, brown)
   * Ceramic Capacitor (0.1uF)
   * Diffused 10mm Red LED
   * Diffused 10mm Green LED
   * Male/Male Jumper Wires - 20 x 6" (150mm) 
   * Female/Male 'Extension' Jumper Wires - 20x6" (150mm)
   * Full Size Breadboard
   <br /><br />


   ### Azure CLI

   Instead of using the Azure Portal GUI:

   Based on https://docs.microsoft.com/en-us/cli/azure/install-az-cli2

0. On a Mac, any folder:

   <pre><strong>curl -L https://aka.ms/InstallAzureCli | bash</strong></pre>

   ===> In what directory would you like to place the install? (leave blank to use '/Users/mac/lib/azure-cli'): 

   ===> In what directory would you like to place the 'az' executable? (leave blank to use '/Users/mac/bin'): 

   ===> Modify profile to update your $PATH and enable shell/tab completion now? (Y/n): 

   ===> Enter a path to an rc file to update (leave blank to use '/Users/mac/.bash_profile'): 

0. Reset the Terminal:

   <pre><strong>source ~/.bash_profile
   </strong></pre>

0. Login using command:

   <pre><strong>az login
   </strong></pre>

0. Authenticate: use a web browser to open the page 
   https://aka.ms/devicelogin 
   to enter code E946P2YFU,

   Click Continue at "Microsoft Azure Cross-platform Command Line Interface".

   Login to see on the Terminal:

   <pre>
    "cloudName": "AzureCloud",
    "id": "4effab90-7516-4bdb-902a-18001facad69",
    "isDefault": true,
    "name": "Developer Program Benefit",
    "state": "Disabled",
    "tenantId": "12345678-5f96-4d36-a89b-5ea0f7614e72",
    "user": {
      "name": "your@hotmail.com",
      "type": "user"
   </pre>

0. Query from 
   https://github.com/Azure/azure-cli

   <pre><strong>az 
   </strong></pre>

   <a target="_blank" href="https://docs.microsoft.com/en-us/cli/azure/iot">
   List of az commands</a>

   TODO: A PowerShell script that does all the below.


   ### IoT Hub Explorer

   The iothub-explorer is a CLI tool for managing device identities in your IoT hub registry, send and receive messages and files from your devices, and monitor your IoT hub operations.

   The iothub-explorer tool also lets you simulate a device connected to your IoT hub.

   To get started with iothub-explorer using the Visual Studio Code command line:

0. Install Node.js
0. Install the latest version from any folder:

   <pre><strong>npm install iothub-explorer -g
   </strong></pre>

0. Verify by getting a menu:

   <pre><strong>iothub-explorer --help
   </strong></pre>

   ### Device Explorer app for IoT Hub devices

   Use the Device Explorer tool (on Windows only) to manage devices connecting to your IoT hub. For example, you can use this tool to register a device with your IoT hub, monitor messages from your devices, and send messages to your devices. This is not the same as the Device Explorer blade that you can open from your IoT Hub service on the Azure portal.

   The Device Explorer app runs on your local machine and connects to your IoT hub in Azure. 
   It communicates with the following IoT Hub endpoints:

   * Device identity management to provision and manage devices registered with your IoT hub.

   * Receive device-to-cloud to enable you to monitor messages sent from your device to your IoT hub.

   * Send cloud-to-device to enable you to send messages to your devices from your IoT hub.


   ### Create an IoT Hub service

0. Clone an <a target="_blank" href="https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-sdks">Azure IoT service SDK</a> (.NET = C#)

   * https://github.com/azure/azure-iot-sdk-python (2.7 and 3.5) - 
   <a target="_blank" href="https://youtu.be/VlK24lfMWfM">Video</a>
   * https://github.com/azure/azure-iot-sdk-node - 
   <a target="_blank" href="https://youtu.be/VlK24lfMWfM">Video</a>
   * https://github.com/azure/azure-iot-sdk-java (1.7+)
   * https://github.com/azure/azure-iot-sdk-csharp for UWP (Universal Windows Platform)
   * https://github.com/azure/azure-iot-sdk-c for microcontrollers such as RTOS - 
   <a target="_blank" href="https://youtu.be/vf2sW3wZjds">Video</a>

   WARNING: These repos contain sub-modules, so add to clone commands
   `--recursive`. 

   ### Create an IoT device and register it with your IoT Hub


   https://youtu.be/wvRE5nvX8GQ
   by linkedin.com/in/arjmand-samuel-7919934

   ### Simulator

0. On Windows 10, run a full version of Linux from inside Windows by
   installing the "Windows Subsystem for Linux" at 

   https://go.microsoft.com/fwlink/?linkid=848175. 

0. In the Linux environment, run:

   <pre><strong>chmod 555 *
   ./deploy.sh -l
   </strong></pre>


   ### IoT Gateway

   https://github.com/azure/azure-iot-gateway-sdk

   https://youtu.be/KdD6FqxwxF4 by Chipalo Street (cstreet@micosoft.com)

   * Connect new and legacy devices
   * Run edge analytics
   * Enable time-sensitive decisions
   * Reduce bandwidth costs - fall back to least cost 
   * Operate more reliably
   * Maximize Security


   ### Send telemetry data from your device to the IoT Hub

   The Azure IoT Hub service is core to the Azure IoT Suite. This service provides the device-to-cloud and cloud-to-device messaging capabilities and acts as the gateway to the cloud and the other key IoT Suite services. The service enables you to receive messages from your devices at scale, and send commands to your devices. The service also enables you to manage your devices. For example, you can configure, reboot, or perform a factory reset on one or more devices connected to the hub.

   See https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messaging

   ### Stream Analytics 

   Azure Stream Analytics provides "in-motion" data analysis. IoT Suite uses this service to process incoming telemetry, perform aggregation, and detect events. 

   Preconfigured solutions use stream analytics to process informational messages that contain data such as metadata or command responses from devices. 

   * Remote monitoring (RMsolution) [2:50] 

   https://youtu.be/Tg_RZMXHYj8 by (corywink@microsoft)

   * Predictive Maintenance

   Solutions use Stream Analytics to process the messages from your devices and deliver those messages to other services.

   Create a Stream Analytics job that monitors data received by the IoT Hub

   <a target="_blank" href="https://mva.microsoft.com/en-US/training-courses/handson-with-azure-stream-analytics-16639?l=xGiVP0JrC_5606218965">
   Hands-On with Azure Stream Analytics</a>
   by Jeff Prosise (<a target="_blank" href="https://twitter.com/jprosise">@jprosise</a>)
   <a target="_blank" href="http://devcenter.wintellect.com/author/jprosise">
   blogger/co-founder at Wintellect</a>.

   1 Streaming Unit (SU) ~= 1 MB/sec.

   ### Azure function

   Implement an Azure Function that sends an email when a sensor reading exceeds a configured threshold value

   ### Cosmos DB storage 

   Azure Storage and Azure Cosmos DB provide the data storage capabilities. The preconfigured solutions use blob storage to store telemetry and to make it available for analysis. The solutions use Cosmos DB to store device metadata and enable the device management capabilities of the solutions.

   * Create a Cosmos DB storage account and use a Stream Analytics job to store your telemetry data

   ### Power BI

   Azure Web Apps and Microsoft Power BI provide the data visualization capabilities. The flexibility of Power BI enables you to quickly build your own interactive dashboards that use IoT Suite data.

   * Use the Power BI service to view live data coming from your IoT device

   * Use Power BI to create and share a data visualization report

   ### Remote Management of Devices

   * Implement a Direct Method on your IoT device and then trigger the method remotely

   * Implement a Firmware Update using a Direct Method and monitor progress of the operation using a Device Twin

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

<a name="Adafruit"></a>

## Adafruit.io #

Below are instructions for 
<a target="_blank" href="https://learn.adafruit.com/adafruit-io-basics-feeds">
creating a feed</a>

0. Register for an account at io.adafruit.com.
0. In the Welcome Dashboard, you can drag the "Try Me" slider to a value of your choosing.
0. Click MY DASHBOARDS, Your Feeds. CREATE FEED.
0. PROTIP: Since you'll have many devices, name the feed with the brand and 
   serial number of the device, such as:

   * rpi-d85fdaa0-cpu-temp
   * rpi-d85fdaa0-room-temp

0. Click CREATE FEED.
0. Optionally, click to change licensing and public/private visibility,
   which is ironic considering the AIO key is part of the query string,
   making it totally vulnerable to interception.
0. Click VIEW AIO KEYS. Highlight it and copy it to save it in a file
   along with the feed ID.
0. Construct a REST API call:
   <pre>
https://io.adafruit.com/api/groups/weather/send.json?x-aio-key=cda65ef7542e42d18aafcdd3d2ed4688&temperature=13&humidity=12&wind=45
   </pre>

   The response is 

0. The website provides docs for Node, Python, Ruby.

<hr />

## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
