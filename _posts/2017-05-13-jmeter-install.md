---
layout: post
title: "JMeter install on a Mac to load test a RabbitMQ service"
excerpt: "Know the options, including my shell script that does it all, each step explained"
tags: [perftest, JMeter]
shorturl: "https://"
image:
# feature: pic white hand key ownership 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622160/3b59e1b2-0585-11e6-9157-cc003fc0f90b.jpg
  credit:
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial introduces "newbies" to the installation of JMeter by explaining each setp of an automated script for imposing artificial load on a local server running RabbitMQ.

## Background

1. In an internet browser (Google Chrome, Mozilla Firefox, Apple Safari, etc.), open

   <a target="_blank" href="
   https://github.com/apache/jmeter">
   https://github.com/apache/jmeter</a>

   BTW: Historically, JMeter first became available December 2003 as the Jakarta project until it became a full-fledged product. Its previous URL is automatically routed from
   http://jakarta.apache.org/jmeter/

   For now, just look at the webpage header:
   JMeter is open-sourced by the Apache Foundation project. 
   This means JMeter is offered free.

   The "J" in JMeter refers to the Java Virtual Machine (JVM).
   JMeter is written in Java.
   This makes JMeter <strong>multi-platform</strong> on Windows, MacOS, Linux.

   "Meter" refers to being akin to parking meters that measure time. 
   It is said that "Time is money" because when a user waits for the system to respond, he or she is not productive getting work done. And the longer that a transaction takes to respond, the more servers are needed to server everyone.

   Each JMeter program running can emulate hundreds of human users typing and clicking through a web application because JMeter mimics just the network traffic exchanged between clients and servers. We make JMeter do that in order to measure how the application server will likely behave under load when running in production. The amount of load imposed by JMeter is often described in terms of the number of <em>real</em> users JMeter emulates. Each fake user may be setup to submit transactions quicker than real users.

   From the Apache web page:

   BLAH: "JMeter is not a browser, it works at protocol level. As far as web-services and remote services are concerned, JMeter looks like a browser (or rather, multiple browsers); however JMeter does not perform all the actions supported by browsers. In particular, JMeter does not execute the Javascript found in HTML pages. Nor does it render the HTML pages as a browser does (it's possible to view the response as HTML etc., but the timings are not included in any samples, and only one sample in one thread is ever displayed at a time)."

## Installation options

There are several ways to obtain a running instance of JMeter,
listed from easiest to most difficult:

A) You don't need a local machine if you run JMeter within a cloud service such as at
   <a href="#Blazemeter">Blazemeter.com</a> or 
   <a target="_blank" href="https://www.flood.io/">Flood.io</a>

   But customers at some companies do not trust public clouds. So...

B) <a href="#BinaryInstall">Manually download installer to install locally</a>.

C) <a href="#DockerHub">Pull an image from Docker Hub</a> 
   within a Google Compute or AWS cloud instance.

D) <a href="#Dockerfile">Use the Dockerfile to build your own Docker image</a> containing JMeter.

E) <a href="#AutoScript">Run a Bash scrpt to install JMeter natively on you Mac</a>.

F) <a href="#Manually">Manually type in Terminal commands executed in the automated script</a>.

CAUTION: If you are in a large enterprise, confer with your security team before 
installing. They often have a repository such as Artifactory or Nexus where
installers are available after being vetted and perhaps patched
for security vulnerabilities.



<a name="Blazemeter"></a>

## Blazemeter SaaS

You don't need a local machine if you use the cloud service<br />
<a target="_blank" href="https://blazemeter.com/">blazemeter.com</a>

The SaaS vendor was purchased by CA in 2017.

Users of Blazemeter can use their add-on test framework.

Blogs about this:

* https://www.blazemeter.com/blog/5-ways-launch-jmeter-test-without-using-jmeter-gui
* https://www.artofsoftwaredevelopment.com/performance/performance-testing-in-the-cloud-with-jmeter-aws



<a name="BinaryInstall"></a>

## Manually download installer

1. Even if you're not intending to download, go here to see the dates of each version available for download:

   <a target="_blank" href="http://jmeter.apache.org/download_jmeter.cgi">
   http://jmeter.apache.org/download_jmeter.cgi</a>

   At time of writing:

   apache-jmeter-3.3.zip

2. In Finder, double-click the file to unzip to folder:

   apache-jmeter-3.3

