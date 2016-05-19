---
layout: post
title: "Jenkins Setup"
excerpt: "Your robot butler daaaarling"
tags: [Jenkins, setup]
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14624073/7b96364a-0594-11e6-9643-06decef9dbfd.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Jenkins is open-source Java software (running under a Tomcat web server)
to invoke jobs 
for building software and conducting tests, etc.

Jenkins can be invoked on a schedule or "continuously" or triggered
as part of a chain of tasks that kicks off each step in sequence based on ending status.
Thus, Jenkins is a key component of <strong>continuous integration</strong> 
to invoke a chain of tasks needed to ensure that components already unit-tested can be integrated together.

PROTIP: Experienced people warn to NOT check in code that may break things (fails even local unit testing).
This is achieved by having each developer having full capabilities on their workstations or in a private cloud stack.
This may mean using mock interfaces.


<a id="Alternatives"></a>

## Alternatives to Jenkins #

<amp-img width="530" height="246" alt="jenkins alternatives" src="https://cloud.githubusercontent.com/assets/300046/12533728/df265ae4-c1ee-11e5-9a0b-bbc380a2d20f.png"></amp-img>

   * Hudson Oracle
   * Bamboo from Atlassian
   * Travis
   * Fabric
   * Capistrano
   * TFS from Microsoft
   * Team City
   * CodeShip

Jenkins began in 2010 as a fork of Hudson into Github from java.net 
after its acquisition by Oracle's purchase of Sun.

   * http://jenkins-ci.org/content/whos-driving-thing

See: 

  * https://isotope11.com/blog/continuous-deployment-at-isotope11-an-update
    Continuous deployment at Isotope11.

<a id="Prerequisites"></a>

## Prerequisites #

Jenkins is written in Java.
So you'll need to first install Java 1.5 or higher.

If you download Jenkins, it's a <strong>jenkins.war</strong> file.


<a id="Installation"></a>

## Installation options #

   * <a href="#CloudbeesInstall">Cloudbees</a>
   * <a href="#AmazonInstall">Amazon cloud</a>
   * <a href="#Install_Mac">Mac</a>
   * <a href="#Install_Windows">Windows</a>
   * <a href="#Install_Linux">Linux</a>

<a id="CloudbeesInstall"></a>

### Cloudbees Installation #

Installation is not necessary if you use <a target="_blank" href="http://www.cloudbees.com/">
Cloudbees.com</a> which hosts Jenkins in their cloud. Their CEO is Kohsuke Kawaguchi (@kohsukekwa, kk@kohsuke.org)
who invented Hudson/Jenkins. Hear him speak at <a target="_blank" href="https://www.youtube.com/watch?v=0nG4xGYvAa0"> this Oct, 2014 meetup about Workflow</a>.

Cloudbees sells Nectar, a supported and enhanced on-premise version of Jenkins that automatically scales on VMWare virtual machines.



<a name="AmazonInstall"></a>

### Amazon Installation #

Alternately, many host Jenkins on the Amazon cloud:

 * https://www.youtube.com/watch?v=1JSOGJQAhtE Jenkins on Amazon
   by Jeff Shantz:
  
<a name="Install_Linux"></a>

### Installation on Linux #

Alternately, to install on RedHat and Centos Linux machines, follow instructions at:

 * https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions


<a id="Install_Mac"></a>

### Installation on Macs #

Alternately, install on Mac OSX using Homebrew:

 <pre><strong>
 brew update
 brew doctor
 brew install jenkins
 </strong></pre>

  A sample response:

{% highlight text %}
==> Downloading http://mirrors.jenkins-ci.org/war/2.5/jenkins.war
==> Downloading from http://ftp-chi.osuosl.org/pub/jenkins/war/2.5/jenkins.war
######################################################################## 100.0%
==> jar xvf jenkins.war
==> Caveats
Note: When using launchctl the port will be 8080.

