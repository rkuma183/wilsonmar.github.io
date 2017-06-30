---
layout: post
title: "Groovy (Language) introduction"
excerpt: "A groovy way to use the Java Virtual Machine"
tags: [apple, mac, setup, Go]
shorturl: "https://goo.gl/JoaWV4"
image:
# feature: groovy-intro-1900x254-180k
  feature: https://user-images.githubusercontent.com/300046/27741686-efc74390-5d83-11e7-9f3f-ba4bb43bfbac.png
  credit: PioneerDrama.com
  creditlink: https://www.pioneerdrama.com/searchdetail.asp?pc=GROOVY
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}


This is a hands-on introduction to the Groovy programming langauge.
Effort was taken to sequence topics for faster learning.

Groovy 1.0 was released in January 2, 2007 


## Social

<a target="_blank" href="http://groovy-lang.org/">http://groovy-lang.org</a>
is the Groovy language homepage, which is built from 
<a target="_blank" href="https://github.com/groovy/groovy-website">
https://github.com/groovy/groovy-website</a>

It's called "Apache Groovy" because it's an Apache open-source project.
Apache runs conferences on the language. Some notable presentations:

* https://www.youtube.com/channel/UC-Vs_q9uWBlSx5NsDkxoGAQ
   gr8conf.eu
   by venkat@agiledeveloper.com
   @venkat_s  Subramaniam

## Video Tutorials

<a target="_blank" href="https://www.JeremyJarrell.com/">
Jeremy Jarrell</a> provides, back in 2014, a [3:37]
<a target="_blank" href="https://app.pluralsight.com/library/courses/groovy-fundamentals/table-of-contents"> Groovy Fundamentals video course on Pluralsight</a>
shows how to develop a Groovy application to parse GPS data from an XML file, insert it into a database, and correlate data to forecast data retrieved from a REST API.

Other introductory tutorials:

* https://www.tutorialspoint.com/groovy/
* https://examples.javacodegeeks.com/jvm-languages/groovy/groovy-script-tutorial-beginners/
* https://www.timroes.de/2015/06/27/groovy-tutorial-for-java-developers/

* https://www.timroes.de/2015/06/28/groovy-tutorial-for-java-developers-part2-closures/
* https://www.youtube.com/watch?v=URkFOLywex4

* https://www.timroes.de/2015/06/28/groovy-tutorial-for-java-developers-part3-collections/
* https://learnxinyminutes.com/docs/groovy/
   Learn Groove in X Minutes

## Install 

### Docker Image

   Docker images contain a complete environment:

   https://github.com/groovy/docker-groovy

### Package Manager

   Formerly known as <a target="_blank" href="http://gvmtool.net/">
   GVM the Groovy enVironment Manager</a>, 
   <a target="_blank" href="http://sdkman.io/">
   SDKMan.io</a> 
   (inspired by RVM and rbenv tools widely used by the Ruby community)
   is a tool for Mac OSX, Linux or Cygwin (Unix-based system) users to manage parallel versions of multiple Software Development Kits. It provides a convenient Command Line Interface (CLI) and API for installing, switching, removing and listing Candidates. 

### On Mac

0. Homebrew install on Mac:

   <pre><strong>brew install groovy
   </strong></pre>

   A sample response on June 2017:

   <pre>
==> Using the sandbox
==> Downloading https://dl.bintray.com/groovy/maven/apache-groovy-binary-2.4.11.zip
######################################################################## 100.0%
==> Caveats
You should set GROOVY_HOME:
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
==> Summary
🍺  /usr/local/Cellar/groovy/2.4.11: 64 files, 27.6MB, built in 10 seconds
   </pre>

   ### Windows

   https://github.com/groovy/groovy-windows-installer

   See http://www.groovy-lang.org/install.html


   ## Verify

0. For a menu:

   <pre><strong>groovy
   </strong></pre>

   A sample response on June 2017:

   <pre>
error: neither -e or filename provided
usage: groovy [options] [args]
options:
  -a,--autosplit <splitPattern>    split lines using splitPattern (default '\s')
                                   using implicit 'split' variable
  -b,--basescript <class>          Base class name for scripts (must derive from
                                   Script)
  -c,--encoding <charset>          specify the encoding of the files
  -classpath <path>                Specify where to find the class files - must
                                   be first argument
     --configscript <arg>          A script for tweaking the configuration
                                   options
  -cp,--classpath <path>           Aliases for '-classpath'
  -D,--define <name=value>         define a system property
  -d,--debug                       debug mode will print out full stack traces
     --disableopt <optlist>        disables one or all optimization elements.
                                   optlist can be a comma separated list with
                                   the elements: all (disables all
                                   optimizations), int (disable any int based
                                   optimizations)
  -e <script>                      specify a command line script
  -h,--help                        usage information
  -i <extension>                   modify files in place; create backup if
                                   extension is given (e.g. '.bak')
     --indy                        enables compilation using invokedynamic
  -l <port>                        listen on a port and process inbound lines
                                   (default: 1960)
  -n                               process files line by line using implicit
                                   'line' variable
  -p                               process files line by line and print result
                                   (see also -n)
  -v,--version                     display the Groovy and JVM versions
   </pre>

0. Eclipse IDE and Maven setup

   https://github.com/groovy/groovy-eclipse


## Sample code

0. Install a Git client.
0. Navigate to a working folder and:

   <pre><strong>git clone https://github.com/wilsonmar/groovy-samples
   cd groovy-samples
   </strong></pre>

## Make it work