3. Move the folder to a folder with a path containing no spaces, such as:

   PROTIP: Putting the folder in your home folder would avoid issues with permissions.

   <pre>
   cd ~/Downloads
   mv apache-jmeter-3.3  ~/jmeter
   cd jmeter
   </pre> 

   export PATH="$HOME/jmeter:$PATH"



<a name="DockerHub"></a>

## Images from DockerHub.com

A Docker image is ready to run, after having Docker build it based on a Dockerfile.

There are <a target="_blank" href="https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=jmeter&starCount=0">
many JMeter images on DockerHub</a>. 

The most popular:

   <pre>
   docker pull <a target="_blank" href="https://hub.docker.com/r/cirit/jmeter/">cirit/jmeter</a>
   </pre>

   BLAH: As of this writing, it runs the <strong>older Jmeter 2.13</strong> + Debian OS + Java Server JRE 8 on<br />
   https://cloud.docker.com/

Another image containing a JMeter server include:

   <pre>
   docker pull <a target="_blank" href="https://hub.docker.com/r/justb4/jmeter/">justb4/jmeter</a>
   </pre>

The image used in the <a target="_blank" href="https://www.flood.io">flood.io</a> SaaS  service is:

   <pre>
   docker pull <a target="_blank" href="https://hub.docker.com/r/floodio/jmeter/">floodio/jmeter</a>
   </pre>

Videos about this topic:

   * https://www.youtube.com/watch?v=sl2mfyjnkXk
   * https://docs.docker.com/docker-cloud/builds/automated-build/


<a name="Dockerfile"></a>

## Build by Dockerfile

PROTIP: Although it takes more time, this approach is often necessary to incorporate new security patches
in all levels of the tech stack, from the operating system up.
Building an image Dockerfile means that you have the <strong>very latest versions</strong> of all components.

Installing within a Docker container means you are not "cluttering up" you native operating system.
In case a particular combination does not work, you can change it without jepordizing your laptop being in a working state.

Rather than repeating the instructions here, for AWS and Blue Ocean clouds,
see https://gist.github.com/hhcordero/abd1dcaf6654cfe51d0b

The script below can be invoked to setup either a Docker image or your local laptop.



<a name="AutoScript"></a>

## Run BASH script

   PROTIP: This script is the starting point for invoking JMeter using continuous integration such as TeamCity or Jenkins.

If you're on a Mac, all the manual steps described below are automatically performed in the script.

1. In a Terminal, navigate to the folder under which a new folder is created. The script creates this under your user home page:

   <pre><strong>
   mkdir temp
   cd ~/temp
   </strong></pre>   

2. Type or copy and paste this command on your Terminal:

   <pre><strong>
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/JMeter-Rabbit-AMQP/master/jmeter-rabbitmq-setup.sh)"
   </strong></pre>

   Before installing each item, the script first tests if the item has already been installed.

   In this tutorial and script, we load test a RabbitMQ message broker to accept and forward messages, like a physical post office: where you put the mail that you want posting in a post box, you can be sure that the Postman will eventually deliver the mail to your recipient. In this analogy, RabbitMQ is a post box, a post office, and a postman.

   https://www.rabbitmq.com/download.html


<a name="Manually"></a>

## Manual step-by-step install

### Java

   PROTIP: JMeter is written in Java, so it can be run on Windows, Mac, and Linux.

   If you were to manually click at
   http://www.oracle.com/technetwork/java/javase/downloads/index.html
   installation would be to:

   <pre>
/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
   </pre>

   But instead use the automated approach:

1. First see what version is considered the latest 64-bit Java Development Kit (JDK) by brew:

   <pre><strong>
   brew cask info java
   </strong></pre>

   BLAH: We don't want to install version 9 just yet because when JMeter is installed, it throws up this error:

   <pre>
   Error: Java version is too low to run JMeter. Needs at least Java >= 1.8.0.
   </pre>

1. If you have it already installed, <a target="_blank" href="https://planwithvoyant.zendesk.com/hc/en-us/articles/209725003-Install-or-revert-to-a-prior-version-of-Java-Mac-OS-X">uninstall it</a>.

1. PROTIP: Install not the latest 64-bit Java Development Kit (JDK), but the last stable v1.8 version:

   <pre><strong>
   brew tap caskroom/versions
   brew cask install java8
   </strong></pre>

   The response:

   <pre>
