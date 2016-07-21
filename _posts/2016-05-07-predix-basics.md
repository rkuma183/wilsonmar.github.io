---
layout: post
title: "Predix"
excerpt: "Machine Learning for the Industrial Internet"
tags: [ML, GE]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here are my random notes about
Predix, GE's brand name for their "Industrial Internet" which 
incorporates Machine Learning, Data Science, and Artificial Intelligence.

The technical components according to 
<a target="_blank" href="https://www.predix.io/resources/training">
https://www.predix.io/resources/training</a>

0. <a href="#Devbox">Devbox with pre-built virtual machines</a>
0. <a href="#LocalInstall">Local install</a> Eclipse IDE (text editor) with STS (Spring Tool Suite)
0. Java programming language
0. <a href="#Spring">Spring framework</a>
0. <a href="#OpenJPA">Apache OpenJPA persistence</a>
0. Maven build
0. <a href="#CloudFoundary">Hosting in the Cloud Foundry cloud</a>

Pivotal Software was formed in 2012 after spinning out of EMC Corporation. On April 24, 2013, the organization announced both a $105 million investment from General Electric and its PaaS offering, Pivotal Cloud Foundry (PCF), a cloud-enabled application platform for private cloud initiatives and public cloud providers. - per https://en.wikipedia.org/wiki/Pivotal_Software

<hr />

## Intro People Videos #

You won't be taught how to actually DO anything in videos under the
"Predix Developers" section within 
<a target="_blank" href="https://www.youtube.com/channel/UCCQTdYGLd_jt9zpJ9kTroQg">
GE Digital YouTube account</a>.

But the videos are a good overview by principals.


<amp-youtube data-videoid="NZfkQqdZHRo" layout="responsive" width="480" height="270">
</amp-youtube>
In <a target="_blank" href="https://www.youtube.com/watch?v=NZfkQqdZHRo">
this video: A Developer's Take on Predix </a>,
Matt Momont (<a target="_blank" href="https://twitter.com/muymoo">@muymoo</a>), 
front-end UI software engineer, says:

> "The apps can be built by one person. Everything is stood up for you and managed for you."

GE/industrial specific services such as time-series data.
"Nest for wind farms".

Predix is part of the "next industrial revolution".

It can be said that GE is the company that literally invented the light bulb and electricity because it 
was formed by Thomas Edison.
Today it manufactures jet engines, wind turbines, and many industrial goods large and small.

Predix is used to tune that equipment, 
thus they are featured in many of Predix marketing materials.

<amp-youtube data-videoid="UQqytypjbE4" layout="responsive" width="480" height="270">
</amp-youtube>
In <a target="_blank" href="https://www.youtube.com/watch?v=UQqytypjbE4">
this video: Predix Architecture</a>,
Steve Winkler, Principal Architect, Predix Platform Leadership
says Predix Machine is the stack installed locally on gateways and controllers
providing edge analytics, even when normal connectivity is not available.

As follow-up, download and read
<a target="_blank" href="https://www.predix.com/predix-architecture-whitepaper">
Predix Architecture white paper from Septempter 2015</a>.

<amp-img width="650" height="224" alt="predix arch diagrame_2x-650x224-c59.jpg"
src="https://cloud.githubusercontent.com/assets/300046/16947577/201aa83e-4d6d-11e6-8b07-33477ed395c2.jpg">
</amp-img>


## UX/UI Visual Design system #

As you might expect from a large corporation,
someone at GE corporate would invent rules around design of navigation, form layout, toggles & sliders, etc.
for everyone else in the company.

The "design system" is a grand name that encompasses the
Visual Language + Interaction Patterns + Technology Framework
for personas.

GE's Software Design Hub website
provides a reference implementation, stencils, and copyrighted GE corporate font "GE Inspira Sans" and  "GE Inspira Serif".

<strong>Jeff Crossman</strong> ‏(@jeffcrossman),
GE Designer, wrote on 
<a target="_blank" href="https://medium.com/ge-design/ges-predix-design-system-8236d47b0891#.jqxhx95eb">
Medium: GE’s Predix Design System</a> what he said in


<strong>David Cronin</strong> (@davcron)
leads GE's design in
<a target="_blank" href="https://vimeo.com/132580829">
this 36 minute Vimeo video</a> and
<a target="_blank" href="http://www.slideshare.net/davcron/the-ge-design-system-and-thoughts-about-craft-at-scale">
powerpoint</a>
on May 13, 2015 at Enterprise UX 2015


