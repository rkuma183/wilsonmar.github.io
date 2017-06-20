---
layout: post
title: "Mac OSX Command-Line Utilities kill, Grep, Awk, Cron"
excerpt: "The Swiss Army knives for the Mac"
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

<a id="Processes"></a>

## Processes

0. So that we can kill it for fun, create a background process (by specifying &) 
   which sleep for 999 seconds:

   <pre><strong>sleep 999 &
   pgrep sleep
   </strong></pre>

0. To list the top processes:

   <pre><strong>top
   </strong></pre>

0. To list all processes:

   <pre><strong>ps -all
   </strong></pre>

0. To kill a single progam by name, such 

   <pre><strong>pkill sleep
   </strong></pre>

0. To kill several progams by name, such 

   <pre><strong>killall sleep
   </strong></pre>


renice

<a id="Grepz"></a>

## Grep Utilities

My version of the Grep utility that filters what is piped into it:

   <tt><strong>grep --version</strong></tt>

is

   <tt>grep (BSD grep) 2.5.1-FreeBSD</tt>

   NOTE: The Mac is a combination of BSD and Linux goodness.

Grep filters what is piped into it:

   <tt>grep "my string of text" -R</tt>


Find the word "server" with case -insensitive in a file:

   <pre><strong>grep -i Server /etc/ntp.conf
   </strong></pre>

   The response contains the word "server" searched::

   <pre>
server time.apple.com.
   </pre>

Find lines that don't (-v to reverse search) 
begin with # (specified by a ^)
   or blank lines (specified by a ^) to the end of line $:

   <pre><strong>grep -ve'^#' -ve'^$'/etc/ntp.conf
   </strong></pre>




   The response:

   <pre>
server time.apple.com.
   </pre>



## Uptime

   <pre><strong>uptime
   </strong></pre>


## Install appium_console gem

<pre>
gem uninstall -aIx appium_lib
gem uninstall -aIx appium_console
gem install --no-rdoc --no-ri appium_console
</pre>

Install flaky gem.
https://github.com/appium/flaky
(posix-spawn)

<pre>
gem uninstall -aIx flaky
gem install --no-rdoc --no-ri flaky
</pre>



<a id="CronJobs"></a>

## Cron Launchd Background Jobs

<a target="_blank" href="https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/ScheduledJobs.html">This</a> mentions that Apple has deprecated
cron in favor of launchd (a daemon running under the System context).
Since it's a background process, it doesn't present a user interface.

If the system is turned off or asleep, <strong>cron</strong> jobs 
do not execute until the next designated time occurs.

However, launchd job will run when the computer wakes up if 
the computer is <strong>asleep</strong> when the job should have run
(if the StartCalendarInterval key has been set).



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
