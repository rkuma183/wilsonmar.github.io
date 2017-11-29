---
layout: post
title: "Mac OSX Command-Line Utilities kill, grep, sed, regex, cron"
excerpt: "The Swiss Army knives for Linux and Mac - they've thought of everything"
tags: [apple, mac, utilities]
image:
# feature: pic Giant-Swiss-Army-Knife-1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622061/afe5f5da-0584-11e6-8140-3278289baef4.jpg
  credit: 
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This is a guided tour of Linux utilities, presented in as logical a sequence
as I can imagine.

MacOS/Mac OS X uses the BSD version command line tools, 
which are different from the Linux version, 
while they are both compliant with POSIX standards.

See <a target="_blank" href="https://en.wikipedia.org/wiki/GNU_Core_Utilities/">
https://en.wikipedia.org/wiki/GNU_Core_Utilities</a>.


## Uptime

   <pre><strong>uptime
   </strong></pre>

   <pre>
 6:35  up 9 days, 11:56, 7 users, load averages: 2.09 2.08 2.06
   </pre>

   Load averages lists calcuations of the average system load over three period of times:
   the last one-, five-, and fifteen-minute periods.
   Each process using or <strong>waiting</strong> for CPU (the ready queue or run queue) increments the load number by 1. In a system with four CPUs, a load average of 3.73 would indicate that there were, on average, 3.73 processes ready to run, and each one could be scheduled into a CPU.

### Top processes

0. To list the top hungry processes, and refersh the screen:

   <pre><strong>top
   </strong></pre>

0. To cancel the display, press <strong>control+C</strong>.

   That works with any process you want to kill.


<a id="Processes"></a>

## Processes

0. So that we can kill it for fun, create a background process (by specifying &) 
   which sleep for 999 seconds:

   <pre><strong>sleep 999 &
   </strong></pre>

0. Get the process identifier:

   <pre><strong>pgrep sleep
   </strong></pre>

0. List background processes:

   <pre><strong>jobs
   </strong></pre>

   <pre>
[1]+  Running                 sleep 999 &
   </pre>

   The + shows the focus.

0. To list all processes with a niceness (NI) column:

   <pre><strong>ps -l
   </strong></pre>

   Expand the terminal window width to avoid line wrapping.

  <pre>
UID   PID  PPID        F CPU PRI NI       SZ    RSS WCHAN     S             ADDR TTY           TIME CMD
501  2752  2749     4006   0  31  0  4320804     44 -      Ss                  0 ttys001    0:00.19 /Users/wilsonmar
   </pre>

   ### Niceness of priority

   Default niceness of zero, but can be -20 to +19.

   PROTIP: A niceness of +19 is a priority of 99, which is lowest.

   <pre><strong>nice -n 5 sleep 1000&
   </strong></pre>

   root permissions are needed to set nice below zero.

0. Reset nicer:

   <pre><strong>renice -n 5 sleep 1000&
   </strong></pre>


   ## Kill

0. To kill a single program by name: 

   <pre><strong>pkill sleep
   </strong></pre>

0. To kill several progams by name: 

   <pre><strong>killall sleep
   </strong></pre>


## Coreutils

   Get the set of <a target="_blank" href="https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands">utilities from GNU Linux, but for Mac</a>:

   <pre><strong>brew install coreutils
   </strong></pre>

   Then you can:

   <pre><strong>ln -s /usr/local/bin/gtac /usr/local/bin/tac
   </strong></pre>


<a id="CronJobs"></a>

## Cron Launchd Background Jobs

<a target="_blank" href="https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html">This</a> mentions that Apple has deprecated
cron in favor of <strong>launchd</strong> (a daemon running under the System context).
to automatically start (after reboots) service programs at boot time.

If the system is turned off or asleep, <strong>cron</strong> jobs 
do not execute until the <strong>next</strong> designated time occurs.

However, a launchd job will run when the computer wakes up if 
the computer was <strong>asleep</strong> when the job should have run
(if the StartCalendarInterval key has been set).

Since it's a background process, launchd doesn't present a user interface.
So you get "launchd cannot be run directly." when you run launchd like other commands.


The standard way now to run a service on Mac OS X is to use launchd , a program that starts, stops and manages daemons and scripts in Apple OS X environments. 

An XML document named with file extension <strong> .plist</strong> defines its properties. 
The sample file below defines the Nexus Repository Manager from Sonatype.com installed in `/opt`
:

{% highlight xml %}
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.sonatype.nexus</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/nexus/bin/nexus</string>
        <string>start</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
{% endhighlight %}

The above is the `com.sonatype.nexus.plist` file in `/Library/LaunchDaemons/` 

Change its ownership and access rights:

   <pre><strong>
sudo chown root:wheel /Library/LaunchDaemons/com.sonatype.nexus.plist
sudo chmod 644 /Library/LaunchDaemons/com.sonatype.nexus.plist
   </strong></pre>

PROTIP: Consider setting up a different user to run the repository manager and adapt permissions and the RUN_AS_USER setting in the nexus startup script. 

To manually start it after the configuration:

   <pre><strong>
sudo launchctl load /Library/LaunchDaemons/com.sonatype.nexus.plist
   </strong></pre>


## Install appium_console gem

<pre>
gem uninstall -aIx appium_lib
gem uninstall -aIx appium_console
gem install --no-rdoc --no-ri appium_console
</pre>

Install flaky gem:<br />
https://github.com/appium/flaky<br />
(posix-spawn)

<pre>
gem uninstall -aIx flaky
gem install --no-rdoc --no-ri flaky
</pre>

## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
