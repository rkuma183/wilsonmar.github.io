---
layout: post
title: "Spring Petclinic"
excerpt: "Sample Java Spring app for your abuse and amusement"
tags: [Clouds, IoT]
shorturl: "https://goo.gl/"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

This page describes the various ways to 
<a href="#LocalInstall">install</a> 
and use a simple Java application for learning and experimenting 
with a Java Spring application server program from 
SpringSource, now a division of VMWare.

The sample app can also be used to 
explore JVM tools and related utilities.


## Sample app online?

QUESTION: Is there one?

http://spring-petclinic.cloudfoundry.com/
is no longer active

https://github.com/jdubois/spring-petclinic
is no longer active.


## Different versions

The canonical, most up-to-date version is at<br /><a target="_blank" href="https://github.com/spring-projects/spring-petclinic">https://github.com/spring-projects/spring-petclinic</a><br />
Its main contributor is  <a target="_blank" href="http://javaetmoi.com/">
paresian</a>  <a target="_blank" href="https://github.com/arey">
Antoine Rey</a>.

There are also forks at<br /><a target="_blank" href="https://github.com/spring-petclinic"> https://github.com/spring-petclinic</a>
using Angular, https://github.com/spring-petclinic/spring-petclinic-microservices


In the introduction of Spring PetClinic Spring Framework 2.5 at<br />
<a target="_blank" href="http://docs.spring.io/docs/petclinic.html">
http://docs.spring.io/docs/petclinic.html</a><br />
the most recent update is 2007.


PROTIP: The version of the app you use should be of a static instance
(in a your own fork) so that you have a consistent version to work and debug.


Julian Dubois in 2013 blogged about his
<a target="_blank" href="http://blog.ippon.fr/2013/03/11/">
performance audit</a> of the app he forked in 2013 at
https://github.com/jdubois/spring-petclinic

   * https://github.com/jdubois/spring-petclinic/commit/69e55e406db37a386ff8348a5a84343801169f85
   JMeter test file


<a name="Strategy"></a>

## Performance Test Strategy

Performance testing needs a set of <strong>loops</strong>
to impose artificial load.

1. <a href="#LandingPage">Landing page</a> run semi-continuously
   to detect network variability between clients (load generators)
   and servers.

   This can be a measurements every 1-5 minutes of a single user.

2. <a href="#TopMenu">Top Menu Items</a>.
   
   Does navigation into top menu items cause a round-trip to the server?

   Such issues can be identified during performance test script creation.

3. <strong>Browsing</strong> through menu items (without login or buying) 
   stresses the front-end web server.

   Rather than coding to click specific items,
   this activity may be specified by a control file 
   which the test program reads to determine how to iterate through items.

4. <strong>Register</strong> users 
   to identify the maximum rate the system can accommodate increases to
   the user population.

   TODO: Variations in registration data from a file
   to load various users.

5. <strong>Login</strong> to identify the maximum rate of users
   arriving at the same time (such as at a call center during start of shift).
   
   This can be driven from a database of users prepared by registrations.

   This enables measurement of how much memory is taken for each new user.

6. Log-off.

   QUESTION: Does memory get recovered from users who have logged off?

7. <strong>Add to database</strong>.
   To stress the database.

   This enables measurement of how much additional time is needed to list
   each additional list item (until the maximum is shown on each page).

8. <strong>Search</strong> form usage generate database calls.

   Examples are form fields that return an autocomplete list.

9. View lists of user-selected items.

   In the PetStore app, this would be a list of items in the shopping cart.

10. <strong>Process</strong> items.

   In the PetStore app, this would be purchase of items in the cart
   and use of <strong>payment gateways</strong>, which is usually an
   external service.

   QUESTION: Can the app keep up with a lot of people buying at once?

   The JPetStore app does not connect with a payment gateway.

11. <strong>End-to-end</strong> with all the above to ensure that the system can handle a pattern of work during scalability testing (to emulate a mention on Reddit or Hacker News that causes a visitor or buying frenzy).

12. <a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/actions/Order.action?listOrders=">My Orders</a> 
   lists order history for a user,
   by reading from the database.
   A link to it is at the bottom of the User Information page after a user is logged in and has completed an order.


Additionally, there are <strong>error</strong> responses
to each of the above, created by "negative" tests:

