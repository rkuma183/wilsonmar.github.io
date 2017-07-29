---
layout: post
title: "Spring servers"
excerpt: "Making Java web services one object at a time"
tags: []
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

"Spring" is a brand name for a <a href="#Suite">suite</a> of web server products
from <a target="_blank" href="https://www.pivotal.com/">
Pivotal.com</a> (now a division of VMWare).

This tutorial presents a **hands-on** introduction with commentary along the way
with facts and wisdom from <a href="#References">several sources</a>.

> The approach of this tutorial is to get you a working server so that
you can see the impact of your changes to sample code, in the context of all modules
and tools you use.

A lot of time has been spent to sequence the presentation.


<a name="Suite"></a>

## The Pivotal suite

The <strong>Spring Framework</strong> 
manages dependency injection (aka Inversion of Control)
to make application code "loosely coupled" and thus be tested easier.

<strong>Spring Boot</strong> address competitors to Spring (such as 
Node using JavaScript, Ruby on Rails, Python, and Go), which
use RESTful API web services 
exchanging JSON-formatted files rather than SOAP and XML.

Spring Boot makes use of <strong>Spring MVC</strong> (Model View Controller)
programming pattern
for its UI handling (core, beans, context, AOP).

"Beans" are units of work within a server. It is a concept from the framework
Java Enterprise Edition (JEE), previously called J2EE.
This "object oriented programming" approach is considered a "heavyweight" framework
that sprung up during the 1990's. So it can be viewed as both "mature" and "bloated".

<hr />

<a name="EclipseSTS"></a>

## Eclipse STS IDE #

There is no Homebrew module for Mac.

0. Use a modern internet browser to the STS website.
0. Select a download site to begin download. Wait for the file to download.
0. Unzip
0. In Finder, navigate inside the folder, such as:

   ~/Documents/workspace-sts-3.8.0.RELEASE

   This contains the server.

0. Move and/or rename the folder according to your organization's standards.

0. In Finder navigate to /Applications.
0. Move (drag and drop) STS.app to /Applications.
0. Open STS by double-clicking the icon.
0. Click Open icon for first-time confirmation.
0. Specify your workspace.

   See video at https://www.youtube.com/watch?v=s4ShbtOHMCA

<a target="_blank" href="https://www.predix.io/resources/tutorials/journey.html#1607">
This</a>
advises on the use of STS 


## STS (Spring Tools Suite) #

<a target="_blank" href="https://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse">
Included with STS</a> (Spring Tools Suite)
is the developer edition of Pivotal <strong>tc</strong> Server, 
the drop-in replacement for Apache Tomcat that’s optimized for Spring.

The Spring Insight console, tc Server Developer Edition, 
provides a graphical real-time view of application performance metrics that lets developers identify and diagnose problems from their desktops.



## Sample Project

https://github.com/pivotal-enablement/articulate
is the Pivotal Cloud Foundry Elastic Runtime Service basic demo.


## Install

There are several ways:

   1. In a cloud. Pivotal sells time on their 
   Cloud Foundry hosting platform
   so developers can write "cloud native" applications.
   2. QUESTION: Local Docker image?
   3. Local from package (Homebrew on Macs)
   4. Local from direct downloads

Cloud Foundry provides a CLI that enables a level of abstraction to enable one to 
switch from Amazon Web Services to Azure or Google or IBM.

Actions to get started:

   0. <a href="#EclipseSTS">Spring Tools Suite (STS) edition of the Eclipse IDE</a>
   0. <a href="#SampleCode">Get Sample Code</a>
   0. <a href="#LocalInstall">Local install</a>
   0. <a href="#Maven">Build using Maven</a>

## Sample Project

0. In an internet browser, go to this URL and fork the repo:

   https://github.com/pivotal-enablement/articulate

   This is the Pivotal Cloud Foundry Elastic Runtime Service basic demo.

   Notice among the files is a pom.xml file used by Maven.

0. In Jenkins, create job "articulate-dnr"



<hr />

## Spring Boot

Actuator : Enables Advanced Monitoring and Tracing of applications.




## Help and Support

The software is open sourced, but Pivotal provides services.

