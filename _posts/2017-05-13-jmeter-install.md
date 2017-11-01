---
layout: post
title: "JMeter Installation"
excerpt: "Load up a free Java-based tool to impose load on web sites, whether it needs it or not"
tags: [perftest, JMeter]
shorturl: "https://"
image:
# devsecops-diagram-784x232.png
  feature: https://user-images.githubusercontent.com/300046/32279226-53cabb62-bed5-11e7-8325-2ef07966a838.png
  credit: Zapamfsupport
  creditlink: https://zapamfsupport.wordpress.com/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial explains how to install JMeter ... for fun and profit.

https://jmeter.apache.org/usermanual/jmeter_distributed_testing_step_by_step.pdf

* Sign up for the mailing list at: http://jmeter.apache.org/mail.html

* https://github.com/apache/jmeter

* https://twitter.com/ApacheJMeter

* https://groups.google.com/forum/#!forum/jmeter-plugins


## Install Java Dependency

JMeter is written in Java for cross-platform sweetness.

http://www.oracle.com/technetwork/java/javase/downloads/index.html

0. Change the Java Heap appropriate to your machine:

   <pre>HEAP="-Xms512m -Xmx2148m"</pre>

   * http://java.dzone.com/articles/java-8-permgen-metaspace 

   * http://www.infoq.com/news/2013/03/java-8-permgen-metaspace
   <br /><br />

0. Verify whether the JAVA_HOME environment points to the JRE or JDK installation folder:

   <pre><strong>echo $JAVA_HOME
   </strong></pre>

   The response on my Mac:

   <pre>
/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
   </pre>

0. Verify whether the JAVA_HOME/bin folder has been properly added to the PATH environment variable.

   <pre><strong>javac -version
   </strong></pre>

   The response should be similar to the above:

   <pre>javac 1.8.0_102
   </pre>


## Install JMeter

There are several ways to obtain a running instance of JMeter,
listed from easiest to most difficult:

A) You don't need a local machine if you use the cloud service 
   <a href="#Blazemeter">Blazemeter</a> or Flood.io

B) <a href="#DockerHub">Pull an image from Docker Hub</a> 
   within a Google Compute or AWS cloud instance.

C) Use the Dockerfile to build your own Docker image containing JMeter.

D) <a href="Homebrew">Use Homebrew to install JMeter natively on you Mac</a>.

E) <a href="#BinaryInstall">Download installer to install locally</a>.


CAUTION: If you are in a large enterprise, confer with your security team before 
installing. They often have a repository such as Artifactory or Nexus where
installers are available after being vetted and perhaps patched
for security vulnerabilities.


<a name="Blazemeter"></a>

### Blazemeter SaaS

You don't need a local machine if you use the cloud service<br />
<a target="_blank" href="https://blazemeter.com">blazemeter.com</a>

The SaaS vendor was purchased by CA in 2017.

Users of Blazemeter can use their add-on test framework.

Blogs about this:

* https://www.artofsoftwaredevelopment.com/performance/performance-testing-in-the-cloud-with-jmeter-aws


<a name="DockerHub"></a>

### Images from DockerHub.com

A Docker image is ready to run, after having Docker build it based on a Dockerfile.

There are <a target="_blank" href="https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=jmeter&starCount=0">
many JMeter images on DockerHub</a>. 

The most popular:

   <pre>
   docker pull <a target="_blank" href="https://hub.docker.com/r/cirit/jmeter/">cirit/jmeter</a>
   </pre>

   It runs Jmeter 2.13 + Debian OS + Java Server JRE 8 on https://cloud.docker.com/

Another image containing a JMeter server include:

   <pre>
   docker pull <a target="_blank" href="https://hub.docker.com/r/justb4/jmeter/">justb4/jmeter</a>
   </pre>

The image used in the <a target="_blank" href="https://www.flood.io">flood.io</a> SaaS  service is:

   docker pull <a target="_blank" href="https://hub.docker.com/r/floodio/jmeter/">floodio/jmeter</a>

Videos:

   * https://www.youtube.com/watch?v=sl2mfyjnkXk
   * https://docs.docker.com/docker-cloud/builds/automated-build/

<a name="Homebrew"></a>

### Use Homebrew package manager on Mac

0. Create a folder container.

   <pre><strong>brew update
   brew install jmeter --with-plugins
   </strong></pre>

   It downloads from: <br />
   https://www.apache.org/dyn/closer.cgi?path=jmeter/binaries/apache-jmeter-3.3.tgz
   into:

   <pre>
