---
layout: post
title: "Predix basics"
excerpt: "About the Industrial Internet"
tags: [ML, GE, Predix]
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

Here are my "Cliffnotes" about 
Predix, GE's brand name for their 
<a target="_blank" href="https://twitter.com/search?q=%23IndustrialInternet">#IndustrialInternet</a>.

Like a music DJ, I've arranged the various videos and concepts into the sequence below
so you don't have to spend as much time making sense of this flood of material.

Sentences that begin with PROTIP are exclusive to this website,
to point out a wisdom or fact that many miss.


## Videos introduced by real workers #

You won't be taught how to actually DO anything in YouTube videos under the
"Predix Developers" section within 
<a target="_blank" href="https://www.youtube.com/channel/UCCQTdYGLd_jt9zpJ9kTroQg">
GE Digital YouTube account</a>.

But the videos are a good overview by people who actuallyy work there.

<amp-youtube data-videoid="NZfkQqdZHRo" layout="responsive" width="480" height="270">
</amp-youtube>
In <a target="_blank" href="https://www.youtube.com/watch?v=NZfkQqdZHRo">
this video: A Developer's Take on Predix </a>,
Matt Momont (<a target="_blank" href="https://twitter.com/muymoo">@muymoo</a>), 
front-end UI software engineer, says:

> "The apps can be built by one person. Everything is stood up for you and managed for you."

What is "everything"? 


<a name="Industrial"></a>

## Industrial Security and Scalability #

A lot if you're talking about large enterprises and 
their security and scalability concerns.
These issues are what "industrial" systems provide versus "consumer" oriented systems.

As an example of the <strong>velocity</strong> of <strong>data storage</strong>
within an industrial system,
jet engines (built by GE) on a plane creates 50 TB (terrabytes or 1,024 Gigabytes) 
of data during each day of flying.


## Partners #

<amp-youtube data-videoid="sYBQA2pOY-Q" layout="responsive" width="480" height="270">
</amp-youtube>
Denzil Samuels, GE Digital’s Global Head of Alliances, Channels, Business Development & Ventures at
<a target="_blank" href="https://ge.com/digital/partners/">ge.com/digital/partners</a>
in this <a target="_blank" href="https://www.youtube.com/watch?v=sYBQA2pOY-Q">
video: Predix: The Opportunity for Partners</a>
   [0:26] the industrial cloud is "a bigger opportunity than the enterprise and consumer cloud. And yet there is no one there."﻿
   VSI can build a business.
   Service providers working on connected devices talking to each other.
   ISVs write code that run without worrying about hardware, storage.
   Cisco can sell compute power.

TODO: List Predix partners


## GE's competition #

GE is in competition with other large 
"unicorn" technology giants.

Microsoft's CEO Satya Nadella
<a target="_blank" href="http://www.techrepublic.com/article/microsofts-satya-nadella-thinks-these-four-technologies-will-reshape-it/">
in their 2016 partner conference mentions</a> the leading-edge technologies to be:

   "Chatbots, machine learning, augmented reality, and cloud-based automation"

<amp-img width="630" height="324" alt="predix ms hololens2 viewing jet engine 620x324-c68.jpg"
src="https://cloud.githubusercontent.com/assets/300046/17077956/df11914e-50a1-11e6-817a-8d1fd9f92b4b.jpg">
</amp-img>
This photo from Microsoft shows a 3D shaded Hololens image of a jet engine
next to someone wearing a Microsoft Hololens headset.

<a target="_blank" href="http://scn.sap.com/community/pi-and-soa-middleware/blog/2016/07/12/webinar-jump-start-your-iot-integration-using-an-mqtt-adapter-on-sap-hana-cloud-platform-integration-service/">
SAP uses adapters for MQTT</a>
(MQ Telemetry Transport), a publish/subscribe, extremely simple and lightweight messaging protocol, designed for constrained devices and low-bandwidth, high-latency or unreliable networks.

Salesforce, IBM, and most others 
all mention their push to machine learning in 2016.


<a name="UseCases"></a>

### Big use cases #

A lot of the <a href="#UseCases">use cases</a> and examples for Predix
refer to giant wind turbines, giant aircraft engines, etc. 
because that's where GE has the experience and the data (time-series data).

PROTIP: GE was a major part of the first industrial revolution.
It can be said that GE is the company that literally invented the light bulb because it 
was formed mostly by Thomas Edison, who did invent the light bulb, the phonograph, 
and a bunch of other necessities.
(I visited his workshop in Michigan where it now lives as a museum
showing the various stages of inventions from early protoypes)

PROTIP: GE's size makes it uniquely able to serve other large industrial organizations.

