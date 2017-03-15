---
layout: post
title: "Dynatrace"
excerpt: "He sees you when you're sleeping. He knows when you're awake ..."
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

This is a hands-on narrated tour on how to use Dynatrace.

Dynatrace offers several products. Two products have downloads:

* Application Monitoring
* Data Center RUM (Real User Monitor) captures traffic and analyzes it

The product that enables "Shift-Left" is one that enables identification of performance issues
during development.

Additional:

* Synthetic Monitoring has fake users logging in, etc.
* Dynatrace adds HTTP header
* Keynote monitors what end-users experience through the public network
* Dynatrace Load
* Business Service Management

## Application Monitoring

PureModel = PurePath + PureStack

   PurePath monitors horizontally across the server tiers

   PureStack dives into the vertical infrastructure

   Baselines

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10858">
   What is Application Monitoring</a>

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10206">
   Reviewing the Architecture</a>
   the Application Monitoring Platform, PureModel, and PureStack.
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10872">
   Exploring Core Technologies</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10875">
   What is a PureStack</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10865">
   What is a Pure Path</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10863">
   What is UEM</a>

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10893">
   Understanding Dashboards</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10855">
   PureLytics Stream and UEM Heatmap</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10891">
   Exploring the Web Interface</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10890">
   Exploring the Rich Webstart Client</a>

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10209">
   Installing Application Monitoring on Windows</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10210">
   Configuring the Performance Warehouse</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10211">
   Deploying Dynatrace Collectors</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10857">
   Managing Sensors</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10860">
   Managing Dynatrace Servers</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10856">
   Managing Collectors</a>

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10873">
   Managing System Profiles</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10870">
   Working with Support - Part 2</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10866">
   Managing Licenses</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10864">
   Managing the Performance Warehouse</a>

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10861">
   Managing Memory Analysis</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10862">
   Native Applications and Custom Protocols with Dynatrace AppMon ADK</a>
* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10876">
   Integrating with Data Center Real User Monitoring</a>

* <a target="_blank" href="https://university.dynatrace.com/discover/appmon/10859">
   Managing On Premises SaaS</a>

<hr />

## Acronyms

   ADK

   APM

   UEM

   SaaS

<hr />



![dynatrace across lifecycle 898x527](https://cloud.githubusercontent.com/assets/300046/23922979/11b6313a-08db-11e7-9376-a6627907b058.png)

## In AWS #

You can use Dynatrace in place of or in addition to Amazon CloudWatch logging.
Here are the steps:

0. Download the installer from Dynatrace.com.

   BLAH: I wish Dynatrace have its own on S3.

   This can be either/both a Windows or Linux instance.

0. Put the Dynatrace installer in an S3 instance
   so that Ansible scripts to build up a server have a stable reference.

0. Create a new AWS instance.

   Again, this can be either a Windows or Linux instance.

0. Install the Dynatrace agent on the server.

0. Connect the agents to the Dynatrace controller so you see metrics being recorded.

0. Impose some artificial load on the machine to see metrics in their full glory.

0. Repeat the above in an automated script:

   0. Jankins invoked when a commit occurs to a branch on GitHub
   0. The Jenkins v2 Pipeline Groovy script downloads build script from GitHub
   0. The build downloads installers to assemble
   0. The build script creates image in DockerHub
   0. Instantiate AWS with Docker image
   0. Sends an email when the image is ready for use
   0. Start a performance testing run
   0. Sends SMS texts with the results of test run
   0. If all is well, commits into the next branch in GitHub

## More on cloud #

This is one of a series on cloud computing:

{% include cloud_links.html %}
