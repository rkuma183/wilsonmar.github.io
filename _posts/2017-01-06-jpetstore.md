---
layout: post
title: "JPetstore"
excerpt: "Sample Java Spring app for your abuse and amusement"
tags: [Clouds, IoT]
shorturl: "https://git.io/v1CKg"
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

This page describes the various ways to 
<a href="#LocalInstall">install</a> 
and use a simple Java application for learning Java Spring and 
exploring JVM tools.

The app provides a shopping cart because it's a common use case on the internet. Different items within several categories (of pets). 

Microsoft created a sample .Net Pet Shop when it orginally debuted its .NET framework.

JPetStore v6 is a rewrite of Sun's original J2EE Pet Store. 

One company has it running all the time at
   <a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/actions/Catalog.action">
   http://demo.kieker-monitoring.net/jpetstore/actions/Catalog.action</a>

<a name="LandingPage">Landing page</a>

DO THIS: Adjust the width of your browser for a frame like this:

TODO: Picture of landing page.


## Use case

TODO: Video.

Performance testing needs a set of <strong>loops</strong>
to impose artificial load.

1. <a href="#LandingPage">Landing page</a>  and
   <strong>Info (?) page</strong>
   for network variability measurement.

2. <strong>Register</string> to see how many the system can accomodate when the system is widely announced to the public.

3. <strong>Login</strong> to see what happens when everyone arrives at the same time (such as at a call center).

4. <strong>Search</strong> form usage, especially for form fields that return an autocomplete list for user ease-of-use.

5. <strong>Navigation</strong> browsing through items without buying to specifically stress the web server.

   Rather than coding to click specific items,
   this activity is often specified by a file with the test program iterates through.

6. <strong>Add to cart</strong> which adds to the database for each unique user, specifically to stress the database.

7. <strong>Purchase</strong> to ensure that 
   <strong>payment gateways</strong> can keep up with a lot of people buying at once.

   Except the JPetStore app does not connect with a payment gateway.

8. <strong>End-to-end</strong> with all the above to ensure that the system can handle a pattern of work during scalability testing (to emulate a mention on Reddit or Hacker News that causes a buying frenzy).


<a name="LocalInstall"></a>

## Local Installation

There are several versions on the internet. 
The latest one I know of is at:

https://github.com/mybatis/jpetstore-6/releases

Rather than downloading a 
<a target="_blank" href="https://github.com/mybatis/jpetstore-6/releases">release zip file</a>, 
use a Git client, as the <a target="_blank" href="https://github.com/mybatis/jpetstore-6/blob/master/README.md">readme</a> recommends.

TODO: Create a bootstrap script that does the following:

0. Create a folder to hold.
0. In a Terminal, obtain the whole repository with its history:

   <pre><strong>
   git clone https://github.com/mybatis/jpetstore-6.git
   </strong></pre>

0. Have Maven download and install <a href="#Dependencies">
   dependencies</a> defined in pom.xml:

   <pre><install>
   mvn install
   </strong></pre>

   "JPetStore 6 should run in any Servlet 2.5 y JSP 2.1 compliant Java server."

   Eclipse is not needed either, you can run the sample from your favorite IDE or the command line.

0. Download and install dependencies in the pom.xml file:

   <pre><install>
   mvn install
   </strong></pre>

<a name="Dependencies"></a>

### Dependencies

http://www.mybatis.org/jpetstore-6/dependency-info.html

* Java 1.6 and above (1.8.11 at January 2017)

* Spring 4 

* Stripes

* MyBatis 3

   MyBatis mappers and dependency injection lets you build applications without dependencies.



<a name="Monitoring"></a>

## Monitoring

Online Solution
http://demo.kieker-monitoring.net/

## Code

Docs at http://www.mybatis.org/jpetstore-6/
says:

The purpose of JPetStore 6 is to demonstrate how to build a web application with very few classes and no advanced coding skills. You just need to know plain Java and SQL.

<hr />

## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