GE's industry-specific divisions include: 
Energy, Healthcare, Transportation

Marketing materials specifically mention these industrial customers:

   * Pitney Bowes
   * RasGas
   * E.ON
   * Exelon
   * City of San Diego
   * Toshiba
   * Lixil

QUESTION: Example of start-ups or even consumers using Predix?

<amp-youtube data-videoid="LnVZaoiClUU" layout="responsive" width="480" height="270">
</amp-youtube>
This <a target="_blank" href="https://www.youtube.com/watch?v=LnVZaoiClUU">
2-minute video: GE’s Asset Performance Management Powered by Predix</a>
is a cartoon that asks "what if" and outlines the process:

[0:32] 1) Get connected. Capture data to get a more complete and accurate view of machine and equipment health.

[0:45] 2) Reliability management. Use andvanced analytices to get insights, predict and diagnose issues early, 
and respond before failure. These insights help you make better decisions.

[1:00] 3) Get optimized. Create maintenance strategies that balance reliability, performance, and cost.
Maintenance Optimization.

[1:42] The complex business challenges:

   * Rising costs
   * Safe operation
   * Performance & reliability
   * Security concerns
   * Workforce turnover

PROTIP: In the new industrial age, the focus is on <strong>proactive</strong> and predictive.
It's not enough for metrics to just measure the "productivity" of assets such as machines.

PROTIP: In the advanced IoT world, 
the role of people is no longer to run around collecting data and filling out forms.
People are relatively more expensive than machines.
So sensors (in stationary sensors and cameras, robots, and drones) gather the data.

PROTIP: How do humans supervise massive data streams?
This is when software can (and need to) do much of the planning and scheduling to available capacity.


   ### Buzzwords #

Several business and technical buzzwords are uttered 
in various marketing materials without much explanation:

QUESTION: What do these mean? Explain:

   * Connected assets 

   * Industrial data science

   * Industrial data management

   * Asset lifecycle

   * Operations & Intelligence

   * Monitoring & diagnostics

   * Risk mitigation



## Architecture video #

<amp-youtube data-videoid="UQqytypjbE4" layout="responsive" width="480" height="270">
</amp-youtube>
In <a target="_blank" href="https://www.youtube.com/watch?v=UQqytypjbE4">
this video: Predix Architecture</a>,
Steve Winkler, Principal Architect, Predix Platform Leadership, 
says Predix Machine is the stack installed locally on gateways and controllers
providing edge analytics, even when normal connectivity is not available.

The text of the vide is in this
<a target="_blank" href="https://www.predix.com/predix-architecture-whitepaper">
Predix Architecture white paper from Septempter 2015</a>.


### Archicture diagram #

This diagram illustratrate the major components within the "ecosystem" Predix operates:

<amp-img width="650" height="224" alt="predix arch diagrame_2x-650x224-c59.jpg"
src="https://cloud.githubusercontent.com/assets/300046/16947577/201aa83e-4d6d-11e6-8b07-33477ed395c2.jpg">
</amp-img>
Technical buzzwords spoken in this video include:

   * "Ops" is an abbreviation for "Operations".


### Services #

Questions in the $350 Predix Certified Developer on-line exam are grouped by the boxes above:

   * Edge software and services containing Predix Machine agents and sensors, on the left side
   * Assets

   * Analytics
   * Data Services
   * Data Management
   * Security
   * DevOps

   * App UI Services
   * Predix Cloud

Each of these is a category of cloud services listed at<br />
<a target="_blank" href="https://www.predix.io/catalog/services">
https://www.predix.io/catalog/services</a><br />
which also include:

   * Geospacial services
   * Intelligent Enviornments

PROTIP: I evaluate each service in the above categories at my
[Predix services](/predix-services/) page.


   <a name="UserSecurity"></a>

   ### User Security #

[6:00] into the video:
PROTIP: The principal way GE and most others invented during the first industrial revoluton 
to handle <strong>complexity</strong> under scale
was to separate workers into various departments of people
to reduce the overhead of groups continuously communicating with each other.
During the first industrial revolution, communication through telegraph and telegrams was expensive
and thus needed to be funneled and controlled.
This strategy is reflected in the security for software systems.

<amp-img width="427" height="344" alt="predix orgs and spaces 427x344-c76.jpg"
src="https://cloud.githubusercontent.com/assets/300046/17078454/ac9b8f3a-50b0-11e6-9490-e6de5a82f9d3.jpg">
</amp-img><br /><br />

Each part of the organization would handle just one aspect (one <strong>space</strong>) of the whole.
Consequently, software for one space typically do not consider the needs of another space
since the whole point of segregation is so departments don't have the overhead of communicating with each other.

