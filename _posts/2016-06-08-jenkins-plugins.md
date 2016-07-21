---
layout: post
title: "Jenkins Plugins"
excerpt: "You own Minions"
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

This assumes that you have followed 
[Jenkins Setup](/jenkins-setup/)


### Install Plugins #

Here is a generic set of steps to install a plug-in:

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.
0. Clikc **Manage Plugins**.
0. Click **Installed** tab to view what has been installed already.

   Pick one from the list of plugin-ins <a href="#MorePlugins">more plugins</a>.

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

## More plug-ins #

<a name="BasePlugins"></a>

### Base Plug-ins #

   * Email Extension Plugin
   * Git Plugin
   * Graddle Plugin
   * SSH Slaves
   * Translation Assistance
   * Workspace Cleanup Plugin
   

### For Microsoft developers #

   * MSBuild
   * MSTest
   * MSTest Runner
   * VSTest Runner

<a id="OtherPlugins"></a>

### Other plugins #

<a target="_blank" href="https://www.cloudbees.com/jenkins/jenkins-certification">
Cloubees' Study Guide PDF</a>
lists these plug-ins that all Certified Jenkins Engineers should know:

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Script+Security+Plugin">
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
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin">
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

## JMeter plug-ins #

QUESTION: Are there more plug-ins for JMeter?

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
   * https://www.blazemeter.com/blog/continuous-integration-101-how-run-jmeter-jenkins
   * https://www.linkedin.com/pulse/continuous-automated-web-tests-using-jenkins-jmeter-mahanta

