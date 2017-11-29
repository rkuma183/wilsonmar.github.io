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
cron in favor of launchd (a daemon running under the System context).
Since it's a background process, it doesn't present a user interface.

If the system is turned off or asleep, <strong>cron</strong> jobs 
do not execute until the next designated time occurs.

However, launchd job will run when the computer wakes up if 
the computer is <strong>asleep</strong> when the job should have run
(if the StartCalendarInterval key has been set).



<a name="Grep"></a>

## Grep Utilities

My version of the Grep utility that filters what is piped into it:

   <pre><strong>grep --version</strong></pre>

   response:

   <tt>grep (BSD grep) 2.5.1-FreeBSD</tt>

   PROTIP: The Mac is a combination of BSD and Linux goodness.

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



   <a name="Regex"></a>

## Regular Expressions

   We'll use the spelling dictionary of English words that comes with Linux.

   * <a target="_blank" href="https://dzone.com/articles/abc-of-regex">ABCs of Regex</a>

0. Search for words ending with "fine":

   <pre><strong>grep 'fine$' /usr/share/dict/words
   </strong></pre>

   $ (Shift+4) specifies search from the end of string.

   Responses include "refine".

0. Search for words beginng with "fine":

   <pre><strong>grep '^fine' /usr/share/dict/words
   </strong></pre>

   ^ (Shift+6) specifies search from the beginning of string.

   Responses include "refine".

0. Search for "fine" anywhere within the line:

   <pre><strong>grep 'fine' /usr/share/dict/words
   </strong></pre>

0. Search for lines containing "fine" anywhere within words:

   <pre><strong>grep 'fine' /usr/share/dict/words
   </strong></pre>

   ### Whitespace 

0. Search for a **s**pace before "system" in lines, such as either "system" or "file system":

   <pre><strong>grep '\ssystem' /etc/ntp.conf
   </strong></pre>

0. Search for any word **b**oundary after "server" in lines, such as 
   "servers" or "serverless":

   <pre><strong>grep 'server\b' /etc/ntp.conf
   </strong></pre>

   PROTIP: The response "server time.apple.com" is the server used for Network Time Protocol
   used to update your machine's clock.

   ### Reverse search

0. Return lines that do not start with # for comment:

   <pre><strong>grep -v '^\s*#' /etc/hosts
   </strong></pre>


0. Search for specific characters C or c:

   <pre><strong>grep '[Cc]'
   </strong></pre>

   ### Quantifiers

0. Search for "color" or "colour" in any line, using a combination, including
   a ? to specify the previous character u as an optional character:

   <pre><strong>grep '\b[Cc]olou?r\b' /usr/share/dict/words
   </strong></pre>

   `u+` matches one or more occurrences.

   `u*` matches zero or more times.

   `u{4}` matches exactly four occurrences.

   ## enhanced grep

0. Return words with five consequtive vowel characters:

   <pre><strong>grep -E '[aeiou]{5}' /usr/share/dict/words
   </strong></pre>

   BTW, "euouae" (<a target="_blank" href="https://www.youtube.com/watch?v=i5IVh7245hg">pronounced your-you-ee"</a>) consists only of vowels.


   ### Regex ranges

0. Search for characters, upper and lower case ranges from A to Z, 
   plus underscores:

   <pre><strong>grep '[A-Za-z_]' ???
   </strong></pre>

0. Search for just numbers range 1 through 9:

   <pre><strong>grep '[0-9]' ???
   </strong></pre>




<a name="Sed"></a>

## Sed

The Linux sed utility replaces contents within a file.

To delete empty lines and comment lines:

   sed -i.bak '/^s*#/d;/^$/d' somefile

   The -i generates a backup.

   The semicolon separates multiple specifications.


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
