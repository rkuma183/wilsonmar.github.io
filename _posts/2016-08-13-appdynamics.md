---
layout: post
title: "AppDynamics"
excerpt: "It knows you when your good and bad ..."
tags: [Clouds, Monitoring, Analytics]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

This is a hands-on narrated tour on how to learn AppDynamics to detect trouble.

{% include _intro.html %}

<hr />

## Explore #

<strong>Agents</strong> are installed on each machine you wish to monitor.
AD claims "Up to 10,000 per controller"
at "less than 2% overhead".
They automatically discover servers (very cool, especially on Hadoop clusters).

The AppDynamics Controller can be either
<a target="_blank" href="https://docs.appdynamics.com/display/PRO42/Quick+Install">
installed on-premises</a>
or hosted on public cloud (SaaS option), which is what is used in
<a target="_blank" href="https://www.youtube.com/watch?v=HxPvIz68E2A">
self-service trials/a>.

   Controllers are configured by a <strong>controller-info.xml</strong> file.

It collects metrics reported by different types of agents:

* Stand-alone machine agents obtain Java Thread Pool and other JVM stats.

* End-User Monitor (EUM) absorb activity from listening to network traffic.

* Database Monitors extract from databases.
<br /><br />

AD has a <a target="_blank" href="https://docs.appdynamics.com/display/PRO42/JVM+Crash+Guard">
Java Crash Guard</a>

Videos:

* <a target="_blank" href="https://www.youtube.com/watch?v=qO1M2-J4jYs">
   Intro to AppDynamics</a> by AD partner Emergent 360.
   24 Nov 2015.

* <a target="_blank" href="https://www.youtube.com/watch?v=yygbxv4lS7Y">
   Demo</a>

* <a target="_blank" href="https://www.youtube.com/watch?v=bdom54w8_tw">
   Overview of Architecture</a>

<hr />

## Cool features. So What? #

There are several aspects that sales pitches don't cover,
but keep actual users up at night.

0. The Flow Map provides icons representing every server in each 
   <strong>tier</strong> (Web-Tier-Services, Database, etc.).
   Metrics obtained are classified compared to averages observed in the past.

   PROTIP: AD gathers a huge amount of information every hour.
   How many GB per day is that rate?
   
   PROTIP: There is a cost to keep data.
   Have a plan for how long to keep data on AD's servers,
   Many people save just the summary information for management reporting.
   
   PROTIP: Often we don't realize what analysis to do unti later, and by then
   the historical data is gone.
   How much is longitudinal operational analysis is worth?
   This needs to be decision by management so they are not disappointed later.

0. AD displays response time captured from every entry and exit point,
   down to specific page iframes.

   PROTIP: How does each page compare against metrics 
   predicted during performance testing?
   Identify surprises so you don't have to look at what you already know.

   PROTIP: Ultimately, organizations need to <strong>proactively predict</strong>
   rather than responding to alerts which occur.

   In my opinion, AD can do more than it is in this aspect.
   For example, project the <strong>trend</strong>
   of disk space usage to identify the urgency so 
   the appropriate notification method is used.

0. PROTIP: It helps to identify up front specifically who should be called 
   (and when) for specific alerts that can appear.
   
   PROTIP: Escalation specification is the specialty of PagerDuty software.

0. <strong>Browser</strong> distribution pie charts on Web App Dashboards 
   is based on what clients responds. Some networks strip that out, so watch out for
   "unknown". These stats can differ significantly versus Google Analytics if
   you also have that installed.

   PROTIP: Identify the percentage of browser distribution chart 
   associated with specific customer accounts so you can track their movement 
   from IE to modern browsers needed by React.js and other web apps.

0. <strong>Synthetic users</strong>
   are useful not just to identify issues during off-hours.

   * <a target="_blank" href="https://community.appdynamics.com/t5/Tech-Webinars/AppDynamics-Synthetic-Monitoring-4-2/m-p/21398#U21398">
   webinar 20 Apr 2016</a>

   PROTIP: Synthetic users ensure that programs don't page off memory and 
   cause delays (bad performance) for 
   the first user who gets on the system in the morning.

