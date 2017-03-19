---
layout: post
title: "EasyTravel"
excerpt: "Catch the bad boys if you can"
tags: [Clouds, Monitoring, Analytics]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dDynatracebf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://bDynatraceges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=bDynatracege&utm_medium=bDynatracege&utm_campaign=pr-bDynatracege)

{% include _toc.html %}

EasyTravel is a "a realistic heterogeneous multi-tier web-application"
Dynatrace provides to evaluate its AppMon and UEM software.

YOUTUBE: 
<a target="_blank" href="https://www.youtube.com/watch?v=ps9Y14KlPyU">
Evaluate Dynatrace with easyTravel</a> demo app
published on May 14, 2015. In 1 hour it takes a whirlwind tour, half based on random questions,
which can be confusing to newbies.

0. Identify the latest version (6.5 as of this writing March 2017).
0. Download and Get license

   <a target="_blank" href="http://bit.ly/dteasytravel/">
   http://bit.ly/dteasytravel</a>
   (https://community.dynatrace.com/community/display/DL/Demo+Applications+-+easyTravel)

   Click "Download easyTravel Demo License" = https://community.dynatrace.com/community/download/attachments/45383742/dynaTrace_license_201609281051.key?version=2&modificationDate=1486998983333&api=v2

   <strong>dynaTrace_license_201609281051.key</strong> is downloaded.

   CAUTION: The file name is deceptive.
   Each license is valid within a 3 month period. A new license needs to be downloaded. 
   The license is bound to easyTravel and the pre-configured System Profile that comes with easyTravel.

   QUESTION: How is https://community.dynatrace.com/community/display/EVAL/My+dynaTrace+Trial
   different than the other page? "A trial account for this ID already exists!"

0. Uninstall previous version

   $UserHome/.dynaTrace/easyTravel 2.0.0/easyTravel/config


0. Install agents on Apache servers under test

   0. Adjust dtwsagent.ini 
   0. Adjust Apache HTTP config via "Edit http.conf" on Apache Procedure in easyTravel Launcher

0. Install Dynatrace server (Apache)

0. Configure System Profile (install resource pack) on dynatrace client

   <img width="226" alt="dynatrace easytravel system profile 452x362" src="https://cloud.githubusercontent.com/assets/300046/24030587/0c2b8456-0ab4-11e7-8df2-5e1d279cf9a6.png">

0. Verify API ports

   http://localhost:8020/api-docs/index.html

0. Configure Agent Mappings
0. Inject agentpath-setting into the application code for instrumentation

   https://community.dynatrace.com/community/display/DL/easyTravel+Training+Mode
   EasyTravel Training Mode

0. Configure EasyTravel: click on icon at upper-right

   ![dynatrace easytravel config icon menu 340x131](https://cloud.githubusercontent.com/assets/300046/24032047/636f9a24-0abc-11e7-9bfb-adea2aee8b84.png)

   Select Show Properties for file <strong>easyTravelConfig.properties</strong> file.

   Edit <strong>config.dtserverWebPort=8020</strong>.

0. Launch servers under test

   The starting of the various tiers and the enabling/disabling of different problem pattern plugins is done via a separate easyTravel Launcher. The Launcher allows the user to conveniently switch between different demo scenarios. Each scenario can define load scripts and certain problem pattern plugins that are enabled. The scenarios can be modified or extended by changing an XML file. This is useful when giving demos and allows you to focus on <em>problem areas</em> that are particularly relevant for a specific demo.

   The default:

   https://localhost:9911

   <img width="771" alt="dynatrace easytravel config ui 1542x1014" src="https://cloud.githubusercontent.com/assets/300046/24030487/aad9e74c-0ab3-11e7-9223-4ba4bf436678.png">

0. Install System Profile

0. Use by travelers

   Users log in, search for journeys to various destinations, select promotional journeys directly that are offered and book a journey using credit card details. 

0. Use by travel agents

   Login as ???

   A Business-to-Business (B2B) .NET web portal for travel agencies is provided where travel agencies can manage the journeys that they offer and can review reports about bookings made by travelers.
 
0. Adjust Generated visits (built into easytravel app)

   ![dynatrace easytravel config 207x90](https://cloud.githubusercontent.com/assets/300046/24032301/adb2b714-0abd-11e7-91f9-76baa2f13fb1.png)

0. Activate Problem Pattern - slow authentication

   In the easytravel Configuration UI, search for "monica".

   Login as monica / monica.

   See trace on desktop client.

0. Run load traffic pattern

   [18:54] Watch on Dynatrace Dashboard of specific users.

   [20:02] End user experience geolocation map and who is frustrated.

   QUESTION: What can the company do about frustrated users?

   [22:12] In Diagnostics Transaction Flow: Hotspots by Tier and API

   ![dynatrace hotspots by tier 805x173](https://cloud.githubusercontent.com/assets/300046/24031048/b75be864-0ab6-11e7-92a9-614057fe360e.png)

   ![dynatrace hotspots by api 797x183](https://cloud.githubusercontent.com/assets/300046/24031022/864b4648-0ab6-11e7-930c-c5bdc5340fcd.png)

   ### IDE

   https://marketplace.atlassian.com/plugins/be.sofico.bamboo.plugins.bamboo-dynatrace-plugin/server/overview

0. Configure Eclipse IDE

   https://community.dynatrace.com/community/display/DL/dynaTrace+Eclipse+Integration+Plugin

   https://github.com/Dynatrace/Dynatrace-Eclipse-Integration-Plugin

0. Configure IntelliJ

   https://community.dynatrace.com/community/display/DL/dynaTrace+IntelliJ+IDEA+Integration+Plugin

   https://community.dynatrace.com/community/display/DL/IntelliJ+IDEA+Integration+Plugin

0. Configure Visual Studio IDE


0. Identify Memory Leaks

   https://www.dynatrace.com/blog/hands-tutorial-5-steps-identify-java-net-memory-leaks/

0. Identify Garbage Collection

   http://apmblog.dynatrace.com/2014/09/16/detecting-bad-deployments-resource-impact-response-time-hotspot-garbage-collection/

   ### Jenkins integration

0. Jenkins

   https://github.com/Dynatrace/Dynatrace-JenkinsPlugin

   ### Confluence

0. Integrate with Confluence via cPrime

   https://marketplace.atlassian.com/vendors/1211168

   https://marketplace.atlassian.com/plugins/com.cprime.confluence.templates/server/overview


### Built-in load generator



