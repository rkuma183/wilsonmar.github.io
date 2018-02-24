---
layout: post
title: "Eclipse IDE (STS and for Selenium)"
excerpt: "Open source and free since the 90's."
shorturl: "https://goo.gl/Pi9qAE"
tags: [ML, GE]
image:
# feature: banner-eclipse-1900x500-321k.png
  feature: https://user-images.githubusercontent.com/300046/28752993-0d1437a4-74fa-11e7-99cc-ed04f625174c.png
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This article contains note on my personal experience installing and using Eclipse IDE.

Eclipse was originally funded by IBM as open source.

Chose an edition of Eclipse IDE:

   a. The edition working with Web (HTML) is licensed (costs money)
   b. <a href="HomebrewInstall">The "Standard" edition</a> for working with Java is free<br />
   c. <a href="#STS">STS</a> (Spring Tools Suite) edition<br />

<hr />

<a name="HomebrewInstall"></a>

## b. Standard Edition Homebrew install #

The simplest way to install the <strong>standard</strong> edition of Eclipse
is to use [Homebrew](/macos-homebrew/) to 
<a target="_blank" href="http://macappstore.org/eclipse-java/">eclipse-java</a>:

0. First, update the Homebrew installation bits shared:

   <pre><strong>brew update
   </strong></pre>

   This can take a while.

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

   ### Invoke

0. On a Mac, in a Finder click Go > Applications or
   click the "rocket ship" icon if you have that at the bar at bottom of the screen.

0. Type the portion of "Eclipse Java" until the icon appears.

   ### Add STS

   Optionally, you can add STS to a Standard Eclipse install:

0. Help > Eclipse Marketplace and Find: Spring.
0. Click Install.
0. In Confirm Selected Features, check all (for AOP, AERI, Roo, etc.) explained later.

   ### Uninstall Homebrew

0. The nice thing about using Homebrew is uninstallation is easy:

   <pre><strong>brew cask uninstall eclipse-java
   </strong></pre>


<strong>Alternately:</strong>


<a name="STS"></a>

## c. STS install from spring.io #

There is no Homebrew module for the Spring Tools Suite (STS) for Mac.

0. Use a modern internet browser to the STS download page at<br />
   <a target="_blank" href="https://spring.io/tools/sts/all">
   https://spring.io/tools/sts/all</a>

   Alternately, download the installer from:<br />
   <a target="_blank" href="
   https://www.eclipse.org/downloads/">
   https://www.eclipse.org/downloads</a>

0. Click on the web page "Based on Eclipse 4.7.0" under "Mac", then "dmg 397MB".

0. Click "Save File" in the pop-up if it appears.

0. In the Finder's Downloads folder,
   CAUTION: If you see a number to the right of the "sts-bundle" folder name,
   another installer was downloaded previously.
   If there is another STS app there, move it to Trash.

0. Expand the installer file just downloaded by clicking it :

   <tt>spring-tool-suite-3.9.2.RELEASE-e4.7.2-macosx-cocoa-x86_64.dmg</tt>

0. Drag the green "STS" icon (for the Spring brand) and drop it on the Applications folder
   (this is a type of manual security requirement Apple imposes to copy into the Applications folder.
0. Close the dialog by clicking the top left-most (red) button.

0. Switch to Finder and click the eject icon for the STS installer under the Devices section.

0. Click Applications if it's among Favorites or if it's not, the Go menu for the
   <strong>/Applications</strong> folder.

   ### First time config.

0. If you will be using it a lot, drag and drop the STS icon to Apple's bar.
0. Open STS by double-clicking the icon. It may take a minute to load the first time.

0.  When you invoke Eclipse for the first time, you may see a "Welcome" screen.
   If so, at the lower-right of the screen, uncheck "Always show Welcome at start up".

0. If you get an "Are you sure you want to open it?", click Open for the Launcher pop-up:

   <!-- eclipse-sts-launcher-new.png -->

   ### Workspace config.

   By default, the folder is something like:

   <tt>/Users/wilsonm/Documents/workspace-sts-3.9.2.RELEASE</tt>


0. PROTIP: Change the <strong>Workspace</strong> to a directory per your personal or your organization's standards
   which is under Git source version control.

   PROTIP: I like to create under my persoal home directory a folder named "gits" for various projects. 
   Others may prefer "projects" or "dev".

   Under that I create a folder for the account name in GitHub which in my case is "wilsonmar".
   If the repository is from someone else, I create a folder (such as "baedlund").

   Under that I let my git client create repository folders cloned from my GitHub account.

   PROTIP: STS will create folders that don't yet exist.

0. Click "Use this as the default and do not ask again", then the blue Launch button for 
the Eclipse Dashboard in the middle pane.

0. In the Eclipse Spring Tools Suite menu bar, select File, Switch Workspace, and Other... 
   to change the Workspace folder.


   ## Tutorials

0. Take the time to click "GUIDES" to visit https://spring.io/guides such as

   https://spring.io/guides/gs/accessing-twitter

   <a target="_blank" href="https://www.youtube.com/watch?time_continue=70&v=6mtI4vmsQ08">
   VIDEO:</a> Spring Tips: Spring Tool Suite" by Josh Long is dated Dec 21, 2016 is based 3.8.2.


0. For the menu, right-click on the white space in the <strong>Dashboard</strong> with Package Explorer.


<a name="FirstTime"></a>

## First Time Preferences #

0. Click "Review IDE configuration settings" to "Review the IDE's most fiercely contested preferences".

   * Show line numbers in editor: yes.
   * Check spelling
   * Execute jobs in background
   * Encode text files with UTF-8
   * Enable preference recorder
   <br /><br />

0. Check "Always exit without prompt" (your call).

0. Click "Open an existing file".


   <a name="ExistingProject"></a>

   ### Compile from Eclipse #

0. Click Finish.

0. To compile and run your program, keep the "Main" app Java file tab active and 

   * use Run option available in the Eclipse IDE or 
   * press <strong>Ctrl + F11</strong> to compile and run your MainApp application. 
   <br /><br />

   If everything is fine with your application, this will print the following message in Eclipse IDE's console.


<hr />

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


<a name="ImportProject"></a>

## Import Project #

1. Open your existing workspace in Eclipse.
2. In the Eclipse (Spring Tools Suite) menu, choose File -> Import.
3. Expand the General folder by clicking the icon in front of it.
4. Select "Existing Projects into Workspace"
5. Xlick Next for the Import Projects dialog.
6. Click Browse... to the location containing the files.


<a name="Perspectives"></a>

## Perspectives #

Perspectives define the size and location of different views on the workspace window.

0. Right-click on the <strong>Perspectives</strong> icon at the upper-right corner
   and select "Show Text".

0. Click the icon to the right of the Perspective icon to open a list of perspectives.
0. Click Cancel

## Views



<a name="Plugins"></a>

## Plug-ins #

* Checkstyle

* EclEmma - Java Code Coverage for Eclipse

* Spelling checking

* Formatter


<a name="Tutorials"></a>

## Video Tutorials #

https://www.udemy.com/spring-framework-4-course-and-core-spring-certification/learn/v4/t/lecture/3106412?start=0
video course uses STS 3.6.4 under Java JDK 8u45.

There are a lot on YouTube:

   * <a target="_blank" href="https://www.youtube.com/watch?v=BJAKDaaWfh0&t=20s">
   Introduction to Eclipse: Driving Java Productivity</a> from 2012
   by Marakana

Pluralsight.com has a two-part series on Eclipse
from 2013 by Tod Gentille (@Tod Gentille) of syncorsystems.com:

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

