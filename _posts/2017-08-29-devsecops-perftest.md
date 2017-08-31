---
layout: post
title: "DevSecOps PerfTest Shift-Left Hands-On Course"
excerpt: "For performance engineering demo at end of every sprint"
tags: [DevOps, DevSecOps]
shorturl: "https://goo.gl/"
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

To ensure quality at speed, <a target="_blank" href="http://www.scaledagileframework.com/system-demo/">System Demos</a> by Agile software developers at the end of each two or three week sprint
must now include automated performance status.

Continuing the traditional approach of performance testing only before final release to production
means hiding of potentially major risks and technical debt.
Such organizations need to make performance testing and engineering "shift-left" earlier in the software development lifecycle.

However, the DevSecOps toolchain today consist of many moving parts from many software vendors. The most popular options from among the <a target="_blank" href="https://wilsonmar.github.io/ci-cd">21 groups of technologies</a> are Git, Maven, Nexus, Jenkins, Vault, SonarQube, Selenium, Ansible, etc. There are subtleties and substitutes to each of these.

## Hands-on course

This course provides you <strong>hands-on</strong> experience using the most popular tools within a guided end-to-end tour:

   <amp-youtube data-videoid="ZG073qSgh_0" layout="responsive" width="480" height="270"></amp-youtube>
   VIDEO: https://youtu.be/ZG073qSgh_0

In this two-day class, we avoid spending too much time with installation. Many examples require participants to first do the installation themselves, which requires skill and time.

The intent of this class is to provide a way for participants to see an end-to-end example of how DevOps works, wheras most vendors only focus on a little part of the whole sequence.

That's the value add over the one-hour overviews that only talk about concepts. Participants are provided <strong>cloud-based instances</strong> to work on during the class. This enables focus during the class to build practical skill working with software:

1. Change an Entity diagram and see JHipster generate a complete stack of servers using the latest DevOps software. This approach enables specific technologies to be swapped out for another.
2. Watch a smoke test run automatically after a build.
3. Edit a file and push it to GitHub to kick off a test run from Jenkins.
4. View the report of GC and APM tracing metrics from the run.
5. View run result trend history on SonarQube (which defines done to Agile teams).
6. Make a configuration setting on Jenkins and submit a job.
7. Run performance tests to compare the impact of configuration changes to identify the maximum profit per transaction.

You will leave the class with a plan for proactive actions presenters learned from experience:

- Maps to see how various pieces fit together (https://github.com/wilsonmar/oss-perf)
- A list of specific differences between various options to address needs.
- Strategies to achieve the mindset change necessary (from ticket-writing police and guards to enablers to build in quality)
- Ways to manage secrets in test scripts within GitHub using Hashicorp Vault
- Steps to structure and sequence incremental Agile sprints to deliver value with less pressure and more teamwork


https://github.com/wilsonmar/oss-perf

https://github.com/cgivre/metis-data-science-intro

