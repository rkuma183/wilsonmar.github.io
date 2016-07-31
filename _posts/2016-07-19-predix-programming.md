---
layout: post
title: "Predix programming"
excerpt: "Code for the Industrial Internet"
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

This article examines instructions to developers from
Predix, GE's brand name for their "Industrial Internet".

This duplicates much of the material on predix.io,
so that PROTIPs and NOTEs can be added in context.

{% include _intro.html %}

## Hackathons #

GE's #Current sponsors a "City-changing" and enterprises hackathon based on Predix 
until August 2, 2016 on
<a target="_blank" href="http://intelligentworld.devpost.com/">
http://intelligentworld.devpost.com</a>

<amp-img width="650" height="293" alt="predix smartcity 650x293-c68.jpg"
src="https://cloud.githubusercontent.com/assets/300046/17079833/1f1c3014-50d9-11e6-925e-6b052e4ddf75.jpg">
</amp-img>
This integration diagram <a target="_blank" href="https://t.co/kUcroXVFBl">
from Programmableweb</a>
is a great example of what is possible.


## Predixdev GitHub #

Predix provide its public GitHub for developers at<br />
<a target="_blank" href="https://github.com/predixdev/">
https://github.com/predixdev</a>

   * Maurice Williams
   @morficus 


   <a name="GitSSH"></a>

   ### Git SSH #

0. Add ssh-key to GitHub
   <a target="_blank" href="https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/">
   SSH</a>

## Seed #

https://github.com/PredixDev/predix-seed
The Dashboard Seed app uses Px Web Components and Px UI Elements inside an Angular application.


## API End-point Login #

Within programs, calls to APIs can be one of two <strong>end-points</strong>:

   * `https://api.system.aws-usw02-pr.ice.predix.io` <br /> for those under the "Basic" plan.

   * `https://api.system.asv-pr.ice.predix.io` <br />for those under the "Select" plan.

Login is to one of these end points, such as:

   <tt><strong>
   cf login -a https://api.system.aws-usw02-pr.ice.predix.io
   </strong></tt>

PROTIP: Create a shell script with a short name to login to one of these.



TODO: Edget starter with Raspberry Pi?



## Getting Started #

Jayson Delancy, Dev. Evangelist interviews 
Tom Turner of the Adoption team about
<a target="_blank" href="https://www.youtube.com/watch?v=0RdsCHDLmEw">
Getting Started</a> 10 Jun 2016.


## UAA Security #

Jayson Delancy, Dev. Evangelist interviews 
developer Tom Turner on
<a target="_blank" href="https://www.youtube.com/watch?v=DXbJM0bvkME">
User Account and Authentication</a> 29 Jun 2016.
includes SAML in SSO.

0. <a target="_blank" href="https://www.predix.io/docs/?r=250183#XpKGAdQ7-Q0CoIStl">
   Create a UAA Service predix-uaa Instance</a>

   REMEMBER: Up to 10 instances of UAA service in your space. 


## Cloud Foundry #

Jayson Delancy, Dev. Evangelist interviews 
Jeff Barrows, Cloud Services (CF, RabitMQ, LogStash, Redis, sys automation, monitoring)
<a target="_blank" href="https://www.youtube.com/watch?v=DXbJM0bvkME">
Cloud Foundry</a> 20 Jun 2016
PaaS makes it easy for devs to deploy production-grade apps.
by abstracting infrastructure functions for several languages (Go, Ruby, Java, Ruby).
Embraces DevOps methodology to build out a load balancer, create database instance, etc.
Difference vs. Kubernetes are both container models in a separate ecosystem.
CF has "build pack" that bundles apps and other underpinnings. 
12 Factor Apps pioneered by Heroku cloud apps using environment variables.

Pivotal is the custodian for 
Cloud Foundry open-source repositories at<br />
   <a target="_blank" href="https://github.com/cloudfoundry">
   https://github.com/cloudfoundry</a>
and maintains additional services.

Check out predix.io/docs/
deploy a "hello world" application.


## <a name="OpenJPA">OpenJPA persistence</a> #

