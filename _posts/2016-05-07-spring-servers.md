---
layout: post
title: "Spring servers"
excerpt: "Making Java web services one object at a time"
tags: []
image:
# feature: pic brown java beans 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622024/6a77b5b0-0584-11e6-93ea-ed1ca2c4bbc6.jpg
  credit: Green Coffee Lover
  creditlink: http://www.greencoffeelover.com/wp-content/uploads/2015/03/7.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}


This tutorial presents a **hands-on** introduction with commentary along the way
with facts and wisdom from <a href="#References">several sources</a>.

"Spring" is a brand name for a <a href="#Suite">suite</a> of web server software 
from <a target="_blank" href="https://www.pivotal.com/">
Pivotal.com</a> (now a division of VMWare).
The Spring framework was initially written by Rod Johnson, who released it on June 2003 in the SourceForge public repository under the Apache 2.0 license.

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

Spring Boot was first released on April 1, 2014.

Spring Boot makes use of <strong>Spring MVC</strong> (Model View Controller)
programming pattern
for its use of Java beans, context, and AOP.

"Beans" are units of work within a server. It is a concept from the framework
Java Enterprise Edition (JEE), previously called J2EE.
In fact, Spring began as a project to replace EJB (Enterprise Java Beans)
with simpler POJOs (Plain Old Java Objects).

This "object oriented programming" approach is considered a "heavyweight" framework
that sprung up during the 1990's. So it can be viewed as both "mature" and "bloated".

Other modules in the suite include Spring Security and 
Spring Data JPA.

The <a target="_blank" href="https://github.com/spring-io/initializr">
Spring Initializr project</a>, hosted at <a target="_blank" href="http://start.spring.io/">
start.spring.io</a> allows you to select just the libraries (starters) you need
to configure and download a complete Spring Boot project (named demo.zip).
Run it:

   <pre>
