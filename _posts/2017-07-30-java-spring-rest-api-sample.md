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

Among several simple sample client programs that read REST APIs available on the internet:

   * https://github.com/joshlong/bootiful-microservices

## REST API sample service

This article describes a Java Spring client program that calls this REST API:<br />
<a target="_blank" href="https://gturnquist-quoters.cfapps.io/api/random">
https://gturnquist-quoters.cfapps.io/api/random</a>

0. Click on the URL above to see a raw response such as:

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


## Sample Spring program source

<a target="_blank" href="https://spring.io/guides/gs/consuming-rest/">
https://spring.io/guides/gs/consuming-rest</a><br />
describes source code for a program that consumes the API shown above.

This article describes the code in a different way.<br />
This article provides a hands-on approach to learning
by introducing concepts immediately after asking you to take an action.

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

   <pre><strong>
git clone https://github.com/spring-guides/gs-consuming-rest.git --depth=1
cd gs-consuming-rest
   </strong></pre>

   NOTE: The account spring-guides is maintained by folks within Pivitol
   who maintain the spring.io website.

## Structure of folders

0. View top level folders:

   <pre><strong>cd gs-consuming-rest
   </strong></pre>

   There are two folders: "initial" and "complete" so that this repo can be used
   for learning, with a completed set if changes were made correctly.

0. View the folders

   <pre><strong>cd completed
   </strong></pre>

   Code for two build mechanisms are provided. Use either Maven or Gradle, not both.

   This tutorial makes use of Maven (although Gradle is a simpler, more modern tool).


   ### Run Maven for target

0. Open the file Maven references to download dependencies using Atom:

   <pre><strong>atom pom.xml
   </strong></pre>

   `&LT;modelVersion>4.0.0&LT;/modelVersion>` 
   refers to the version of Maven.

   `&LT;groupId>org.springframework&LT;/groupId><br />
   `&LT;artifactId>gs-consuming-rest&LT;/artifactId>`
   is used within Eclipse STS.

   `java.version` 1.8 is required by 
   spring.framework specified as a dependency.
   (Others substitute a variable `${spring.version}`)

   Jackson provides methods to process JSON files.

   Maven downloads artifacts and plugins specified from its
   Maven Central repository.

0. On Windows, use `mvnw.cmd` to create a <strong>target</strong> folder.<br />
   On Mac:

   <pre><strong>chmod +x *
   ./mvnw
   </strong></pre>


   ### Run .jar from command line

0. Run the module (.jar file) created within the target folder:

   <pre><strong>cd target
   java -jar gs-consuming-rest-0.1.0.jar
   </strong></pre>

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

   We need to ignore the date/time stamps, markers, and warnings in the response.

   Notice "hello.Application" is called (even though "No active profile set").

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

   This line defines a new type called Value:

   <pre>
    private Value value;
   </pre>

0. Look in file Value.java which defines the type:

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
