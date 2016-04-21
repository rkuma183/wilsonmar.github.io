---
layout: post
title: "DevOps Setup"
excerpt: "Do this or else."
tags: [devops]
image:
# feature: pic-brown-horses-running-forward-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14724047/445df2f0-07d1-11e6-9c26-782291fe2b47.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

## Overview and History

Rather than repeating others, let me link to the most influencial pieces about DevOps:

* http://continuousdelivery.com/

* 12factorapp.net

* http://www.clearlytech.com/2014/01/04/12-factor-apps-plain-english/
  12 Factor App in plain english</a>

* Gene Kim

## Plethora of choices

Regardless of the choice of specific technologies, 
here are the categories for standardization decisions:

0. <a href="#DevProcess">Development process</a>
0. <a href="#DevOS">Developer laptop</a>
0. <a href="#MicroserviceMgmt">Microservice management</a>
0. <a href="#SingleSignOn">Single-Sign On Authentication</a>
0. <a href="#InputForms">Input formats</a>
0. <a href="#InputLocations">Input locations</a>
0. <a href="#CloudEnvs">Cloud environment</a>
0. <a href="#LoadBalancer">Load Balancer</a>
0. <a href="#CDN">Content Distribution Network</a>
0. <a href="#ServerOS">Server Operating System</a>
0. <a href="#SourceRepo">Source repository</a>
0. <a href="#BitRepository">Bit and Image repository</a>
0. <a href="#TaskRunner">Task runner</a>
0. <a href="#BuildTool">Build tool</a>
0. <a href="#SpecRepo">Specifications repository</a>
0. <a href="#ProgrammingLanguages">Programming Languages</a>
0. <a href="#IDEs">Integrated Development Environments</a>
0. <a href="#StaticScanner">Static Code Scanner</a>
0. <a href="#Graphics">Graphics Processing</a>
0. <a href="#MobilePlatforms">Mobile platforms</a>
0. <a href="#MobileTesting">Mobile testing</a>
0. <a href="#FunctionalTesting">Functional testing</a>
0. <a href="#PerformanceTesting">Performance testing</a>
0. <a href="#Logging">Logging and log management</a>
0. <a href="#DataVisualization">Visualization</a>
0. <a href="#In-MemoryDatabases">In-Memory Databases</a>
0. <a href="#Back-endDatabases">Back-end Databases</a>
0. <a href="#MessageQueuing">Message queuing</a>
0. <a href="#Notifications">Notifications</a>
0. <a href="#Email">Email & SMS</a>
0. <a href="#RESTAPI">REST API management</a>
0. <a href="#GeoDatabases">Geographic Databases</a>
0. <a href="#MachineLearning">Machine Learning</a>
0. <a href="#Others">Other technologies</a>

Most organizations flip back and forth over time between
limiting choices to limit fragmentation (and costs)
vs. allowing for individual experimentation for
creativity.

There is a debate which yields the fastest speed to market
because bleeding-edge tools often require patching
which almost everyone is struggling to understand it
-- a condition which yields a <strong>fragile</strong> 
environment.

<hr />

   <a name="DevProcess"></a>

### Development process

Boards, burn-down charts.

   * Scrum
   * Kanban
   * Lean
   * Atlassian JIRA 
   * etc.

   <a name="DevOS"></a>

### Developer laptop

   * Apple Macintosh OSX
   * Microsoft Windows 7
   * Microsoft Windows 10
   * Linux

   <a name="MicroserviceMgmt"></a>

### Microservice management

   * Docker
   * Vagrant (on Macs)
   * Mesos (open source)
   * Marathon
   * etc.

   <a name="SingleSignOn"></a>

### Single-Sign On Authentication

   * Okta
   * LDAP
   * PKI/encryption CA server
   * OAuth1 (PKI certificates)
   * OAuth2 (SHA1)
   * etc.

   <a name="InputForms"></a>

### Input formats

   * CSV, JSON, XML
   * Google Sheet (online)
   * Excel .xlsx, .xls (Microsoft Office, Office365)
   * Word .docx, .doc (Microsoft Office, Office365)

   <a name="InputLocations"></a>

### Input cloud locations

   * Dropbox
   * Box
   * Google 
   * Microsoft OneCloud
   * etc.

   <a name="CloudEnvs"></a>

### Cloud environment

   * AWS is the most popular
   * Microsoft Azure 
   * Google Cloud
   * Heroku
   * Rackspace

   * HP private cloud
   * Oracle
   * etc.

   <a name="LoadBalancer"></a>

### Load Balancer

   * F5
   * etc.

   <a name="CDN"></a>

