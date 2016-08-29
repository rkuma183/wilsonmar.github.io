---
layout: post
title: "AppDynamics"
excerpt: "It knows you when your good and bad ..."
tags: [Clouds, Monitoring, Analytics]
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

This is a hands-on narrated tour on how to learn AppDynamics to detect trouble.

{% include _intro.html %}

<hr />

## Explore #

<strong>Agents</strong> are installed on each machine you wish to monitor.
AD claims "Up to 10,000 per controller"
at "less than 2% overhead".
They automatically discover servers (very cool, especially on Hadoop clusters).

The AppDynamics Controller has both 
<a target="_blank" href="https://docs.appdynamics.com/display/PRO42/Quick+Install">
installed on-premises</a>
and hosted on public cloud (SaaS option).

The agents can thus obtain Java Thread Pool and other JVM stats.

* <a target="_blank" href="https://www.youtube.com/watch?v=qO1M2-J4jYs">
   Intro to AppDynamics</a> by AD partner Emergent 360.
   24 Nov 2015.

* <a target="_blank" href="https://www.youtube.com/watch?v=yygbxv4lS7Y">
   Demo</a>


<hr />

## Cool features #

The Flow Map provides icons representing each 
<strong>tier</strong> (Web-Tier-Services, Database, etc.).
Metrics obtained are classified compared to averages observed in the past.

When an issue is detected, the icon turns red and
diagnostic snapshots are automatically captured.

AD displays response time captured by entry and exit points,
down to specific page iframes.

   PROTIP: How does each page compare against metrics predicted during performance testing?
   Identify surprises so you don't have to look at what you already know.


## So what? #

There are several aspects that sales pitches don't cover,
but keep actual users up at night.

0. <strong>Browser</strong> distribution pie charts on Web App Dashboards 
   is based on what clients responds. Some networks strip that out, so watch out for
   "unknown".  These stats can differ significantly versus Google Analytics if
   you also have that installed.

   PROTIP: Identify the percentage of browser distribution chart 
   associated with specific customer accounts so you can track their movement 
   from IE to modern browsers needed by React.js and other web apps.

0. <strong>Synthetic users</strong>
   are useful not just to identify issues at off-hours.

   PROTIP: Synthetic users ensure that programs don't page off memory and 
   cause delays (bad performance) for 
   the first user who gets on the system in the morning.

0. PROTIP: AD gathers a huge amount of information every hour.
   How many GB per day is that rate?
   
   PROTIP: There is a cost to keep data.
   Have a plan for how long to keep data on AD's servers,
   Many people save just the summary information for management reporting.
   
   PROTIP: Often we don't realize what analysis to do unti later, and by then
   the historical data is gone.
   How much is longitudinal operational analysis is worth?
   This needs to be decision by management so they are not disappointed later.

0. AD provides a way to create graphs dynamically.

   PROTIP: Consider dumping monitoring data for analysis using your organization's
   analytics product such as ElasticSearch, Tableau, etc.
   This would focus leverage of skills brough to this work,
   and (more importantly) make it easier and more likely for
   other statistics in the organization to be integrated,
   such as impact performance has on dollar sales, etc.

   <img align="right" alt="appd-actions-selections-2015-376x361-71kb.png" width="376" height="361" src="https://cloud.githubusercontent.com/assets/300046/18060867/89a6cd88-6ddd-11e6-8d4d-01362a711b95.png">
0. AD has <strong>Health Rules</strong> and policies that trigger actions.

   PROTIP: If the action is to send an email,
   someone is needed to constantly go through screens to notice problems.  
   This is a 3-shift job, with no breaks on weekends and holidays.
   So plan work schedules and training for this.
   Some use 12 hour workdays and office accross the globe for this reason.

   PROTIP: Use "Choas monkeys" to create havoc randomly, in production,
   to ensure that responses are adequate.

   PROTIP: If the response is to run a script, 
   has that script been tested in production?
   Many organizations don't have an enviornment to conduct such tests.

   PROTIP: If the response is to add more servers,
   how much free server capacity available?

   PROTIP: If the server is already down, there is not much point
   (and wastes precious time) to take diagnostics dumps.

0. Ultimately, organizations need to <strong>proactively predict</strong>
   rather than responding to alerts which occur.

   In my opinion, AD can do more than it is in this aspect.
   For example, project the <strong>trend</strong>
   of disk space usage to identify the urgency so 
   the appropriate notification method is used.

0. PROTIP: It helps to identify up front specifically who should be called 
   (and when) for specific alerts that can appear.
   
   PROTIP: Escalation specification is the speciality of PagerDuty software.

0. <strong>End-user Response-Time Distribution</strong> spikes on Web App Dashboards 
   identify the percentile of each spike.
   A spike on the 50th percentile is more troubling becuase of its consistency
   than one at 90th percentile or above.



<hr />

## Integrations #

The AD Controller can integrate with various other systems.

But it's through one-way HTTPS

Alphabetical:

* https://www.appdynamics.com/community/exchange/extension/docker-monitoring-extension/">
   Docker</a>

* https://github.com/carlosdoki/extensionSolarwinds">
   SolarWinds</a>

* https://www.appdynamics.com/community/exchange/extension/websphere-mq-monitoring-extension/">
   Websphere MQ</a>


<hr />

### Cloud Security #

The biggest concern enterprises have with cloud services is their security.

* https://community.appdynamics.com/t5/Knowledge-Base/Introduction-to-AppDynamics-with-SSL/ta-p/20580?site=community


<hr />

### Social #

<hr />

### Social #

<a target="_blank" href="https://www.appdynamics.com/community/">
<strong>https://www.appdynamics.com/community</strong></a><br />
is the one-stop shop.

<a target="_blank" href="https://www.appdynamics.com/community/events/appsphere-2016">
AppSphere</a> in 2016 is on November 14 at the Marriott Cosmopolitan Las Vegas.

<a target="_blank" href="https://twitter.com/@AppDynamics/">
Twitter: @AppDynamics</a>

Email: <a target="_blank" href="mailto:developer@artik.cloud">developer@artik.cloud</a><br />
answered by Developer Evangelists<br />
<a target="_blank" href="https://www.linkedin.com/in/jswatton/">
   Jeanine (Swatton) Jue</a><!-- j.jue@samsung.com -->

* <a target="_blank" href="https://www.linkedin.com/in/yujingwu">
   Dr. Yujing Wu</a> (@yujingwu)

LinkedIn shows Samsung America being based in Seattle and Bellevue, Washington.
Smart Home in Mountain View, California.
Home Appliances in Rigefield Park, New Jersey and Minneapolis, Minnesota.

*  <a target="_blank" href="https://www.artik.io/blog/cloud/">
   artik.io/blog/cloud</a>
   is the user forum.





## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