==> Caveats
This Cask makes minor modifications to the JRE to prevent issues with
packaged applications, as discussed here:
&nbsp;
  https://bugs.eclipse.org/bugs/show_bug.cgi?id=411361
&nbsp;
If your Java application still asks for JRE installation, you might need
to reboot or logout/login.
&nbsp;
Installing this Cask means you have AGREED to the Oracle Binary Code
License Agreement for Java SE at
&nbsp;
  https://www.oracle.com/technetwork/java/javase/terms/license/index.html
&nbsp;
==> Satisfying dependencies
==> Downloading http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd30
######################################################################## 100.0%
==> Verifying checksum for Cask java8
==> Installing Cask java8
==> Running installer for java8; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are i
Password:
==> installer: Package name is JDK 8 Update 152
==> installer: Installing at base path /
==> installer: The install was successful.
🍺  java8 was successfully installed!
   </pre>


2. Provide your administrator password when prompted.

3. Confirm it works by returning the version of the Java compiler installed. In version 9:

   <pre><strong>
   javac --version
   </strong></pre>

   Alternately, in version 8, use a single dash:

   <pre><strong>
   javac -version
   </strong></pre>


   <a name="JMeterInstall"></a>

   ### JMeter install

4. On a Mac, with a Terminal at any folder, install:

   <pre><strong>
   brew install jmeter --with-plugins
   </strong></pre>

   Notice in the response that there is a different version of the installer for each version of the operating system. At time of this writing:

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/jmeter-3.3.el_capitan.bottle.tar.gz
######################################################################## 100.0%
==> Pouring jmeter-3.3.el_capitan.bottle.tar.gz
🍺  /usr/local/Cellar/jmeter/3.3: 2,855 files, 101.7MB
   </pre>

   PROTIP: Behind the scenes, downloads are from: <br />
   https://www.apache.org/dyn/closer.cgi?path=jmeter/binaries/apache-jmeter-3.3.tgz


5. The script saves the file path other scripts will be using to invoke JMeter just installed:

   <pre><strong>
   export JMETER_HOME="/usr/local/Cellar/jmeter/3.3"
   echo $JMETER_HOME
   ls $JMETER_HOME
   </strong></pre>

   The response (at time of writing):

   <pre>
/usr/local/Cellar/jmeter/3.3
INSTALL_RECEIPT.json NOTICE         bin
LICENSE        README.md      libexec
   </pre>

   Alternately, if you are to be using JMeter on your machine, add the export in your Mac's 
   <tt>~/.bash_profile</tt> file.

6. Let's summarize what folders are in a folder, install the tree utility:

   <pre><strong>
   brew install tree
   </strong></pre>

7. Show the first level tree:

   <pre><strong>
   tree -L 1
   </strong></pre>

   The folders:

   * <strong>bin</strong> contains executables, jar, and properties files
   * docs
   * extras contains miscellaneous files including samples using the Apache Ant tool
   * <strong>lib</strong> contains library utlity jar files
   * lib/ext contains JMeter components and add-ons
   * licenses contains legal text 
   * printable_docs contains the usermanual in html and a demos folder containing jmx files
   <br /><br />

   ### Run bash script

1. To obtain a JMeter project to test a RabbitMQ service:

   <pre><strong>
   git clone https://github.com/wilsonmar/JMeter-Rabbit-AMQP --depth=1
   cd JMeter-Rabbit-AMQP
   </strong></pre>

   PROTIP: The depth parameter ensures that only the most recent version of files are downloaded instead of all the history.

   NOTE: The repo was cloned from https://github.com/jlavallee/JMeter-Rabbit-AMQP 
   because of a deprecation error in <a href="#Build">build.xml</a> updated to Java 1.8 from 1.5:

   <pre>
  &LT;property name="target.java.version" value="1.5"/>
  &LT;property name="src.java.version" value="1.5"/>
   </pre>

   Its author <a target="_blank" href="https://www.linkedin.com/in/vcampos1/">Vitor Campos</a> from Brazil (vitor@ciandt.com) no longer has an active account on GitHub.

   I also added the Bash script described above.


1. Let's see what was built, using the tree utility (which we installed above):

   <pre><strong>
   tree
   </strong></pre>

   The tree output:

   <pre>