* <a target="_blank" href="https://www.youtube.com/watch?v=gPjsmLKd6d8">
   Predix Fundamentals</a>

* <a target="_blank" href="https://www.youtube.com/watch?v=KklEcfnA0yg">
   Predix.io Developer Portal Walktrough</a> service catalog

<a target="_blank" href="https://www.predix.io/resources/">
   Predix.io/resources</a>
   lists free videos but doesn't say where they are:

   * Introduction to <a href="#CloudFoundry">Cloud Foundry</a>
   * Implementing Security on Predix
   * Modeling Assets
   * UI Basics

The $350 Predix Certified Developer on-line exam topics:

   * Analytics
   * Asset
   * Predix Cloud
   * Data Management
   * DevOps
   * Predix Machine
   * Security
   * UI Services


One-day fundamentals course topics:

0. develop and deploy applications on Predix
0. create service instances in Predix Cloud
0. work with the Cloud Foundry command line interface (CLI)
0. use manifest files to deploy applications

Boot camp topics:

* Visualize the Predix architecture
* Utilize the various Predix catalog services
* Deploy and monitor a microservice
* Connect Edge devices to Predix Cloud
* Configure security services


http://www.slideshare.net/GETurkiye/predix-cloud?next_slideshow=1
predixsamsa-150915072353-lva1-app6892(1).pdf

Videos from GE's Minds+ Machines conference
<a target="_blank" href="https://www.GEmindsandmachines.com/">
GEmindsandmachines.com</a> 29 Sep - 1 Oct 2015

<hr />

## Use cases #

Predix propaganda uses high-level buzzwords like:

   * Connected assets 
   * Industrial data science
   * Industrial data management
   * Asset lifecycle
   * Operations & Intelligence
   * Monitoring & diagnostics
   * Risk mitigation

But there's one:

   * Predictive maintenance

What is the role of what humans do when artificial intelligence supercedes any particular human?

It's no longer to fill out forms.
With IoT drones and robots will gather the data.

How do humans now supervise massive data streams?

Software can do much of the planning and scheduling to available capacity.

We want to avoid focusing too much on "productivity" metrics of operators
rather than people.

## Partners #

Denzil Samuels, GE Digital’s Global Head of Alliances, Channels, Business Development & Ventures, 

* <a target="_blank" href="https://www.youtube.com/watch?v=sYBQA2pOY-Q">
   Video: Predix: The Opportunity for Partners</a>
   ge.com/digital/partners
   [0:26] the industrial cloud is "a bigger opportunity than the enterprise and consumer cloud. And yet there is no one there."﻿
   VSI can build a business.
   Service providers working on connected devices talking to each other.
   ISVs write code that run without worrying about hardware, storage.
   Cisco can sell compute power.


## 30-second commercials #

TV Commercial created by GE corporate:

* https://www.youtube.com/watch?v=puRCMlOPaPE
  Predix: Industrial Assistant - GE

* https://www.youtube.com/watch?v=eCQ-M2-kVhE
  Like Talking to a Wall - Unimpossible Missions - GE
  places sensitive accelerameters (microphones) on both sides of the Berline wall.
  Man reads a children's book to kids on the other side of the wall
  "... living in peace".

* https://www.youtube.com/watch?v=SQ_blyWcQoQ
   Raining Octopuses - GE
   ... whatever the world throws at us ... we're ready.

* https://www.youtube.com/watch?v=zIZHBzvgfGk
   'A Snowball’s Chance in Hell' - Unimpossible Missions - GE
   encases a snowball in a highly insulated 3D-printed container 
   lowered in a foundry 2,000 degrees hot.



## Reference Customers and use cases #

• Pitney Bowes
• RasGas
• E.ON
• Exelon
• City of San Diego
• Toshiba
• Lixil

## Ecosystem #

* Predix-Ready
* Predix-Certified
* Predix-Powered


<hr />

<a name="#CloudFoundry"></a>

## Cloud Foundry #

* https://en.wikipedia.org/wiki/Cloud_Foundry
* https://github.com/cloudfoundry
* https://www.cloudfoundry.org/

* https://github.com/cloudfoundry/cli
   is written in the <a target="_blank" href="https://golang.org/">Go language</a>.
   Now at cloudfoundry/tap/cf-cli-6.20.0 

* http://docs.cloudfoundry.org/devguide/#cf
* https://github.com/cloudfoundry/cli/tree/master/plugin_examples


<hr />

## <a name="#Devbox">Devbox</a> #

https://www.predix.io/resources/tutorials

https://www.predix.io/services/other-resources/devbox.html


## <a name="#LocalInstall">Local install</a> #

