---
layout: post
title: "JVM JProfiler"
excerpt: "Avoid and resolve performance bottlenecks, pin down memory leaks, and understand threading issues"
tags: [Java, Debugging]
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

This tutorial aims to enable you to identify and resolve 
<strong>problematic patterns</strong> in memory and CPU usage in Java and Scala code.

{% include _intro.html %}


## Install & License #

0. Download from<br /><a target="_blank" href="https://www.ej-technologies.com/download/jprofiler/files">
   https://www.ej-technologies.com/download/jprofiler/files</a><br />
   for your platform:

   | Platform | Date | File Name | MB |
   | -------- | ----- | -------- | -: |
   | Mac | 2016-06-21 | jprofiler_macos_9_2.dmg | 126 MB |

0. PROTIP: While you wait for the download,
   identify the version of IDE you'll be using with JProfiler.
   Most developers use integrations with their IDE 
   IntelliJ IDEA, Eclipse, NetBeans, Oracle JDeveloper.

   Also, get a license at<br />
   <a target="_blank" href="https://www.ej-technologies.com/buy/jprofiler/select">
   https://www.ej-technologies.com/buy/jprofiler/select</a>

   $698 with a year of support.

0. Open the installer.

0. On a Mac, drag the JProfiler icon to drop on the Applications folder.
0. Exit the installer dialog.
0. Delete (Move to Trash) the installer file to save disk space.
0. Use Finder to initiate JProfiler.
0. The first time it opens, JProfiler enters Setup. Click Next.
0. Click Next to Evaluate for 10 days.

   ### IDE #

0. Optionally: Click "[Select an IDE]" if you have one and click Integrate.

   See http://resources.ej-technologies.com/jprofiler/help/doc/ide/$folder$.html

   An example of IDE configuration is http://www.andrejkoelewijn.com/blog/

0. Click Next, Finish.

   JProfiler is started up automatically.

0. Check "Don't show this dialog again" and Cancel.

   https://www.ej-technologies.com/products/jprofiler/java-profiler-JEE.html


   ### See Sample Apps Behave Badly #

   To see how JProfiler works, let's look at a program known to behave badly.

0. Click to select the "Animated Bezier Curve demo" session which
   JProfile provides to intentionally leak memory not garbage collected:
   Its code contains a "LeakMap" object.

0. Click Start.
0. If an Evaluation version dialog appears, click "Evaluate".
   
   The Session Starup settings dialog appears. 

   ### Help and Docs #
  
0. Click the Help button for context-sensitive help.

   PROTIP: This is the best way to access specific documentation.
   So if you want to review documentation on another process, open
   <a target="_blank" href="http://resources.ej-technologies.com/jprofiler/help/doc/help.pdf"> 
   the 303 page pdf JProfiler Manual at<br />
   http://resources.ej-technologies.com/jprofiler/help/doc/help.pdf</a>.
   It presents same content as
   <a target="_blank" href="http://resources.ej-technologies.com/jprofiler/help/doc/">
   Online Help</a>.

0. To continue working, click on the app dialog partially hidden by the Help dialog.

   In 2015 Ingo Kegel (CTO of the company)
   <a target="_blank" href="https://www.youtube.com/watch?v=vRssrJmTcsU&list=PLkPBGtwA1Ta6Fdbe7Asx-7Ve2bs-J6n2p&index=1">
   created several videos</a>

0. Click OK to accept the Startup Settings.

   A terminal window is opened for the demo process and 
   the main window of JProfiler displays profiling metrics.

   PROTIP: In the Terminal window opened automatically, notice "JVMTI version 1.1 detected"
   refers to the technology the JVM provides to enable JProfiler to obtain instrumentation data.

0. Begin run. Programs that leak memory will show an upward trend in Thread.

0. Click on Dynamic Memory View to sort objects by the amount each uses memory.

0. Click the "Mark Current" button to set the baseline for differences to be displayed.

   Most items are generic objects such as "java.lang.Long" which use a lot of memory because
   many objects use them.

