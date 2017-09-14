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
* Winlogbeat collects and sends Windows Event logs data
* Libbeat collects and sends custom data defined in Golang programs.

Beats usually sends its data to a Logstash receiver.



## Beats Marketing

The product marketing page for LogStash is at:

  <a target="_blank" href="https://www.elastic.co/products/beats">
                      https://www.elastic.co/products/beats</a>

ElasticSearch the company hired the original author (Jordan Sissel) to work on it full time.

Before forwarding, Logstash can parse and normalize varying schema and formats.



## More #

This is one of a series on Elastic Stack and monitoring:

{% include monitoring_links.html %}