<a target="_blank" href="https://www.springOnePlatform.io">
SpringOnePlatform.io</a> is Pivotal's annual conference (#springone, @s1p) 
on December 4, 2017
at the Moscone Center, near Pivotal's San Francisco office.

https://in28minutes.teachable.com/courses/126488/



## Install Predix #

See https://www.predix.io/resources/tutorials/tutorial-details.html?tutorial_id=1523

0. Create a folder (~/gits/predix) to hold repos and cd to it.

   Predix offers two samples:

   * git clone https://github.com/PredixDev/predix-microservice-cf-jsr.git
   * git clone https://github.com/PredixDev/predix-microservice-cf-spring.git

0. Create repo for JSR and cd into it:

   <tt><strong>
   git clone https://github.com/PredixDev/predix-microservice-cf-jsr.git<br />
   cd predix-microservice-cf-jsr
   </strong></tt>

   The tree of folders and files for JSR is more complex than Spring:

   <pre>
|-- COPYRIGHT.md
|-- LICENSE.md
|-- README.md
|-- config
|   `-- application.properties
|-- manifest.yml
|-- pom.xml
`-- src
    |-- main
    |   |   `-- com
   </pre>


<a name="Maven"></a>

## Build using Maven #

   <tt><strong>mvn clean package 
   </strong></tt>

   The end of a long list is like this:

   <pre>
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 02:27 min
[INFO] Finished at: 2016-07-08T08:55:47-06:00
[INFO] Final Memory: 30M/152M
[INFO] ------------------------------------------------------------------------
   </pre>

   See Maven video at https://www.youtube.com/watch?v=0CFWeVgzsqY


<a name="SpringModules"></a>

## Spring Modules #

* Spring JDBC (Java Data Base) for SQL data
* Spring MVC
* Spring AOP
* Spring ORM
* Spring JMS
* Spring Test
* Spring Security for Authentication and Authorization

Spring enables easier integration with other frameworks:

* Hibernate for ORM
* iBatis for Object Mapping
* <a target="_blank" href="https://www.youtube.com/watch?v=o5k9NOR9lrI">
   JUnit</a> and <a target="_blank" href="https://www.youtube.com/watch?v=d2KwvXQgQx4">
   Mockito</a> for Unit Testing

Spring - spring-framework-tutorial-for-beginners
Spring MVC - https://www.youtube.com/watch?v=BjNhGaZDr0Y
Spring Boot - https://www.youtube.com/watch?v=PSP1-2cN7vM


### Auto configuration

Spring Boot looks at the operating system CLASSPATH containing paths to folders of 
Java libraries to do auto-configuration.

* Jackson Databind for JSON data binding
* Log4j for logging logback, slf4j
* Tomcat embedded servlet container (front-end)
* Hibernate Validator, Validation API
* Add HATEOAS features to your services

<a name="DependencyInjection"></a>

## Dependency Injection #

There are two parts to dependency injectioon.

Java annotations are used to define the java bean to manage and tests doing the managing.

`@Component` marks the class definitions to manage.

`@Autowired` marks where a mock the correct match for this specific type.

In a unit test, I can ask the Spring framework to auto-wire the mock of WelcomeService into WelcomeController. (Spring Boot makes things easy to do this with @MockBean.


<a name="References"></a>

## References

<a target="_blank" href="https://spring.io/guides/">
https://spring.io/guides</a>


![spring-whitelable-1146x412-32k](https://user-images.githubusercontent.com/300046/28741389-26836902-73e3-11e7-8184-fe5f80b914de.png)

http://www.springboottutorial.com/spring-boot-vs-spring-mvc-vs-spring
https://github.com/in28minutes/in28minutes.github.io/tree/master/code-zip-files

http://www.springboottutorial.com/spring-boot-tutorials-for-beginners

### Pluralsight

https://app.pluralsight.com/library/courses/cloud-foundry-developer-1dot7-pivotal/exercise-files
Pivotal Cloud Foundry Developer course</a>
released on 14 Apr 2017 by Pivotal Software provides 5h 7m of videos.
Learn how to push applications to Pivotal Cloud Foundry and many of the concepts and features of the Pivotal Cloud Foundry platform, including services, log draining, metrics, buildpacks, service brokers, and route services and more.

   https://github.com/d4v3r


## More #

This is one of several related topics:

{% include predix_links.html %}