PROTIP: The public internet is challenging the traditional segmentation mindset.
Advanced systems of today transcend organizational boundaries.
Workers who grew up with Twitter are used to having each person able to communicate with all others.
Those who grew up with Facebook are used to being in on conversations of their friends, no matter how far away.

### Microservices #

Predix adopts the microservices architecture popular today,
which consists of many "loosely coupled" microservices, each focused on a single task.
Microservices operating mostly independently,
so they are easier to build, maintain, and scale.

See <a target="_blank" href="http://bit.ly/cloud-native-book">
O'Reilly book: Migrating Cloud-Native Application Architectures</a>


## Predix fundamentals #

<amp-youtube data-videoid="gPjsmLKd6d8" layout="responsive" width="480" height="270">
</amp-youtube>
This <a target="_blank" href="https://www.youtube.com/watch?v=gPjsmLKd6d8">
51 minute video</a> summarizes what Predix offers.

> From machine to 
   mobile, a <a href="#CloudPlatform">
   cloud-based developer platform</a>
   for creating innovative, highly <a href="#Industrial">
   scalable, industrial internet</a>
   applications that turn <a href="#RealTimeData">
   real-time operational data</a>
   into <a href="#Insights">
   actionble insights</a>.

Click on each link in the paragraph above to go directly to more about each aspect.

This last phrase, "actionable insights" is the revolution.
It's what different, and worth a lot of money.


<a name="#Insights"></a>

## Actionable insights #

<amp-img width="641" height="235" alt="predix real-time vid 641x235-c66.jpg"
src="">
</amp-img><br /><br />

PROTIP: Most existing systems that produce a bunch of graphs with lines crossing each other 
expect human experts to
interpret what the various lines mean and what to do about them.

In today's world, a company can be running hundreds of computers,
each providing dozens of "metrics" about itself.
The introduction of robots and drones and all sorts of things monitoring everything,
it's too much to digest by any one person.

PROTIP: The "artificial intelligence" that Predix offers can interpret the various lines simultaneously
and <strong>recommend</strong> specific actions, 
or even invoke commands for people to take care of what it thinks needs to be done.
But hopefully not quite to the sophistication (and terror) of 
computer systems portrayed in the fictional 
<a target="_blank" href="https://en.wikipedia.org/wiki/Person_of_Interest_(TV_series)">
"Personal of Interest" TV series</a>.

<a target="_blank" href="http://www.techrepublic.com/article/microsoft-brings-ges-predix-iot-solution-to-the-azure-cloud-platform/">
In July 2016</a>,
GE announced that Predix will also run in the Microsoft Azure cloud.

PROTIP: Access to the Microsoft Azure cloud links Predix to Microsoft's Cortana 
Artificial Intelligence capabilities.


<a name="CloudPlatform"></a>

## Cloud Platform #


<a name="DevPortal"></a>

### Developer Portal #

<amp-youtube data-videoid="KklEcfnA0yg" layout="responsive" width="480" height="270">
</amp-youtube>
This <a target="_blank" href="https://www.youtube.com/watch?v=KklEcfnA0yg">
6-minute video: Predix.io Developer Portal Walkthrough</a> 
begins from 
<a target="_blank" href="https://www.predix.io/">
https://www.predix.io</a>, the Predix Developer Portal.

   <a name="#Starter"></a>

   ### Starter Packs #

[1:07] <a target="_blank" href="https://www.predix.io/catalog/services/">
Services Catalog page</a>

[2:27] The "cf bind-service [app-name] my-service-instance"
is a command invoking the cf (cloud foundry) cli (command line) tool.

[3:32] The application with the turbine picture has a URL of
"https://rmd-ref-app.run.aws-usw02-pr.ice.predix.io"
running in a temporary instance within the "aws-usw02" (Amazon Web Service us-west-2) 
cloud envionment is the 
"Reference App" defined as an example (baseline) 
for how a completd app looks and works.
It includes data for monitoring and diagnostics of things running remotely from an office.
Thus the abbreviation RMD, which stands for Remote Monitoring and Diagnostics.

   <a name="RealTimeData"></a>

   ### Real-time data #

<amp-img width="641" height="235" alt="predix real-time vid 641x235-c66.jpg"
src="https://cloud.githubusercontent.com/assets/300046/17075633/c3aad41a-5056-11e6-905c-67adf65348d8.jpg">
</amp-img><br /><br />

[4:54] <a target="_blank" href="https://github.com/predixdev/predix-rmd-ref-app/">
https://github.com/predixdev/predix-rmd-ref-app/</a>

   WARNING: Not all services available are used by the Reference app,
   which may use an older version of services.

