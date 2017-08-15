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

The editions of Eclipse IDE:

   * The "Standard" edition for working with Java is free
   * The edition working with Web (HTML) is licensed (costs money)
   * <a href="#STS">STS</a> edition


<a name="HomebrewInstall"></a>

## Standard Edition Homebrew install #

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

   In a Standard Eclipse, you can add STS in 

0. Help > Eclipse Marketplace and Find: Spring.
0. Click Install.
0. In Confirm Selected Features, check all (for AOP, AERI, Roo, etc.) explained later.

   ### Uninstall Homebrew

0. The nice thing about using Homebrew is uninstallation is easy:

   <pre><strong>brew cask uninstall eclipse-java
   </strong></pre>


<strong>Alternately:</strong>


<a name="STS"></a>

## STS install on Macs #

There is no Homebrew module for the Spring Tools Suite (STS) for Mac.

0. Use a modern internet browser to the STS download page at<br />
   <a target="_blank" href="https://spring.io/tools/sts/all">
   https://spring.io/tools/sts/all</a>
0. Click on "Based on Eclipse 4.7.0", then "tar.gz".

   spring-tool-suite-3.9.0.RELEASE-e4.7.0-macosx-cocoa-x86_64.tar is 412.5 MB.

0. In Finder, select the Download folder to receive the file, then click "Save".
0. While you're waiting, switch to exit the download web page.
0. Double click on the file to unzip it to a new folder.

   CAUTION: If you see a number to the right of the "sts-bundle" folder name,
   another installer was downloaded previously.

0. In Finder, navigate inside the "sts-bundle" folder.
0. Open a new Finder new window and click the Go menu for the
   <strong>/Applications</strong> folder.
0. If there is another STS app there, move it to Trash.

0. Long-Click on the <strong>STS</strong> app file, then drag and drop it 
   onto the Applications window.
0. Open STS by double-clicking the icon. It may take a minute to load the first time.
0. Press command+tab until your land on the green Spring app icon for the Eclipse Launcher.
0. Check "Use this as the default and do not ask again".
0. PROTIP: The default directory generated should be changed per your organization's standards.

   /Users/mac/Documents/workspace-sts-3.9.0.RELEASE

   PROTIP: This folder path is where you should do git clone. The one I use is<br />
   `/Users/mac/gits/spring`. Others define a "dev" folder<br />
   `/Users/mac/dev/workspace`


   This can be changed to something else later (in Files, Switch Workspace).

   The folder path is created when you click "Launch".

0. For the menu, click on the white space in the <strong>Dashboard</strong> with Package Explorer.

   See <a target="_blank" href="https://www.predix.io/resources/tutorials/journey.html#1607">
   https://www.predix.io/resources/tutorials/journey.html#1607</a>

<a target="_blank" href="https://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse">
Included with STS</a> (Spring Tools Suite)
is the developer edition of Pivotal <strong>tc</strong> Server, 
the drop-in replacement for Apache Tomcat 
that’s optimized for Spring.

The Spring Insight console, tc Server Developer Edition, 
provides a graphical real-time view of application performance metrics that lets developers identify and diagnose problems from their desktops.



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



<a name="SeleniumLib"></a>

## Selenium Libraries#

### Download

1. Go to
   <a target="_blank" href="http://docs.seleniumhq.org/download/">
   http://docs.seleniumhq.org/download</a>

0. Under the "Selenium Standalone Server" section heading, click the link
   next to "Download version":<br />

   Download version <a target="_blank" href="https://goo.gl/mFtw7n">3.5.0</a>

0. Click Save of file named with the same version number, such as:<br />
   <strong>selenium-server-standalone-3.5.0.jar</strong><br />
   to the Downloads folder.

0. On Windows only, under "The Internet Explorer Driver Server" section heading, 
   click the link 
   <a target="_blank" href="https://goo.gl/GwYYmg">64-bit Windows IE</a>

0. Click Save of file named with the same version number, such as:<br />
   <strong>IEDriverServer_x64_3.5.0.zip</strong><br />
   to the Downloads folder.


0. Under the "Selenium Client & WebDriver Language Bindings" section heading, click the link
   click the <a target="_blank" href="http://selenium-release.storage.googleapis.com/3.5/selenium-java-3.5.0.zip">Download</a>
   link associated with the programming language you use, such as Java.

0. Click Save of file named with the same version number, such as:<br />
   <strong>selenium-java-3.5.0.zip</strong><br />
   to the Downloads folder.


0. Under the "Safari" section heading, click the link<br />
   Latest release <a target="_blank" href="http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz">2.48.0</a>

0. Click Save of file named <br />
   <strong>SafariDriver.safariextz</strong><br />
   to the Downloads folder.


   ### New Lib folder

0. Within Eclipse, right-click on your project name to select New, Folder.
0. Type in name "lib" (for library). Finish.

   ### Server into lib folder

0. Press command+tab to switch to the File Explorer window.
0. Drag from within the Downloads folder file <br />
   selenium-server-standalone-3.5.0.jar<br />
   and drop it within the lib folder when the mouse turns into a "+" sign.
0. Click OK to the pop-up dialog for Copy files.

   ### Selenium Java into lib folder

0. Press command+tab to switch to the File Explorer window.
0. Within the Downloads folder, unzip by double-clicking on file <br />
   selenium-java-3.5.0.zip. 

   <a target="_blank" href="https://www.youtube.com/watch?v=wlZVSud2vdg">
   On a Mac</a>, this should result in the creation of folder<br />
   <strong>selenium-java-3.5.0</strong>. But 
   <a target="_blank" href="http://osxdaily.com/2013/02/13/open-zip-cpgz-file/">"
   if you see a .cpgz file, move it to trash and use another utility such as RAR.

0. Dive into the folders to drag <br />
   <strong>selenium-java-3.5.0.jar</strong><br />
   to the lib folder.

0. Click OK to the pop-up dialog for Copy files.


   ### Chrome driver

0. Navigate to<br />
   <a target="_blank" href="http://chromedriver.storage.googleapis.com/index.html">
   http://chromedriver.storage.googleapis.com/index.html</a>

0. Scroll down to click the LATEST_RELEASE so it downloads.
0. Open the file to see the version number (2.31 at time of writing).
0. Scroll down to that largest version number and click on it.
0. Click the file for your operating system, such as<br />
   chromedriver_mac64.zip.
0. Unzip it to file <strong>chromedriver</strong> Unix executable.
0. Copy the chromdriver file to <strong>/usr/local/bin</strong> folder.
0. Restart your system and try your Selenium WebDriver code as 
   shown in video.


   ### Firefox driver



   ### Mac Safari driver

   See https://www.youtube.com/watch?v=9IoP45r5Ap4&t=11s
   by EvilTester



   ### Junit into lib folder

0. Navigate to<br />
   <a target="_blank" href="http://sourceforge.net/projects/junit/files/junit/">
   http://sourceforge.net/projects/junit/files/junit</a>
0. Click the text to the right of "Looking for the latest version?",
   such as <strong>Download junit-4.10.jar (253.2 kB)</strong>.
   
   This downloads file <strong>junit-4.10.jar</strong> (from 2011).

0. Drag from within the Downloads folder file <br />
   junit-4.10.jar<br />
   and drop it within the lib folder when the mouse turns into a "+" sign.


   ### New Class

0. Right-click on "src" 



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

   * <a target="_blank" href="https://www.youtube.com/watch?v=zylSll8hsPs">
   Selenium WebDriver Eclipse Java Project Setup: For the absolute beginner</a>
   on Java 1.6 [13:58]

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