0. AD provides a way to create graphs dynamically.

   PROTIP: Consider dumping monitoring data for analysis using your organization's
   analytics product such as ElasticSearch, Tableau, etc.
   This would focus leverage of skills brough to this work,
   and (more importantly) make it easier and more likely for
   other statistics in the organization to be integrated,
   such as impact performance has on dollar sales, etc.

   <img align="right" alt="appd-actions-selections-2015-376x361-71kb.png" width="376" height="361" src="https://cloud.githubusercontent.com/assets/300046/18060867/89a6cd88-6ddd-11e6-8d4d-01362a711b95.png">
0. AD has <strong>Health Rules</strong> and policies that trigger actions.

   PROTIP: If the action is to send an email,
   someone is needed to constantly go through screens to notice problems.  
   This is a 3-shift job, with no breaks on weekends and holidays.
   So plan work schedules and training for this.
   Some use 12 hour workdays and office accross the globe for this reason.

   PROTIP: Use "Choas monkeys" to create havoc randomly, in production,
   to ensure that responses are adequate.

0. <a target="_blank" href="https://docs.appdynamics.com/display/PRO42/Remediation+Actions">
   Remediation scripts</a>
   to take action after problems.

   PROTIP: Has that script been tested in production?
   Many organizations don't have an enviornment to conduct such tests.

   PROTIP: If the response is to add more servers,
   how much free server capacity available?

0. When an issue is detected, the icon turns red and
   diagnostic snapshots are automatically captured.

   PROTIP: If the server is already down, there is not much point
   (and wastes precious time) to take diagnostics dumps.

   PROTIP: There are utilities which help you analyze dumps
   from the operating system, which can be quite cryptic.

0. <strong>End-user Response-Time Distribution</strong> spikes on Web App Dashboards 
   identify the percentile of each spike.
   
   PROTIP: A spike on the 50th percentile is more troubling becuase of its consistency
   than one at 90th percentile or above.


<hr />

## AWS Agent installation #

The AD Metric Browser can display metrics as a mash-up of data from cloud vendors.

For example, for Amazon S3, AD can analyze CloudWatch metrics 
about the S3 buckets designated:

* <strong>Size</strong> of all the objects present in bucket(s).

* <strong>Objects Count</strong> of objects present in bucket(s) configured 

* <strong>Since Last Modified Time</strong> of objects in bucket(s) configured.

The code and configuration notes are at<br />
<a target="_blank" href="https://github.com/Appdynamics/aws-s3-monitoring-extension">
https://github.com/Appdynamics/aws-s3-monitoring-extension</a>

To 
<a target="_blank" href="https://www.appdynamics.com/community/exchange/extension/amazon-aws-s3-monitoring-extension/">
install the agent in AWS to do the above</a>:

1. Download file 
   <strong>S3Monitor.zip</strong>

   The jar file in it was compiled from 
   <a target="_blank" href="https://github.com/Appdynamics/aws-s3-monitoring-extension">
   https://github.com/Appdynamics/aws-s3-monitoring-extension</a>
   (by Satish Muddam on 05/11/2015)
   and includes dependencies pulled in.

   PROTIP: Some enterprises prefer to recompile and store it in their Artifactory repository
   for internal use rather than downloading from the internet unreviewed by 
   ethical hackers.

0. Unzip it into folder
   <em>machineagent install dir</em>/monitors/

0. The <strong>monitor.xml</strong> for AD
   points to the yml file. It's in the config folder.

1. Open <strong>S3Configurations.yml</strong> in a text editor.

0. Copy and paste the *accesskey: <Access-Key> for S3 account.

0. Copy and paste the *secretkey: <Secret-Key> for S3 account.

0. Copy and paste the * metricPrefix: Metric prefix path for AppDynamics controller.

0. onlyConsolidatedMetric: true or false(default).
   
   If only consolidated metric is required (Bucket wise metrics will not be pushed to controller if this is true)

0. noOfThreads: Min-1, Max-32, Default-8