[5:25] If you're really stuck, file a support ticket at lower-left on
<a target="_blank" href="https://www.predix.io/support/">
predix.io/support/</a>

[5:52] <a target="_blank" href="https://www.predix.io/community/blog/">
Community Blog page</a> is where events are announced.

   <a name="PortalResources"></a>

   ### Portal: Resources #

[5:53] <a target="_blank" href="https://www.predix.io/resources/">
Resources page at https://www.predix.io/resources</a>
   lists free videos but doesn't say where they are:

   * Introduction to <a href="#CloudFoundry">Cloud Foundry</a>
   * Implementing Security on Predix
   * Modeling Assets
   * UI Basics


## UX/UI Visual Design system #

As you might expect from a large corporation,
someone at GE corporate would invent rules around design of navigation, form layout, toggles, sliders, etc.
for everyone else in the company.

The "design system" is a grand name that encompasses the
Visual Language + Interaction Patterns + Technology Framework
for personas.

GE's Software Design Hub website
provides a reference implementation, stencils, and copyrighted GE Inspira font 
<a target="_blank" href="http://fontsgeek.com/fonts/GE-Inspira-Bold">
Bold</a>,
<a target="_blank" href="http://fontsgeek.com/fonts/GE-Inspira-Italic">
Italic</a>,
<a target="_blank" href="http://fontsgeek.com/fonts/GE-Inspira-Bold-Italic">
Bold Italic</a>,
<a target="_blank" href="http://fontsgeek.com/fonts/GE-Inspira-Regular">
Sans Regular</a>,
<a target="_blank" href="http://fontsgeek.com/fonts/GE-Inspira-Small-Caps-Regular">
Small Caps Regular</a>,
and
GE Inspira Serif?.

Download each by clicking on each link above.
BTW, I also like 
<a target="_blank" href="http://fontsgeek.com/fonts/GE-Iron-Works-Regular">
GE Iron Works Regular</a>.

<strong>Jeff Crossman</strong> ‏(<a target="_blank" href="https://www.twitter.com/jeffcrossman/">@jeffcrossman</a>),
GE Designer, wrote on 
<a target="_blank" href="https://medium.com/ge-design/ges-predix-design-system-8236d47b0891#.jqxhx95eb">
Medium: GE’s Predix Design System</a> what he said in

<strong>David Cronin</strong> (<a target="_blank" href="https://www.twitter.com/davcron/">@davcron</a>)
leads GE's design in
<a target="_blank" href="https://vimeo.com/132580829">
this 36 minute Vimeo video</a> and
<a target="_blank" href="http://www.slideshare.net/davcron/the-ge-design-system-and-thoughts-about-craft-at-scale">
powerpoint</a>
on May 13, 2015 at Enterprise UX 2015


<a name="PortalClassess"></a>

## Classes #

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

Certifications offered by GE:

* Predix-Ready
* Predix-Certified
* Predix-Powered


<hr />

<a name="#CloudFoundry"></a>

## Cloud Foundry #


<a name="PCF"></a>

## Pivotal Cloud Foundry (PCF) #

<amp-youtube data-videoid="6h3iEy2MnsY" layout="responsive" width="480" height="270">
</amp-youtube>
<a target="_blank" href="https://www.youtube.com/watch?v=6h3iEy2MnsY">
1:29 VIDEO: Inside the Predix Cloud</a>
is a bunch of photos of a data center set to music.


Per <a target="_blank" href="https://en.wikipedia.org/wiki/Pivotal_Software">
Wikipedia</a>,
Pivotal Software was formed in 2012 after spinning out of EMC Corporation. 
On April 24, 2013, the organization announced both a $105 million investment from General Electric and its PaaS offering, 
Pivotal Cloud Foundry (PCF), a cloud-enabled application platform for private cloud initiatives and public cloud providers.

<a target="_blank" href="https://run.pivotal.io/">
PWS (Pivotal Web Services)</a>
provides $87 of initial fees and 2GB free. Whoopee!
After that, it's $0.03/GB hour.

PWS runs on PCF (Pivotal Cloud Foundry).


Several videos are in the 
   <a target="_blank" href="https://www.youtube.com/channel/UC0ZYS0Y7b5oiVLvxGf4magw">
   Cloud Foundry channel on YouTube</a>.

0. Click on the Wikipedia article at:<br />
   <a target="_blank" href="https://en.wikipedia.org/wiki/Cloud_Foundry/">
   https://en.wikipedia.org/wiki/Cloud_Foundry</a>

