---
layout: post
title: "Java Install on Mac OSX"
excerpt: "Because programmers can't get enough caffeine"
tags: [apple, mac, setup]
image:
# feature: pic brown java beans 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622024/6a77b5b0-0584-11e6-93ea-ed1ca2c4bbc6.jpg
  credit: Green Coffee Lover
  creditlink: http://www.greencoffeelover.com/wp-content/uploads/2015/03/7.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<a id="JDKSetupz"></a>

There are several ways to install Java.
This is the one that worked for me.

<a name="AppleJavaC"></a>

### Apple Java

WARNING: The version that comes installed on Apple Macs can be obsolete.

CAUTION: Do not delete the default version.
But if you did, to re-install <strong>Java 6</strong> for OS X 2014-001,
it can be obtained from
<a target="_blank" href="https://support.apple.com/kb/DL1572?locale=en_US">
https://support.apple.com/kb/DL1572?locale=en_US</a>


<a name="WhichJava"></a>

## Which Java You Got?

On a Terminal open to any folder:

0. To see what JRE you have already installed:

   <pre><strong>
   java -version
   </strong></pre>

   A sample response:

   <pre>
java version "1.8.0_06-ea"
Java(TM) SE Runtime Environment (build 1.8.0_06-ea-b13)
Java HotSpot(TM) 64-Bit Server VM (build 23.2-b04, mixed mode)
   </pre>

0. PROTIP: Developers use the JDK rather than the JRE (Runtime Environment),
   see what version of the Java Compiler is installed:

   <pre><strong>
   javac -version
   </strong></pre>

   A sample response:

   <pre>
   javac 1.8.0_74
   </pre>

   If it's not installed, MacOS prompts you to install the JDK.
   Clever. But don't do it if you want the Oracle version.

0. Click <strong>More Info...</strong>.

   <pre><strong>
   /usr/libexec/java_home -V
   </strong></pre>

   That's a capital V.

   The response on my machine:

   <pre>
Matching Java Virtual Machines (4):
1.8.0_45, x86_64:	"Java SE 8"	/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
1.7.0_65, x86_64:	"Java SE 7"	/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
1.6.0_65-b14-466.1, x86_64:	"Java SE 6"	/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
1.6.0_65-b14-466.1, i386:	"Java SE 6"	/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
   </pre>

   PROTIP: In OSX, all known JVM's are located at:

   <pre>
   /Library/Java/JavaVirtualMachines/
   </pre>

0. The $JAVA_HOME environment variable is used by Groovy, Grails, Spring Boot, and others:

   <tt><strong>
   echo $JAVA_HOME
   </strong></tt>

   The response:

   <pre>
   /Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
   </pre>

0. See what derivative program such as Maven uses:

   <tt><strong>
   mvn -version
   </strong></tt>

   The sample response:

   <pre>
Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T09:41:47-07:00)
Maven home: /usr/local/Cellar/maven/3.3.9/libexec
Java version: 1.8.0_74, vendor: Oracle Corporation
Java home: /Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home/jre
Default locale: en_US, platform encoding: US-ASCII
OS name: "mac os x", version: "10.11.5", arch: "x86_64", family: "mac"
   </pre>

0. See:

   <tt><strong>
   command -v java
   </strong></tt>

   If you get this:

   <pre>
   /usr/bin/java
   </pre>



   <a name="OracleJavaC"></a>

   ### Latest Version of Oracle Java #

0. PROTIP: <strong>Hold off downloading</strong> the java .dmg installer file,
   as described at
   <a target="_blank" href="https://java.com/en/download/help/mac_install.xml">
   https://java.com/en/download/help/mac_install.xml</a>

   WARNING: Oracle installs an annoying Ask Toolbar, sometimes without asking.

   Oracles docs on installing the JDK:<br />
   <a target="_blank" href="https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html">
   https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html</a>

0. Use an internet browser to<br />
   <a target="_blank" href="http://www.oracle.com/technetwork/java/javase/downloads/index.html">
   http://www.oracle.com/technetwork/java/javase/downloads/index.html</a>

   
   ### Multiple Versions of JDK #