🍺  /usr/local/Cellar/jmeter/3.3: 2,924 files, 131.4MB, built in 1 minute 14 seconds
   </pre>

   Alternately, if it's already installed:

   <pre><strong>
   brew upgrade jmeter
   </strong></pre>

   PROTIP: As with other package managers, Brew does not save JMeter in your Mac's Applications folder.



<a name="BinaryInstall"></a>

### Download installer from developers

Even if you're not intending to download, go here to see the dates of each version.

0. Download <strong>binary</strong> installer from:

   <a target="_blank" href="http://jmeter.apache.org/download_jmeter.cgi">
   http://jmeter.apache.org/download_jmeter.cgi</a>

   apache-jmeter-3.3.zip

0. In Finder, double-click the file to unzip to folder:

   apache-jmeter-3.3

0. Move the folder to a folder with a path containing no spaces, such as:

   PROTIP: Putting the folder in your home folder would avoid issues with permissions.

   <pre>
   cd ~/Downloads
   mv apache-jmeter-3.3  ~/jmeter
   cd jmeter
   </pre> 

   export PATH="$HOME/jmeter:$PATH"


<a name="SetPath"></a>

### Set Path 

   On Mac/Linux:

0. In a Text Editor, edit file <strong>~/.bash_profile</strong>

   <tt>subl ~/.bash_profile</tt>

0. Insert these lines to make JMeter within the Path sought for executables:

   <pre>
   # Following https://wilsonmar/github.io/jmeter-install ::
   export PATH="/usr/local/Cellar/jmeter/3.3/libexec/bin:$PATH"
   export JMETER_HOME=/usr/local/Cellar/jmeter/3.3/libexec  # if installed using Homebrew
   </pre>

   WARNING: Package managers may install older versions than what is available for direct download.

0. Close existing terminals or refresh on each window:

   <pre>
   source ~/.bash_profile
   </pre>

0. Verify `$JMETER_HOME`

   <pre><strong>
   cd $JMETER_HOME
   pwd
   </strong></pre>

   <pre>/usr/local/Cellar/jmeter/3.3/libexec</pre>


<hr />

## JMeter folders

0. List folders and top-level files:

   <pre>ls -al
   </pre> 

   Alternately:

   <pre>tree -L 1
   </pre> 

   The folders:

   * <strong>bin</strong> contains executables, jar, and properties files
   * docs
   * extras contains miscellaneous files including samples using the Apache Ant tool
   * <strong>lib</strong> contains library utlity jar files
   * lib/ext contains JMeter components and add-ons
   * licenses contains legal text 
   * printable_docs contains the usermanual in html and a demos folder containing jmx files


### Invoke Blank JMeter GUI

   On a Mac:

0. Go to <strong>$JMETER_HOME/bin</strong> and run:

   <pre><strong>chmod 555 jmeter.sh
   ./jmeter.sh
   </strong></pre>

   Alternately, invoke the JMeter GUI program using the link:

   <pre><strong>open /usr/local/bin/jmeter
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

   Either way, the response:

   <pre>
================================================================================
Don't use GUI mode for load testing, only for Test creation and Test debugging !
For load testing, use NON GUI Mode:
   jmeter -n -t [jmx file] -l [results file] -e -o [Path to output folder]
& adapt Java Heap to your test requirements:
   Modify HEAP="-Xms512m -Xmx512m" in the JMeter batch file
================================================================================
   </pre>

   The default JMeter GUI:

   <img alt="jmeter-3.3-UI-default-2046x1240-85392.png" width="650" src="https://user-images.githubusercontent.com/300046/32251766-b1b65cda-be4f-11e7-87e6-16ed8ff06083.png">

   PROTIP: Press command+Q to Quit out of the JMeter GUI.


<a name="SampleScripts"></a>

## Sample test.jmx

0. Open another Terminal and be at:

   <pre><strong>
   cd $JMETER_HOME/extras/
   </strong></pre>

0. View JMeter example files that comes with the installer:

   <pre><strong>
   ls *.jmx
   </strong></pre>

   The response is:

   <pre>
   Test.jmx
   </pre>

   PROTIP: JMeter test scripts are defined within XML-formatted files.

0. Remove graphic data writers for batch.

0. Set Up at Least One Thread Group:

   PROTIP: A JMeter
   thread group contains both the automated script (URLs, etc.) and the load scenario. 
   This is unlike LoadRunner, which has scripts in files folders separate from the Scenario (.lrs) file.

   In thread groups is defined the number of users to simulate. 
   Each user is emulated by a separate thread. 

   The ramp-up period tells JMeter how long it should take to reach the desired number of threads chosen. 

   Set the number of iterations to process each user in the group with the Loop Count.

   Click on the thread group to see the load configurations. Expand a thread group to see the steps of the load script.

