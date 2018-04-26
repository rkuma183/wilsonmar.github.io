---
layout: post
title: "Bash script coding"
excerpt: "Justifications and explanations for coding Bash on MacOS the way we do"
tags: [API, devops, evaluation]
Categories: Devops
filename: bash-coding.md
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14612210/373cb4e2-0553-11e6-8a1a-4b5e1dabe181.jpg
  credit: And Beyond
  creditlink: http://www.andbeyond.com/chile/places-to-go/easter-island.htm
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This page explains the decisions around coding bash shell scripts, quoting websites when techniques are discussed. This was created during creation of a Bash Script to install all programs on a Mac that a typical developer needs:

   <strong>mac-setup-all.sh</strong> in <a target="_blank" href="
   https://github.com/wilsonmar/mac-setup/">
   https://github.com/wilsonmar/mac-setup</a>

1. Open a Terminal. 

   It is called a "Bash" shell, which is a contraction of the term "Bourne-agan shell", which is a play on words.

   ### Version with Grep

1. Test if you have Bash v4 installed.

   <pre><strong>bash --version | grep 'bash'
   </strong></pre>

   If the response shows version 4, you're good to go:

   <pre>GNU bash, version 4.4.19(1)-release (x86_64-apple-darwin17.3.0)</pre>

   The <tt>grep 'bash'</tt> is needed to filter out lines that do not contain the word "bash":

   <pre>
GNU bash, version 4.4.19(1)-release (x86_64-apple-darwin17.3.0)
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
&nbsp;
This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
   </pre>


   ### mac-bash4.sh initialization

1. If you have bash v3 that comes with MacOS, triple-click the script line here and copy, then click the Terminal and paste in the command to upgrade Bash to version 4:

   <pre>sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/mac-setup/master/mac-bash4.sh)"</pre>

   BTW, copy it by clicking on the line 3 times, then press Command+C, then click and paste using Command+V.

   The script first makes use of the Ruby program to install Homebrew which in turn installs Bash v4 using the brew command to download and configure packages.

2. After it runs, verify the version again to ensure it's version 4.

   ### secrets.sh at Home

   The script also copies the <strong>secrets.sh</strong> file from the public on-line repository into your laptop so that you can add your secrets in the file but have no chance the file will be uploaded from the Git repository where it came from.

   The file is placed in your account Home folder.

   <a name="HomeFolder"></a>

   ### Home folder

2. The default location the Teminal command opens to by default is your "Home" folder, which you can reach anytime by:

   <pre><strong>cd
   </strong></pre>

3. The "~" (tilde character) prompt represents the $HOME folder, which is equivalent to a path that contains your user account, such as (if you were me):

   <pre>/Users/wilsonmar</pre>

4. You can also use this variable to reach Home:

   <pre>cd $HOME</pre>

   In other words these four commands all achieve the same result:

   <tt>cd = cd ~ = cd $HOME</tt>

   ### Text edit secrets.sh

3. Use a text editor to edit the <tt>secrets.sh</tt> file using a text editor that comes pre-loaded on every Mac:

   <pre><strong>textedit secrets.sh</strong></pre>

   <a name="Shebang"></a>

   ### Top of file Shebang

   Consider the first line in the secrets.sh file:

   <pre>#!/bin/bash</pre>

   That is the "Bourne-compliant" path for the Bash v3.2 shell installed by default on MacOS up to High Sierra. BTW, other Linux flavors may alternately use this for portability:

   <pre>#!/usr/bin/env</pre>

   BTW, unlike Windows, which determines the program to open files based on the suffix (or extension) of the file name, Linux shell programs such as Bash reference the "shebang" on the first line inside the file. 

   ### Version 4 Shebang

   If you instead you see this on the first line:

   <tt>#!/usr/local/bin/bash</tt>

   That is the path associated with where <a href="#Bash4">Bash v4</a> is installed.

   Version 4 is needed for <a href="#BashArrays">Bash arrays needed later in the script</a>.

   This is why we need to first upgrade Bash before running other scripts.


   ### App keywords

   The initial file does not have keywords which specify additional apps to install.

4. Scroll down or press command+F to specify an app you want installed.


   ### Edit port numbers

4. Scroll to the list of ports (listed alphabetically).

5. May sure that none of the ports are the same.

