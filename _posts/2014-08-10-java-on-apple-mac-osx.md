---
layout: post
title: "Java on Mac OSX"
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


<a name="WhichJava"></a>

## Which Java You Got?

On a Terminal open to any folder:

0. To see what JRE you have already installed:

   <pre><strong>
   java -version
   </strong></pre>

   A sample response:

   <pre>
   Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)
   </pre>

0. To see what JDK (Java Compiler) you have already installed:

   <pre><strong>
   javac -version
   </strong></pre>

   A sample response:

   <pre>
   javac 1.8.0_45
   </pre>


   if it's not installed, you will be prompted to install the JDK.
   Clever.

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

   In OSX, all known JVM's are located at

   /Library/Java/JavaVirtualMachines/.


<a name="AppleJavaC"></a>

### Apple Java

WARNING: Apple's version of <strong>Java 6</strong> for OS X 2014-001 can be obtained from
<a target="_blank" href="https://support.apple.com/kb/DL1572?locale=en_US">
https://support.apple.com/kb/DL1572?locale=en_US</a>
but note it's not the latest (Java 8).

<a name="OracleJavaC"></a>

### Oracle Java .dmg

Hold off downloading the java .dmg installer file from

   * https://www.java.com/en/
   * https://www.java.com/en/download/help/mac_install.xml
   * http://www.oracle.com/technetwork/java/javase/downloads/index.html

WARNING: Oracle installs an annoying Ask Toolbar, sometimes without asking.


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
   make all
   make install
   </strong></tt>

   Built image should be available at build/macosx-x86_64-normal-server-release/jdk/

<a name="TestBuild"></a>

## Test JDK Build #

https://mihail.stoynov.com/2015/01/29/building-openjdk-9-on-a-osx-or-any-linux/
   shows JDK 9 install using ccache, mercurial (hg), jtreg "testing harness", and Webrev to diff code




<a name="JenvInstall"></a>

### Multiple Versions of Java Using Jenv

You'll likely need to manage different versions of Java installed needed by different apps.

<a target="_blank" href="http://hanxue-it.blogspot.com/2014/05/installing-java-8-managing-multiple.html?q=java">
http://hanxue-it.blogspot.com/2014/05/installing-java-8-managing-multiple.html?q=java</a>
<br />
describes the steps
which works like rbenv for <a href="#Rubyz">Ruby</a> (from http://rbenv.org/).

So install Jenv from https://github.com/gcuisinier/jenv/blob/master/README.md


Since jenv (from http://www.jenv.be/)
is not in the core Homebrew formula collection yet:

<pre><strong>
brew install https://raw.githubusercontent.com/entrypass/jenv/homebrew/homebrew/jenv.rb
</strong></pre>

To activate jenv:

<pre><strong>
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
</strong></pre>

To see if jenv can run:

<pre><strong>
jenv
</strong></pre>

lists its version and commands.


To see what jenv recognizes:

<pre><strong>
jenv versions
</strong></pre>

The response if none if brew cask was not installed:

<tt>
* system (set by /Users/wilsonmar/.jenv/version)
</tt>


Install Java using brew cask:

<pre><strong>
sudo brew update && brew cask install java
</strong></pre>

The response:

<tt>
==> Downloading http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-ma
</tt>


NOTE: Others include cheatsheet, google-chrome, google-drive, google-hangouts, dropbox, etc.
listed in Sourabh Bajaj's venerable
<a target="_blank" href="http://sourabhbajaj.com/mac-setup/Homebrew/Cask.html">
Mac OSX Setup Guide</a>, developed and distributed as a
<a target="_blank" href="http://gitbook.com/">GitBook</a>.


To add JDK 7:

<pre><strong>
jenv add /Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
</strong></pre>

The response:

<tt>
oracle64-1.7.0.65 added
</tt>


To add JDK 8:

<pre><strong>
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
</strong></pre>

The response:

<tt>
oracle64-1.8.0.45 added
</tt>


List the libraries jenv knows about:

<pre><strong>
jenv versions
</strong></pre>

Highlight, copy and paste the version you want to use.

To configure global version:

<pre><strong>
jenv global oracle64-1.8.0.45
</strong></pre>

The response:

<tt>
system<br />
oracle64-1.7.0.65<br />
* oracle64-1.8.0.45 (set by /Users/wilsonmar/.jenv/version)
</tt>


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