Eclipse v3.2 (2010) has annotation support used by OpenJPA.
defined in javax.persistence:
 which is left to the JPA vendor to implement. (OpenJPA implements it through a table sequence.)

<a target="_blank" href="https://github.com/apache/openjpa">
OpenJPA</a> is a library to manage persistence and 
object/relational mapping (ORM) for Java EE and Java SE environments
to store data in a database.

It implements the <a target="_blank" href="https://jcp.org/en/jsr/detail?id=317">
Java Persistence 2.0 spec at https://jcp.org/en/jsr/detail?id=317</a>
 that went final in 2009.

Three artifacts to implement a JPA-compliant program:

   0. An entity class
   0. A persistence.xml file
   0. A class through which you will insert, update, or find an entity.

QUESTION: XML? In 2016.  Really?

JPA supports SQL, but OpenJPA has a canonical query language 
named Java Persistence Query Language (JPQL).

Some rants about JPA:

   * http://www.ibm.com/developerworks/websphere/techjournal/0612_barcia/0612_barcia.html

   * http://openjpa.apache.org/quick-start.html

   * http://www.jpab.org/OpenJPA.html
   is not the fastest ORM/DB.

   * http://www.javaworld.com/article/2077817/java-se/understanding-jpa-part-1-the-object-oriented-paradigm-of-data-persistence.html?page=2


<a target="_blank" href="https://www.wikiwand.com/en/Apache_OpenJPA">
The Wikipedia article on OpenJPA</a>
notes the source code is the basis for the core <strong>persistence engine</strong>
of BEA Weblogic Server, IBM WebSphere, and the Apache Geronimo Application Server.

   * <a target="_blank" href="https://dzone.com/articles/openjpa-introductory-tutorial">
   https://dzone.com/articles/openjpa-introductory-tutorial</a>
   provides a sample Geronimo site.

<a target="_blank" href="http://www.javaworld.com/article/2077817/java-se/understanding-jpa-part-1-the-object-oriented-paradigm-of-data-persistence.html">
This notes</a>
The JPA specification was first introduced as part of JSR 220: EJB 3.0, 
with the goal of "simplifying" the EJB entity beans programming model. 
Although it all started with entity beans and is packaged with Java EE 5.0, 
JPA can be used outside the container in a Java SE environment.



QUESTION: Why is such advanced ML tech based on such old techology? 
Well, have you seen what's in Java 8? Spring Boot?



<a name="SpringBoot"></a>

## Spring Boot #

Spring Boot are microservices,
the "next chapter" of Spring Framework.
Spring Boot has a CLI based on the 
<a href="#CloudFoundry">Cloud Foundry CLI</a>
Actuator

Task modules in Spring Cloud Data Flow enables "data ingestion" with 
Spring Cloud Streams 
rather than batch like ETL for data warehouses,

The above uses Apache Maven commands.

<a target="_blank" href="https://network.pivotal.io/products/pcfdev">
Pivotal PCDEV</a>


### JPA Fields #

By default, all the fields are of type @Basic, which are persisted as-is in the database.

@Enitity signifies that a particular class is an entity class. If the entity name is different from the table name, then the @Table annotation is used; otherwise, it isn't required.

@Column provides the name of the column in a table if it is different from the attribute name. (By default, the two names are assumed to be the same.)

@Id signifies the primary key.

@Version signifies a version field in an entity. JPA uses a version field to detect concurrent modifications to a data store record. When the JPA runtime detects multiple attempts to concurrently modify the same record, it throws an exception to the transaction attempting to commit last. This prevents you from overwriting the previous commit with stale data.

@GeneratedValue signifies a strategy to assign a unique value to your identity fields automatically. The types of strategies available are IDENTITY, SEQUENCE, TABLE, and AUTO. The default strategy is auto


## Ingestion  #

https://www.youtube.com/watch?v=74-J5nH4jlo
Meetup + Slides: GE IOT Predix Time Series & Data Ingestion Service Using Apache Apex (Hadoop) DataTorrent 539 views


## Raspberry Pi #

https://www.predix.io/blog/article.html?article_id=1906
goes into Time Series service.


## More #

This is one of several related topics:

{% include predix_links.html %}