Use the script at https://github.com/PredixDev/local-setup


### <a name="Eclipse">Eclipse STS IDE</a> #

https://www.predix.io/resources/tutorials/journey.html#1607
advises the use of STS instead of using [Homebrew](/macos-homebrew/) to install 
   <a target="_blank" href="http://macappstore.org/eclipse-java/">eclipse-java</a>:

   <tt><strong>
   brew update<br />
   brew cask install eclipse-java
   </strong></tt>

   The response:

   <pre>
Please migrate your Casks to the new location and delete /opt/homebrew-cask/Caskroom,
or if you would like to keep your Caskroom at /opt/homebrew-cask/Caskroom, add the
following to your HOMEBREW_CASK_OPTS:
&nbsp;
  --caskroom=/opt/homebrew-cask/Caskroom
&nbsp;
For more details on each of those options, see https://github.com/caskroom/homebrew-cask/issues/21913.
==> Satisfying dependencies
complete
==> Downloading https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/R/eclipse-java-neon-R-macosx-cocoa-x86_64.tar.gz&r=1
==> Verifying checksum for Cask eclipse-java
==> Moving App 'Eclipse.app' to '/Applications/Eclipse.app'
🍺  eclipse-java staged at '/opt/homebrew-cask/Caskroom/eclipse-java/4.6.0' (0B)
   </pre>

   Anyway:

0. Use an interest browser to the STS website.
0. Select a download site to begin download. Wait for the file to download.
0. Unzip
0. In Finder, navigate inside the folder, such as:

   ~/Documents/workspace-sts-3.8.0.RELEASE

   This contains the server.

0. Move and/or rename the folder according to your organization's standards.

0. In Finder navigate to /Applications.
0. Move (drag and drop) STS.app to /Applications.
0. Open STS by double-clicking the icon.
0. Click Open icon for first-time confirmation.
0. Specify your workspace.



## STS (Spring Tools Suite) #

<a target="_blank" href="https://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse">
Included with STS</a> (Spring Tools Suite)
is the developer edition of Pivotal tc Server, 
the drop-in replacement for Apache Tomcat that’s optimized for Spring.

The Spring Insight console, tc Server Developer Edition, 
provides a graphical real-time view of application performance metrics that lets developers identify and diagnose problems from their desktops.


<a name="Spring"></a>

## Spring framework

The framework is based on the Java Spring framework,
which many now consider "heavy".

This is surprising considering most others in their industry
have gone to Python or React.

QUESTION: Why Spring and not Node or Python or React?

Maybe it's because there are more Java Spring developers unemployed than the other hotter frameworks?

Or that Spring is more "mature" as a framework since it's been around since the 90's.


## predixdev #

During register for a Predix account, 
each developer's GitHub account is granted access to 
the repository and a number of subrepositories
at

   * <a target="_blank" href="https://github.com/predixdev/">https://github.com/predixdev</a>



<a name="PCF"></a>

## Pivotal Cloud Foundry (PCF) #

<a target="_blank" href="https://www.youtube.com/channel/UC0ZYS0Y7b5oiVLvxGf4magw">
Cloud Foundry</a>

<a target="_blank" href="http://bit.ly/cloud-native-book">
O'Reilly book: Migrating Cloud-Native Application Architectures</a>


Pivotal leaders: Sam Ramji, Cornelia Davis, Casey West, Justin Smith, Jessica Frazelle, Kenny Bastani, Nicole Forsgren,

<a target="_blank" href="https://run.pivotal.io/">
PWS (Pivotal Web Services)</a>
provides $87 of initial fees and 2GB free. Whoopee!
After that, it's $0.03/GB hour.

PWS runs on PCF (Pivotal Cloud Foundry).

Deploying Microservice Architectures with Cloud Foundry

Spring Boot are microservices,
the "next chapter" of Spring Framework.
Spring Boot has a CLI based on the 
<a href="#CloudFoundry">Cloud Foundry CLI</a>
Actuator

Task modules in Spring Cloud Data Flow enables "data ingestion" with 
Spring Cloud Streams 
rather than batch like ETL for data warehouses,

The above uses Apache Maven commands

<a target="_blank" href="https://network.pivotal.io/products/pcfdev">
Pivotal PCDEV</a>

## Videos #

* <a target="_blank" href="https://www.youtube.com/watch?v=6h3iEy2MnsY">
   1:29 VIDEO: Inside the Predix Cloud</a>
   is a bunch of photos of a data center set to music.


## More #

This is one of several related topics:

{% include predix_links.html %}
