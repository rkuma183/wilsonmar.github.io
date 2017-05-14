---
layout: post
title: "JMeter Installation"
excerpt: "Load 'em up"
tags: [perftest, JMeter]
shorturl: "https://"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial explains how to install JMeter ... for fun and profit.

https://jmeter.apache.org/usermanual/jmeter_distributed_testing_step_by_step.pdf

* Sign up for the mailing list at: http://jmeter.apache.org/mail.html

* https://github.com/apache/jmeter


## Install Java

http://www.oracle.com/technetwork/java/javase/downloads/index.html

0. Change the Java Heap appropriate to your machine:

   <pre>HEAP="-Xms512m -Xmx2148m"</pre>

   * http://java.dzone.com/articles/java-8-permgen-metaspace 

   * http://www.infoq.com/news/2013/03/java-8-permgen-metaspace
   <br /><br />

0. Verify whether the JAVA_HOME environment points to the JRE or JDK installation folder:

   <pre><strong>echo $JAVA_HOME
   </strong></pre>

0. Verify whether the JAVA_HOME/bin folder has been properly added to the PATH environment variable.



## Install JMeter

   There are several ways to obtain a running instance of JMeter.


### Docker container

A Docker image contains bits.


### Blazemeter

   https://blazemeter.com
   cloud

### Download installer

0. Download <strong>binary</strong> installer from:

   <a target="_blank" href="http://jmeter.apache.org/download_jmeter.cgi">
   http://jmeter.apache.org/download_jmeter.cgi</a>

   apache-jmeter-3.2.zip

0. In Finder, double-click the file to unzip to folder:

   apache-jmeter-3.2

0. Move the folder to a folder with a path containing no spaces, such as:

   PROTIP: Putting the folder in your home folder would avoid issues with permissions.

   <pre>
   cd ~/Downloads
   mv apache-jmeter-3.2  ~/jmeter
   cd jmeter
   ls
   </pre> 

0. The folders:

   * bin contains executables, jar, and properties files
   * docs
   * extras contains miscellaneous files including samples using the Apache Ant tool
   * lib contains library utlity jar files
   * lib/ext contains JMeter components and add-ons
   * licenses contains legal text 
   * printable_docs contains the usermanual in html and a demos folder containing jmx files
   <br /><br />

   
### Set Path

On Windows...

On Mac/Linux:

0. Edit <tt>subl ~/.bash_profile</tt>

0. Add the path, with a colon:

   <pre>
export PATH="$HOME/jmeter:$PATH"
   </pre>


## Configure

0. Edit properties file:

   <pre><strong>cd bin
   edit jmeter.properties
   </strong></pre>

0. Specify slave computers IP addresses, separated by commas. Example:

   <pre>
   remote_hosts=192.168.0.10,192.168.0.11,192.168.0.12,192.168.0.13,192.168.0.14
   </pre>

   All on the same subnet?

   CAUTION: All instances of JMeter should have the same version.

   DEFINITIONS: 

   <strong>Slave</strong> is the system running jmeter-server, which takes commands from the GUI and send requests to 

   <strong>Target</strong> servers, the web server under test

   <strong>Master</strong> is the JMeter system running Jmeter GUI controlling the server which controls slaves.


### Invoke JMeter GUI

0. Define $JMETER_HOME

0. Go to <strong>$JMETER_HOME/bin</strong> and run:

   <pre><strong>chmod 555 jmeter.sh
   ./jmeter.sh
   </strong></pre>

   Alternately, if you are using Windows:

   <pre><strong>jmeter.bat
   </strong></pre>

   In response, a DOS window should appear with 

   <pre><strong>jre\[version]\bin\rmiregistry.exe
   </strong></pre>

   [version] is the jre version installed on the system.

   If it does not happen, either the environment settings are incorrect, 
   or there are several JREs installed on the system. 


   ### Help

0. To view all possible command line options:

   <pre><strong>
   jmeter -h
   </strong></pre>



## Install JMeter Generator

These are the bare mininum JARs required based on JMeter 2.9 and the HTTPSampler used. 

Other samplers will most likely have different library JAR dependencies:

* ApacheJMeter_core.jar
* jorphan.jar
* avalon-framework-4.1.4.jar
* ApacheJMeter_http.jar
* commons-logging-1.1.1.jar
* logkit-2.0.jar
* oro-2.0.8.jar
* commons-io-2.2.jar
* commons-lang3-3.1.jar
<br /><br />


## integrate JMeter with Apache Ant using the JMeter Ant Task

http://ant.apache.org/

http://www.programmerplanet.org/projects/jmeter-ant-task/

http://ant.apache.org/manual/install.html

http://www.programmerplanet.org/projects/jmeter-ant-task/


## Prepare sample test.jmx

JMeter tests are defined in an XML-format file.

0. View JMeter example files that comes with the installer in 

   <em>script</em>/extras/

   This path is shown as "..." below.

0. Remove graphic data writers for batch.


0. Set Up at Least One Thread Group and Sampler

   Unlike LoadRunner, a JMeter
   thread group contains both the automated script (URLs, etc.) and the load scenario. 

   In thread groups is defined the number of users to simulate. Each user is emulated by each thread. 

   The ramp-up period tells JMeter how long it should take to reach the desired number of threads chosen. 

   Set the number of iterations to process each user in the group with the Loop Count.

   Click on the thread group to see the load configurations. Expand a thread group to see the steps of the load script.

