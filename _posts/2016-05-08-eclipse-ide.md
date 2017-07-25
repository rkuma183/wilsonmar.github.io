---
layout: post
title: "Eclipse IDE"
excerpt: "Open source and free since the 90's."
shorturl: "https://goo.gl/Pi9qAE"
tags: [ML, GE]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This article contains note on my personal experience installing and using Eclipse IDE.

Eclipse was originally funded by IBM as open source.

The editions of Eclipse IDE:

   * The "Standard" edition for working with Java is free
   * The edition working with Web (HTML) is licensed (costs money)
   * <a href="#STS">STS</a> edition


<a name="HomebrewInstall"></a>

## Homebrew install #

The simplest way to install the <strong>standard</strong> edition of Eclipse
is to use [Homebrew](/macos-homebrew/) to 
<a target="_blank" href="http://macappstore.org/eclipse-java/">eclipse-java</a>:

0. First, update the Homebrew installation bits shared:

   <pre><strong>brew update
   </strong></pre>

   This usually takes a while.

0. Use cask to install GUI programs:

   <pre><strong>brew cask install eclipse-java
   </strong></pre>

   The response (as of 24 July 2017):

   <pre>
==> Satisfying dependencies
==> Downloading https://www.eclipse.org/downloads/download.php?file=/technology/
######################################################################## 100.0%
==> Verifying checksum for Cask eclipse-java
==> Installing Cask eclipse-java
==> Moving App 'Eclipse.app' to '/Applications/Eclipse Java.app'.
🍺  eclipse-java was successfully installed!
   </pre>

   Remember the name of the app is "Eclipse Java".

0. The nice thing about using Homebrew is uninstallation is easy:

   <pre><strong>brew cask uninstall eclipse-java
   </strong></pre>

   ### Invoke

0. On a Mac, click the "rocket ship" icon at the bar at bottom of the screen or
   in a Finder click Go > Applications.

0. Type the portion of "Eclipse Java" until the icon appears.


<a name="STS"></a>

## STS install #

https://www.predix.io/resources/tutorials/journey.html#1607

0. Use an interest browser to the STS website.
0. Select a download site to begin download. Wait for the file to download.
0. Unzip
0. In Finder, navigate inside the folder, such as:

   ~/Documents/workspace-sts-3.8.0.RELEASE

   This contains the server.

0. Move and/or rename the folder according to your organization's standards.

0. In Finder navigate to /Applications.
0. Move (drag and drop) STS.app to /Applications.
0. Open STS by double-clicking the icon.
0. Click Open icon for first-time confirmation.
0. Specify your workspace.



<a name="FirstTime"></a>

## First Time Preferences #

When you invoke Eclipse for the first time, you see a "Welcome" screen.

0. At the lower-right of the screen, uncheck "Always show Welcome at start up".

0. Click "Review IDE configuration settings" to "Review the IDE's most fiercely contested preferences".

   * Show line numbers in editor: yes.
   * Check spelling
   * Execute jobs in background
   * Encode text files with UTF-8
   * Enable preference recorder

0. Check "Always exit without prompt" (your call).

0. Click "Open an existing file".

   <a name="ExistingProject"></a>

   ### Existing Project #

0. Click Finish.


<a name="NewProject"></a>

## New Project #

0. Right-click on the blank part under "Project Explorer" to select "New" and "Other".

0. In the New Select a Wizard dialog, select "Java Project", then "Next".

0. Type your Project Name.

0. It's best to leave the default JRE version because additional downloads are necessary
   if you want to change it.

0. Click Finish.

0. Check "Remember" then click "Yes" to associate the project with a perspective.

   Notice several JRE System Libraries were added automatically.
   .jar files are Java classes. 
   .dll files are Windows classes.

   Notice the "src" folder is created to hold source code.

0. Right-click the app name to select Package (test suite).

0. Name it "Basics".

0. Right-click on "Basics".

0. Type the Name for Java Class, such as "helloworld".



<a name="Perspectives"></a>

## Perspectives #

Perspectives define the size and location of different views on the workspace window.

0. Right-click on the <strong>Perspectives</strong> icon at the upper-right corner
   and select "Show Text".

0. Click the icon to the right of the Perspective icon to open a list of perspectives.
0. Click Cancel

Views



<a name="Plugins"></a>

## Plug-ins #

* Checkstyle

* EclEmma - Java Code Coverage for Eclipse

* Spelling checking

* Formatter


<a name="Tutorials"></a>

## Video Tutorials #

There are a lot on YouTube:

   * <a target="_blank" href="https://www.youtube.com/watch?v=BJAKDaaWfh0&t=20s">
   Introduction to Eclipse: Driving Java Productivity</a> from 2012
   by Marakana

Pluralsight.com has a two-part series from 2013 by Tod Gentille (@Tod Gentille) of syncorsystems.com:

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/eclipse-guided-tour-part1/table-of-contents"> Part 1</a>
   * <a target="_blank" href="https://app.pluralsight.com/library/courses/eclipse-guided-tour-part2/table-of-contents"> Part 2</a>

## Shortcuts

To go back to previous edit location: Control+Q

* <a target="_blank" href="https://www.youtube.com/watch?v=C5glFtpuy0U">
   Keyboard shortcuts</a> for constructors.

   <a target="_blank" href="http://goo.gl/OI9DU">Cheatsheet at http://goo.gl/OI9DU</a>

https://www.youtube.com/watch?v=ZUM9jEhLie0

https://www.youtube.com/watch?v=E3hKgb4aLHM

https://www.youtube.com/watch?v=X8Xw7FWw49E

