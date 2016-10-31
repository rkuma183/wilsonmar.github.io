---
layout: post
title: "Finding fault in Java Apps"
excerpt: "How to find and fix"
tags: [IoT, Raspberry, Mono, Mac]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct. 
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial explains the tools and techniques for finding faults in Java application code
and configurations.

## Potential root causes

* Configuration settings inappropriate (defaults used)
* Network equipment failure
* Server hardware (memory, inadequate
* Code causing memory leaks
* Inadequate free disk space

## Symptoms

* Delays in response time (due to garbage collection, slow database access, etc.)
* Memory leaks
* CPU spikes
* Heavy disk usage (thrashing, swapping)
* etc.

## The tools

0. Operating System level metrics (collected by Microsoft Windows Perfmon)
0. Operating System log storage and analysis

0. Application logs storage and analysis
0. Application log readers

0. JMX to collect from JVM Garbage Collection
0. JVM Garbage Collection log readers

0. Operating System thread dump readers

0. [Java Code Profilers](/jvm-profilers/)

## Our services

* Interview to collect relevant facts and perspectives
* Advise on courses of action
* Design architecture and project plans
* Assist with implementation
* Verify
* Educate

> Call me 