├── LICENSE
├── README.md
├── build.xml
├── examples
│   └── RPC_Load_Test.jmx
├── ivy.xml
└── src
    └── main
        └── com
            └── zeroclue
                └── jmeter
                    └── protocol
                        └── amqp
                            ├── AMQPConsumer.java
                            ├── AMQPPublisher.java
                            ├── AMQPSampler.java
                            └── gui
                                ├── AMQPConsumerGui.java
                                ├── AMQPPublisherGui.java
                                └── AMQPSamplerGui.java
   </pre>

   The convention for Java program is to have programming source files within the <tt>src</tt> folder.
   The folder <tt>src/main/com/zeroclue/jmeter/protocol/amqp/</tt> contains Java code to recognize and respond to the AMQP (Advanced Message Queuing Protocol) used by <strong>RabbitMQ</strong> services.

   * AMQPConsumer.java
   * AMQPPublisher.java
   * AMQPSampler.java
   <br /><br />

   The companion to that set of programs are within the folder "gui".

   <tt>import</tt> statements in the code are dependencies that need to be downloaded as well before the Java code is compiled into classes that Java Virtual Machine runs.
   That is done by a build automation.


   ### Build

1. When a project's files include a <strong>build.xml</strong> file for ant or maven program to specify download of libraries needed by source code in the src folder.

1. Install the ant program and run it:

   <pre><strong>
   brew install ant
   </strong></pre>   

   At time of this writing:

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/ant-1.10.1.el_capitan.bottle.tar.gz
######################################################################## 100.0%
==> Pouring ant-1.10.1.el_capitan.bottle.tar.gz
🍺  /usr/local/Cellar/ant/1.10.1: 1,628 files, 36.8MB
   </pre>

   PROTIP: https://github.com/jfifield/ant-jmeter provides examples of how to use ant to run JMeter.

   * http://ant.apache.org/
   * http://www.programmerplanet.org/projects/jmeter-ant-task/
   * http://ant.apache.org/manual/install.html
   * http://www.programmerplanet.org/projects/jmeter-ant-task/
   <br /><br />

1. Edit to view the <strong>build.xml</strong> file.

1. Run the ant program which knows to read the <strong>build.xml</strong> file:

   <pre><strong>
   ant
   </strong></pre>   

   At time of writing, when running on Java 8, the many console messages end with:

   <pre>
   ---------------------------------------------------------------------
   |                  |            modules            ||   artifacts   |
   |       conf       | number| search|dwnlded|evicted|| number|dwnlded|
   ---------------------------------------------------------------------
   |       build      |  119  |  108  |  108  |   33  ||   86  |   86  |
   |      runtime     |  119  |  108  |  108  |   33  ||   86  |   86  |
   ---------------------------------------------------------------------
&nbsp;
compile:
     [echo] Compiling
    [mkdir] Created dir: /Users/wilsonm/gits/JMeter-Rabbit-AMQP/target/classes
    [javac] Compiling 6 source files to /Users/wilsonm/gits/JMeter-Rabbit-AMQP/target/classes
    [javac] warning: [options] bootstrap class path not set in conjunction with -source 1.5
    [javac] warning: [options] source value 1.5 is obsolete and will be removed in a future release
    [javac] warning: [options] target value 1.5 is obsolete and will be removed in a future release
    [javac] warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
    [javac] 4 warnings
&nbsp;
package:
    [mkdir] Created dir: /Users/wilsonm/gits/JMeter-Rabbit-AMQP/target/dist
      [jar] Building jar: /Users/wilsonm/gits/JMeter-Rabbit-AMQP/target/dist/JMeterAMQP.jar
&nbsp;
BUILD SUCCESSFUL
Total time: 2 minutes 17 seconds
   </pre>

   BTW, if ant is run again, the search and "dwnlded" would be zero because they are already downloaded.

   CAUTION: When running on Java 9, this error message appears before the compile fails:

   <pre>
compile:
     [echo] Compiling
    [javac] Compiling 6 source files to /Users/wilsonm/gits/wilsonmar/JMeter-Rabbit-AMQP/target/classes
    [javac] warning: [options] bootstrap class path not set in conjunction with -source 1.5
    [javac] error: Source option 1.5 is no longer supported. Use 1.6 or later.
    [javac] error: Target option 1.5 is no longer supported. Use 1.6 or later.
   </pre>

1. Let's see what was added by the build, using the tree utility installed earlier:

   <pre><strong>
   tree
   </strong></pre>

   The tree:

   <pre>