0. Set up Samplers

   Samplers emulate the actual work done within clients. When JMeter executes samplers, it writes down the results such as: 
   start time, duration, success, response messages, etc.  

   Listeners are used to view results. 
   The most commonly used sampler is the HTTP Request, which sends a HTTP or HTTPS request to a web server.

0. Add Timers

   Set the duration of the delay from one request to the next.
   The specification is how many seconds JMeter waits before navigating from the homepage to the features page.

0. Add Configuration Elements

   This manages elements like the cache and the cookies, during test runs. 

   Adding the “HTTP Cache Manager” and the “HTTP Cookie Manager” simulates the browser’s behavior. 

   See <a target="_blank" href="https://guide.blazemeter.com/hc/en-us/articles/206733719-How-to-make-JMeter-behave-more-like-a-real-browser">
   this</a>.

0. Add Assertions

   These define pass or fail criteria for the test.

   Let’s say you want to make sure your site or app responds within 100 milliseconds. 

   You can set a Duration Assertion to specify that if any response lasts longer than 100 milliseconds, the sample will be marked as “failed.”
 
   The most important assertion to know is the Response Assertion. This covers 99% of your needs - so no wonder it’s so popular! You can use it to test the URL, response body, messages, embedded resources, redirects, headers and more. This assertion gives you loads of flexibility as it lets you test regular expressions rather than text patterns. JMeter handles regular expressions in a very similar way to Perl - except you don’t enclose the expression in //’s.
 
0. Add Listeners

   Listeners display the results of a sampler. 

   Listeners can be viewed in various formats (table, graph, tree, or log file). 

   Listeners can be added anywhere in the test - but only collect data (listens) to elements on the same level or below.

   The most commonly used listener is "View Results Tree", which presents in the GUI all test plan results in a user-friendly tree structure.

   Other listeners include Assertion Results, Aggregate Report and Beanshell Listener.
 
   WARNING: Disable all your listeners as they use up a lot of memory.

0. Add a Thread Group component by right-clicking on the name of a test plan to select ‘Add’, then
   choose the component to set up and configure.


## Start JMeter Batch run

0. Substituting <em>script</em> with your script name:

   <pre><strong>jmeter -n -t .../Test.jmx -l .../test.jtl -e -o [Path to output folder]
   </pre></strong>
 
   where:
 
   <tt>-n</tt> tells JMeter to run in <strong>n</strong>on-GUI mode
 
   <tt>-t</tt> the path to source .jmx script to run the script that comes with the JMeter installation.

   <tt>-l</tt> test .jtl

   <tt>-j</tt> the name of JMeter run log file.

   <tt>-p</tt>  or <pre>--propfile</pre> to preced a JMeter property file to use 

   <tt>-q</tt> or --addprop to precede JMeter property file(s)

   Aditionally, JMeter has several other parameters that can be used for running in non-GUI mode.
 
   <tt>-R</tt> lists remote servers to run.
 
   <tt>-H</tt> proxy server hostname or ip address.
 
   <tt>-P</tt> proxy server port.


## Shutdown and Abort run

   Running JMeter in non-GUI mode means there is no Menu which listens to keystrokes such as Control + '.'. 

   However, JMeter in non-GUI mode listens for commands on port <strong>4445</strong> 
   (set at default in the JMeter property <tt>jmeterengine.nongui.port</tt>). 
   If that port is being used (i.e. by another JMeter instance), JMeter tries the next higher port, 
   continuing until it reaches the JMeter property jmeterengine.nongui.maxport, which defaults to 4455 (10 more). 
   If maxport is less than or equal to port, port scanning stops.

   Since the JVM calls class files from ApacheJMeter.jar,
   the CLASSPATH variable needs to be put in the PATH along with ApacheJmeter.jar, 
   because inside these files is this string:
 
   <strong><pre>java -cp %~dp0ApacheJMeter.jar org.apache.jmeter.util.ShutdownClient StopTestNow %*</strong></pre>


0. Gracefully shutdown
   using these scripts the installer puts in the JMeter /bin directory. 

   <pre><strong>Shutdown.cmd
   </strong></tt>

   Alternately, shutdown immediately:

   <pre><strong>StopTestNow.cmd
   </strong></tt>

   The commands will only be accepted if the script is run from the same host.


## Certificates

   JMeter makes use of the
   keytool utility (available in JRE/JDK) so you need to ensure your configuration is correct, read this wiki page before starting.


## Report review

   The Ant task creates a report like <a target="_blank" href="https://www.blazemeter.com/blog/5-ways-launch-jmeter-test-without-using-jmeter-gui">
   this</a>:

   ![jmeter ant html blazemeter](https://cloud.githubusercontent.com/assets/14143059/26027083/34137d7c-37d5-11e7-8013-7ae801b13cff.png)


## Record Custom Script

0. Install the <a target="_blank" href="https://guide.blazemeter.com/hc/en-us/articles/206732579-Chrome-Extension">
   JMeter Chrome Extension</a> filters only the URL’s to be load tested.


   http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.html

   See <a target="_blank" href="https://www.blazemeter.com/blog/how-cut-your-jmeter-scripting-time-80">
   How to Cut Your JMeter Scripting Time by 80%</a>
   using Blazemeter's "Smart JMX" to generate script files from proxy recordings.

   The recording has Automatic Extractors that does
   auto-parameterization (also known as "auto-correlation" of values with variables it creates).


JMeter ThreadGroup and Samplers. 

<a target="_blank" href="http://stackoverflow.com/questions/19147235/how-to-create-and-run-apache-jmeter-test-scripts-from-a-java-program">
this</a>


## Generate JMeter Code from Swagger



