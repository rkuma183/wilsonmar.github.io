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

This page explains the decisions around coding bash shell scripts, quoting websites when techniques are discussed.

Bash Script such as:

   mac-git-install.sh in https://github.com/wilsonmar/git-utilities/

## Top of file Shebang for Mac only

As with all Linux files, there is a "shebang" on the first line of the file.
The bash v3.2 shell is installed by default on macOS in the Bourne-compliant path:

<tt>\#!/bin/bash</tt>

However, this script specifies a Shebang for Bash v4 installed via brew:

<pre>\#!/usr/local/bin/bash</pre>

It's needed for Bash arrays used in the script.
The above path looks for bash in a hard-coded path rather than the alternative of<br />
<tt>\#!/usr/bin/env</tt>
because the script is not meant to be portable among Linux, only Mac due to use of Homebrew.

To verify the bash version used in the script:

<pre>bash --version | grep 'bash'</pre>

The response is:
<tt>GNU bash, version 4.4.19(1)-release (x86_64-apple-darwin17.3.0)</tt>

See https://scriptingosx.com/2017/10/on-the-shebang/

## Trap

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

   </pre>
trap cleanup EXIT
trap sig_cleanup INT QUIT TERM
   </pre>

This statement in the script...

<pre><strong>
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
</strong></pre>


## Indent 3 spaces

It's an asthetic choice.
The if statement is the most common in the script. 
So three spaces make the line indented under if align better.

## Logging to file

Echo statements are sent to a file:

<pre>
 >>$THISSCRIPT
</pre>

The file name of the log file contains a date in ISO 8601 format,
so multiple editions of the file can be sorted by date.


## Functions

Bash library with various functions?
https://stackoverflow.com/questions/11369522/bash-utility-script-library

Libraries for bash are out there, but not common. One of the reasons that bash libraries are scarce is due to the limitation of functions. I believe these limitations are best explained on "Greg's Bash Wiki":

<a target="_blank" href="http://mywiki.wooledge.org/BashWeaknesses">
NOTE</a>: Bash's "functions" have several issues:

Code reusability: Bash functions don't return anything; they only produce output streams. Every reasonable method of capturing that stream and either assigning it to a variable or passing it as an argument requires a SubShell, which breaks all assignments to outer scopes. (See also BashFAQ/084 for tricks to retrieve results from a function.) Thus, libraries of reusable functions are not feasible, as you can't ask a function to store its results in a variable whose name is passed as an argument (except by performing eval backflips).

Scope: Bash has a simple system of local scope which roughly resembles "dynamic scope" (e.g. Javascript, elisp). Functions see the locals of their callers (like Python's "nonlocal" keyword), but can't access a caller's positional parameters (except through BASH_ARGV if extdebug is enabled). Reusable functions can't be guaranteed free of namespace collisions unless you resort to weird naming rules to make conflicts sufficiently unlikely. This is particularly a problem if implementing functions that expect to be acting upon variable names from frame n-3 which may have been overwritten by your reusable function at n-2. Ksh93 can use the more common lexical scope rules by declaring functions with the "function name { ... }" syntax (Bash can't, but supports this syntax anyway).

Closures: In Bash, functions themselves are always global (have "file scope"), so no closures. Function definitions may be nested, but these are not closures, though they look very much the same. Functions are not "passable" (first-class), and there are no anonymous functions (lambdas). In fact, nothing is "passable", especially not arrays. Bash uses strictly call-by-value semantics (magic alias hack excepted).

There are many more complications involving: subshells; exported functions; "function collapsing" (functions that define or redefine other functions or themselves); traps (and their inheritance); and the way functions interact with stdio. Don't bite the newbie for not understanding all this. Shell functions are totally f***ed.

One example of a shell "library" is /etc/rc.d/functions on Redhat based system. This file contains functions commonly used in sysV init script.


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


## Save backup

See "Reliable Writes" in https://www.greenend.org.uk/rjk/tech/shellmistakes.html

A script overwrites files only after saving a backup copy.

TODO: Where there may be relationships among several files, all files changed in the same run have the same timestamp.

The file name of the backup contains a date and time stamp 

A random number is also added

Naming the file with a suffix of ".bak" 


## Lint check

https://shellcheck.com

https://github.com/koalaman/shellcheck


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


## Multiple terminals

When a service is started by a shell script within a terminal, no additional commands can be entered while the service runs.

So additional terminal sessions are needed to invoke the client or other services.

The options to do that depend on the operating system.

On Mac, the "open" command is unique to Macs.

   xterm -e crazy.sh

   open -a Terminal.app crazy.sh

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

