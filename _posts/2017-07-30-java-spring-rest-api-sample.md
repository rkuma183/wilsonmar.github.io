---
layout: post
title: "Java Spring REST API Sample"
excerpt: "Spring for some Java web service client"
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

This article introduces how Spring programs works by examining a simple 
Java Spring client program that calls a REST API (without authentication, GUI, or database):

   <a target="_blank" href="https://gturnquist-quoters.cfapps.io/api/random">
   https://gturnquist-quoters.cfapps.io/api/random</a>

   This API is described at<br />
   <a target="_blank" href="https://spring.io/guides/gs/consuming-rest/">
   https://spring.io/guides/gs/consuming-rest</a>

   But this article describes the code using a  
   <strong>hands-on</strong> approach 
   by introducing concepts <strong>after</strong> asking you to take an action,
   so that you have a <strong>visual</strong> image to go with the commentary.

> If any of this doesn't work for you or doesn't make sense to you,
please reach out to me.

0. Click on the URL above to see a raw (unformatted) response such as:

   <a name="SampleResponse"></a>

   <pre>
{"type":"success","value":{"id":10,"quote":"Really loving Spring Boot, makes stand alone Spring apps easy."}}
   </pre>

   The web service returns a JSON document containing a reponse type ("success" or "failure"),
an id, and a text string (random quotes about Spring Boot).

   If you are using a FireFox browser you would see a formatted display:

   <pre>
{
   type: "success",
   value: {
      id: 10,
      quote: "Really loving Spring Boot, makes stand alone Spring apps easy."
   }
}
   </pre>

0. The Firefox browser also provides a tab to display HTTP headers it exchanges
   with servers behind the scenes.


   ### Sample Spring program source

0. In an internet browser (Chrome or Firefox), go to:

   <a target="_blank" href="https://github.com/spring-guides/gs-consuming-rest.git">
   https://github.com/spring-guides/gs-consuming-rest</a>

0. Log into your own GitHub account.
0. Click Fork because you'll want to make changes and save it back to GitHub
   as backup if nothing else.

0. Install on your laptop the Java Development Kit (JDK), Maven, and Git client software.
0. Install Atom and Sublime Text for editing files. These are free tools.
   Commands in this tutorial used "atom" and "subl" to open text files for viewing and edit
   in context of its folder of other files.
0. Install Eclipse STS IDE. Also free.

0. Open a Terminal screen on your operating system (assuming Mac):
0. Make a folder to hold the new folder to be added.
0. Get the repository (substituting "spring-guides" with your own account name):

   <tt><strong>git clone https://github.com/spring-guides/gs-consuming-rest.git \-\-depth=1<br />
   cd gs-consuming-rest
   </strong></tt>

   NOTE: The account spring-guides is maintained by folks within Pivitol
   who maintain the spring.io website.

   ### Structure of folders

0. View top level folders:

   <tt><strong>cd gs-consuming-rest
   </strong></tt>

   There are two folders: "initial" and "complete" so that this repo can be used
   for learning, with a completed set if changes were made correctly.

0. View the folders

   <tt><strong>cd completed
   </strong></tt>

   Code for two build mechanisms are provided. Use either Maven or Gradle, not both.

   This tutorial makes use of Maven (although Gradle is a simpler, more modern tool).


   ### Maven to create target .jar