├── ivy
│   └── ivy.jar
└── target
    ├── classes
    │   └── com
    │       └── zeroclue
    │           └── jmeter
    │               └── protocol
    │                   └── amqp
    │                       ├── AMQPConsumer.class
    │                       ├── AMQPPublisher.class
    │                       ├── AMQPSampler.class
    │                       └── gui
    │                           ├── AMQPConsumerGui.class
    │                           ├── AMQPPublisherGui.class
    │                           └── AMQPSamplerGui.class
    └── dist
        └── JMeterAMQP.jar
   </pre>

   Ant installs Apache Ivy, which is <a target="_blank" href="https://ant.apache.org/ivy/m2comparison.html
">used instead of Maven for resolving dependencies</a>. This avoids the alternative installation using:

   <pre>curl -L -O http://search.maven.org/remotecontent?filepath=org/apache/ivy/ivy/2.3.0/ivy-2.3.0.jar
   </pre>

   ivy.jar is run by Ant to resolve dependencies specified in file <tt>ivy.xml</tt>.   

   Also, the build created a <strong>target</strong> folder containing java executable class files. These are packaged into the <tt>JMeterAMQP.jar</tt> within the dist folder. That jar is what the JVM runs.


   ### Copy JMeterAMQP.jar into JMeter

1. Copy the <strong>JMeterAMQP.jar</strong> just compiled into where JMeter stores its built-in extension executables:

   <pre><strong>
   \* From the root folder within JMeter-Rabbit-AMQP-master ::
   cp target/dist/JMeterAMQP.jar  $JMETER_HOME/libexec/lib/ext
   ls $JMETER_HOME/libexec/lib/ext -al
   </strong></pre>

   PROTIP: JMeter comes with extensions to work with protocols FTP, JDBC, JMS, LDAP, TCP, mail, MongoDB, etc.


   ### amqp-client jar

1. Use Ivy to download file <tt>amqp-client-3.6.1.jar</tt> from the Maven Repo (dated Mar 01, 2016)
   from http://mvnrepository.com/artifact/com.rabbitmq/amqp-client/3.6.1  ???
   into the $JMETER_HOME/lib folder created during <a href="#JMeterInstall">JMeter install</a>.

   PROTIP: Books about RabbitMQ are listed at the bottom of the Maven web page.

   On a Mac:

   <pre><strong>
   java -jar ivy.jar -dependency com.rabbitmq amqp-client 3.6.1 \
      -retrieve "$JMETER_HOME/lab/[artifact](-[classifier]).[ext]"
   </strong></pre>

   Alternately, on Windows:

   <pre><strong>
   java -jar ivy.jar -dependency com.rabbitmq amqp-client 3.6.1 -retrieve "%JAVA_HOME%/lib/lib/[artifact](-[classifier]).[ext]"
   </strong></pre>

   See: https://www.mkyong.com/ant/ant-how-to-create-a-jar-file-with-external-libraries/


   <a name="InstallRabbitMQ"></a>

   ### Install RabbitMQ server under test

   Based on http://www.rabbitmq.com/install-homebrew.html
   and video https://www.youtube.com/watch?v=8mFsh1cwlsA  Feb 18, 2015 (on Yosemite) by YouTube DevOps celebrity Derek Bailey of http://watchmecode.net/

1. Install RabbitMQ 

   <pre><strong>
   brew install rabbitmq
   </strong></pre>

   The response (at time of writing):

   <pre>
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (caskroom/cask).
No changes to formulae.
&nbsp;
==> Downloading https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.2/rabbit
Already downloaded: /Users/wilsonm/Library/Caches/Homebrew/rabbitmq-3.7.2.tar.xz
==> /usr/bin/unzip -qq -j /usr/local/Cellar/rabbitmq/3.7.2/plugins/rabbitmq_mana
==> Caveats
Management Plugin enabled by default at http://localhost:15672
&nbsp;
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
&nbsp;
To have launchd start rabbitmq now and restart at login:
  brew services start rabbitmq
Or, if you don't want/need a background service you can just run:
  rabbitmq-server
==> Summary
🍺  /usr/local/Cellar/rabbitmq/3.7.2: 232 files, 12.6MB, built in 2 seconds
   </pre>

1. Put the executable within the PATH so it can be executed from any folder:
   https://rabbitmq.com/install-homebrew.htm
 
   <pre><strong>
   export PATH=$PATH:/usr/local/sbin
   </strong></pre>

   Do this permanently to your .bash_profile or .profile file.

   ### Startup service under test

   PROTIP: Start up the server in the background so the script can continue doing other things.