unzip demo.zip && \
cd demo && \
mvn clean install && \
java -jar target/*.jar
   </pre>

<hr />

<a name="Installations"></a>

## Installations #

The pre-requisites are:

1. [Java 8](/java-on-apple-mac-osx/)
2. [Maven](/maven-on-macos/) is required by Spring now.
3. [Eclipse STS IDE](/eclipse-ide/)
4. Git client and certificates in .ssh folder to work with GitHub.
5. Install Atom and Sublime Text for editing files. These are free tools.
   Commands in this tutorial used "atom" and "subl" to open text files for viewing and edit
   in context of its folder of other files.

## Groovy 

Here is the quickest way to 

0. Open a Terminal window on your Mac.
0. Navigate to make a directory to hold the new repository.
0. Get the repository (substituting "spring-guides" with your own account name):

   <pre><strong>
git clone https://github.com/wilsonmar/spring-servers.git --depth=1
cd spring-servers
   </strong></pre>

0. Invoke the server using a Groovy script:

   <pre><strong>spring run HelloController.groovy
   </strong></pre>

   A web server instance should be instantiated.

0. Use an internet browser (Chrome or Firefox) to open:

   <a target="_blank" href="http://localhost:8080">
   http://localhost:8080</a>

   You should see "Hello Spring Boot!"


## Get Sample Project

<a target="_blank" href="https://github.com/pivotal-enablement/articulate">
https://github.com/pivotal-enablement/articulate</a>
is the Pivotal Cloud Foundry Elastic Runtime Service basic demo.


## Make New Sprng Project

Within Eclipse STS:

0. Alt-click on the Package Explore. Select New.
0. Select Other (Wizard).
0. Expand Maven. Select Maven Project. Next.
0. Check "Create a simple project (skip archetype selection)". Next.
0. Group Id: "com.pluralsight" or whatever your organization uses.
0. Artifact Id: "spring_sample". Finish.

   Notice the Artifact Id appears as a Package.

0. Expand the project.

   ### JRE System Library to [J2SE-1.8]

0. Alt-click the pom.xml for Open With Text Editor. In the Text Editor:
0. Insert lines above `&LT;/project>` and insert these lines:

  <pre>
  <build>
    <plugins>
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.2</version>
          <configuration>
            <source>1.8</source>
            <target>1.8</target>
          </configuration>
        </plugin>
      </plugins>
  </build>
   </pre>

0. Click the X to save the file.
0. Alt-click on the project name ("spring_sample") to select Maven.
0. Select Update project. Click OK.
   The JRE System Library should now say "1.8."

   ### New Class after Package Rename

0. Alt-click on `src/main/java`. New Class.
0. Change the Package: to "com.pluralsight.model" or whatever.
0. For Name: type "Customer". Finish.

   This generates the Customer.java file that appears.

   ### Generate getters and setters

0. Add variables within `public class Customer`:

   <pre>
   private string firstname;
   private string lastname;
   </pre>

0. Use Eclipse automation: alt-click the source under the above to select 
   `Source` then <strong>`Generate Getters and Setters`</strong>.

0. Select the fields to generate (both firstname and lastname in the example).
   Click OK.

   ### Inversion of Control

   IoC (Inversion of Control) means that developers do not write object creation program code.
   Instead, metadata about objects are described in an XML file for the Spring Container
   to parse then construct Java objects.

     To do that within the Eclipse STS IDE,



## Install Spring Server

There are several ways to obtain a Spring app server:

   1. In a cloud. Pivotal sells time on their 
   Cloud Foundry hosting platform
   so developers can write "cloud native" applications.
   2. QUESTION: Local Docker image?
   3. Local from package (Homebrew on Macs)
   4. Local from direct downloads
   5. <a href="#pom.xml">Automatic Maven in pom.xml</a>

Cloud Foundry provides a CLI that enables a level of abstraction to enable one to 
switch from Amazon Web Services to Azure or Google or IBM.

Actions to get started:

   0. <a href="#EclipseSTS">Spring Tools Suite (STS) edition of the Eclipse IDE</a>
   0. <a href="#SampleCode">Get Sample Code</a>
   0. <a href="#LocalInstall">Local install</a>
   0. <a href="#Maven">Build using Maven</a>
   <br /><br />

## Sample Project

0. In an internet browser, go to this URL and fork the repo:

   https://github.com/pivotal-enablement/articulate

   This is the Pivotal Cloud Foundry Elastic Runtime Service basic demo.

   Notice among the files is a pom.xml file used by Maven.

0. In Jenkins, create job "articulate-dnr"


<a name="#pom.xml"></a>

### pom.xml

0. Go to <a target="_blank" href="http://projects.spring.io/spring-framework/">
   http://projects.spring.io/spring-framework/</a>
lists the versions to
provide core support for dependency injection, transaction management,
web apps, data access, messaging, and more.

0. Copy the below:

   ```
<dependencies>
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-context</artifactId>
        <version>4.3.10.RELEASE</version>
    </dependency>
</dependencies>
   ```

0. Click on a line before `<buuild>` tag.
0. Paste in that new line.


<hr />

## Spring Boot

Spring Boot adds to Spring MVC Framework.

Actuator : Enables Advanced Monitoring and Tracing of applications.




## Help and Support

The software is open sourced, but Pivotal provides services.

<a target="_blank" href="https://www.springOnePlatform.io">
SpringOnePlatform.io</a> is Pivotal's annual conference (#springone, @s1p) 
on December 4, 2017
at the Moscone Center, near Pivotal's San Francisco office.

https://in28minutes.teachable.com/courses/126488/




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

<a target="_blank" href="https://spring.io/projects/">
https://spring.io/projects</a>
lists several products:

* Spring Framework
* Spring Security for Authentication and Authorization
* Spring HATEOAS REST API discovery features
* Spring Data

Additionally:

* Spring JDBC (Java Data Base) for SQL data
* Spring MVC
* Spring AOP
* Spring ORM
* Spring JMS
* Spring Test

Spring enables easier integration with other frameworks:

* Hibernate for ORM
* iBatis for Object Mapping
* <a target="_blank" href="https://www.youtube.com/watch?v=o5k9NOR9lrI">
   JUnit</a> and <a target="_blank" href="https://www.youtube.com/watch?v=d2KwvXQgQx4">
   Mockito</a> for Unit Testing
* JNDI

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

Pluralsight's
<a target="_blank" href="https://app.pluralsight.com/library/courses/spring-fundamentals/table-of-contents">
Spring Fundamentals</a> 2h 55m video course released 9 Dec 2016
by Bryan Hansen (@bh5k)

https://www.mkyong.com/all-tutorials-on-mkyong-com/
Java, Spring, other frameworks

## More #

This is one of several related topics:

{% include predix_links.html %}
