---
layout: post
title: "Jenkins Setup"
excerpt: "Meet your robot butler"
tags: [Jenkins, setup]
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

Jenkins invokes jobs 
for building software, conducting tests, etc.

Jenkins can invoke jobs on a schedule, but it's called a "continuos integration" (CI) tool because it can
invoke jobs when a <strong>trigger</strong> is fired.

Jenkins can orchestrate a chain of tasks that kicks off each step in sequence based on ending status,
such as ensure that components already unit-tested can be integrated together.


<a id="Alternatives"></a>

## Alternatives to Jenkins #

<amp-img width="530" height="246" alt="jenkins alternatives" src="https://cloud.githubusercontent.com/assets/300046/12533728/df265ae4-c1ee-11e5-9a0b-bbc380a2d20f.png"></amp-img>

   * [My list of CI tools](/devops-choices/#CITaskRunner/)

Jenkins began in 2010 as a fork of Oracle Hudson into Github from java.net 
after its acquisition by Oracle's purchase of Sun.
<a target="_blank" href="http://jenkins-ci.org/content/whos-driving-thing">*</a>
<a target="_blank" href="https://isotope11.com/blog/continuous-deployment-at-isotope11-an-update">*</a>


<a id="Prerequisites"></a>

## Prerequisites #

Jenkins is open-source software written in Java.
So you'll need to first install Java 1.5 or higher.

If you download Jenkins, it's a <strong>jenkins.war</strong> file.

It contains a Tomcat web server Java runs under.


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
Cloudbees has a professional certification exam on this product.


<a name="AmazonInstall"></a>

### Amazon Cloud Installation #

Jenkins can be hosted on the Amazon cloud several ways:

   * AWS EC2 instance
   * <a href="#CodeDeploy">AWS CodeDeploy service</a>

Jeff Shantz has a great set of videos on "Continuous Integration with Jenkins on Amazon EC2" (from 2014):
   <a target="_blank" href="https://www.youtube.com/watch?v=1JSOGJQAhtE">
   1</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=zojMg2c6k3Q">
   2</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=0ZS2BL5R3Ow">
   3</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=SRAQzs41ct4">
   4</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=IZ99VwrF6t4">
   5</a>

<a name="CodeDeploy"></a>

### AWS CodeDeploy service #

#### Pre-requisites #

Define what will be specified later:

0. Define EC2 Key Pair.
0. Define VPC id.
0. Define VPC subnet.

#### Use CloudFormation #

0. <a target="_blank" href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new">
  Go to AWS CloudFormation service, Create stack</a>.
0. Create a <strong>CloudFormation template</strong> based on 
   <a target="_blank" href="https://github.com/mikepfeiffer/jenkins-aws-ec2/blob/master/jenkins-server.template">
   this one</a>.
0. Upload it to S3.
0. Specify a Stack name according to your organization's naming standards. (For now we use "Jenkins1").
0. For Parameters, select an Instance Type (t2.micro).
0. For YourIPRange, type "0.0.0.0" to expose it to the world. Next.
0. Options: Tag a key not necessary.
0. Advanced notification options and stack policy not used for now. Next.
0. Check acknowledge resource creation (to talk to CodePipeline).
0. Click Create in the Summary page.

   Status goest from CREATE_IN_PROGRESS to CREATE_COMPLETE.


<a name="Install_Linux"></a>

### Linux Installation #

Alternately, to install on RedHat and Centos Linux machines, follow instructions at:

 * https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions


<a id="Install_Mac"></a>

### Mac OSX Installation #

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

### Windows Installation #

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

   NOTE: This command takes a minute or more.

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


### Use HTTPS #

PROTIP: Encrypt over the wire by using https instead of https.
    
0. Start Jenkins again using more parameters:

   <pre><strong>
   java -jar jenkins.war --httpPort=-1 --httpsPort=8081 –httpListenAddress=0.0.0.0
   </strong></pre>

    Value -1 turns off the port.

    –httpListenAddress=0.0.0.0 allows remote access, while 127.0.0.1 does not.

    A sample response:
    
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

   NOTE: Some use a domain name to reach the IP address.

<a id="Config_Security"></a>

### Unlock Admin password #

PROTIP: Jenkins is installed with no authentication enabled.

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

0. DO NOT click "Install the Recommended". But if you do, you'll see:

   <amp-img width="650" height="206" alt="jenkins-recommended-plugins-650x206" src="https://cloud.githubusercontent.com/assets/300046/15395245/2e9ac3a2-1d94-11e6-8c12-e9dbcc261d1f.jpg"></amp-img>

### Create First Admin User #

Back to the Jenkins UI:

0. Input your Username, Password, Confirm, Full Name, E-mail address.

   PROTIP: Write this information down and put the paper in a safe place.

0. Press OK to see the login screen:

   <amp-img width="296" height="145" alt="jenkins2.5-login" src="https://cloud.githubusercontent.com/assets/300046/15448936/c665558c-1f2c-11e6-9fe4-21e7a125e3da.jpg"></amp-img>

0. Type in the credentials entered earlier.

## Dashboard Explained #


   <amp-img width="471" height="336" alt="jenkins2 5-dashboard-annotated" src="https://cloud.githubusercontent.com/assets/300046/15448917/36b153be-1f2c-11e6-8ae6-512e16f05f16.jpg"></amp-img>


1\. The whole page is called a **Dashboard**.
2\. **Breadcrumbs** show the hierarchy of page navigation.
3\. Menu items are within a **Sidebar**.
4\. Under the **Build Queue** heading.
5\. Under the **Build Executor Status** heading.
6\. To the right of the **All** view ???
7\. Under the **Name** column are jobs and projects.
8\. Build.
9\. Different colors of icons under the **S** column indicate differing **build status**.
10\. Different colors of icons under the **W** column indicate differing **uild trend**, 
   where yellow sunshine is good and a thundercloud is bad.

## Server Status #

Use the process status command to find the process ID to kill:

   <tt><strong> ps -eaf | grep jenkins </strong></tt>

   A sample response:

<pre>
  501  4137     1   0 Thu06AM ??         2:54.41 /usr/bin/java -Dmail.smtp.starttls.enable=true -jar /usr/local/opt/jenkins/libexec/jenkins.war --httpListenAddress=127.0.0.1 --httpPort=8080
  501 14728 14384   0  6:31PM ttys002    0:00.00 grep jenkins
</pre>

To remove the Jenkins process:

    kill 4137


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

0. Bring up Jenkins in your default browser:

   <a target="_blank" href="http://localhost:8081/">
   https://localhost:8081/</a>

   If you don't see the full menu (shown on the right), you don't have some permissions.

   As with other systems, granting permissions is typically done only by the Administrator of the system.

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.
0. Click **Configure Global Security**.

   <amp-img width="481" height="57" alt="jenkins2 5-manage-config-global-security-962x114" src="https://cloud.githubusercontent.com/assets/300046/15433535/f9da19d8-1e6f-11e6-8e30-e66dc2cbc9c4.png"></amp-img>

0. Check <strong>Enable Security</strong>.
0. If you have an LDAP, select that. Alternately, check <strong>Use Jenkin's own user database</strong>. But you'll have to add each user.
0. Check **Allow users to sign up**.
0. Check **Matrix-based security**.
0. In **User/Group to add", type "admin".
0. In the row of check boxes that appear, check the box under "Administer".
0. Check **Project-based Matrix Authorization Strategy** to limit Anonymous users Read-only access.

   PROTIP: Rather than specifying individual users and their permissions,
   the preferred approach is to first assign individual users to a group in LDAP,
   then assign permission to the group (like what the Windows OS does).

0. For an existing user/group, check boxes to its right.

   <amp-img width="600" height="47" alt="jenkins-security-permissions-matrix-1420x112" src="https://cloud.githubusercontent.com/assets/300046/11181173/6ea5dfe4-8c1d-11e5-9674-ef0e7d88ef8d.png"></amp-img>

   <img width="881" alt="jenkins-build-project-detail2" src="https://cloud.githubusercontent.com/assets/300046/11181632/017e375a-8c21-11e5-8147-4df54611d009.png">

0. Or create a user.

0. Install the "AWS CodePipeline Plugin" 
   by following the next section below.

<a id="Plugins"></a>

## Plugins #

### Install Plugins #

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.
0. Clikc **Manage Plugins**.
0. Click **Installed** tab to view what has been installed already.

   <a name="BasePlugins"></a>

   ### Base Plug-ins:

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

   See the list of plugin-ins <a href="#MorePlugins">more plugins</a>.

0. Click **Available** tab has many plug-ins.

0. Click on a category (Artifact Uploaders) to expand additional categories.

0. View the <a target="_blank" href="http://wiki.jenkins-ci.org/display/JENKINS/Plugins">
   Wiki on Plugins</a>.

 PROTIP: The wide variety of plugins is why Jenkins is popular.


### Plug-in files #

0. Switch to Terminal to open a new command line window.
0. Navigate to the hidden Jenkins folder:

   <pre><strong>
   cd ~/.jenkins
   cd plugins
   ls -al
   </strong></pre>

   NOTE: Each plug-in has a <strong>.jpi</strong> binary file for each folder which contains a META-INF and WEB-INF folder.


### Rake Environment Variable #

0. In the Manage Jenkins menu, click Configure System.
0. Check Environment variables under the Global properties section.
0. Click Add.
0. In the name value, type "PATH".
0. In the value field, type "$PATH /usr/local/bin" for Linux or OSX.

   Alternately, on Windows type "???". TODO:

<a id="MorePlugins"></a>

### Other plug-ins #

<a target="_blank" href="https://www.cloudbees.com/jenkins/jenkins-certification">
Cloubees' Study Guide PDF</a>
lists these plug-ins that all Certified Jenkins Engineers should know:

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Script+Security+Plugin".
   Script Security Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Trigger+Plugin">
   Parameterized Trigger Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Credentials+Plugin">
   Credentials Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Fingerprint+Plugin">
   Fingerprint Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Amazon+EC2+Plugin">
   Amazon EC2 Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin">
   Docker Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Folders+Plugin">
   CloudBees Folders Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Disk+Usage+Plugin">
   Disk Usage Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Workflow+Plugin">
   Pipeline Plugin (formerly known as Workflow)</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin">
   Build Pipeline Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Delivery+Pipeline+Plugin">
   Delivery Pipeline Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Build+and+Publish+plugin">
   CloudBees Docker Build and Publish Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Promoted+Builds+Plugin">
   Promoted Builds Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin">
   Git Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Copy+Artifact+Plugin">
   Copy Artifact Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin
   JUnit Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Matrix+Project+Plugin">
   Matrix Project Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/NodeLabel+Parameter+Plugin">
   NodeLabel Parameter Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Radiator+View+Plugin">
   Radiator View Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Email-ext+plugin">
   Email-ext Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Jabber+Plugin">
   Jabber Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Mailer">
   Mailer Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/IRC+Plugin">
   IRC Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/SMS+Notification">
   SMS Notification Plugin</a>
* https://wiki.jenkins-ci.org/display/JENKINS/Skype+Plugin">
   Skype Plugin</a>

<hr />

### Safe Restart Plugin #

Some install the 
<a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/SafeRestart+Plugin"> 
SafeRestart plug-in</a> which adds the <strong>Restart Safely</strong> option to the 
<a title="jenkins saferestart_plugin" href="https://cloud.githubusercontent.com/assets/300046/12584913/9681b1d2-c3fe-11e5-9359-e51fc5809734.png">
Jenkins left menu</a> to avoid needing to be at the server console at all.

### Green icon plugin #

Don't like the color blue?

https://wiki.jenkins-ci.org/display/JENKINS/Green+Balls


<a id="JMeterPlugin"></a>

### JMeter Performance Plug-in for JMeter #

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


## Resources #

* <a target="_blank" href="https://www.youtube.com/watch?v=Lxd6JMMxuwo">
   Getting Started With Jenkins | Jenkins and DevOps tutorial on YouTube</a>
  
* <a target="_blank" href="https://www.selikoff.net/2016/02/27/jeannes-experiences-with-the-jenkins-certification-beta-exam/">
   Jenkins beta certification exam</a> by Jeanne Boyarsky, 27 Feb 2016
   shares a word file and quizlet that enabled her to pass.
