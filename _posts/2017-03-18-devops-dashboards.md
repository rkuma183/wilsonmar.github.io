---
layout: post
title: "Hygieia DevOps Dashboard"
excerpt: "All the stats that fits on a dashboard"
tags: [Clouds, IoT, Metrics]
shorturl: "https://goo.gl/tkGA1u"
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

Hygieia (pronouced hi-GEE-ya, the name of the <a target="_blank" href="https://www.wikiwand.com/en/Hygieia">
daughter of the Greek god of medicine and personification of hygiene and prevention of illness</a>.

The name is adopted for an open-source software project created at CapitalOne (the credit card company) 
which displays in a single <strong>dashboard</strong> the various statistics of a software delivery pipeline.

## Websites

<a target="_blank" href="https://www.youtube.com/watch?v=WuPQOBMmzSE">
https://www.youtube.com/watch?v=WuPQOBMmzSE</a> [4:01] May 10, 2016

<a target="_blank" href="https://developer.capitalone.com/opensource-projects/hygieia/">
https://developer.capitalone.com/opensource-projects/hygieia</a>

<a target="_blank" href="https://github.com/capitalone/Hygieia/">
https://github.com/capitalone/Hygieia</a>



<a name="TeamDashboard"></a>

## Team Dashboard

At the team level:

   * Features (work items)
   * Code commits per day
   * Builds 
   * Quality of code from scans for compliance to rules for security and other aspects of coverage
   * Deployments to servers

<a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24074613/8b7f7f62-0be2-11e7-9c78-867c0343fd00.jpg">
<img width="400" alt="hygiea-screenshot-2848x1666" src="https://cloud.githubusercontent.com/assets/300046/24074613/8b7f7f62-0be2-11e7-9c78-867c0343fd00.jpg"><br />(Click for pop-up full image)</a>



## Program-level Dashboard

At the program level:

   commit -> build -> DEV -> QA -> INT -> PERF -> PROD

![hygieia-pgm-shift-left-600x219](https://cloud.githubusercontent.com/assets/300046/24074674/af146176-0be3-11e7-9eac-358a0a657ba7.png)
<a target="_blank" href="https://www.dynatrace.com/blog/scaling-continuous-delivery-shift-left-performance-to-improve-lead-time-pipeline-flow/">*</a>

PROTIP: Symptoms of health should also include:

   * <strong>Cycle time</strong> from idea to production

   * Man-Months of backlog in innovations and defect fix effort

   * Man-Months of "Technical Debt"


## Trends over time 

Displays of <strong>trends</strong> over time are important to keep numbers in perspective,
both to keep from over reacting to momentary anomalies and 
from under-reacting to underlying patterns that need to be fixed.

So it's better to have a set of rotating dashboards about trends than
having just a number on a dashboard <strong>without context</strong> of whether that number is "good" or "bad".

Having an arbitrary <strong>target number can be counter-productive</strong> unless 
individual employees have a coherent
approach that balances the many conflicting needs.

For example, an insistance on "100% all the time" can lead staff to prioritize caution 
over <strong>innovation</strong>.



## Executives

<strong>Executives and business managers</strong>
typically focus on <strong>financials</strong> :

   * Total cost per transaction ratio
   * Total cost as percent of revenue
   * Total revenue per employee

They favor <strong>trends</strong> over time that reflect <strong>customer experience</strong>:
(not just internal processes)

   * Availability of the system 
   * Productivity of end-users using the system being developed, such as<br />
   purchases, invoices, or other business transactions processed during a <strong>peak hour</strong>.

   * Customer Net Promoter Score
   * Employee satisfaction
   * Employee turnover rate

