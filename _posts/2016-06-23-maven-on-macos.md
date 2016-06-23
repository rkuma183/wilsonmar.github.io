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

This tutorial helps you install Maven.

Maven's competitors include Ant and Gradle.

Unlike Ant, Maven also provides dependency management, standard project layout and project management.

Maven is written in Java, and grew up supporting Java builds
by creating from Java source and resources for deployment
deliverables like JAR file or WAR files.

So Maven is the default for the Jenkins continuous integration tool which
triggers a Maven build whenever developer commit code.

Read more: http://javarevisited.blogspot.com/2015/01/difference-between-maven-ant-jenkins-and-hudson.html#ixzz4CQKSY3oF

Maven adopts principle of "Convention over configuration", which means
less coding work.


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


## Using Maven #

Maven allows use of a central maven repository.

With Maven, after downloading a project, to build, run:

   <pre><strong>
   mvn install
   </strong></pre>

   Maven looks at <strong>pom.xml</strong> (Project Object Model)
   files that describes project dependencies.

   Maven enforces a standard naming convention for artifacts defined using
   groupId, artifactId, and version.

   Maven is said to also act as project management tool because
   it can generate reports etc.

   <strong>build.xml</strong>


### Maven lifecycle phases #

<a target="_blank" href="http://www.slideshare.net/boyw165/note-apache-maven-intro-36821953">
<img width="527" height="360" alt="fig maven-lifecycle-phases-527x360-6.png"
src="https://cloud.githubusercontent.com/assets/300046/16313507/bb3e9320-3936-11e6-9a3b-aa4d0afa6416.png">
</a>

Here are sub-commands for mvn:

<pre>
   | **validate** | - |
   | initialize | - |  
   | generate-sources | - |  
   | process-sources | - |  
   | generate-resources | - |  
   | process-resources | - |  
   | **compile** | - |  
   | process-classes | - |  
   | generate-test-sources | - |  
   | process-test-sources | - |  
   | generate-test-resources | - |  
   | process-test-resources | - |  
   | test-compile | - |  
   | process-test-classes | - |  
   | **test** | - |  
   | prepare-package | - |  
   | **package** | - |  
   | pre-integration-test | - |  
   | **integration-test** | - |  
   | post-integration-test | - |  
   | **verify** | - |  
   | **install** | - |  
   | **deploy** | - |  
   | pre-clean | - |  
   | clean | - |  
   | post-clean | - |  
   | pre-site | - |  
   | site | - |  
   | post-site | - |  
   | site-deploy | - |
</pre>

### Maven plug-in goals by lifecycle phase #

<a target="_blank" href="http://java.uzmanprogramci.com/maven-lifecycle/">
<img width="638" height="359" alt="fig maven-phase-plugin-goals"
src="https://cloud.githubusercontent.com/assets/300046/16313672/881e4a8e-3937-11e6-8af5-1c3b93b9caef.jpg">
</a>


### Maven plug-ins by lifecycle phase #

<a target="_blank" href="http://java.uzmanprogramci.com/maven-lifecycle/">
<img width="374" height="479" alt="fig maven lifecycle plugin-374x479-60"
src="https://cloud.githubusercontent.com/assets/300046/16313780/06fbabbc-3938-11e6-99fd-d3cb0acf5170.png">
</a>




## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