1. Server unavailable (NGINX).

2. Item not available during browsing.

3. Registration error (such as bad email,
   user already defined, etc.).

4. Login error, such as forgotten password change.

5. Search not found.

etc.

<hr />

<a name="LandingPage"></a>

## Landing page (Main Menu) #

Unlike the PetStore app which has for data several categories of pets,
the PetClinic app manages Pets and the Owners and Vet who take care of them.

<img alt="SpringSourceList" width="650" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

Question for one user performance test runs reaching just the landing page
every 1-5 minutes continuously: Are there spikes in response time?
If so, it is probably due to network or some infrastructure conditions.

[<a href="#Strategy">Back to Strategy</a>]

<a name="TopMenu"></a>

## Top Menu 

The menu items at the top menu bar are:

* Home
* Owners (of pets)
* Vetinerians
* Errors

The menu bar remains visible in all screens throughout the app.

[<a href="#Strategy">Back to Strategy</a>]


## New item registration



## Find/Search

QUESTION: Functionality to find/search usually involves database access.


## Find functions

QUESTION: Do functionality to find

Michael Isvy on March 20, 2013 presented 
<a target="_blank" href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">
diagrams and code samples</a> describing the 
Spring MVC and Dandelion and WebJars 
used by the sample app.

   * WebJars by https://twitter.com/_JamesWard

   * http://dandelion.github.io/blog/2013/04/24/Integrating-Dandelion-DataTables-in-the-Spring-Petclinic-app
   based on jQuery Datatables and Bootstrap



https://github.com/spring-projects/spring-petclinic/


   <img width="650" alt="jpetstore6 main menu" src="https://cloud.githubusercontent.com/assets/300046/21746325/c24dd12a-d50e-11e6-8408-925e0c16021e.png">



## Use case loops #


<a target="_blank" href="https://graphwalker.github.io/petclinic/">
https://graphwalker.github.io/petclinic</a>
uses the <a target="_blank" href="https://www.yworks.com/products/yed"><br />
yEd graph editor</a>
and <a target="_blank" href="http://graphstream-project.org/">
GraphStream</a> to visualize tests as they run.




### Options for performance testing apps

Since JPeterStore was built for developers, missing are some features in the 
WebTours app Mercury/HP built to use as a sample app
during demos and training for LoadRunner.




### Pattern of iteration

To mimic real-life load across the various pages,
not every iteration would invoke "My Orders".
   So the automation scripts would need to use a
   <strong>percentage chance</strong> 
   when the action is performed.

Ideally, we would have a data-driven approach where
a file external to the code
specifies the pattern of invocation.
This approach would not require a re-compile
after changes.


### Reset data

QUESTION: How to reset the Orders data for a user?


<a name="UI"></a>

## UI #

On the Main Menu, there are links to category lists
from the text at the left, 
the headings at the top,
and icons at the center.

   * Fish
   * Dogs
   * Cats
   * Reptiles
   * Birds


### User Registration


### Headings

On the heading, when a user is signed in, "Sign In" changes to "My Account".


### User Profile Options

These change behavior, which automation scripts need to
respond to:

* Enable MyList 

* Enable MyBanner 



<a name="LocalInstall"></a>

## Local Installation

WARNING: There are several obsolete versions on the internet,
such as <a target="_blank" href="http://sourceforge.net/projects/ibatisjpetstore/">
v4 on Sourceforge</a>.

There are several variations

http://support.neotys.com/misc/jpetstore-test.zip


### MyBatis

Rather than downloading a 
<a target="_blank" href="https://github.com/mybatis/jpetstore-6/releases">release zip file</a>, 
use a Git client, as the <a target="_blank" href="https://github.com/mybatis/jpetstore-6/blob/master/README.md">readme</a> recommends.

TODO: Create a bootstrap script that does the following:

0. Create a folder to hold. I prefer to have a container folder
   (jpetstore) because there are multiple repositories:

   ~/gits/jpetstore/jpetstore-6

   ~/gits/jpetstore/mybatis-spring-boot-jpetstore<br />
   is an alternative from Kazuki Shimizu of Japan.
   It is implemented using <a target="_blank" href="http://www.thymeleaf.org/"> Thymeleaf</a> 3.0 templating.