To have launchd start jenkins now and restart at login:
brew services start jenkins
Or, if you don't want/need a background service you can just run:
jenkins
==> Summary
🍺  /usr/local/Cellar/jenkins/2.5: 6 files, 66.4M, built in 2 minutes 46 seconds
{% endhighlight %}
 
   Homebrew puts the jenkins.war file in:
  
   ```
   /usr/local/Cellar/jenkins/2.5/libexec/jenkins.war
   ```
  
 For more information:
 
    * http://iosfactory.blogspot.com/2015/02/jenkins-setup-for-ios-development.html
 

<a id="Install_Windows"></a>

### Installation on Windows #

0. Open a Command Window.
0. Install the Chocolatey package manager (if you haven't already) by copying and pasting the PowerShell command from
   <a target="_blank" href="http://chocolatey.org/">Chocolatey.org</a>
0. Install the version of Jenkins that Chocolatey makes available:
 
   <pre><strong>
   choco install jenkins
   </strong></pre>
 
   If Java is not installed on your computer already, it will be installed as a dependency.

   A sample response:

{% highlight text %}
Microsoft Windows [Version 6.1.7601]
Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

C:\Users\Mainali>choco install jenkins
Chocolatey detected you are not running from an elevated command shell
  (cmd/powershell). You may experience errors - many functions/packages
  require admin rights. Only advanced users should run choco w/out an
  elevated shell (and very advanced users as non-admin). When you open
  the command shell, you should ensure "Run as Administrator".
Chocolatey (v0.9.8.31) is installing 'jenkins' and dependencies. By installing y
ou accept the license for 'jenkins' and each dependency you are installing.

jenkins v1.645.0.0

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
d----        01/24/2016     23:09            jenkins

Downloading jenkins 64 bit
  from 'http://mirrors.jenkins-ci.org/windows/jenkins-1.645.zip'
Extracting C:\Users\Mainali\AppData\Local\Temp\chocolatey\jenkins\jenkins-1.645.
zip to C:\Users\Mainali\AppData\Local\Temp\chocolatey\jenkins...
C:\Users\Mainali\AppData\Local\Temp\chocolatey\jenkins
Installing jenkins...
jenkins has been installed.
Finished installing 'jenkins' and dependencies - if errors not shown in console,
 none detected. Check log for errors if unsure.
{% endhighlight %}
 
   Notice Java is installed on path `C:\Users\%User%\AppData\Local\Temp\chocolatey\jenkins`, where %user% is what's on your own computer.


<a id="Verify_install"></a>

## Verify Installation #

0. Verify intallation on a Mac or Linux:

   ```
   which jenkins
   ```
 
   The response is the location Jenkins was installed:
 
   ```
   /usr/local/bin/jenkins
   ```

<a id="Start-server"></a>

## Start server with defaults #

The command to start Jenkins has several parameters.

0. See https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins
   for a full explanation, inclidiong use of <strong>nohup</strong>.

0. Start Jenkins using defaults:

   ```
   jenkins
   ```

   If all goes well, you should see:

   ```
   INFO: Jenkins is fully up and running.
   ```

0. Confirm tcp ports Jenkins uses as java (8005 sharing, 8009, 8080):

   ```
   netstat | grep java
   ```

## Stop server #

PROTIP: Do not stop the Jenkins instance by clicking the red X to close the command window Jenkins runs under.
   Doing a soft-stop enables Jenkins to save data to memory rather than potentially lose data during a hard and sudden stop.

0. Stop the server by escaping the process.

   * Ctrl+C on Windows
   * command+C on Macs

   &nbsp;

   The response is:
   
   ```
   INFO: JVM is terminating. Shutting down Winstone
   ```

## First-time setup #


### Harden #

PROTIP: Encrypt over the wire by using https instead of https.
    
0. Start Jenkins again using more parameters:

   <pre><strong>
   java -jar jenkins.war --httpPort=-1 --httpsPort=8081 –httpListenAddress=0.0.0.0
   </strong></pre>

    Value -1 turns off the port.

    –httpListenAddress=0.0.0.0 allows remote access, while 127.0.0.1 does not.

    The response:
    
   {% highlight text %}
   Running from: /usr/local/Cellar/jenkins/2.5/libexec/jenkins.war
   webroot: $user.home/.jenkins
   Jan 26, 2016 8:52:21 AM winstone.Logger logInternal
   INFO: Beginning extraction from war file
   Jan 26, 2016 8:52:21 AM org.eclipse.jetty.util.log.JavaUtilLog info
   INFO: jetty-winstone-2.9
   Jan 26, 2016 8:52:27 AM org.eclipse.jetty.util.log.JavaUtilLog info
   INFO: NO JSP Support for , did not find org.apache.jasper.servlet.JspServlet
   Jenkins home directory: /Users/wmar/.jenkins found at: $user.home/.jenkins
   Jan 26, 2016 8:52:34 AM org.eclipse.jetty.util.log.JavaUtilLog info
   INFO: Started SelectChannelConnector@0.0.0.0:8081
   Jan 26, 2016 8:52:34 AM winstone.Logger logInternal
   INFO: Winstone Servlet Engine v2.0 running: controlPort=disabled
   {% endhighlight %}

0. View Jenkins in your default browser by clicking: 

   <a target="_blank" href="http://localhost:8081/">
   https://localhost:8081/</a>

   <amp-img width="643" alt="jenkins virgin menu" src="https://cloud.githubusercontent.com/assets/300046/12587756/7da7b5d8-c40a-11e5-88fa-a2b668c3dba6.png"></amp-img>


<a id="Config_Security"></a>

### Unlock Admin password #

The first time, you see this screen:

   <amp-img width="660" height="238" alt="jenkins-unlock" src="https://cloud.githubusercontent.com/assets/300046/15393232/7631489a-1d89-11e6-8d3b-8479160064ff.jpg"></amp-img>

0. Open a new Terminal session.
0. Edit the file (using Sublime):

   ```
   subl /Users/mac/.jenkins/secrets/initialAdminPassword
   ```

0. Copy the password. Dismiss the editor window.
0. Return to the web page and paste it under "Administrator password". Press Continue.
0. Press "Start using Jenkins".

### Customize Initial Plug-ins #

PROTIP: Configure one plug-in at a time. This makes it easier to troubleshoot.

0. If you click "Install the Recommended", you'll see:

   <amp-img width="650" height="206" alt="jenkins-recommended-plugins-650x206" src="https://cloud.githubusercontent.com/assets/300046/15395245/2e9ac3a2-1d94-11e6-8c12-e9dbcc261d1f.jpg"></amp-img>

### View Plug-ins #

0. Switch to Terminal to open a new command line window.
0. Navigate to the Jenkins folder:

   <pre><strong>
   cd ~/.jenkins
   cd plugins
   ls -al
   </strong></pre>

   NOTE: Each plug-in has a <strong>.jpi</strong> binary file for each folder which contains a META-INF and WEB-INF folder.

### Create First Admin User #

Back to the Jenkins UI:

0. Input your Username, Password, Confirm, Full Name, E-mail address.

   PROTIP: Write this information down and put the paper in a safe place.


## Configure User Security #

Jenkins installation options are described at:
 
   * https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins

   By default, Jenkins stores its configuration files in the user's home folder at `~/.jenkins`.

   To make a Jenkins server completely public (and open to hacking)
   use a text editor to edit ~jenkins/.ssh/config
   to add `StrictHostKeyChecking no`.

0. Create a key without a passphrase, per https://help.github.com/articles/generating-ssh-keys/

0. Login under user named Jenkins (if applicable):

   ```
   sudo su jenkins
   ```

0. Copy your github key to Jenkins .ssh folder.

   ```
   cp ~/.ssh/id_rsa_github*  /var/lib/jenkins/.ssh/
   ```

0. Raname the keys:

   ```
   mv id_rsa_github id_rsa
   mv id_rsa_github.pub id_rsa.pub
   ```


<a id="AddUser"></a>

### Add User Permissions #

<img align="right" width="181" height="201" alt="jenkins full menu 362x402" src="https://cloud.githubusercontent.com/assets/300046/12525765/b4483cbc-c11b-11e5-8053-57556314ff0e.png">

If you don't see the full menu (shown on the right), you don't have some permissions.

As with other systems, granting permissions is typically done only by the Administrator of the system.

0. In **Manage Jenkins** UI enter **Configre Global Security**.
0. Check Enable Security.
0. If you have an LDAP, select that, or check Use Jenkin's own user database. But you'll have to add each user.
0. Check **Project-based Matrix Authorization Strategy** to limit Anonymous users Read-only access.

   PROTIP: Rather than specifying individual users and their permissions,
   the preferred approach is to firt assign individual users to a group in LDAP,
   then assign permission to the group.

0. For an existing user/group, check boxes to its right.

   <amp-img width="600" height="47" alt="jenkins-security-permissions-matrix-1420x112" src="https://cloud.githubusercontent.com/assets/300046/11181173/6ea5dfe4-8c1d-11e5-9674-ef0e7d88ef8d.png"></amp-img>

   <img width="881" alt="jenkins-build-project-detail2" src="https://cloud.githubusercontent.com/assets/300046/11181632/017e375a-8c21-11e5-8147-4df54611d009.png">

0. Or create a user.

<a id="MorePlugins"></a>

## More Plug-ins #

### Safe Restart #

Some install the 
<a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/SafeRestart+Plugin"> 
SafeRestart plug-in</a> which adds the <strong>Restart Safely</strong> option to the 
<a title="jenkins saferestart_plugin" href="https://cloud.githubusercontent.com/assets/300046/12584913/9681b1d2-c3fe-11e5-9359-e51fc5809734.png">
Jenkins left menu</a> to avoid needing to be at the server console at all.

### Green icon #

Don't like the color blue?


<a id="JMeterPlugin"></a>

### Performance Plug-in for JMeter #

WARNING: This is no longer maintained, with a large <a target="_blank" href="https://issues.jenkins-ci.org/browse/JENKINS-28426?jql=project%20%3D%20JENKINS%20AND%20status%20in%20(Open%2C%20%22In%20Progress%22%2C%20Reopened)%20AND%20component%20%3D%20'performance-plugin">bug list</a>.

To add the
<a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Performance+Plugin"> 
Performance plug-in</a> to display results from JMeter runs:

1. Click the Manage Jenkins link.
2. Click the Manage Plugins link.
3. Select the Available tab.
4. In Filter type "Performance".
5. Check to select "Performance plugin".
6. Click "Download now and install after restart".
7. Click to restart server.

If you prefer a manual approach:

0. Create a folder to hold the folder created during cloning (such as jmeter or jenkinsci).
1. cd to that folder, then:

   ```
git clone https://github.com/jenkinsci/performance-plugin.git performance
cd performance
   ```
   
   This contains a pom.xml file for Maven to compile the src folder.
   
0. If you haven't already:

   ```
brew install maven
   ```
   
0. Compile in a command window:

   ```
mvn package
   ```

   This downloads a bunch of files specified as dependencies, ending in this:
   
   ```
   [INFO] Total time: 09:20 min
[INFO] Finished at: 2016-01-26T08:31:04-08:00
[INFO] Final Memory: 52M/259M
   ```

0. Get the address of the Jenkins server. To find (ignoring case)

   ```
   find . -iname "jenkins.war"
   ```

0. Copy to the target server the .hpi file which <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Plugin+Structure">defines a plug-in</a>:

   ```
cp <target>/performance.hpi <path_to_jenkins>/data/plugins
   ```

0. To fix <a target="_blank" href="http://stackoverflow.com/questions/33126279/jenkins-performance-plugin-for-jmeter">this</a>
switching report format to xml in jmeter properties file:

   ```
   jmeter.save.saveservice.output_format=xml
   ```

0. Configure the search pattern to select the files to be parsed by the Performance plugin. JMeter generates <strong>.jtl</strong> files.

0. Configure the error percentage thresholds which would make the project unstable or failed 

  
0. When no jobs are running, restart the Jenkins server to reload the plugin.

   Read more about plugins:

   * http://wiki.jenkins-ci.org/display/JENKINS/Checking+out+existing+plugins
   * http://wiki.jenkins-ci.org/display/JENKINS/Plugin+tutorial
   * http://wiki.jenkins-ci.org/display/JENKINS/Hosting+Plugins


<a id="Nodes"></a>

## Nodes for scalability #

 A Jenkins server can scale by adding **nodes** to spread build work across several servers running different operating systems.

 Look at the **Load Statistics** UI to see whether additional nodes are necessary.
 
 Jenkins slave nodes can be started by the master using several launch methods:

  * Launch slave agents on Unix machines via SSH
  * Launch slave agents via Java Web Start
  * Launch slave via execution of command on the Master
  * Let Jenkins control this Window slave as a Windows service

0. Setup a node as a VirtualBox. TODO.

0. In Configure Server, a node can be setup as a **Virtualbox** 
   URL such as http://localhost:18083/.

0. In Manage Nodes, configure a VBox host.
1. Run the box by clicking the icon at the far right of the node listed.
2. Launch Slave Agent to start the machine.

<a id="Node_Security"></a>

### From a slave node #

0. From a slave command line, connect to a Jenkins master:
 
   ```
   java -jar slave.jar -jnlpUrl http://jenkins-master:8081/computer/Test Node/slave-agent.jnlp
   ```

 Several **executors** can be running simultaneously.
 This number is specified within the **Manage Jenkins** UI.
 
 Tool locations (such as Github) is also specified in that UI.

 Nodes are described at:
 * https://wiki.jenkins-ci.org/display/JENKINS/Distributed+builds

<a id="Builds">
## Build Projects</a>
Jenkins was originally created for automating the building (compilation) of java programs.
But Jenkins is ALSO used for other types of work.
Nevertheless, the Jenkins term <strong>"build"</strong> 
is another word for what operating systems call a <strong>"job"</strong> (unit of batch work).

Builds/jobs can be automatically triggered several ways:

 * after other projects
 * periodically on a schedule
 * poll a version control system for changes


<a id="Plugins"></a>

## Plugins #

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.
1. Clikc **Manage Plugins**.
2. Click **Installed** tab to view what has been installed already.

   * Email Extension Plugin
   * Git Plugin
   * Graddle Plugin
   * SSH Slaves
   * Translation Assistance
   * Workspace Cleanup Plugin
   
   &nbsp;

   For Microsoft developers:

   * MSBuild
   * MSTest
   * MSTest Runner
   * VSTest Runner

   &nbsp;

0. Click **Available** tab has many plug-ins.

0. Click on a category (Artifact Uploaders) to expand additional categories.

0. View the <a target="_blank" href="http://wiki.jenkins-ci.org/display/JENKINS/Plugins">
Wiki on Plugins</a>.

 PROTIP: The wide variety of plugins is why Jenkins is popular.

The plugin: <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Remote+Trigger+Plugin">
https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Remote+Trigger+Plugin</a>
**triggers** parameterized builds on other jenkins servers. 
This would centralize a single store of credentials.

 Plugins inject **Add build step** choices.

<a target="_blank" href="http://wiki.jenkins-ci.org/display/JENKINS/Extension+points">
Extension points</a> are plugins that extend other plugins.

The flow for programming code may includ **static code analysis** 
 such as using StyleCop (there is also SonarQube).
This provides options on what violations to report. 