0. Click the "Download" button for the JDK (not the JRE).

   NOTE: Downloads of the JDK contains the JRE.

   <a name="JenvInstall"></a>

   ### Install Jenv to manage multiple Versions of Java #

   PROTIP: If you're a developer, 
   you'll likely need to manage different versions of Java needed by different apps.
   Much like NPM for Node
   and [rbenv for Ruby](/ruby-on-apple-mac-osx/).

   <a target="_blank" href="http://hanxue-it.blogspot.com/2014/05/installing-java-8-managing-multiple.html?q=java">
   http://hanxue-it.blogspot.com/2014/05/installing-java-8-managing-multiple.html?q=java</a>
   <br />
   describes the steps.

0. Install Jenv by specifying the location URL:

   <tt><strong>
   brew install https://raw.githubusercontent.com/entrypass/jenv/homebrew/homebrew/jenv.rb
   </strong></tt>

   The long response:

   <pre>
==> Auto-updated Homebrew!
Updated Homebrew from fa19447 to 7c5e149.
Updated 3 taps (homebrew/core, homebrew/dupes, pivotal/tap).
==> New Formulae
lean-cli                                 libdivecomputer                        
==> Updated Formulae
antigen                    konoha                     prometheus               
cogl                       kyua                       qbs                      
fabio                      libfreenect                rapidjson                
ffmpeg                     libgit2-glib               rclone                   
ffmpegthumbnailer          mkvtoolnix                 rebar                    
gawk                       mpv                        repo                     
git-fresh                  mypy                       sngrep                   
git-lfs                    ncdu                       swiftlint                
giter8                     nghttp2                    tailor                   
gssh                       open-mpi                   the_platinum_searcher    
homebrew/dupes/ed          openvpn                    tile38                   
homebrew/dupes/tcl-tk      osh                        tippecanoe               
infer                      pcap_dnsproxy              tor                      
jlog                       pivotal/tap/pivnet-cli     vegeta                   
joe                        ponyc                      yle-dl                   
######################################################################## 100.0%
==> Cloning https://github.com/gcuisinier/jenv.git
Cloning into '/Users/mac/Library/Caches/Homebrew/jenv--git'...
remote: Counting objects: 122, done.
remote: Compressing objects: 100% (75/75), done.
remote: Total 122 (delta 8), reused 94 (delta 5), pack-reused 0
Receiving objects: 100% (122/122), 29.04 KiB | 0 bytes/s, done.
Resolving deltas: 100% (8/8), done.
Checking connectivity... done.
Note: checking out '76268a9b90248f260037137ac9212db9ba1e72c6'.
&nbsp;
You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.
&nbsp;
If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:
&nbsp;
  git checkout -b <new-branch-name>
&nbsp;
==> Checking out tag 0.2.0-201404260
==> Caveats
Add 'jenv init' to your shell to enable shims and autocompletion.
&nbsp;
$ echo 'eval "$(jenv init -)"' >> ~/.bash_profile
&nbsp;
Fish shell export functions are available at /usr/local/Cellar/jenv/0.2.0-201404260/fish
&nbsp;
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
&nbsp;
zsh completion has been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/jenv/0.2.0-201404260: 70 files, 61K, built in 2 seconds
   </pre>

   The destination of the install is different than standard Java install:

   <pre>
   Cloning into '/Users/mac/Library/Caches/Homebrew/jenv--git'...
   </pre>

0. Do what the jenv message says and 
   activate jenv by adding this to the bottom of the file
   activated when a Terminal shell window starts:

   <pre><strong>
   echo 'eval "$(jenv init -)"' >> ~/.bash_profile
   </strong></pre>

0. To see if jenv can run, list its version and commands:

   <tt><strong>
   jenv
   </strong></tt>

   The desired response is like this:

   <pre>
Usage: jenv <command> [<args>]
&nbsp;
Some useful jenv commands are:
   commands    List all available jenv commands
   local       Set or show the local application-specific Java version
   global      Set or show the global Java version
   shell       Set or show the shell-specific Java version
   rehash      Rehash jenv shims (run this after installing executables)
   version     Show the current Java version and its origin
   versions    List all Java versions available to jenv
   which       Display the full path to an executable
   whence      List all Java versions that contain the given executable
