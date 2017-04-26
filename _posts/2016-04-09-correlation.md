---
layout: post
title: "Correlation"
excerpt: "Identify relationships between TPS and metrics"
shorturl: "https://goo.gl/jSGYPU"
modified:
tags: []
image:
# feature: pic blue black stars spin 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621973/fe6e21a6-0583-11e6-9a94-a969a51759b6.jpg
  credit: Jeremy Thomas
  creditlink: https://www.flickr.com/photos/132218932@N03/page2
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here is how to analyze system performance automatically.

## Objectives

Our objective is a way to create a structure and 
proactively identify issues before they occur.

??? and use a regression formula that correlates processing data and

Processing data is *HPS = Hits per second and TPS = Transactions per second 


## Architecture

We prefer to use all open source software components.

For example, the "TICK" stack:

<a target="_blank" title="tick_stack 1570x750" href="https://cloud.githubusercontent.com/assets/300046/25427304/2461a5fe-2a40-11e7-8d55-9a07d002f133.png">
<img alt="tick_stack 650x311" src="https://cloud.githubusercontent.com/assets/300046/25427313/2d5695de-2a40-11e7-94d8-b088f59e2534.png"></a>

   * <a target="_blank" href="https://github.com/influxdata/telegraf">
   Telegraf</a> 
   is a plugin-driven server agent for collecting and reporting metrics.
   It pulls into one place metrics from StatsD, Redis, Elasticsearch, PostgreSQL, and more.

   * <a target="_blank" href="https://github.com/influxdata/influxdb">InfluxDB</a> 
   is a time-series database built from the ground up to handle high write and query loads.

   * <a target="_blank" href="https://github.com/influxdata/chronograf">Chronograf</a> 
   is a graphing and visualization application for performing ad hoc exploration of data.

   * <a target="_blank" href="https://github.com/influxdata/kapacitor/tree/master/services">
   Kapacitor</a> is a data processing framework providing alerting, anomaly detection, and action frameworks.

<a target="_blank" title="tick plus 800x684.png" href="https://cloud.githubusercontent.com/assets/300046/25431188/8e1023ec-2a4d-11e7-9558-54787d03e6ee.png">
<img alt="tick plus 800x684.png" src="https://cloud.githubusercontent.com/assets/300046/25431188/8e1023ec-2a4d-11e7-9558-54787d03e6ee.png"></a>
<small><a target="_blank" href="https://thehoard.blog/monitoring-with-influxdatas-tick-stack-cafe82a07efc">*</a></small>

Charts (files that describe a set of Kubernetes resources) read by Helm.

https://github.com/influxdata/sandbox

Addtitional information:

   * https://docs.influxdata.com/influxdb/v1.2/guides/hardware_sizing/

   * <a target="_blank" href="https://www.digitalocean.com/community/tutorials/how-to-monitor-system-metrics-with-the-tick-stack-on-centos-7">
   Tutorial to run on Digital Ocean's cloud using Centos7</a>

   * https://github.com/influxdata/TICK-docker/blob/master/README.md

   * https://gist.github.com/travisjeffery/43f424fbd7ac677adbba304cef6eb58f

   * https://github.com/influxdata/influxdb-comparisons

   * https://github.com/influxdata/influxdb-testing

Where custom programming is needed, the preference is Python and Java.


## Plan

   ### App under load

0. Select a sample target application to analyze (EasyTravel Java/Spring app from Dynatrace has code)
0. Ansible: Establish a test environment for the application
0. Telegraf: Instrument application environment to collect mentrics time series data

   ### Server load Data

0. JMeter: Create load scripts that impose a gradually increase in artifical load until overload
0. JMeter: Conduct load-induced runs to collect processing and monitoring data along the same time series
0. Custom: Extract run results into a format to load into database
   (https://github.com/influxdata/whisper-migrator)
0. Custom: Load into database

0. Custom: <strong>Identify period with peak rate of processing (transactions per second)</strong>
0. Custom: Obtain metadata around peak periods (number of users imposing load)
0. Custom: Match metrics observed during peak steady-state period

   ### Initial metrics

0. InfluxDB: Create a database using the appropriate technology vendor
0. Load initial metrics into database and index
0. Verify backup and recovery procedures
0. Chronograf: Produce initial (simple) visualizations

   ### Regression formula

0. Calculate regression formula 

   ### Predictive

   To identify conditions before the point of inflection to identify triggers.

0. Chronograf: Explore by visualizing ratios (such as memory used per active user)
0. Kapacitor: Setup alerts

   Kapacitor has its own DSL called TICKscript.

   ### Action

0. Custom: Automatic response to alerts (such as bring additional servers up)