### Content Distribution Network

   * GitHub Issues (free)
   * Amazon EC2 (subscription)
   * Google (subscription)
   * etc.

   <a name="ServerOS"></a>

### Server Operating System

   * Shell scripts
   * CentOS (open source)
   * Ubuntu (open source)
   * RedHat Enterprise Linux (licensed)
   * etc.

   <a name="SourceRepo"></a>

### Source repository

   * Git is the most popular
   * Bitbucket
   * Stash
   * Subversion
   * etc.

   <a name="BitRepository"></a>

### Bit and Image Repository

   * Artifactory (open source)
   * etc.

   <a name="TaskRunner"></a>

### Task runner CI

   * Jenkins (licensed Cloudbees SaaS)
   * CircleCI
   * TravisCI

   * Bamboo from Atlassian (licensed)
   * TFS from Microsoft (licensed)
   * etc.

   <a name="BuildTool"></a>

### Build Tool

   * Ant
   * Maven
   * Grunt, Gulp (used by Node)
   * ActionScript (Mac)
   * etc.

   <a name="SpecRepo"></a>

### Specifications repository

   * Swagger
   * RAML
   * WADL
   * etc.

   <a name="ProgrammingLanguages"></a>

### Programming Languages

   * Scala is the new darling
   * Java continues to dominate

   * C# (ASP.NET or MVC) from Microsoft

   * Python
   * Perl
   * PHP

   * Clojure
   * Go (popular within Google)
   * etc.

   <a name="IDEs"></a>

### Integrated Development Environments

   * JetBrains
   * Eclipse (favored by Java)
   * Visual Studio
   * etc.

   <a name="StaticScanner"></a>

### Static Code Scanner

   * custom for the language
   * SonarQube
   * etc.

   <a name="Graphics"></a>

### Graphics Processing

   * Adobe Photoshop
   * Sketch (Mac)
   * etc.

   <a name="MobilePlatforms"></a>

### Mobile platforms

   * Desktop (GitHub Electron)
   * Google Android (Java) native
   * Apple iOS native
   * Hybrid Web (Sencha and others based on Apache Cordova)
   * Generators (React Native from JavaScript v6)
   * etc.

   <a href="#FunctionalTesting"></a>

### Mobile testing

   * Appium (Java)
   * Perfecto (mobile device cloud)
   * etc.

   <a name="PerformanceTesting"></a>

### Unit & Functional testing

   * Selenium (Java, JavaScript, .NET, etc.)
   * Jasmine
   * Mocha
   * etc.

   <a name="#MobileTesting"></a>

### Performance testing

   * JMeter (Java)
   * SOASTA (cloud subscription)
   * etc.

   <a name="Logging"></a>

### Logging and log mangement

   * Logstash / ElastiSearch (open source)
   * NewRelic
   * 
   * SumoLogic (subscription)
   * AWS (subscription)
   * Splunk
   * etc.

   <a name="DataVisualization">

### Data Visualization

   * Kibana (from Elastisearch)
   * Tableau
   * Qlik
   * etc.

   <a name="In-MemoryDatabases"></a>

### In-Memory Databases

   * Redis
   * SQLite (mobile)
   * HTML5 local storage
   * etc.

   <a name="Back-endDatabases"></a>

### Back-end Databases

   * Cassandra
   * CouchDB
   * Neo4J graph database
   * MongoDB
   * SparkDB

   * PostgreSql
   * MySQL (local and in Amazon)
   * Microsoft SQL Server
   * Oracle
   * DynamoDB
   * etc.

   <a name="MessageQueuing"></a>

### Message queuing

   * ZeroMQ
   * Kafka
   * ActiveMQ
   * Amazon
   * MSMQ
   * TIBCO
   * etc.

   <a name="Notifications"></a>

### Notifications

   * PagerDuty
   * Zapier
   * etc.


   <a name="Email"></a>

### Email & SMS

   * Microsoft Exchange
   * Microsoft Sharepoint
   * SMS gateway server
   * Fax gateway server
   * etc.

   <a name="RESTAPI"></a>

### REST API management

   * Mulesoft
   * etc.

   <a name="GeoDatabases"></a>

### Geographic Databases

   * Google Maps
   * Bing Maps
   * ESRI
   * Route optimization (machine learning)
   * etc.

  <a name="MachineLearning"></a>

### Machine Learning

   * Tensorflow (Google)
   * Semantic Analysis
   * Recommender
   * etc.

  <a name="Others"></a>

### Other technologies

   * Text to speech
   * Computer vision (XBox)
   * Drones
   * Gaming (Unity)
   * GLib, Maya (motion graphics)
   * etc.
