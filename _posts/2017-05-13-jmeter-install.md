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


## Install Java

0. Change Java Heap to your machine:

   Modify HEAP="-Xms512m -Xmx512m" in the JMeter batch file


## Install JMeter

   There are several ways to obtain a running instance of JMeter.


### Docker container

A Docker image contains bits.


### Blazemeter

   https://blazemeter.com


### Download installer

0. Download <strong>binary</strong> installer from:

   http://jmeter.apache.org/download_jmeter.cgi

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
   * extras contains a batch file to start JMeter
   * lib contains library jar files
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

   <pre><strong>
   cd bin
   edit jmeter.properties
   </strong></pre>

0. Specify slave computers IP addresses, separated by commas:

   <pre>
   remote_hosts=xxx.x.x.x
   </pre>

   All on the same subnet?

   CAUTION: All instances of JMeter should have the same version.

   DEFINITIONS: 

   <strong>Slave</strong> is the system running jmeter-server, which takes commands from the GUI and send requests to 

   <strong>Target</strong> servers, the web server under test

   <strong>Master</strong> is the JMeter system running Jmeter GUI controlling the server which controls slaves.


### Invoke JMeter GUI

0. Define $JMETER_HOME

0. Go to $JMETER_HOME/bin and run:

   <pre><strong>
   chmod 555 jmeter.sh
   ./jmeter.sh
   </strong></pre>

   Alternately, if you are using Windows:

   <pre><strong>
   jmeter.bat
   </strong></pre>

   In response, a DOS window should appear with 

   <pre><strong>
   jre\[version]\bin\rmiregistry.exe
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

0. Remove all graphic data writers. ???


## Start JMeter Batch run

0. Substituting <em>script</em> with your script name:

   <pre><strong>
   jmeter -n -t .../Test.jmx -l .../test.jtl -e -o [Path to output folder]
   </pre></strong>
 
   where:
 
   <tt>-n</tt> tells JMeter to run in <strong>n</strong>on-GUI mode
 
   <tt>-t</tt> the path to source .jmx script to run the script that comes with the JMeter installation.

   <tt>-l</tt> test .jtl

   <tt>-j</tt> the name of JMeter run log file.

   Besides these options, JMeter has several other parameters that can be used for running in non-GUI mode.
 
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
 
   <strong>java -cp %~dp0ApacheJMeter.jar org.apache.jmeter.util.ShutdownClient StopTestNow %*</strong>


0. Gracefully shutdown
   using these scripts the installer puts in the JMeter /bin directory. 

   <pre><strong>
   Shutdown.cmd
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


## Record Script

   http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.html




## Generate JMeter Code

JMeter ThreadGroup and Samplers. 

<a target="_blank" href="http://stackoverflow.com/questions/19147235/how-to-create-and-run-apache-jmeter-test-scripts-from-a-java-program">
this</a>