1. Use the nohup to bypass the HUP (hung up) signal that would otherwise cause a shutdown:

   <pre><strong>
   nohup rabbitmq-server &>/dev/null &
   </strong></pre>

   The response is the process number assigned, such as:

   <tt>[1] 26316</tt>

   PROTIP: The <tt>&&LT;/dev/null</tt> prevents nohup from automatically creating a <tt>nohup.out</tt> file which would contain output from the  <tt>rabbitmq-server</tt> command, such as:

   <pre>
  ##  ##
  ##  ##      RabbitMQ 3.7.2. Copyright (C) 2007-2017 Pivotal Software, Inc.
  ##########  Licensed under the MPL.  See http://www.rabbitmq.com/
  ######  ##
  ##########  Logs: /usr/local/var/log/rabbitmq/rabbit@localhost.log
                    /usr/local/var/log/rabbitmq/rabbit@localhost_upgrade.log
&nbsp;
              Starting broker...
   completed with 6 plugins.
   </pre>

   <a target="_blank" href="https://www.maketecheasier.com/systemd-what-you-need-to-know-linux/">
   PROTIP</a>: The "&" ampersand at the end of the command


   ### Stop background service

1. List the background jobs running:

   <pre><strong>
   jobs
   </strong></pre>

   The response:

   <pre>
[1]+  Exit 1                  nohup rabbitmq-server >&/dev/null
   </pre>

   WARNING: Be sure to remember to stop this service when it's not needed.

1. To remove all jobs in the background:

   <pre><strong>
   disown
   </strong></pre>

   
   NOTE: Alternatively, start up the server every reboot using brew:

   <pre><strong>
   brew services start rabbitmq
   </strong></pre>

   The response:

   <pre>
==> Tapping homebrew/services
Cloning into '/usr/local/Homebrew/Library/Taps/homebrew/homebrew-services'...
remote: Counting objects: 14, done.
remote: Compressing objects: 100% (10/10), done.
Unpacking objects: 100% (14/14), done.
remote: Total 14 (delta 0), reused 9 (delta 0), pack-reused 0
Checking connectivity... done.
Tapped 0 formulae (42 files, 55.2KB)
==> Successfully started `rabbitmq` (label: homebrew.mxcl.rabbitmq)
   </pre>   

   Such would create processes listed by the ps command and killed by the pkill or pskill command.


   <a name="RunJMeter"></a>

   ### Run JMeter

1. <a target="_blank" href="https://lincolnloop.com/blog/load-testing-jmeter-part-2-headless-testing-and-je/">
   PROTIP</a>: Run the automated install script runs a "headless" JMeter instance since humans are not involved during script execution. Plus, the memory taken to display a GUI is saved for testing work.

   When running headless, parameters are used. 

2. Get a list of parameters recognized by jmeter:   

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





   To prepare Test plan in JMeter

1. Right-click Test Plan and go to Add->Thread(Users)->Thread Group. Give a name to Thread Group

   A "Test Plan" is a container for "elements" which specifies the parameters for test runs.

   Each "Thread Group" simulates what LoadRunner calls an individual virtual user. 

   Each "thread" is a unit of work that can be simultaneous or sequentially executed. (JMeter itself is multi-threaded).



1. Within the folder. run the jmeter GUI without any parameters:

   <pre><strong>
   jmeter
   </strong></pre>

   This is returned while the Workbench GUI appears:

   <pre>
================================================================================
Don't use GUI mode for load testing, only for Test creation and Test debugging !
For load testing, use NON GUI Mode:
   jmeter -n -t [jmx file] -l [results file] -e -o [Path to output folder]
& adapt Java Heap to your test requirements:
   Modify HEAP="-Xms512m -Xmx512m" in the JMeter batch file
================================================================================
   </pre>

   PROTIP: JMeter should be invoked with more than the default amount of memory by adding paramenters to the HEAP environment variable.



   <a name="WatchRun"></a>

   ### Watch run

1. Manually, switch to an internet browser to see the GUI:

   <pre><strong>
   open http://localhost:15672
   curl --user guest:guest http://localhost:15672 -v
   </strong></pre>

   The default username and password are "guest" and "guest".

   PROTIP: The run.xml file in this repo has been edited to reference the above URL.



## Learning Resources
https://www.guru99.com/jmeter-tutorials.html