0. In a Terminal, obtain the whole repository with its history:

   <pre><strong>
   git clone https://github.com/mybatis/jpetstore-6.git
   cd jpetstore-6
   </strong></pre>

0. Have Maven download and install <a href="#Dependencies">
   dependencies</a> defined in pom.xml:

   <pre><strong>
   mvn clean package
   </strong></pre>

   JPetStore 6 should run in any Servlet 2.5 y JSP 2.1 compliant Java server.

   Eclipse is not needed. You can run the sample from your favorite IDE or the command line.

0. Startup the Tomcat server and deploy web application
   using the
   <a target="_blank" href="https://codehaus-cargo.github.io/cargo/Maven2+plugin.html">Cargo Maven plug-in</a>

   <pre><strong>
   mvn cargo:run
   </strong></pre>

   The pom.xml file has several versions of Tomcat loaded.

0. In a browser, use the app as a user:

   <pre><strong>
   http://localhost:8080/jpetstore/
   </strong></pre>

   You should now see the entry screen:

   <img width="272" alt="jpetstore6 enter store" src="https://cloud.githubusercontent.com/assets/300046/21746314/42beea02-d50e-11e6-8b2b-cdfebe3fee50.png">

0. Click "Enter the store" for the 
   <a href="#LandingPage">main menu</a>.

### Change port

0. To change the port from the default 8080 to something else, edit file:

   <pre>target/cargo/configurations/tomcat8x/conf/server.xml</strong>

0. Scroll down to the line:

   <tt>
   &LT;Connector SSLEnabled="false" URIEncoding="ISO-8859-1" connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443" scheme="http" secure="false"/>
   </tt>

0. Change the number.

0. Save the file and restart the server.   


<a name="Dependencies"></a>

### Dependencies

http://www.mybatis.org/jpetstore-6/dependency-info.html

* Java 1.6 and above (1.8.11 at January 2017)

* Spring 4 

* Stripes - https://github.com/StripesFramework

* MyBatis 3 SQL mapping framework for Java <br />
   http://blog.mybatis.org/p/products.html

   MyBatis mappers and dependency injection lets you build applications without dependencies.
   Thus, the source has no code to deal with JDBC, to create objects or bind them or to handle transactions. 

   (There is a port to .NET)

   The iBATIS Database Layer uses simple XML descriptor filesto describe the inputs and outputs of each SQL statement. It allows the programmer to simply pass a JavaBean into a MappedStatement as a parameter (input) and receive a JavaBean as a result (output).  

* Formatter Tag Library
   by Tak Yoshida of ibatis.

* Tomcat web server from the Apache Foundation.

* JUnit for Mokito

   Used by tests


<a name="Monitoring"></a>

## Monitoring

Online Solution
http://demo.kieker-monitoring.net/


<a hrer="JavaCode"></a>

## Java Code

JPetStore v6 is vendor-independent open source freeware 
first released <a target="_blank" href="http://www.theserverside.com/discussions/thread.tss?thread_id=14243">
in 2002</a> in 3,154 lines of code. It uses the Jakarta Struts Model-View-Controller based presentation layer. It has NO SQL in code nor stored procedures running in a database, so is independent of database vendors (Oracle SQL in particular).
PostgreSQL is free.

It has no generated code, nor HTML in the database. 

Eclipse is not required, but there is a 
<a target="_blank" href="http://blog.mybatis.org/2016/12/mybatipse-eclipse-plugin-1024-is.html">
MyBatis plug-in</a>

Docs at http://www.mybatis.org/jpetstore-6/
says:

The purpose of JPetStore 6 is to demonstrate how to build a web application with very few classes and no advanced coding skills. You just need to know plain Java and SQL.

Java source code is in the <a target="_blank" href="https://github.com/mybatis/jpetstore-6/tree/master/src/main/java/org/mybatis/jpetstore">src/mainjava/org/mybatis/jpetstore</a> folder.


### Predecessors

Sun created a J2EE Pet Store, in a massive 15,000 lines, 
as a demonstration of various coding features (not for benchmarking).

Microsoft contracted with Vertigo Software to create a sample .Net Pet Shop when it orginally debuted its .NET framework. The repo had 3,484 lines of code and was tuned for benchmarking speed rather than coding best practices.


<hr />

## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
