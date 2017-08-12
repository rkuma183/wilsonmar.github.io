---
layout: post
title: "JPetstore"
excerpt: "Sample Java Spring app for your abuse and amusement"
tags: [Clouds, IoT]
shorturl: "https://goo.gl/Nfu9ps"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

<a target="_blank" href="https://gitter.im/wilsonmar/great-big-example-application?utm_source=badge&amp;utm_medium=badge&amp;utm_campaign=pr-badge"><img src="https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg" alt="Gitter" /></a>

{% include _toc.html %}

This page describes the various ways to 
<a href="#LocalInstall">install</a> 
and use a simple Java application for learning Java Spring and 
exploring JVM tools.

The app provides a shopping cart because it's a common use case on the internet. Different items within several categories (of pets). 

[NeoLoad](neoload)
uses it as a sample app in their
<a target="_blank" href="http://www.neotys.com/documents/doc/neoload/latest/en/html/#1609.htm">
docs</a>.



<a name="LandingPage"></a>

### Landing page (Main Menu) #

   <img width="650" alt="jpetstore6 main menu" src="https://cloud.githubusercontent.com/assets/300046/21746325/c24dd12a-d50e-11e6-8408-925e0c16021e.png">

   The page has 3 columns under a header. The image above was adjusted to the smallest width without wrapping.
   The page design is HTML4 transitional, 
   not HTML5 "responsive" for mobile, 
   which is an SEO issue.

   Thankfully, one company has it running all the time at
   <a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/actions/Catalog.action">
   http://demo.kieker-monitoring.net/jpetstore/actions/Catalog.action</a>
   It rated 
   <a target="_blank" href="https://developers.google.com/speed/pagespeed/insights/?url=http%3A%2F%2Fdemo.kieker-monitoring.net%2Fjpetstore%2Factions%2FCatalog.action&tab=desktop">90/100 for Desktop on Google Page Speed</a>
   and 83/100 for Mobile. Google recommends:

   * <a target="_blank" href="https://developers.google.com/speed/docs/insights/LeverageBrowserCaching">Leverage browser caching.</a> Setting an expiry date or a maximum age in the HTTP headers for static resources (.gif media files) instructs the browser to load previously downloaded resources from local disk rather than over the network.

   * <a target="_blank" href="https://developers.google.com/speed/docs/insights/OptimizeCSSDelivery">Eliminate render-blocking JavaScript and CSS in above-the-fold content.</a> The browser waits for <a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/css/jpetstore.css">.../css/jpetstore.css</a> to load before rendering
   above-the-fold content. Defer or asynchronously load blocking resources, or inline the critical portions of those resources directly in the HTML.
   
   * The css file is not mimified.


## Use case loops #

An explanation of the UI actions is available by clicking the (?) on the heading, at<br />
<a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/help.html">
http://demo.kieker-monitoring.net/jpetstore/help.html</a>

This site map is from the 
<a target="_blank" href="http://www.clintonbegin.com/downloads/JPetStore-1-2-0.pdf">comparison</a>
by Clinton Begin (of Alberta):

![jpetstore6 site map](https://cloud.githubusercontent.com/assets/300046/21751209/7ad5c63a-d591-11e6-88ea-c67d3dc107f6.png)


## Performance Tests

Performance testing needs a set of <strong>loops</strong>
to impose artificial load.

1. <a href="#LandingPage">Landing page</a>  and
   <strong>Info (?) page</strong>
   for network variability measurement.

2. <strong>Browsing</strong> through items (without login or buying) 
   to specifically stress the web server.

   Rather than coding to click specific items,
   this activity is often specified by a file with the test program iterates through.

3. <strong>Register</strong> to see how many the system can accommodate when the system is widely announced to the public.

   QUESTION: j2ee is the default user? What's the password?

   The <a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/actions/Account.action?newAccountForm=">user registration link</a> is not on the landing page (Main Menu),
   reached after a click of <strong>Sign In</strong>.

   TODO: Variations in registration data from a file
   to load various users.

4. <strong>Login</strong> to see what happens when everyone arrives at the same time (such as at a call center during start of shift).

5. Log-off

6. <strong>Search</strong> form usage, especially for form fields that return an autocomplete list for user ease-of-use.

7. <strong>Add to cart</strong> from an item listing,
   which adds to the database for each unique user, specifically to stress the database.

8. View cart.

9. <strong>Purchase</strong> to ensure that 
   <strong>payment gateways</strong> can keep up with a lot of people buying at once.

   Except the JPetStore app does not connect with a payment gateway.

10. <strong>End-to-end</strong> with all the above to ensure that the system can handle a pattern of work during scalability testing (to emulate a mention on Reddit or Hacker News that causes a buying frenzy).

11. <a target="_blank" href="http://demo.kieker-monitoring.net/jpetstore/actions/Order.action?listOrders=">My Orders</a> 
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