4. Save the file and exit the text editor.

   ### Setup all

2. Now again copy and paste and run this command: 

   <pre>sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/mac-setup/master/mac-setup-all.sh)"</pre>

   The script referenced in the command obtains more files needed by cloning from a public GitHub repository to a folder under your home folder.

   <pre>mac-setup</pre>

   ### Subsequent runs

   Within this folder is a script you can use to update what is installed on your Mac.

3. cd into that folder.
   
5. To change what is installed, edit the secrets.sh file and run again locally:

   <pre><strong>chmod +x mac-setup-all.sh
   ./mac-setup-all.sh
   </strong></pre>

   The <tt>chmod</tt> (pronounced "che-mod") changes the permissions for executing the file.

Now let's look at the code in file <strong>mac-setup-all.sh</strong>:

## Traps

The Bash trap command catches signals so it can execute some commands when appropriate,
such as <a target="_blank" href="https://www.shellscript.sh/trap.html>
cleaning up temp files before the script finishes</a>, called an
<a target="_blank" href="http://redsymbol.net/articles/bash-exit-traps/">exit trap</a>.

   <pre>
cleanup() {
    err=$?
    echo "Cleaning stuff up..."
    trap '' EXIT INT TERM
    exit $err 
}
sig_cleanup() {
    trap '' EXIT # some shells will call EXIT after the INT handler
    false # sets $?
    cleanup
}
   </pre>

<a target="_blank" href="https://unix.stackexchange.com/questions/57940/trap-int-term-exit-really-necessary">
The above cleanup function</a> is invoked when INT TERM occurs to trigger the function,
at the bottom of the script:

   <pre>
trap cleanup EXIT
trap sig_cleanup INT QUIT TERM
   </pre>

This statement in the script...

<pre><strong>
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
</strong></pre>


## Set "Strict Mode"

<pre>set -o nounset -o pipefail -o errexit  # "strict mode"</pre>

 <tt>pipefail</tt> means that when the program encounters an exit code != 0, the exit code for the pipeline (Bash script) becomes != 0.
<a target="_blank" href="https://news.ycombinator.com/item?id=10736584">
E.g.</a> pipefail can be useful to ensure `curl does-not-exist-aaaaaaa.com | wc -c` doesn't exit with exit code 0..!>


## Indent 3 spaces

It's an asthetic choice.

<a target="_blank" href="https://google.github.io/styleguide/shell.xml?showone=Use_Local_Variables#Use_Local_Variables">Google's Style Guide</a>
calls for two spaces.

But <strong>three spaces</strong> make the line indent under if align better.
And the if statement is the most common in the script. 


<a name="ShellCheck"></a>

## Lint Shellcheck

Coding in this script is linted using ShellCheck online at
<a target="_blank" href="https://shellcheck.com">shellcheck.com</a> or installed from 
<a target="_blank" href="https://github.com/koalaman/shellcheck">https://github.com/koalaman/shellcheck</a>

To override the triggering of one of its particular rules so that it does not appear as an error,
a line like this is added

<pre># shellcheck disable=SC2059</pre>



## Time start and elapsed

Near the script's beginning, the MacOS <tt>date</tt> command is used to obtain a starting time stamp:

<pre>TIME_START="$(date -u +%s)"</pre>

The output is like "1524256274", which is the number of seconds since the "epoch" of January 1, 1970.

At the end of the script, the END timestamp is obtained for use in calculating the 
time elapsed during the script run.


## Disk Space Free and Used

Near the script's beginning, the MacOS <tt>df</tt> command is used to obtain the number of blocks available:

<pre>FREE_DISKBLOCKS_START="$(df | sed -n -e '2{p;q}' | cut -d' ' -f 6)"</pre>

At the end of the script, the END variable is obtained for use in calculatubg the 
space used during the script run.


## Logging to file

The script is designed so the historical record of each run pops up at the end of the script.
This is so you can easily <strong>scroll and search</strong> through the document, something that is difficult on the Console.

What sends statements to a file is this:

   <pre>
echo "something" >>$LOGFILE
   </pre>

The file name of the log file contains a date in ISO 8601 format,
so multiple editions of the file can be sorted by date.

The file is put in the user's $HOME folder so that logs don't accumulate unnoticed in an obscure location.