0. Set up Samplers:

   Samplers emulate the actual work done within clients. When JMeter executes samplers, it writes down the results such as: 
   start time, duration, success, response messages, etc.  

   Listeners are used to view results. 
   The most commonly used sampler is the HTTP Request, which sends a HTTP or HTTPS request to a web server.

0. Add Timers:

   Set the duration of the delay from one request to the next.
   The specification is how many seconds JMeter waits before navigating from the homepage to the features page.

0. Add Configuration Elements:

   This manages elements like the cache and the cookies, during test runs. 

   Adding the “HTTP Cache Manager” and the “HTTP Cookie Manager” simulates the browser’s behavior. 

   See <a target="_blank" href="https://guide.blazemeter.com/hc/en-us/articles/206733719-How-to-make-JMeter-behave-more-like-a-real-browser">
   this</a>.

0. Add Assertions:

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



## JMeter commands

0. To view information:

   <pre><strong>
   jmeter -h
   </strong></pre>

   The response:

   <pre>
Writing log file to: /Users/mac/jmeter.log
   </pre>   

0. To view all possible command line options:

   <pre><strong>
   jmeter -?
   </strong></pre>

   The response has the version at the right edge (3.1 at time of writing):

   <pre>
Writing log file to: /Users/mac/jmeter.log
    _    ____   _    ____ _   _ _____       _ __  __ _____ _____ _____ ____     
   / \  |  _ \ / \  / ___| | | | ____|     | |  \/  | ____|_   _| ____|  _ \   
  / _ \ | |_) / _ \| |   | |_| |  _|    _  | | |\/| |  _|   | | |  _| | |_) | 
 / ___ \|  __/ ___ \ |___|  _  | |___  | |_| | |  | | |___  | | | |___|  _ <  
/_/   \_\_| /_/   \_\____|_| |_|_____|  \___/|_|  |_|_____| |_| |_____|_| \_\ 3.1 r1770033  
&nbsp;
Copyright (c) 1999-2016 The Apache Software Foundation
&nbsp;
   --?
      print command line options and exit
   -h, --help
      print usage information and exit
   -v, --version
      print the version information and exit
   -p, --propfile &LT;argument>
      the jmeter property file to use
   -q, --addprop &LT;argument>
      additional JMeter property file(s)
   -t, --testfile &LT;argument>
      the jmeter test(.jmx) file to run
   -l, --logfile &LT;argument>
      the file to log samples to
   -j, --jmeterlogfile &LT;argument>
      jmeter run log file (jmeter.log)
   -n, --nongui
      run JMeter in nongui mode
   -s, --server
      run the JMeter server
   -H, --proxyHost &LT;argument>
      Set a proxy server for JMeter to use
   -P, --proxyPort &LT;argument>
      Set proxy server port for JMeter to use
   -N, --nonProxyHosts &LT;argument>
      Set nonproxy host list (e.g. *.apache.org|localhost)
   -u, --username &LT;argument>
      Set username for proxy server that JMeter is to use
   -a, --password &LT;argument>
      Set password for proxy server that JMeter is to use
   -J, --jmeterproperty &LT;argument>=<value>
      Define additional JMeter properties
   -G, --globalproperty &LT;argument>=&LT;value>
      Define Global properties (sent to servers)
      e.g. -Gport=123
       or -Gglobal.properties
   -D, --systemproperty &LT;argument>=&LT;value>
      Define additional system properties
   -S, --systemPropertyFile &LT;argument>
      additional system property file(s)
   -L, --loglevel &LT;argument>=&LT;value>
      [category=]level e.g. jorphan=INFO or jmeter.util=DEBUG
   -r, --runremote
      Start remote servers (as defined in remote_hosts)
   -R, --remotestart &LT;argument>
      Start these remote servers (overrides remote_hosts)
   -d, --homedir &LT;argument>
      the jmeter home directory to use
   -X, --remoteexit
      Exit the remote servers at end of test (non-GUI)
   -g, --reportonly &LT;argument>
      generate report dashboard only, from a test results file
   -e, --reportatendofloadtests
      generate report dashboard after load test
   -o, --reportoutputfolder &LT;argument>
      output folder for report dashboard
   </pre>   


   <a name="BatchRun"></a>

   ## Run JMeter in Batch

   The format of command line:

   <pre><strong>jmeter -n -t .../<em>Test</em>.jmx -l .../<em>test</em>.jtl -e -o <em>[Path to output folder]</em>
   </strong></pre>
 
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


   ### Shutdown and Abort run

   Running JMeter in non-GUI (batch) mode means there is no Menu which listens to keystrokes such as 
   Control + '.'. 

   However, JMeter in non-GUI mode listens for commands on port <strong>4445</strong> 
   (set at default in the JMeter property <tt>jmeterengine.nongui.port</tt>). 
   If that port is being used (i.e. by another JMeter instance), JMeter tries the next higher port, 
   continuing until it reaches the port defined in JMeter property 
   <tt>jmeterengine.nongui.maxport</tt>, which defaults to <strong>4455</strong> 
   (10 more than the default). 

   Since the JVM calls class files from ApacheJMeter.jar,
   the CLASSPATH variable needs to be in the PATH along with ApacheJmeter.jar, 
   because inside these files is this string:
 
   <pre><strong>java -cp %~dp0ApacheJMeter.jar org.apache.jmeter.util.ShutdownClient StopTestNow %*
   </strong></pre>