0. Open to view the pom.xml file which tells the Maven program
   what artifacts and plugins to download from its
   <a target="_blank" href="https://search.maven.org/">
   Maven Central repository</a>.

   (You can subsitute another editor than Atom)

   <tt><strong>atom pom.xml
   </strong></tt>

   `<modelVersion>4.0.0</modelVersion>` 
   refers to the version of Maven.

   `<groupId>org.springframework</groupId><br />
   `<artifactId>gs-consuming-rest</artifactId>`
   is used within Eclipse STS.

   `java.version` 1.8 is required by 
   spring.framework specified as a dependency.
   (Others substitute a variable `${spring.version}`, which is substituted automatically based on the value specified in the <spring.version> tag's content within the same file.)

   `jackson` provides methods to process JSON files.

   A full application would contain references to libraries to enable use of
   Tomcat, database, and 
   others.

0. Assemble all the various files necessary to run into a single .jar file
   within a <strong>target</strong> folder.

   On Windows:

   <tt><strong>mvnw.cmd
   </strong></tt>

   On Mac:

   <tt><strong>chmod +x *
   ./mvnw
   </strong></tt>


   ### Run .jar from command line

0. Run the module (.jar file) created within the target folder:

   <tt><strong>cd target<br />
   java -jar gs-consuming-rest-0.1.0.jar
   </strong></tt>

   DEFINITION: A <strong>module</strong> refers to the way that Java libraries are distributed and used - JAR, WAR, EAR. A .jar file contains all the other files assembled together.

   Although most other Spring apps have a UI,
   this sample program has only a "console" program with no UI.
   
   So we look to the console log messages to debug and see whether calls worked.

   <a name="LogOutput"></a>

   <pre>
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v1.5.6.RELEASE)
&nbsp;
2017-07-30 15:02:46.236  INFO 27820 --- [           main] hello.Application                        : Starting Application v0.1.0 on macs-MacBook-Pro-4.local with PID 27820 (/Users/mac/gits/gs-consuming-rest/complete/target/gs-consuming-rest-0.1.0.jar started by mac in /Users/mac/gits/gs-consuming-rest/complete/target)
2017-07-30 15:02:46.242  INFO 27820 --- [           main] hello.Application                        : No active profile set, falling back to default profiles: default
2017-07-30 15:02:46.365  INFO 27820 --- [           main] s.c.a.AnnotationConfigApplicationContext : Refreshing org.springframework.context.annotation.AnnotationConfigApplicationContext@4b9af9a9: startup date [Sun Jul 30 15:02:46 EDT 2017]; root of context hierarchy
2017-07-30 15:02:47.715  INFO 27820 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
2017-07-30 15:02:48.031  INFO 27820 --- [           main] hello.Application                        : Quote{type='success', value=Value{id=7, quote='The real benefit of Boot, however, is that it's just Spring. That means any direction the code takes, regardless of complexity, I know it's a safe bet.'}}
2017-07-30 15:02:48.035  INFO 27820 --- [           main] hello.Application                        : Started Application in 2.501 seconds (JVM running for 3.096)
2017-07-30 15:02:48.035  INFO 27820 --- [       Thread-2] s.c.a.AnnotationConfigApplicationContext : Closing org.springframework.context.annotation.AnnotationConfigApplicationContext@4b9af9a9: startup date [Sun Jul 30 15:02:46 EDT 2017]; root of context hierarchy
2017-07-30 15:02:48.037  INFO 27820 --- [       Thread-2] o.s.j.e.a.AnnotationMBeanExporter        : Unregistering JMX-exposed beans on shutdown
   </pre>

   PROTIP: Ignore the date/time stamps, markers, and warnings in the response.
   Scroll to the right.

   Notice "hello.Application" is called (even though "No active profile set").
   NOTE: <a target="_blank" href="https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html">Spring Profiles</a> provide a way to segregate parts of your application configuration and make it only available in certain environments.

   After "Registering beans for JMX exposure on startup" notice there is a 
   <a href="#SampleResponse">valid response from the web service</a>
   over the public internet.

   There is also<br />
   `Started Application in 2.501 seconds (JVM running for 3.096)`

   Success!

   But how can the program know if the response was successful?

   ### Test Coding

0. Look into the src (source) folder:

   <pre><strong>cd src
   ls -al
   </strong></pre>

   The `src/test/java/hello` folder contains an `ApplicationTest.java` file
   which exercises classes compiled from<br />
   the `src/main/java/hello` folder.

0. Use a text editor to look into the `ApplicationTest.java` file:

   <pre><strong>atom test/java/hello/ApplicationTest.java
   </strong></pre>

   Annotations have been processed by the Java compiler since version 5.
   The compiler looks up the processor associated with each annotation specified.
   Libraries are imported to enable the use of <a target="_blank" href="https://docs.oracle.com/javase/tutorial/java/annotations/index.html">annotations</a>
   added above regular code.

   Code to process the @Test annotation is imported from 
   `org.springframework.test.context.junit4.SpringRunner`.

   The `@Test` annotation tells JUnit 4 that it can run as a test case the method defined beneath it. This improves upon JUnit 3 which assumes every method is a test if its name starts with "test" and its class extends TestCase.

   JUnit constructs a fresh instance of the class then invokes the annotated method. 

   Any exceptions thrown by the test will be reported by JUnit as a failure. If no exceptions are thrown, the test is assumed to have succeeded.

   <a target="_blank" href="http://www.java2novice.com/junit-examples/junit-annotations/">
   BTW</a>: Additional annotations @Before/@BeforeClass and @After/@AfterClass are not in JUnit 3.
   Attributes can be optionally added with annotations. 
   To fail a test if the method does NOT throw the named exception: 

   `@Test(expected = Exception.class)`

   To fail a test if the function does not finish with the allotted milliseconds time limit:

   `@Test(timeout = 500)`

   Code to process the @SpringBootTest annotation is imported from 
   `org.springframework.boot.test.context.SpringBootTest`.

   Code to process the @Autowired annotation is imported from 
   `org.springframework.beans.factory.annotation.Autowired`.


   See http://qaautomated.blogspot.in/p/junit.html

   See http://www.baeldung.com/java-annotation-processing-builder

   (Multiple passes may be necessary to resolve annotations within annotation processor code.)

   PROTIP: Java programs are best read from the bottom of the file.

   At the bottom of the code, the Test program makes an <strong>assertThat/strong> 
   <a target="_blank" href="http://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/web/client/RestTemplateBuilder.html">`restTemplate`</a> 
   `isNotNull` based on code in the
   `org.springframework.web.client.RestTemplate` imported.

   `@Autowired` cause the injection of getter and setter function code automatically
   during build, to save developer time on the restTemplate.
   (Any Spring components can be autowired. These include, components, configurations, services and beans.)

   NOTE: A Java Bean is a simple POJO whose only behavior is getters and setters.
   POJO (Plain Old Java Object) is an object that has attributes as well as behaviors.


   ### Run Test from Eclipse IDE

   The easiest way of running a single JUnit test method is to run it from within the test case’s class editor within the Eclipse IDE.

0. Place your cursor on the method’s name inside the test class. I’d recommend using the keyboard to navigate to the method, especially if there are many tests.
0. To run the test, press <strong>Alt+Shift+X,T</strong> or right-click, Run As > JUnit Test.
0. To rerun the same test method, press <strong>Ctrl+F11</strong>. 

   For this to work, ensure that you’ve told Eclipse to always run the last launched application.

Alternately, go to the Outline view and run the method from there. 

   <a target="_blank" href="http://www.eclipseonetips.com/2014/06/16/run-a-single-junit-test-method-in-eclipse/">*</a>


   <a name="Application.java"></a>

   ### Application.java

   The Java package name defined at the top of the file, `hello`, puts this in the same
   package as the Test code described above.

0. Look into the src (source) folder:

   <pre><strong>atom main/java/hello/Application.java
   </strong></pre>

   The <strong>entry point</strong> into the package is this 
   line of code that appears on all Java programs:

   <pre>
	public static void main(String args[]) {
      ...
	}
   </pre>

   The Application.class is then invoked:

   <pre>
      SpringApplication.run(Application.class);
   </pre>

   ???

   The `@SpringBootApplication` annotation provides the base package for component
   scanning. It marks a class for static configurations of the
   Application Context. It provides for autoconfiguration to start applying default
   behaviors.

   The "CommandLineRunner" finishes by issuing an log entry with the code:

   <pre>log.info(quote.toString());
   </pre>

   The `Logger` class imported from the slf1j library takes care of sending
   <a href="#LogOutput">lines displayed on your Console</a>.

   As for the line:

   <pre>
			Quote quote = restTemplate.getForObject(
					"http://gturnquist-quoters.cfapps.io/api/random", Quote.class);
   </pre>

   The "restTemplate" class's `getForObject` method is supplied by the Spring Framework.

   "Quote.class" is the response. There must then be a Quote class file to define it.


   <a name="Quote.java"></a>

   ### Quote.java

   The Quote class is defined within the Quote.java file which creates a 
   <strong>domain class</strong> to specify the data requested.

0. Look at the bottom of the Quote.java file:

   <pre>
    public String toString() {
        return "Quote{" +
                "type='" + type + '\'' +
                ", value=" + value +
                '}';
    }
   </pre>

   The programmer created this by typing the lines:

   <pre>
    private String type;
    private Value value;
   </pre>

   The set and get funtions can be automatically created within the Eclipse IDE.

   ???

   Notice "Value" is not a built-in data type such as "String", etc.
   It is a custom type which needs to be defined.

0. Look in file Value.java which defines the Value type:

   <pre>
    public String toString() {
        return "Value{" +
                "id=" + id +
                ", quote='" + quote + '\'' +
                '}';
    }
   </pre>


   <a name="Annotations"></a>

   ### Annotations

   https://docs.spring.io/spring-boot/docs/current/reference/html/

   @Bean provies Bean Factory

   QUESTION: applicationContext.xml file

   <a target="_blank" href="https://robert-reiz.com/2012/07/24/jsonignoreproperties/">
   "just something you have to do"</a>

##

Data Manipulation Language (DML) is stored in a data.sql file in
src > main > resources.

## Paid Lessons

Some videos from the <br />
<a target="_blank" href="http://www.baeldung.com/rest-with-spring-course">
http://www.baeldung.com/rest-with-spring-course</a><br />
by Eugen in Romania (<a target="_blank" href="https://twitter.com/baeldung">@baeldung</a>) is previewed on <a target="_blank" href="https://www.youtube.com/channel/UClz8vOAb28UzP64meEvhg5w">
his YouTube channel</a>.

<a target="_blank" href="https://www.udemy.com/spring-boot-tutorial-for-beginners/">
Spring Boot Tutorial For Beginners</a> on Udemy.com
by in28Minutes, which provides:<br />
https://www.udemy.com/spring-boot-tutorial-for-beginners/<br />
with code in<br />
https://github.com/in28minutes/in28minutes.github.io/tree/master/code-zip-files


## Free Videos about Spring clients

* <a target="_blank" href="https://www.youtube.com/user/Loketus">
JUnit4</a> by Petri Kainulainen from Finland.

* <a target="_blank" href="https://www.youtube.com/watch?v=5jQSat1cKMo">
Java API | Developing Restful APIs | Rest API In Java | Java Tutorial | Java Training</a>
by Edureka 12 April 2017

* <a target="_blank" href="https://www.youtube.com/watch?v=47xNBNd-LLI">
Build a Hello World REST service in less than 6 minutes

   Actuator libraries provides enviornment and self-health status monitoring 
   * localhost:8080/env
   * localhost:8080/health should return "ok"
   * localhost:8080/metrics returns how many times the service has been called
   * localhost:8080/beans
   * localhost:8080/trace for a stack trace
   * localhost:8080/shutdown
   <br /><br />

* <a target="_blank" href="https://www.youtube.com/watch?v=24rGqtxuLhc">
Spring Tutorial for Beginners - Using Maven and Eclipse

* <a target="_blank" href="https://www.youtube.com/watch?v=s4ShbtOHMCA">
Eclipse Java Tutorial For Beginners with Maven & Git - New Version

* <a target="_blank" href="https://www.youtube.com/watch?v=BjNhGaZDr0Y">
Spring MVC Tutorial for Beginners

* <a target="_blank" href="https://www.youtube.com/watch?v=rMLP-NEPgnM">
Spring Framework Tutorial for beginners with examples Java [57:31]

* <a target="_blank" href="https://www.youtube.com/watch?v=3znVD-VD5i4">
How to create a simple hello world example in Spring ?.
by Dinesh Varyani

* <a target="_blank" href="https://www.youtube.com/watch?v=OQIsKgfkYcE">
Spring Tutorial 5 - Hello World Spring

* <a target="_blank" href="https://www.youtube.com/watch?v=qFaijUFxbmk">
Spring Boot Hello World Example

* <a target="_blank" href="https://www.youtube.com/watch?v=kXkel8eTCCk">
Spring MVC: Hello World

* <a target="_blank" href="https://www.youtube.com/watch?v=uJ-z5O_9M78">
HelloWorld with Spring Web MVC

* <a target="_blank" href="https://www.youtube.com/watch?v=gwdISLtlWic">
Spring MVC Basics

* <a target="_blank" href="https://www.youtube.com/watch?v=Ke7Tr4RgRTs">
Learn Spring Boot (MVC) in 50 minutes

* <a target="_blank" href="https://www.youtube.com/watch?v=GB8k2-Egfv0&list=PLC97BDEFDCDD169D7">
Spring Framework playlist from 2011 by javabrains.koushik.org
<a target="_blank" href="https://www.youtube.com/watch?v=GB8k2-Egfv0">

   1. Understanding Dependency Injection
   2. Setting up
   3. Understand Spring Bean Factory
   4. Writng Code Using the Bean Factory

## Competitors

JAX-RS - see http://www.java2novice.com/restful-web-services/

Java API for JSON Processing (JSR 353) provides an API to parse, transform, and query JSON data using the object model or the streaming mode.
See http://www.java2novice.com/java-json/javax.json/

Google Gson is a Java library that can be used to convert Java Objects into their JSON representation. It can also be used to convert a JSON string to an equivalent Java object. Gson can work with arbitrary Java objects including pre-existing objects that you do not have source-code of.
See http://www.java2novice.com/java-json/google-gson/