This section has you going through the several ways to run Groovy programs.

### Verify compile

0. Compile to a Java class file containing Java byte code:

   <pre><strong>groovyc hello.groovy
   </strong></pre>

0. List files to see "hello1.class" (and not hello.class) 
   created because the class file name is defined within the code.
   

   ### Groovy Console 

0. In a Terminal:

   <pre><strong>groovyConsole
   </strong></pre>

   ![groovy-intro-console-572x194-26k](https://user-images.githubusercontent.com/300046/27742401-79c7ca68-5d86-11e7-96ed-81f91304bba6.png)

0. Select File Open, etc.

0. Press command + Q to Quit out of the program.


   ### Groovy shell 

   NOTE: Groovy is a dynamic language wrapper to Java.

0. Open a new Groovy shell:

   <pre><strong>groovysh
   </strong></pre>

0. Click on the Terminal window again.
0. Print a line or other

   <pre><strong>println "hello"
   </strong></pre>

0. List <a target="_blank" href="https://www.tutorialspoint.com/groovy/groovy_command_line.htm">
   commands</a>

   <pre><strong>:help
   </strong></pre>

   Notice there are two formats for the same command.
   For example, either `:exit` or the shorter `:x` to exit.

0. Exit the shell using a command starting with colon:

   <pre><strong>:x
   </strong></pre>

0. Invoke the shell again:

   Groovy coding doesn't yet have an import keyword that will do a 
   literal include of another file's contents.

   http://docs.groovy-lang.org/latest/html/documentation/#GroovyShell-load
   Load one or more files (or urls) into the buffer.

   <pre>groovy:000> :load hello.groovy</pre>

   PROTIP: The shell does not import groovy.transform.BaseScript

   
   <pre>
import groovy.transform.AnnotationCollector
   </pre>


   ### Sample script

   Let's begin by looking at a simple script to see basic constructs of a Groovy program: 

   PROTIP: Underlines and # are OK in file names.
   No dashes or + in file names.

0. Open a script in the Groovy Playground:

   <a target="_blank" href="https://groovy-playground.appspot.com/#?load=4cdac770f83bd4adde3ae4fa9e0814b7">
   https://groovy-playground.appspot.com/...</a>
   which 
   It is stored <a target="_blank" href="https://gist.github.com/wilsonmar/4cdac770f83bd4adde3ae4fa9e0814b7">Git</a>

   BLAH: Nothing happens when I click Execute!

   QUESTION: Does this happen for you?


   ### Basic Groovy Coding

0. In a text editor, open file <strong>hello.groovy</strong>:

   <pre>
// hello.groovy
class Hello1 {
   static void main(String[] args) {
      /* This program shows how to display 
      hello world to console. */
      System.out.println("Hello World");
      println('Hello World');
   }
}
   </pre>


   Groovy is based on Java. So there's semicolons.
   
   ### Default Library Dependencies

   NOTE: By default, Groovy includes these libraries, 
   so you don’t need to explicitly import them:

   <pre>
import java.lang.* 
import java.util.* 
import java.io.* 
import java.net.* 
&nbsp;
import groovy.lang.* 
import groovy.util.* 
&nbsp;
import java.math.BigInteger 
import java.math.BigDecimal
   </pre>

   ### Java Library Dependencies

   Additional imports, just as with Java:

   Grape for Dependency management for Groovy.
   Grape is built on Ivy, which is compatible with Maven,
   which automatically installs dependencies at runtime.

0. Using a Terminal at my <a href="#groovy-samples">
   groovy-samples folder</a>,
   open file ImportGpsData.groovy

   * Joda-time alternative to standard Java data and time libraries.

   <pre>
@Grapes(
   @Grab(group='joda-time', module='joda-time', version='2.3')
)
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
   </pre>

   Functions in the library are used by statements such as:

   <pre>
  def printableTime = new DateTime(it.time.toString())
  def format = DateTimeFormat.forPattern('MM/dd/yyyy - hh:mm aa')
  println printableTime.toString(format)
   </pre>

   ### Google Guava

   * Google Guava
   * Apache Commons for logging


   ### Templating

   TODO:

   Hello world this is ${something}


   ### Use with Gradle

   (based on Maven syntax)


## Other source code:

   * https://groovy.codehaus.org
   * https://examples.javacodegeeks.com/jvm-languages/groovy/groovy-script-tutorial-beginners/
   with objects and database access.


   Data types are enforced at run-time, not compile time.

## Libraries

Grails builds web servers written in Groovy.

Griffon builds desktop apps in Groovy.



## Usage

Jenkins supports processing of Groovy scripts in post-build actions 
and as an action of the build.

Groovy's flexible syntax enables it to develop
DSLs (Domain-Specific Languages) 


<a target="_blank" href="https://github.com/CA-APM/ca-apm-acc-api-scripts/blob/master/scripts/agent-diag-report.groovy">
CA APM Command Center API Scripts</a>
manage log level of APM Agents.


IBM's Urban Code/uDeploy works with a Groovy language via a
<a target="_blank" href="https://developer.ibm.com/urbancode/plugin/groovy-ibmucd/">
plug-in</a>
to process XML files
<a target="_blank" href="https://developer.ibm.com/urbancode/plugindoc/ibmucd/groovy/1-2/">
Docs</a>


## Metaprogramming

* https://www.youtube.com/watch?v=UJhlp5P7Ec0

* https://www.youtube.com/watch?v=vwysol6tipM
   Metaprogramming techniques

* https://www.youtube.com/watch?v=vwysol6tipM&t=49s

