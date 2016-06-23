---
layout: post
title: "Maven on MacOS (OSX)"
excerpt: "for Java"
tags: [homebrew, apple, mac, setup]
image:
# feature: pic brown homebrew logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622020/60672448-0584-11e6-8202-41c36ba82d04.jpg
  credit: Kickstarter
  creditlink: https://www.kickstarter.com/projects/homebrew/brew-test-bot
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<a id="MavenSetupz"></a>

## Install latest #

0. To install the latest version:

   <pre><strong>
   brew update
   brew install maven
   </strong></pre>

   the response:

   <pre>
   ==> Downloading https://www.apache.org/dyn/closer.cgi?path=maven/maven-3/3.3.9/b
   ==> Best Mirror http://apache.mirrors.pair.com/maven/maven-3/3.3.9/binaries/apac
   ######################################################################## 100.0%
   🍺  /usr/local/Cellar/maven/3.3.9: 94 files, 9.6M, built in 31 seconds
   </pre>

0. Copy the version number (3.3.9) to your Clipboard.

   Alternately:

## Install previous version #

   Alternately, to
   <a target="_blank" href="http://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula">
   install a previous version</a>:

   <pre><strong>
   brew install homebrew/versions/maven30
   </strong></pre>

   Then, to switch among versions:

   <pre><strong>
   brew unlink maven30 && brew link maven
   brew unlink maven && brew link maven30
   </strong></pre>


## Configure Path #

0. Verify install:

   <pre><strong>
   mvn -version
   </strong></pre>

   I got this response:

   <pre>
   Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T09:41:47-07:00)
   Maven home: /usr/local/Cellar/maven/3.3.9/libexec
   Java version: 1.8.0_74, vendor: Oracle Corporation
   Java home: /Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home/jre
   Default locale: en_US, platform encoding: US-ASCII
   OS name: "mac os x", version: "10.11.5", arch: "x86_64", family: "mac"
   </pre>


0. Confirm the path:

   <pre><strong>
   which mvn
   </strong></pre>

   response:

   <pre>
   /usr/local/bin/mvn
   </pre>

   NOTE: Before OSX Mavericks,
   <a target="_blank" href="http://maven.apache.org/">
   Maven</a> was installed by default in:
   <tt>/usr/share/maven/bin/mvn</tt>

0. Confirm the path. Substitute the version (3.3.9) with the version
   you just installed:

   <pre><strong>
   cd /usr/local/Cellar/maven/3.3.9/libexec
   cd bin
   ls
   </strong></pre>

   mvn files should be listed.

0. Open a text editor:

   <pre><strong>
   cd $HOME
   subl .bash_profile
   </strong></pre>

   Substitute subl for Sublime with atom or vim.

0. Add the following to under export PATH=:

   <pre><strong>
   export M2_HOME=/usr/local/Cellar/maven/3.3.9/libexec
   export M2=$M2_HOME/bin
   export PATH=$PATH:$M2_HOME/bin
   </strong></pre>

   Change the version (3.3.9) to whatever appeared above.

0. In a Terminal, verify changes:

   <pre><strong>
   echo $JAVA_HOME
   </strong></pre>

   The reply I got:

   <pre>
   /Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
   </pre>

   <pre><strong>
   echo $M2_HOME
   echo $M2
   echo $PATH
   </strong></pre>


<a name="Config"></a>

## Change Default Configurations #

0. Navigate to the hidden folder Maven installed
   to house packages installed (junit, commons-cli, commons-lang, etc).

   <tt><strong>
   cd ~/.m2/repository
   </tt></strong>

   Some prefer to change Maven's local repository to another location.

   See https://maven.apache.org/guides/mini/guide-configuring-maven.html

   There is a settings.xml file containing:

   <pre>
   &LT;localRepository>~//maven/repo/&LT;/localRepository>
   </pre>


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