0. Click on the home page at<br /><a target="_blank" href="https://www.cloudfoundry.org/">
   https://www.cloudfoundry.org</a>

   NOTE: Several major corporations involved include GE, IBM, HP.

   <a name="#CloudFoundryCLI"></a>

   ### Cloud Foundry CLI #

* https://github.com/cloudfoundry/cli
   is written in the <a target="_blank" href="https://golang.org/">Go language</a>.
   Now at cloudfoundry/tap/cf-cli-6.20.0 

0. CF is open-sourced at:<br />
   <a target="_blank" href="http://docs.cloudfoundry.org/devguide/#cf">
   http://docs.cloudfoundry.org/devguide/#cf</a>

* https://github.com/cloudfoundry/cli/tree/master/plugin_examples

Deploying Microservice Architectures with Cloud Foundry


## People and presentations #

Greg Petroff (<a target="_blank" href="https://twitter.com/gpetroff">@gpetroff</a>), 
Chief Experience Office, GE Digital

Pivotal leaders: Sam Ramji, Cornelia Davis, Casey West, Justin Smith, Jessica Frazelle, Kenny Bastani, Nicole Forsgren,

https://18f.gsa.gov/2016/07/13/technology-transformation-services-looking-for-new-commissioner/

<hr />

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


Videos from GE's Minds+ Machines conference 
<a target="_blank" href="https://www.GEmindsandmachines.com/">
GEmindsandmachines.com</a> 29 Sep - 1 Oct 2015

* https://www.youtube.com/watch?v=wNKxaTzRu5c
   Predix Deep Dive - Minds + Machines 2015 

* http://www.slideshare.net/GETurkiye/predix-cloud?next_slideshow=1
predixsamsa-150915072353-lva1-app6892(1).pdf


## Meetup groups #

Meetup groups are forming in cities around the world.
It's a great way to meet people face-to-face.

Some groups video-stream and record their presentations.

<a target="_blank" href="http://www.meetup.com/find/?allMeetups=false&keywords=predix&radius=Infinity&userFreeform=Mill+Creek%2C+WA&mcId=z98082&mcName=Mill+Creek%2C+WA&sort=recommended&eventFilter=mysugg">
Search results for "Predix" regardless of location</a>
yields the following (on the day of search).

PROTIP: Groups listed here are ranked by number of members who joined the group.
Although the largest group is in the Silicon Valley,
groups in Northern and Northwestern cities big during the first industrial revolution are popular:

0. <a target="_blank" href="http://www.meetup.com/Industrial-Internet-of-Things/">
   Industrial IoT Group</a>, 514 worldwide

0. <a target="_blank" href="http://www.meetup.com/Predix/">
   Silicon Valley, California</a>, 358

0. <a target="_blank" href="http://www.meetup.com/GE-Europe-Predix-Meetup/">
   Europe: Paris, France</a>, 290

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Chicago-Industrial-Internet/">
   Chicago, Illinois</a>, 230

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Boston-Industrial-Internet/">
   Boston, Massachusettes</a>, 207

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Cincinnati-Industrial-Internet/">
   Cincinnati</a>, 177

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-NYC-Industrial-Internet/">
   New York City</a>, 167

0. <a target="_blank" href="http://www.meetup.com/Milwaukee-GE-Predix-Industrial-Internet/">
   Milwaukee, Wisconsin</a>, 112

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Houston-Industrial-Internet/">
   Houston, Texas</a>, 103

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Atlanta-Industrial-Internet/">
   Atlanta, Georgia</a>, 94

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Dallas-Industrial-Internet/">
   Dallas, Texas</a>, 89

0. <a target="_blank" href="http://www.meetup.com/GE-Predix-Detroit-Industrial-Internet/">
   Detroit, Michigan</a>, 73

0. <a target="_blank" href="http://www.meetup.com/PredixTokyo/">
   Tokyo, Japan</a>, 33

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Seattle/">
   Seattle, Washington</a>, 22

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-LA/">
   Los Angeles, California</a>, 21

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Portland/">
   Portland, Oregon</a>, 20

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Austin/">
   Austin, Texas</a>, 15

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Washington-DC/">
   Washington DC</a>, 11

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Toronto/">
   Toronto, Ontario, Canada</a>, 11

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Delhi/">
   Delhi, India</a>, 10

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Pittsburgh/">
   Pittsburg, Pennsyvania</a>, 10

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Mumbai/">
   Mumbai, India</a>, 0

0. <a target="_blank" href="http://www.meetup.com/Predix-Builders-of-Bangalore/">
   Bangalore, India</a>, 0


## More #

This is one of several related topics:

{% include predix_links.html %}