Logs are not sent to the Linux <tt>/var/log</tt> folder because on a Mac its default owner for permissions is root:

   <pre>ls -ld /var/log
drwxr-xr-x  54 root  wheel  1728 Apr 21 05:01 /var/log
   </pre>


## Functions for dependencies

<a target="_blank" href="https://stackoverflow.com/questions/11369522/bash-utility-script-library">
QUESTION</a>: What are good Bash libraries with common functions?
Libraries for bash are not common. 
One is /etc/rc.d/functions on RedHat-based systems.
The file contains functions commonly used in sysV init script.

<a target="_blank" href="https://mywiki.wooledge.org/BashGuide">
NOTE</a>: Bash libraries are scarce is due to limitation of Bash functions. 

<a target="_blank" href="http://mywiki.wooledge.org/BashWeaknesses">
NOTE</a>: Bash's "functions" have several issues:

Code reusability: Bash functions don't return anything; they only produce output streams. Every reasonable method of capturing that stream and either assigning it to a variable or passing it as an argument requires a SubShell, which breaks all assignments to outer scopes. (See also <a target="_blank" href="https://mywiki.wooledge.org/BashFAQ/084">BashFAQ/084</a> for tricks to retrieve results from a function.) Thus, libraries of reusable functions are not feasible, as you can't ask a function to store its results in a variable whose name is passed as an argument (except by performing eval backflips).

