---
layout: post
title: "Elastic Beats"
excerpt: "Minions to collect data from each server"
tags: [ELK, ecosystem]
filename: "elastic-beats.md"
shorturl: "https://goo.gl/"
image:
# elk-beat-arch-1900x500-102084.jpg
  feature: https://user-images.githubusercontent.com/300046/30410257-2d3fa8b0-98c7-11e7-9467-d35837b592a2.jpg
  credit: JP Toto on Pluralsight
  creditlink: https://app.pluralsight.com/library/courses/centralized-logging-elastic-stack/table-of-contents
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This section describes how to install, configure, and use the Beats component within the Elastic Stack, previously called ELK stack before Beats was added in 2016.

Beats is the collective term for Elastic's utilities that run on servers to read logs from a variety of sources.

Beats are small, lightweight (written in Golang)

* Filebeat collects and sends <strong>text</strong> log files.
* Metricbeat collects and sends operating system and application data.
* Packetbeat collects and sends network monitoring data.
* <a href="#Winlogbeat">Winlogbeat</a> collects and sends Windows Event logs data
* Libbeat collects and sends custom data defined in Golang programs.
* Heartbeat
* Auditbeat

Beats usually sends its data to a Logstash receiver, but they can send directly to ElasticSearch database.


## Beats Marketing

The product marketing page for LogStash is at:

  <a target="_blank" href="https://www.elastic.co/products/beats">
                      https://www.elastic.co/products/beats</a>

## Install

Beats is written in [the Go Language (Golang)](/golang/), which compiles to a static binary containing its own VM. So there is no need to install a run-time such as JVM to run Java.

Alternatives to get bits onto a server:

A) Ansible

B) Chef

C) Microsoft SCCM

D) Direct download

### Download Beats

1. https://www.elastic.co/downloads/beats



## Processing

Before forwarding, Logstash can parse and normalize varying schema and formats.

   * Reading
   * Filtering
   * Enhancing
   * Forwarding

## Metricbeat modules

   * System Logs
   * Apache web server
   * NginX
   * HAProxy

   * MongoDB
   * MySQL
   * PostgreSQL
   * Redis

   * Zookeeper (Puppet)


<a name="Winlogbeat"></a>

## Winlogbeat

0. Download and unzip.

   File `winlogbeat.full.yml` contains ALL specifications.

   File `winlogbeat.template.es2x.yml` should be ignored since you're not using v2.

   NOTE: Formats changed in v5, so Python scripts/migrate_beat_config_1_x_to_5_0.py is provided to migrate.

0. Edit the `winlogbeat.yml` configuration file 

   <pre>
   ignore_older: 72h
   </pre>

0. Run in PowerShell: 

   <tt><strong>winlogbeat.exe -c winlogbeat.yml
   </strong></tt>

0. Install as a service within PowerShell CLI:

   install-service-winlogbeat.ps1

scripts/import_dashboards.exe



## Resources

## More #

This is one of a series on Elastic Stack and monitoring:

{% include monitoring_links.html %}