0. Righ-Click on a high-level object defined by a custom name
   to select "Take Heap Snapshot for Selection".

0. Click OK to "Select recorded objects".

0. Click "References" at the bottom button to activate the reference graph view.

0. Right-click on object to select "Show paths to GC Root".

0. Click OK to see Single Root.

0. Scroll horizontally to the left in the chain.


<a href="ChromeExt">

## JProfiler Origin Tracker #

Although Chrome announced it is doing away with Extensions,
<a target="_blank" href="https://chrome.google.com/webstore/detail/jprofiler-origin-tracker/mnicmpklpjkhohdbcdkflhochdfnmmbm?hl=en">
JProfiler Origin Tracker Chrome Browser Extension</a>
can still be useful.


<a href="Docs">

## Docs #

TODO: Recreate video using JProfiler for Scala.


## Strategy #

<a target="_blank" href="https://www.ej-technologies.com/products/jprofiler/features.html">
JProfiler has several "modes" it can run</a>.

PROTIP: Take a "top-down" approach to analyzing a Java program.

0. Ideally, you can attach JProfiler to a running server.

0. It can be time consuming to create load scripts that provide the coverage of code needed.
   So it is often useful to see running production servers.

0. Begin using JProfiler by using the "Profile at startup" mode.

0. Understand a programs's major dependencies.

0. Identify the biggest objects.

0. Identify the rate of memory use.

0. <strong>Instrument</strong> classes by having JProfiler retransform the program.

0. Run JProfile in <strong>offline mode</strong> to save snapshots
   when you need to analyze several JVMs running at the same time.
   Then have an <a target="_blank" href="http://resources.ej-technologies.com/jprofiler/help/doc/export/antExport.html">
   Ant program task to compare the snapshots</a>.


The difference run-time data areas are illustrated here:
![jvm architecture-650](https://cloud.githubusercontent.com/assets/14143059/19409987/e9e3f9ca-929d-11e6-96a4-4e070f209a2c.jpg)
From <a target="_blank" href="https://www.youtube.com/watch?v=ZBJ0u9MaKtM">
Java8 virtual machine architecture</a> by Ranjith ramachandran

   * To manage the Method Area holding classes defined in source code,<br />
   use Memory Profiling

   NOTE: In Java8, <strong>metaspace</strong> 
   setting takes the place of the MaxPermSize parameter
   that specifies space of the method area holding classes.

   * To manage the "thrashing" of PC (Program Counters) pointing to 
   the next instruction to be executed in each thread,<br />
   use CPU profiling.

   * To manage the Java Stacks containing stack frames for each chain of <strong>methods</strong> in each thread
   "Stack Overflow" errors refer to this area,<br />
   use Thread Profiling.

   * Native Method Stacks per thread

   * To manage the Heap holding objects instantiated for use in JVM (garbage collected),<br />
   use the Heap Walker.


## Attach GUI #

PROTIP: The most convenient and visual approach is to attach JProfiler to a running JVM instance.

0. Bring up the Java program targeted for analysis.

0. jpenable that loads the profiling agent and makes it possible to connect with a remote
session from another computer.

   PROTIP: The profiling agent and JProfiler GUI communicate
   with each other through a socket.
   By default, the profiling agent listens on <strong>port 8849</strong>.
   Many networks block traffic from such a port.

   <a target="_blank" href="https://www.youtube.com/watch?v=GnBmUjPRMjs">
   This video</a> shows how to setup a SSH Tunnel.



<a name="Offline"></a>

## Offline #

Use the integration wizard to activate this by appending to the -agentpath VM parameter

   <pre>
   offline,config=[config file],id=[id]
   </pre>


## ReTransform to Instrument Code #



## Social Media #

The company behind JProfile is 
<a target="_blank" href="http://www.ej-technologies.com/company/profile.html">
based in Munich, Germany</a>.


## More on front-end styling #

This is one of several topics:

{% include front-end_links.html %}