0. sizeunit: B, KB (Default), MB

0. timeunit: Seconds (Default), Minutes, Hours, Days

0. bucketNames: Bucket names to monitor. 

   To monitor all available buckets remove this field or Add a bucket named "All".

   To avoid permission issues, install the agent as the same user who owns the Machine Agent files or as an administrator on the host machine. 

0. PROTIP: To detect any typos, use a YML validator such as
   <a target="_blank" href="http://www.yamllint.com/">
   http://www.yamllint.com</a>,
   even when the file is generated.

0. Review the <strong>monitor.xml</strong>.

0. Restart the <strong>machineagent</strong>.

   https://docs.appdynamics.com/display/PRO42/Where+to+Specify+Machine+Agent+Configuration

   The Standalone Machine Agent (Machine Agent) starts within its own JVM.
   In 4.2, JRE 1.8 is bundled with the OS-specific Machine Agent installation downloads.

0. In the AppDynamics Metric Browser, look for: 
   Application Infrastructure Performance | <em>Tier</em> | Custom Metrics | Amazon S3.


<hr />

## App Instrumentation #

There is work necessary to instrument code objects to reveal them in monitoring.

0. Proxies or firewalls on the network may need to opened up for the agent 
   to talk to the Controller at default <strong>port 8090</strong>.

0. From the AD Home screen Getting Started section, 
   click "Agent Download &amp; Install Wizard".

   AppServerAgent-4.1.0.3.zip, 11 MB

0. Unzip the file.
   
   The folder contains a javaagent.jar file.

0. To the Java startup argument starting the application,
   add the Java Agent binary to the Java application process.

   AD provides the line to add for each type of Application Server:

   On Tomcat this means editing the <strong>catalina.sh</strong> file:

   <tt><strong>
   cd /bin<br />
   sudo cp catalina.sh  catalina.sh.backup<br />
   sudo gedit catalina.sh
   </strong></tt>

0. Use a text editor to add a line before Java is invoked:

   <tt><strong>
   export CATALINE_OPTS="$CATALINA_OPTS -javaagent:/home/appduser/appd-agent/javaagent.jar"
   </strong></tt>

0. if you're not ready for a server reboot,
   attach to a running process. 

   <tt><strong>
   sudo java -Xbootclasspath/a:/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.85.x86_64/lib/tools.jar
   -jar /home/appduser/appd-agent/javaagent.jar 
   </strong></tt>

   Don't press Enter to submit until you get its PID:

   <tt><strong>
   sudo ps -A | grep java
   </strong></tt>

0. Highlight and copy the process number returned to paste at the end of the command above.

0. Invoke one of the sample apps 
   to impose load such as at:

   localhost:8080/examples/servlets/




<hr />

## Docker Instrumentation #

https://www.appdynamics.com/community/exchange/extension/docker-monitoring-extension/

0. The 1st section of the doc at<br />
   <a target="_blank" href="https://docs.docker.com/reference/api/docker_remote_api/">
   https://docs.docker.com/reference/api/docker_remote_api</a>

0. The Stats API GET /containers/(id)/stats is available only from Docker version 1.17 onwards. If you are using an older version, the CPU Stats, Memory Stats and Network Stats will not be available.
TCP Socket: The docker daemon should be bound to the tcp socket. Please refer to https://docs.docker.com/articles/basics/#bind-docker-to-another-hostport-or-a-unix-socket. This is the command to bind the docker daemon to both TCP Socket and Unix Socket sudo /path/to/docker daemon -H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock &
Unix Socket: There are some known issues while using UnixSocket to fetch the data. Please refer to Troubleshooting / Known Issues Section
Unix Socket: To use this mode to collect the data, the machine agent should be run as the root user. If this is not possible, then the current user should have password-less sudo access or he should have access to the docker socket
Unix Socket: netcat (nc) is required to fetch the data from socket. Please install it.
Installation

