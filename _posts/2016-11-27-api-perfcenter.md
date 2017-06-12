---
layout: post
title: "API PerfCenter (Performance Center/LoadRunner)"
excerpt: "Get to specific runs in HPE ALM"
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

Since version 12, HP ALM Performance Center has a Performance Center REST-based API. 
It enables load tests to be run without using the Performance Center web user interface.

The Jenkins plug-in for Performance Center makes use of this.

## References online

The HP Performance Center REST API Version 12.50 Reference on-line is at
<a target="_blank" href="http://alm-help.saas.hpe.com/en/12.50/api_refs/Performance_Center_REST_API/Performance_Center_REST_API.htm">
http://alm-help.saas.hpe.com/en/12.50/api_refs/Performance_Center_REST_API/Performance_Center_REST_API.htm</a>

  http://alm-help.saas.hpe.com/en/12.50/api_refs/REST_TECH_PREVIEW/ALM_REST_API_TP.html


## Client code on GitHub

Client code on GitHub:

* https://github.com/okean/alm-rest-api
  by Oleg Kean uses Java

* https://github.com/alonso05/ALM
  examples uses Java

* https://github.com/ddikman/QC.js
  uses JavaScript to access Quality Center

* https://github.com/jaism/ALM-Rest-Client-API
  from 2014

* https://github.com/xiaomengzheng/alm-rest-api
  uses Ruby and  HappyMapper lib for XML mapping 

* https://github.com/AndrewMFlick/NextGenALM_Samples
   just Authentication of "next generation ALM"
   by Andrew Flick, Product Manager showing code for "some marketing guy".


## Functionality

1. Authenticate.
2. Upload and download VuGen scripts. See Scripts and Scripts/{ID}.
3. Define test scenarios. See tests, testInstances, Groups/{name}, Groups/{name}/RTS, and tests/{ID}/validity
4. Start a test run defined in scenarios.
5. Stop a run. See stop, stopNow, and abort.
6. Get run results data. See Get Run Status, Results (metadata), Results/{ID} (metadata), and Results/{ID}/data (report).
7. Logout from the server before your application closes.

https://www.youtube.com/watch?v=Dw0-GH0y0Hw
HPE Jenkins automation plugin for performance engineering webinar

https://www.youtube.com/watch?v=n-E_U1ggd6s
LR Jenkins
Feb 17, 2017

https://www.youtube.com/watch?v=hhSzCHyqSMY&t=4m55s
Tips to achieve continuous integration/delivery using HP ALM, Jenkins, and Skytap
James of Orasi Software 
Jul 16, 2014

## Related

https://github.com/retishp/uft_mqtt
create MQTT Publish and Subscribe activities for HPE UFT API testing

From 2016
https://github.com/HewlettPackard/hpe-nv-js

https://github.com/HewlettPackard/hpe-nv-java

* https://github.com/djurodrljaca/tuleap-rest-api-client
  uses Python for https://www.tuleap.org/

* https://github.com/hpsa/hp-application-automation-tools-plugin
   Jenkins plugin to run HP Application Automation tools

* https://github.com/ogarling/LR2Graphite
   LoadRunner response time metrics export tool to Graphite using AutoIt
   by Okke Garling of Perfcon in the Netherlands 

* https://github.com/moinuddin14/loadrunner
   .flv tutorials from 2012   

* https://github.com/wybgithub/loadrunner
   Python reads .lrs file from 2014   

* https://github.com/davbaster/loadrunner
   LoadRunner practices and trainning
   contains a bare script   

* https://github.com/markdowd/LoadRunner/blob/master/lr_scenario.pl
   Perl to read scenario file   

* http://lrhelp.saas.hpe.com/en/12.53/help/WebHelp/Content/VuGen/139650_c_dotnet_overview.htm
   .NET protocol in LoadRunner
   