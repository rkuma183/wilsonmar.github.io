---
layout: post
title: "Elastic Kibana setup"
excerpt: "Show all the numbers in a dashboard"
tags: [apple, mac, setup]
shorturl: "https://goo.gl/8mGgPF"
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

Kibana presents visualization (a dashboard) from Elasticsearch databases.

WARNING: Kibana 4 has a completely different approach to creating charts than Kibana 3.


<a name="Install"></a>

## Install

Kibana was originally written in JavaScript using NodeJs.

0. Manually install Kibana on Ubuntu:

   <tt><strong>wget -qO - https://artifacts.elastic.co/GPG-Key-elasticsearch | sudo apt-key add -OK
   </strong></tt>

   The response expected is just "OK".

0. Update the installer:

   <tt><strong>echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list deb https://artifacts.elastic.co/packages/5.x/apt stable main
   </strong></tt>

0. Update and install:

   <tt><strong>apt-get update && apt-get install kibana
   </strong></tt>

   
   ### Edit configuration

0. Navigate into folder `/etc/kibana` to edit file `configuration.yml`.

0. For the `server.host:` settting, replace `localhost` with `192.168.0.16` or whatever it should be.

0. For the `server.name:` settting, replace `your-hostname` with your name.

0. For the `elasticsearch.url:` settting, replace `http://localhost:9200` with the IP and port defined.

0. Save the file.

0. Start the server:

   <tt><strong>service kibana start
   </strong></tt>

0. View the landing page at Kibana's default port 5601:

   <tt><strong>http://192.168.0.15:5601
   </strong></tt>

   The default "index patterns" screen should appear.

   ![elk-kibana-created-650x358-78550](https://user-images.githubusercontent.com/300046/30401997-75d35cf8-9899-11e7-9570-6a8ff0c9c787.jpg)

0. Click the blue "Create" button.


<a name="PanelTypes"></a>

## Panel Types

Kibana is described as "general purpose" because it provides a rich pallette of visualizations it can display.

ELK stack became popular among server admins analyzing server logs.

  * bettermap (version 4 on)
  * column
  * goal
  * histogram
  * hits
  * map
  * sparklines
  * terms
  * text
  * trends

For example, Kibana can create a dashboard with these panes:

1) a heatmap to display Logstash-enhanced GeoIp data based on idgeo lookup

2) a line graph to display how many log hits (the higher a point, the more hits).

3) a pie chart to summarize the percentage of different error log levels.


## Query DSL

<a target="_blank" href="https://www.elastic.co/guide/en/elasticsearch/guide/current/proximity-matching.html">
Proximity Matching</a> (closest neighbor search)

https://www.elastic.co/guide/en/elasticsearch/guide/current/partial-matching.html">
Partial Matching


<a name="Videos"></a>

## Videos

 * https://www.youtube.com/watch?v=96og3aIgyrc&list=PLhLSfisesZIvA8ad1J2DSdLWnTPtzWSfI
   is a YouTube playlist by Product Manager and Solutions Architect Morgan Goeller presenting
   Kibana4


## More #

This is one of a series on Elastic Stack and monitoring:

{% include monitoring_links.html %}