Please start the Machine Agent before installing the extension and make sure that it reports data. Verify that the machine-agent status is UP and it is reporting Hardware Metrics
Download and unzip the DockerMonitor.zip to the <MachineAgent_Dir>/monitors directory
Edit the file config.yml located at <MachineAgent_Dir>/monitors/DockerMonitor and update the following details. Comment out properties which are not used
metricPrefix: To report the metrics only to a given Tier, use the second one instead. The TIER_ID can be found from the REST API
metricPrefix: Custom Metrics|Docker
#metricPrefix: Server|Component:<TIER_ID>|Custom Metrics|Docker
unixSocket
unixSocket:
    commandFile: monitors/DockerMonitor/socket-command.sh
tcpSockets: Multiple TCP sockets can be added here. Each one should have a base URL and a unique display name. The metrics will be reported under this name.
tcpSockets:
    - baseUrl: http://127.0.0.1:2375
      name: Server1
Custom Dashboard: Update the following properties in the customDashboard section
username [Required] A user that can login to controller ui and upload dashboard
password[Required*] Clear text password for the user to upload the dashboard. Optionally use the passwordEncrypted and encryptionKey
passwordEncrypted[Optional*] See the section Password Encryption Support
encryptionKey[Optional*] See the section Password Encryption Support
applicationName [Required]
tierName [Required]

Please review the contents of the file at the location <MachineAgent>/monitors/DockerMonitor/socket-command.sh

Add executable permissions
chmod +x MachineAgent/monitors/DockerMonitor/socket-command.sh
Custom Dashboard

The extension will generate and upload the following custom dashboard to the controller. This feature requires the version 4x of Machine Agent and Controller. Please look at the dashboard section in config.yml for configuration.

Please make sure that the customDashboard section of config.yml is configured correctly.

Over time, you might need to update contents of the dashboard.To create a new dashboard, delete(or rename) the existing dashboard and let extension upload a new one. See troubleshooting steps 4 and 5.

<hr />

## Other Integrations #

The AD Controller can integrate with various other systems.

But it's through one-way HTTPS

Listed alphabetically:

* <a target="_blank" href="https://www.appdynamics.com/community/exchange/extension/amazon-aws-s3-monitoring-extension/">
   AWS</a>

* <a target="_blank" href="https://www.appdynamics.com/community/exchange/extension/docker-monitoring-extension/">
   Docker</a>

* <a target="_blank" href="https://github.com/carlosdoki/extensionSolarwinds">
   SolarWinds</a>

* <a target="_blank" href="https://www.appdynamics.com/community/exchange/extension/websphere-mq-monitoring-extension/">
   Websphere MQ</a>


<hr />

### Cloud Security #

The biggest concern enterprises have with cloud services is their security.

* https://community.appdynamics.com/t5/Knowledge-Base/Introduction-to-AppDynamics-with-SSL/ta-p/20580?site=community


<hr />

### Social #

<a target="_blank" href="https://www.appdynamics.com/community/">
<strong>https://www.appdynamics.com/community</strong></a><br />
is the one-stop shop.

<a target="_blank" href="https://www.appdynamics.com/community/events/appsphere-2016">
AppSphere</a> in 2016 is on November 14 at the Marriott Cosmopolitan Las Vegas.

<a target="_blank" href="https://twitter.com/@AppDynamics/">
Twitter: @AppDynamics</a>

Email: <a target="_blank" href="mailto:developer@artik.cloud">developer@artik.cloud</a><br />
answered by Developer Evangelists<br />
<a target="_blank" href="https://www.linkedin.com/in/jswatton/">
   Jeanine (Swatton) Jue</a><!-- j.jue@samsung.com -->

* <a target="_blank" href="https://www.linkedin.com/in/yujingwu">
   Dr. Yujing Wu</a> (@yujingwu)

LinkedIn shows Samsung America being based in Seattle and Bellevue, Washington.
Smart Home in Mountain View, California.
Home Appliances in Rigefield Park, New Jersey and Minneapolis, Minnesota.

*  <a target="_blank" href="https://www.artik.io/blog/cloud/">
   artik.io/blog/cloud</a>
   is the user forum.





## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