Scope: Bash has a simple system of local scope which roughly resembles "dynamic scope" (e.g. Javascript, elisp). Functions see the locals of their callers (like Python's "nonlocal" keyword), but can't access a caller's positional parameters (except through BASH_ARGV if extdebug is enabled). Reusable functions can't be guaranteed free of namespace collisions unless you resort to weird naming rules to make conflicts sufficiently unlikely. This is particularly a problem if implementing functions that expect to be acting upon variable names from frame n-3 which may have been overwritten by your reusable function at n-2. Ksh93 can use the more common lexical scope rules by declaring functions with the "function name { ... }" syntax (Bash can't, but supports this syntax anyway).

Closures: In Bash, functions themselves are always global (have "file scope"), so no closures. Function definitions may be nested, but these are not closures, though they look very much the same. Functions are not "passable" (first-class), and there are no anonymous functions (lambdas). In fact, nothing is "passable", especially not arrays. Bash uses strictly call-by-value semantics (magic alias hack excepted).

There are many more complications involving: subshells; exported functions; "function collapsing" (functions that define or redefine other functions or themselves); and the way functions interact with stdio. Don't bite the newbie for not understanding all this. Shell functions are totally f***ed.


## Time Stamps for run duration

To determine elapsed time, time stamps are captured and the start and end of the script:

<tt>TIME_START="$(date -u +%s)"</tt>

This yields a number counting the number of seconds since the Jan 1, 1970 epoch point in time.


## Disk space used

Available space on disk is obtained using command:

<pre>FREE_DISKBLOCKS_START=$(df | sed -n -e '2{p;q}' | cut -d' ' -f 6)</pre>

The avaiable value is captured from 2nd line, 6th item: 190920080 of the response:

<pre>
Filesystem   1024-blocks      Used Available Capacity iused               ifree %iused  Mounted on
/dev/disk1s1   488245284 294551984 190920080    61% 2470677 9223372036852305130    0%   /
</pre>

The number of blocks needs to be converted to MB (megabytes).


## File Descriptors

Most services such as databases need more file descriptors than the <tt>2048</tt> default on MacOS. We can see the current limit with this command:

   <pre><strong>ulimit -n</strong></pre>

Use the tee command to concatenate to the bottom of the <tt>/etc/profile</tt> file:

   <pre>'ulimit -n 10032' | sudo tee -a /etc/profile</pre>

A reboot is necessary for this to take.

http://bencane.com/2013/09/16/understanding-a-little-more-about-etcprofile-and-etcbashrc/

## Save backup

See "Reliable Writes" in https://www.greenend.org.uk/rjk/tech/shellmistakes.html

A script overwrites files only after saving a backup copy,
naming the file with a suffix of ".bak" 


### Time stamps

Where there may be relationships among several files, all files changed in the same run have the same timestamp.

The file name of the backup contains a date and time stamp in ISO 8601 format such as:

   <tt>mac-setup-all.sh.2018-04-22T19:26:20-0600-18.log</tt>

The coding uses the bash date and RANDOM commands (for microseconds):

   <pre>
LOG_DATETIME=$(date +%Y-%m-%dT%H:%M:%S%z)-$((1 + RANDOM % 1000))
LOGFILE="$HOME/$THISPGM.$LOG_DATETIME.log"
   </pre>


## Brew Package Path Linkages

When we run brew install, it adds new packages to a folder under:

   <tt>/usr/local/Cellar/</tt>

For example, running <tt>brew install sonar</tt> creates a new folder:

   <tt>/usr/local/Cellar/sonarqube/7.1</tt>

   (Notice in this case the path contains "sonarqube" rather than "sonar".)

PROTIP: It's best that version numbers not be hard-coded into scripts.

QUESTION: How do we access the folder using a path that doesn't have a version number?

One of the great reasons for using Homebrew is that it automatically creates a symlink from where it installs so that you can execute a command from any folder, such as:

   <tt>sonar console</tt>

Also, when my bash script wants to know if <tt>brew install sonar</tt> has been run already, it runs:

   <tt>command -v sonar</tt>

If it has not be installed, nothing is returned. If it has been installed, the response is a path such as "/usr/local/bin/sonar".

BLAH: However, we cannot visit that path using <tt>ls /usr/local/bin/sonar</tt>:

   <pre>-bash: cd: /usr/local/bin/sonar: Not a directory</pre>

When we execute <tt>brew link sonar</tt>, it reports:

   <pre>Warning: Already linked: /usr/local/Cellar/sonarqube/7.1</pre>

When we look for "sonar" in the file system using this:

   <pre>find / -name sonar 2>/dev/null</pre>

two paths are reported:

   <pre>/usr/local/bin/sonar
   /usr/local/Cellar/sonarqube/7.1/bin/sonar
   </pre>

However, a find for sonarqube yields:

   <pre>/usr/local/opt/sonarqube
    /usr/local/var/homebrew/linked/sonarqube
   </pre>

PROTIP: So we use that URL found in the full path to the conf file to edit.

### MySQL config files

After brew installs mysql, this message appears:

   <pre>A "/etc/mysql/my.cnf" from another install may interfere with a Homebrew-built
server starting up correctly.
   </pre>

There is no folder, but there is folder <tt>/usr/local/etc/my.cnf</tt>.

<a target="_blank" href="https://forums.mysql.com/read.php?11,366143,376017#msg-376017">
NOTE</a>: By default, the OS X installation does not use a my.cnf, and MySQL just uses the default values. To set up your own my.cnf, you could just create a file straight in /etc.

OS X provides example configuration files at /usr/local/mysql/support-files/

BLAH: Thus I do not recommend using MySQL and to avoid installing it.
The same errors are occuring for MariaDB as well.
So let's just use Postgresql instead to avoid wasting time and headache.
Go to another blog for advice on this terrible program.


## No Brew, No problem

## Scape web page for URL

Most packages setup their installer for easy installation by creating an entry in Homebrew website.

Some don't do that, such as Gatling. So we have to "scrape" their webpage to obtain the URL that is downloaded when a user manually clicks "DOWNLOAD" on the webpage. An analysis of the page (at gatling.io/download) shows it is one of two URLs which download the bundle.zip file.

   <tt>
DOWNLOAD_URL="gatling-version.html"; wget -q "https://gatling.io/download/" -O $outputFile; cat "$outputFile" | sed -n -e '/<\/header>/,/<\/footer>/ p' | grep "Format:" | sed -n 's/.*href="\([^"]*\).*/\1/p' ; rm -f $outputFile
   </tt>

   The code above (from Wisdom Hambolu) pulls down the page. The grep filters out all but the line containing "Format:" which has a link to "zip bundle".  The sed function extracts out the URL between the "href=".

Alternately, Python programmers have a utility called "Beautiful Soup"
https://medium.freecodecamp.org/how-to-scrape-websites-with-python-and-beautifulsoup-5946935d93fe
installed by pip install BeautifulSoup4

Within the Python program:

<pre>
import urllib2
from bs4 import BeautifulSoup
quote_page = ‘http://www.bloomberg.com/quote/SPX:IND'
page = urllib2.urlopen(quote_page)
soup = BeautifulSoup(page, ‘html.parser’)
name_box = soup.find(‘h1’, attrs={‘class’: ‘name’})
name = name_box.text.strip() # strip() is used to remove starting and trailing
print name
# get the index price
price_box = soup.find(‘div’, attrs={‘class’:’price’})
price = price_box.text
print price
</pre>

Others:
* https://www.joyofdata.de/blog/using-linux-shell-web-scraping/
* http://www.gregreda.com/2013/03/03/web-scraping-101-with-python/
* http://www.analyticsvidhya.com/blog/2015/10/beginner-guide-web-scraping-beautiful-soup-python/
* https://github.com/ContentMine/quickscrape



<a name="GitHubReleases"></a>

## Install from GitHub Releases

Some apps do not have Homebrew but have installers in GitHub. An example is:

   <a target="_blank" href="
   https://github.com/pact-foundation/pact-go/releases">
   https://github.com/pact-foundation/pact-go/releases</a>

Unlike a brew command, which downloads into its own folder no matter what folder you're in,
the destination folder for downloads using curl needs to be specified in the command
or it goes to the current folder.

To download outside Homebrew, right-click the link for "Darwin" to copy for pasting it in a curl command such as:

   <pre>curl "$DOWNLOAD_URL" -o "$GATLING_HOME/gatling.zip"  # 55.3M renamed
 </pre>

   DOWNLOAD_URL="https://github.com/pact-foundation/pact-go/releases/download/v0.0.12/pact-go_darwin_amd64.tar.gz"

The trouble is that 

Alternately, the wget command can be used if it has been installed earlier.

Either way, the "gunzip" file needs to be unzipped and verified.

   <pre>unzip pact-go_darwin_amd64.tar.gz
    </pre>

    
    Unzip the package into a known location, 
     ensuring the pact-go binary is on the PATH, next to the pact folder.
    Run pact-go to see what options are available.
    Run go get -d github.com/pact-foundation/pact-go to install the source packages



## Process start/stop/kill

There are several ways to start and stop processes:

   * Invoke the program's cli command, such as <tt>redis-cli start</tt>
   * Invoke the brew services start command
   * Invoke <tt>launchctl load $HOME/Library/LaunchAgents/homebrew.mxcl.mongodb.plist</tt>
   <br /><br />

The typical caveats from a brew install is, for example:

   <pre>
To have launchd start sonarqube now and restart at login:
  brew services start sonarqube
Or, if you don't want/need a background service you can just run:
  sonar console
   </pre>

During installation, few installers create a Plist file to define a service that MacOS brings up automatically on boot-up. 

The preference is to use an approach which enables orderly saving of what may be in memory. This is preferrable to using a kill command which can be too abrupt.

To kill a process within Terminal stopped while presenting a process, press command+. (period).
But in a script, first obtain the PID:

   <pre><strong>
PID="$(ps -A | grep -m1 '/postgresql' | grep -v "grep" | awk '{print $1}')"
kill $PID
   </strong></pre>

   PROTIP: The "/" in the process name is sometime added if there are several ("child") processes related to the one PID. Bringing that down would bring down the others automatically.
   For example: 

   <pre>
86700   ??  Ss     0:00.00 postgres: checkpointer process     
86701   ??  Ss     0:00.07 postgres: writer process     
86702   ??  Ss     0:00.05 postgres: wal writer process     
86703   ??  Ss     0:00.04 postgres: autovacuum launcher process     
86704   ??  Ss     0:00.05 postgres: stats collector process     
86705   ??  Ss     0:00.00 postgres: bgworker: logical replication launcher     
86698 s000  S      0:00.04 /usr/local/Cellar/postgresql/10.3/bin/postgres -D /usr/local/var/postgres
87259 s001  S+     0:00.00 grep postgres
   </pre>

   PROTIP: The <tt>grep -v "grep"</tt> filters out the grep process itself.
   Killing/stopping the "postgresql" process also stops several "postres:" automatically.



<a name="variables"></a>

## Variables

0. Define a variable:

   <pre>
   MY_VARIABLE="x"
   </pre>

0. Clear out a variable as if it was not defined:

   <pre>
   unset MY_VARIABLE
   </pre>

0. Test a variable:

   <pre>
\# PROTIP: -z tests for zero value (empty).  -v is only available on new versions of Bash.
if [ -z "$MY_ZONE" ]; then  # not empty
   MY_ZONE="us-central1-b"  # set default value.
fi
echo "**** MY_ZONE=\"$MY_ZONE\""
   </pre>

0. Define new verbs so different colors are displayed at various levels of concern:

   <pre>
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }
echo_ok "Install starting. You may be asked for your password (for sudo)."
   </pre>

0. If Xcode is not installed, exit the program (quit):

   <pre>
# Require xcode or quit out:
xcode-select -p || exit "XCode must be installed! (use the app store)"
   </pre>

0. Set permissions

   <pre>
cd ~
mkdir -p tmp
echo_ok "Setting permissions..."
for dir in "/usr/local /usr/local/bin /usr/local/include /usr/local/lib /usr/local/share"; do
	sudo chgrp admin $dir
	sudo chmod g+w $dir
done
   </pre>   

0. Make sure Homebrew is installed:

   <pre>
# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &> /dev/null; then
   echo_ok "Homebrew already installed"
else
   echo_warn "Installing homebrew..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
   </pre>   

0. The meanjs sample app requires MongoDB to be running, so this code makes that so
   by concatenating a control keyword text to a variable:

   <pre>
   if echo "$TRYOUT_KEEP" | grep -q "mongodb"; then
      echo "mongodb already in string";
   else
      echo "$TRYOUT_KEEP,mongodb";  # add to string
   fi
   if echo "$TRYOUT" | grep -q "mongodb"; then
      echo "mongodb already in string";
   else
      echo "$TRYOUT,mongodb";  # add to string
   fi
   MONGODB_INSTALL
   </pre>   

   Before calling MONGO_INSTALL, we mark the strings that brings up the MongoDB service
   and keeps it running rather than shutting it down (the default action).


<hr />

## Multiple terminals

When a service is started by a shell script within a terminal, no additional commands can be entered while the service runs.

So additional terminal sessions are needed to invoke the client or other services.

The options to do that depend on the operating system.

On Mac, the "open" command is unique to Macs.

   <pre>
   open -a Terminal.app crazy.sh
   </pre>

   * See https://stackoverflow.com/questions/19440007/mac-gnome-terminal-equivalent-for-shell-script

To make the terminal stay when the command exits:

   In xterm, there is a -hold flag.


In Fedora:

   gnome-terminal -e command

   * https://help.gnome.org/users/gnome-terminal/stable/
   
   * See https://askubuntu.com/questions/46627/how-can-i-make-a-script-that-opens-terminal-windows-and-executes-commands-in-the

   * https://askubuntu.com/questions/484993/run-command-on-anothernew-terminal-window

   * https://stackoverflow.com/questions/42444615/how-to-write-a-shell-script-to-open-four-terminals-and-execute-a-command-in-each

   In gnome-terminal, go to Edit -> Profile Preferences -> Title. Click the Command tab. Select Hold the terminal from the drop-down menu labelled When command exits. You should create a new profile for that and execute with

   gnome-terminal --window-with-profile=NAMEOFTHEPROFILE -e command

Alternately:

   konsole -e command

   In konsole there is a --noclose flag.


Pretty much

   terminal -e command


## Testing

https://medium.com/wemake-services/testing-bash-applications-85512e7fe2de

https://github.com/sstephenson/bats

## References

https://jasonjwilliamsny.github.io/wrangling-genomics/01-automating_a_workflow.html


https://www.greenend.org.uk/rjk/tech/shellmistakes.html

http://wiki.bash-hackers.org/commands/builtin/set

http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html
Debugging bash scripts


https://www.tldp.org/LDP/abs/html/abs-guide.html

http://www.linuxjournal.com/article/9001  on CPU Load Averages

https://www.digitalocean.com/community/tutorials/how-to-use-bash-s-job-control-to-manage-foreground-and-background-processes

https://github.com/Bash-it/bash-it
a collection of community Bash commands and scripts for Bash 3.2+. (And a shameless ripoff of oh-my-zsh 😃)
Includes autocompletion, themes, aliases, custom functions, a few stolen pieces from Steve Losh, and more.

https://github.com/denysdovhan/bash-handbook

   See https://scriptingosx.com/2017/10/on-the-shebang/