0. Gracefully shutdown
   using these scripts the installer puts in the JMeter /bin directory. 

   <pre><strong>
   shutdown.cmd
   </strong></pre>

   Alternately, shutdown immediately:

   <pre><strong>
   StopTestNow.cmd
   </strong></pre>

   The commands will only be accepted if the script is run from the same host.



<hr />

## Servers in user.properties

Specify the various slave servers the master JMeter server uses.


0. Use your favorite text editor instead of vi to edit properties file:

   <pre><strong>cd $JMETER_HOME/bin
   vi user.properties
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


<a name="Plugins"></a>

## Plugins

There are many plug-ins various people have developed for JMeter:

Plugins Standard, Extras, ExtrasLibs, WebDriver, Hadoop, etc.


## Install Sample Apps under Test

PROTIP: Learn to use JMeter targeting a sample app so you can follow tutorials
step by step, to equip you for troubleshooting the unknown.

These are the bare mininum JARs required by JMeter 2.9+ and the HTTPSampler used. 

Other samplers have different library JAR dependencies:

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



## Integrate JMeter with Apache Ant 

0. Install the JMeter Ant Task

http://ant.apache.org/

http://www.programmerplanet.org/projects/jmeter-ant-task/

http://ant.apache.org/manual/install.html

http://www.programmerplanet.org/projects/jmeter-ant-task/


## Certificates

   JMeter makes use of the
   keytool utility (available in JRE/JDK) so you need to ensure your configuration is correct, read this wiki page before starting.


## Report review

   The Ant task creates a report like <a target="_blank" href="https://www.blazemeter.com/blog/5-ways-launch-jmeter-test-without-using-jmeter-gui">
   this</a>:

   ![jmeter ant html blazemeter](https://cloud.githubusercontent.com/assets/14143059/26027083/34137d7c-37d5-11e7-8013-7ae801b13cff.png)


## Record Custom Script

0. Install the <a target="_blank" href="https://guide.blazemeter.com/hc/en-us/articles/206732579-Chrome-Extension">
   JMeter Chrome Extension</a> which filters only the URL’s to be load tested.


   http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.html

   See <a target="_blank" href="https://www.blazemeter.com/blog/how-cut-your-jmeter-scripting-time-80">
   How to Cut Your JMeter Scripting Time by 80%</a>
   using Blazemeter's "Smart JMX" to generate script files from proxy recordings.

   The recording has Automatic Extractors that does
   auto-parameterization (also known as "auto-correlation" of values with variables it creates).


JMeter ThreadGroup and Samplers. 

<a target="_blank" href="http://stackoverflow.com/questions/19147235/how-to-create-and-run-apache-jmeter-test-scripts-from-a-java-program">
this</a>


## Jenkins

In a Continuous Integration environment, we would incorporate JMeter runs within a Jenkinsfile.

Blogs about this topic:

* http://www.theserverlabs.com/blog/?p=280


## SonarQube

In addition to scanning code,
SonarQube maintains a history of test runs.
http://www.sonarplugins.com/jmeter


## Look into this

Generate JMeter Code from Swagger



## Resources

What others have written:

* https://www.guru99.com/introduction-to-jmeter.html

* http://biscminds.blogspot.fr/2011/12/quick-jmeter-setup-on-mac.html

* http://zacster.blogspot.com/2008/03/quick-howto-to-setup-jmeter.html