&nbsp;
See `jenv help <command>' for information on a specific command.
For full documentation, see: https://github.com/hikage/jenv#readme
   </pre>


   TROUBLESHOOTING:
   If you get this:   

   <pre>
/usr/local/bin/jenv: line 25: cd: /Users/mac/.jenv: No such file or directory
/usr/local/Cellar/jenv/0.2.0-201404260/libexec/jenv: line 25: cd: /Users/mac/.jenv: No such file or directory
/usr/local/Cellar/jenv/0.2.0-201404260/libexec/jenv---version: line 17: cd: /Users/mac/.jenv: No such file or directory
   </pre>

   Rather than using instructions at <a target="_blank" href="https://github.com/gcuisinier/jenv#gettings-started">
   https://github.com/gcuisinier/jenv#gettings-started</a><br />
   and<br />
   <a target="_blank" href="https://github.com/gcuisinier/jenv/blob/master/README.md">https://github.com/gcuisinier/jenv/blob/master/README.md</a><br />
   to

   <tt><strong>
   git clone https://github.com/gcuisinier/jenv.git ~/.jenv
   </strong></tt>

   The response:

   <pre>
Cloning into '/Users/mac/.jenv'...
remote: Counting objects: 874, done.
remote: Total 874 (delta 0), reused 0 (delta 0), pack-reused 874
Receiving objects: 100% (874/874), 362.88 KiB | 199.00 KiB/s, done.
Resolving deltas: 100% (367/367), done.
Checking connectivity... done.
   </pre>

   PROTIP: Installing using clone means that you would have to manually check
   whether a new version is available, then manually do the upgrade.
   So instead of doing that, forget the ~/.jenv folder and do this:

0. Use Homebrew's directories rather than ~/.jenv add to the bottom of your profile file:

   <tt><strong>
   export JENV_ROOT=/usr/local/var/jenv
   </strong></tt>

0. To enable shims and autocompletion add to the botton of your profile file:
  
   <pre><strong>
   if which jenv > /dev/null; then eval "$(jenv init -)"; fi
   </strong></pre>

0. To see what jenv recognizes:

   <tt><strong>
   jenv versions
   </strong></tt>

   The response if none if brew cask was not installed:

   <pre>
   * system (set by /usr/local/var/jenv/version)
   </pre>

0. Install Java GUI using brew <strong>cask</strong>, 
   and `--force` to update sub-versions:

   <pre><strong>
   sudo brew update && brew cask install java --force
   </strong></pre>

   The response:

   <pre>
   ==> Downloading http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-ma
Warning: The default Caskroom location has moved to /usr/local/Caskroom.
&nbsp;
Please migrate your Casks to the new location and delete /opt/homebrew-cask/Caskroom,
or if you would like to keep your Caskroom at /opt/homebrew-cask/Caskroom, add the
following to your HOMEBREW_CASK_OPTS:
&nbsp;
  --caskroom=/opt/homebrew-cask/Caskroom
&nbsp;
For more details on each of those options, see https://github.com/caskroom/homebrew-cask/issues/21913.
==> Caveats
This Cask makes minor modifications to the JRE to prevent issues with
packaged applications, as discussed here:
&nbsp;
  https://bugs.eclipse.org/bugs/show_bug.cgi?id=411361
&nbsp;
If your Java application still asks for JRE installation, you might need
to reboot or logout/login.
&nbsp;
Installing this Cask means you have AGREED to the Oracle Binary Code
License Agreement for Java SE at
&nbsp;
  http://www.oracle.com/technetwork/java/javase/terms/license/index.html
&nbsp;
==> Downloading http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-
==> Verifying checksum for Cask java
==> Running installer for java; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are i
Password:
==> installer: Package name is JDK 8 Update 102
==> installer: Upgrading at base path /
==> installer: The upgrade was successful.
🍺  java was successfully installed!
   </pre>

   TROUBLESHOOTING:
   If you get stuck on “verifying…” during the installation process of Java
   on Mac El Capitan, it’s probably because of "rootless".
   See http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x/


   ## Jenv for several Java versions

0. The point of jenv is to add additional versions, such as back version JDK 7:

   <pre><strong>
   jenv add /Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
   </strong></pre>

   The response:

   <pre>
   oracle64-1.7.0.65 added
   </pre>


0. Add JDK 8:

   <pre><strong>
   jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home
   </strong></pre>

   http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-macosx-x64.dmg

   The response:

   <pre>
   oracle64-1.8.0.45 added
   </pre>


0. List the libraries jenv knows about:

   <pre><strong>
   jenv versions
   </strong></pre>

0. Highlight, copy and paste the version you want to use.

0. To configure global version:

   <pre><strong>
   jenv global oracle64-1.8.0.45
   </strong></pre>

   The response:

   <pre>
   system
   oracle64-1.7.0.65
   * oracle64-1.8.0.45 (set by /Users/wilsonmar/.jenv/version)
   </pre>


<a name="OpenJDK"></a>

### Open JDK #

Open JDK is the open-sourced implementation of the
JRE spec, at
<a target="_blank" href="http://openjdk.java.net/">http://openjdk.java.net</a>
is at JVM 7.

  * https://en.wikipedia.org/wiki/List_of_Java_virtual_machines

But it is still not ready for "prime time" on Mac as installation is a dirty affair.

   * https://wiki.openjdk.java.net/display/MacOSXPort/Mac+OS+X+Port+Project+Status

Open JDK's
<a target="_blank" href="http://openjdk.java.net/install/">
install page at http://openjdk.java.net/install/</a>
shows apt-get (for Debian, Ubuntu) and
yum (for Red Hat, CentOS, Oracle Linus, Fedora).

   * http://blog.shelan.org/2015/03/how-to-build-open-jdk-9-on-mac-osx.html
     on Yosemite

   * http://hanxue-it.blogspot.com/2014/05/installing-java-8-managing-multiple.html

<a target="_blank" href="http://gvsmirnov.ru/blog/tech/2014/02/07/building-openjdk-8-on-osx-maverick.html#tldr">
For OSX, this page recommends using Make to compile from source</a>.

0. Download source using Mercurial to a new folder "openjdk9":

   <tt><strong>
   hg clone http://hg.openjdk.java.net/jdk9/jdk9 openjdk9
   cd ./openjdk9
   </strong></tt>

   Note JDK 9 is under active development.

   http://hg.openjdk.java.net/jdk8/jdk8 work stopped at 2014-03-04.

0. Install <a target="_blank" href="https://www.xquartz.org/"> XQuartz</a> for X Window System that runs on OSX:

   <tt><strong>
   brew install Caskroom/cask/xquartz<br />
   brew cask list
   </strong></tt>

   NOTE: Downloaded /Library/Caches/Homebrew/xquartz-2.7.9.dmg was 7.9K

   xquartz staged at '/opt/homebrew-cask/Caskroom/xquartz/2.7.9' (73M)

0. cd to the .tar.gz directory containing the configure file for Make to use.
0. XQuartz fixes an error in this command:

   bash ./configure

0. Install apple-gcc42 the Apple C compiler.

   <a target="_blank" href="https://mihail.stoynov.com/2015/01/29/building-openjdk-9-on-a-osx-or-any-linux/">
   Mihail recommends</a>:

0. Install ccache compiler cache.

   <tt><strong>
   brew install ccache
   </strong></tt>

0. Make a symlink /usr/bin/gcc -> /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/gcc-4.2 (same for g++)

0. If you're at Mavericks Apply patches: 1, 2, 3, 4.

0. if you're at Mavericks Comment out NS_AVAILABLE(10_9, NA) in line 16 of /System/Library/Frameworks/Foundation.framework/Headers/NSUserNotification.h

9. Build:

   <tt><strong>
   make all<br />
   make install
   </strong></tt>

   Built image should be available at build/macosx-x86_64-normal-server-release/jdk/


<a name="TestBuild"></a>

## Test JDK Build #

https://mihail.stoynov.com/2015/01/29/building-openjdk-9-on-a-osx-or-any-linux/
   shows JDK 9 install using ccache, mercurial (hg), jtreg "testing harness", and Webrev to diff code

## Update Java

https://java.com/en/download/help/mac_java_update.xml

NOTE: Others include cheatsheet, google-chrome, google-drive, google-hangouts, dropbox, etc.
listed in Sourabh Bajaj's venerable
<a target="_blank" href="http://sourabhbajaj.com/mac-setup/Homebrew/Cask.html">
Mac OSX Setup Guide</a>, developed and distributed as a
<a target="_blank" href="http://gitbook.com/">GitBook</a>.

## Kotlin

Kotlin is a language that makes use of the JVM.


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
