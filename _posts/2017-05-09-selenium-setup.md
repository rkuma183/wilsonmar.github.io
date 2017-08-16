---
layout: post
title: "Selenium Setup"
excerpt: "How to get robots to Seleniumtastic your web apps"
shorturl: "https://goo.gl/"
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

This article contains notes on installing, coding, and running Selenium.

1. <a href="#MySamples">Obtain my samples</a>.
2. <a href="#Invocation">Invoke a run using starter samples</a>.
3. <a href="#CrossBrowser">Run across various browsers</a> - Firefox browser, IE, etc.
4. <a href="#Obtain">Obtain jars and drivers</a> if they have changed.
5. <a href="#CodeJava">Adapt the starter a basic starter</a> (Java in Selenium driving Chrome).

6. <a href="#ReadCSV">Add CSV data processing</a>
7. <a href="#Excel">Add Excel data processing</a>
8. Add OpenQA via SikuliX2
9. Add Tesseract

<hr />


<a name="MySamples"></a>

## Get My Samples

   <tt><strong>git clone https://github.com/wilsonmar/Selenium-samples
   </strong></tt>

   * Selenium3Hello1 is used to verify whether the Selenium core install works.
   It doesn't use any browser driver.

   * Selenium3FirefoxGoogleSearch1 

   * Selenium3GoogleSearch1 works on multiple browsers.
   <br /><br />

   NOTE: All "Selenium3" require Java 1.8+.

   PROTIP: A number is included with each component to provide for version control,
   since everything changes all the time in IT.
   

Look into the folder:

   NOTE: It is not best practice, but the sample scripts in my GitHub contains binary files
   copied from binary repositories.

   File `Sea.jpg` is required only by the sample program from Neotys.
   
   PROTIP: For team/production coding, place photos in a folder such as `pics`.

   The file is placed at the project's root folder to make it easy to specify its path.
   
   File `chromedriver.exe` and other browser driver files are at the root of each script folder.

   The more correct way is to specify the files (and their specific versions) 
   in a pom.xml file that point to the location of those
   external dependencies, and then have each user of the repository to
   run Maven to obtain those files.

   <a target="_blank" href="https://github.com/Ardesco/Selenium-Maven-Template/blob/master/pom.xml">
   https://github.com/Ardesco/Selenium-Maven-Template/blob/master/pom.xml</a>

   Nevertheless, the drivers are included so you can get going quickly.


<a name="Invocation"></a>

## Invoke sample command



### On Windows:

It is assumed that the Java program is within the PATH which the operating system looks for executables.

0. View the sample command file <strong>Selenium3Chrome1.bat</strong>

   <pre>
REM cd Selenium3Usahidi1NeoloadChrome1
REM Selenium3 must use Java 1.8+
javac         Selenium3Usahidi1NeoloadChrome1.java
java.exe -jar Selenium3Usahidi1NeoloadChrome1.jar ^
-Dnl.selenium.proxy.mode=Design ^
-Ddriver=chromedriver.exe ^
-Druntype=Landing ^
-Dimg=Sea.jpg
   </pre>

   PROTIP: Windows command prompt (cmd.exe) allows the umlaut ^ (Shift + 6) character 
   to indicate line continuation.

0. Open a Terminal window.
0. Run the sample Selenium Java program on a Windows machine:

   <tt><strong>Selenium3Usahidi1NeoloadChrome1.bat
   </strong></tt> 


### On Macs & Linux

0. View the sample command file <strong>Selenium3Chrome1.sh</strong>

   <pre>
# cd Selenium3Usahidi1NeoloadChrome1
# Selenium3 must use Java 1.8+
javac     Selenium3Usahidi1NeoloadChrome1.java
java -jar Selenium3Usahidi1NeoloadChrome1.jar \
-Dnl.selenium.proxy.mode=Design \
-Ddriver=chromedriver \
-Druntype=Landing \
-Dimg=Sea.jpg
   </pre>

   Notice there is no ".exe" in the driver.

   PROTIP: Bash shell scripts use the back-slash character (above the Enter/return key)
   to indicate line continuation.

0. Open a Terminal window.
0. Grant permissions:

   <tt><strong>chmod +X *.sh
   </strong></tt> 

0. Run the sample Selenium Java program:

   <tt><strong>Selenium3Usahidi1NeoloadChrome1.sh
   </strong></tt> 



## Coding

Drivers for browsers go into the Reference folder.

Implicit waits. Don't use them. Especially with explicit waits.


<a name="#CrossPlatform"></a>

### Cross platform

   Windows vs. Mac


<a name="#CrossBrowser"></a>

### Cross browser

   <a target="_blank" href="https://www.youtube.com/watch?v=hbxRgpMTif8">
   VIDEO</a>

   <pre>
    system.setProperty("webdriver.gecko.driver", "\\selenium-java-3.5.0")
   </pre>


<a name="ObtainFiles"></a>

## Obtain jars and drivers #

There are the ways to assemble what Selenium needs:

a). <a href="#MySamples">Copy a working Selenium project</a> (as shown above)
   that already has the files needed. Then edit it for your own uses.
   This is the quickest and simplest way.

b). Copy set of jars from an in-house binary respository (such as Nexus or Artifactory).

   <a target="_blank" href="https://selenium-release.storage.googleapis.com/index.html">
   https://selenium-release.storage.googleapis.com/index.html</a>

c). <a href="#MavenSelenium">MavenSelenium">Code in pom.xml and run Maven</a> 
   (or equivalent tool such as Ant).

d). <a name="ManualDownload">Manual download from websites</a>,
   which you'll need to do when a new version comes along. 

e). Build from source.


PROTIP: Download all the latest install files at one sitting to test compatibility of the set.
Assemble them together in a single folder for copying into each Selenium project folder
so each can stand alone when distributed.

<a target="_blank" href="http://www.softwaretestinghelp.com/how-to-use-different-browsers-drivers-for-your-selenium-script/">
This</a> explains the driver operation.


<hr />


<a name="MavenSelenium"></a>

## Maven

<a target="_blank" href="https://www.youtube.com/watch?v=9IoP45r5Ap4&t=21s">
How to Install Selenium WebDriver With Java And Maven On Mac OS X10 - a 13 Minute SpeedRun</a>

<a target="_blank" href="http://learn-automation.com/selenium-integration-with-jenkins/">
Maven</a>


<a name="ManualDownload"></a>

## Manual Download

If you're using a sample script, skip this.

PROTIP: Download files for all operating systems so the scripts begin as cross-system capable
(works on Windows, Mac, Linux).

1. Go to
   <a target="_blank" href="http://docs.seleniumhq.org/download/">
   http://docs.seleniumhq.org/download</a>

0. Under the "Selenium Standalone Server" section heading, click the link
   next to "Download version":<br />

   Download version <a target="_blank" href="https://goo.gl/mFtw7n">3.5.0</a>

0. Click Save of file named with the same version number, such as:<br />
   <strong>selenium-server-standalone-3.5.0.jar</strong><br />
   to the Downloads folder.


   #### Java bindings

0. Under the "Selenium Client & WebDriver Language Bindings" section heading, click the link
   click the <a target="_blank" href="http://selenium-release.storage.googleapis.com/3.5/selenium-java-3.5.0.zip">Download</a>
   link associated with the programming language you use, such as Java.

0. Click Save of file named with the same version number:<br />
   <strong>selenium-java-3.5.0.zip</strong><br />
   to the Downloads folder.


   #### Windows Internet Explorer driver

   <a target="_blank" href="https://www.youtube.com/watch?v=knMH7phD7Hs">
   VIDEO</a>

0. On Windows only, under "The Internet Explorer Driver Server" section heading, 
   click the link 
   <a target="_blank" href="https://goo.gl/GwYYmg">64-bit Windows IE</a>

0. Click Save of file named with the same version number, such as:<br />
   <strong>IEDriverServer_x64_3.5.0.zip</strong><br />
   to the Downloads folder.


   #### Mac Safari WebDriver

   This section is only applicable on an Apple Mac.

   <a target="_blank" href="https://www.youtube.com/watch?v=wKgDrjBM0pw">
   VIDEO</a>

   Under the "Safari" section heading in the
   <a target="_blank" href="https://github.com/SeleniumHQ/selenium/wiki/SafariDriver">
   Selenium webpage</a>, the 
   SafariDriver.safariextz file is <strong>deprecated</strong>.
   So no need to download it.

   Starting with Safari 10 that comes with OS X El Capitan and macOS Sierra,
   <a target="_blank" href="https://webkit.org/blog/6900/webdriver-support-in-safari-10/">
   in 2016</a>, WebKit running Java 1.8+ supports the new
   <a target="_blank" href="https://www.w3.org/TR/webdriver/">
   W3C WebDriver</a> browser automation API.
   So Selenium automatically launches the driver without further configuration.
 
   However, it needs to be enabled becuase it's off by default.

0. Open the Safari browser.
0. Press command+, (comma) or in the menu bar, select Safari | Preferences | Advanced tab (wheel icon).
0. Check "Show Develop menu in menu bar" to see "Develop" appear in the menu bar behind the dialog. Exit the dialog.
0. Click "Develop" on the menu bar and select "Allow Remote Automation".

   Authorize safaridriver to launch the webdriverd service which hosts the local web server. 

0. Open a Terminal window to run:

   <tt><strong>cd /usr/bin<br />
   ./safaridriver -p 5678
   </strong></tt>

   BLAH: The response asks for a port number.

   <pre>
Usage: safaridriver [options]
   -h, --help                Prints out this usage information.
   -p, --port                Port number the driver should use. If the server
                             is already running, the port cannot be changed.
                             If port 0 is specified, a default port will be used.
   </pre>

0. Complete the authentication prompt.

0. To verify, run the Selenium script:

   SeleniumSafariGoogleSearch1.java



## Eclipse IDE


   ### New Lib folder

0. Within Eclipse, right-click on your project name to select New, Folder.
0. Type in name "lib" (for library). Finish.

   #### Server into lib folder

0. Press command+tab to switch to the File Explorer window.
0. Drag from within the Downloads folder file <br />
   selenium-server-standalone-3.5.0.jar<br />
   and drop it within the lib folder when the mouse turns into a "+" sign.
0. Click OK to the pop-up dialog for Copy files.

   #### Selenium Java into lib folder

0. Press command+tab to switch to the File Explorer window.
0. Within the Downloads folder, unzip by double-clicking on file <br />
   selenium-java-3.5.0.zip. 

   <a target="_blank" href="https://www.youtube.com/watch?v=wlZVSud2vdg">
   On a Mac</a>, this should result in the creation of folder<br />
   <strong>selenium-java-3.5.0</strong>. But 
   <a target="_blank" href="http://osxdaily.com/2013/02/13/open-zip-cpgz-file/">"
   if you see a <strong>.cpgz</strong> file created, 
   move that to trash and use another utility such as the "RAR Extractor" utility 
   or unzip in a Terminal window.

0. Dive into the folders to drag <br />
   <strong>selenium-java-3.5.0.jar</strong><br />
   to the lib folder.

0. Click OK to the pop-up dialog for Copy files.


   ### Eclipse folder

0. In Eclipse, press command + I or 
   right-click on your project to select <strong>Properties</strong>.
0. At Resource, Location is the path of the project.
0. Click on the door icon and a Finder window opens up.

   ### new References folder for Browser drivers

   <a target="_blank" href="https://www.youtube.com/watch?v=zylSll8hsPs&t=6m45s">
   VIDEO</a>:

0. Double-click to expand selenium-java-3.5.0.zip. 
0. Drill down to the "selenium-3.5.0" folder.
0. Drill down to that jar.
0. Drag the <strong>client-combined-3.5.0-nodeps.jar</strong> into the lib folder. ???
0. Choose Copy Files. OK.
0. Drill down into the lib folder within the selenium-java-3.5.0 folder.
0. Select all the files.

   NOTE: Previous versions did not include JUnit and others.

0. Drag them all into the lib folder. 
0. Choose Copy Files. OK.


   ### Establish lib as References

   <a target="_blank" href="https://www.youtube.com/watch?v=zylSll8hsPs&t=7m11s">
   VIDEO</a>:

   To make Eclipse recognize the jar files:

0. Highlight the two files in the lib folder.

   Click first file. Hold Cntrl while clicking the second file.   

0. Right-click for <strong>Build Path</strong>. Add to Build Path.

   A <strong>Referenced Libraries</strong> item should appear under Package Explorer.


   ### Use Chrome driver

   <a target="_blank" href="https://www.youtube.com/watch?v=-stXyMIrsck&t=11s">
   VIDEO</a>:

0. Navigate to<br />
   <a target="_blank" href="http://chromedriver.storage.googleapis.com/index.html">
   http://chromedriver.storage.googleapis.com/index.html</a>

0. Scroll down to click the LATEST_RELEASE so it downloads.
0. Open the file to see the version number (2.31 at time of writing).
0. Scroll down to that largest version number and click on it.
0. Click the file for your operating system, such as<br />
   chromedriver_mac64.zip.
0. Unzip it to file <strong>chromedriver</strong> Unix executable.
0. Copy the chromedriver file to <strong>/usr/local/bin</strong> folder.
0. Restart your Chrome
0. Try your Selenium WebDriver code.
   

   ### Use Gecko Firefox driver

   <a target="_blank" href="https://www.youtube.com/watch?v=21dK8q3BOZU&t=1m27s">
   Video</a> 26 May 2016

0. Navigate to<br />
   <a target="_blank" href="https://github.com/mozilla/geckodriver/releases">
   https://github.com/mozilla/geckodriver/releases</a>

   The "Latest release" is shown at the top. Later releases are below.

   Mozilla also calls it the "Marionette Proxy".

0. Scroll down to the Downloads section and click on the file for your operating system.

   geckodriver-v0.18.0-macos.tar.gz for Mac (1.31 MB)

   geckodriver-v0.18.0-win64.zip for Windows

0. Unzip the macos file for the <strong>geckodriver</strong> executable.

0. Unzip the win64 file for the <strong>geckodriver.exe</strong> executable.

0. Copy the chromdriver file to <strong>/usr/local/bin</strong> folder. ???
0. Restart your system and try your Selenium WebDriver code as 
   shown in video.



   ### Headless drivers 

   Ghost Driver or PhantomJS turns Selenium "headless",
   accessing the DOM.

   HTML Unit from
   https://selenium-release.storage.googleapis.com/index.html
   selenium-html-runner-3.5.0.jar


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

0. In the Package Explorer, right-click on "src". Select New, Java Class.
0. For Package, type "com.demo.testcases".
0. For Name, type "SeleniumFirefoxDemo1".
0. Check "public static void main(Strong[] args)". Finish.

<hr />

## IntelliJ IDE

   <a target="_blank" href="https://www.youtube.com/watch?v=ff5ZsthcSZw">
   VIDEO: How to Install Java, Maven and IntelliJ on Apple Mac</a>


## Java Coding

   TODO: Annotations



   ## TODO: Random number


## Add-on functionality

   ### TestNG

   <a target="_blank" href="https://www.youtube.com/watch?v=OTtFSnZY4f8">
   VIDEO</a>,
   <a target="_blank" href="https://www.amazon.com/Selenium-WebDriver-TestNG-Practical-Tricks-ebook/dp/B0746F5XLV/ref=sr_1_2?ie=UTF8&qid=1502881762&sr=8-2&keywords=selenium+webdriver+books">
   BOOK</a>

   TestNG has more in-built annotations than JUnit,
   making testing easier.

   TestNG requires a download from http://testng.org/

   Its @DataProvider and parameters enables data-driven testing.

   JUnit does not generate a HTML reports. But TestNG generates an XSLT 
   <a target="_blank" href="http://learn-automation.com/generate-xslt-report-in-selenium/">
   report</a>.

   * https://www.youtube.com/watch?v=OTtFSnZY4f8


   <a name="Logging"></a>

   ### Logging

   <a target="_blank" href="https://www.youtube.com/watch?v=Xk9fzXCX61U">
   VIDEO</a> on emitting industry-standard logs.

   <a target="_blank" href="https://www.youtube.com/watch?v=zSjwgjVl4P4">
   VIDEO</a> on Advanced topics.

   ```
   import org.apache.log4j.Logger;
   public class LogDemo {
      public static void main(String[] args){
         Logger logger=Logger.getLogger("LogDemo");  // the class name
      }
   }
   ```

   * https://www.youtube.com/watch?v=0UQ9pAlY3qg


<a name="ReadCSV"></a>

### Read CSV files

   So your Selenium Java code can read CSV files:

   Specify the dependency in Maven, Ant, etc.
   or

0. Download from
   https://mvnrepository.com/artifact/net.sf.opencsv/opencsv/

   opencsv-2.3.jar

0. Add in your Java code:

   ```
     List<MyBean> beans = new CsvToBeanBuilder(FileReader("yourfile.csv"))
       .withType(Visitors.class).build().parse();
   ```

   
   <a name="Excel"></a>

   ### Read Excel files

   <a target="_blank" href="https://www.youtube.com/watch?v=sbBdj4zIMqY">
   VIDEO</a>,
   <a target="_blank" href="http://learn-automation.com/read-and-write-excel-files-in-selenium/">
   BLOG</a>

   To get your Selenium Java code can read Excel files: 

0. Download Apache POI - the Java library for Microsoft documents from<br />
   <a target="_blank" href="https://poi.apache.org/download.html">
   https://poi.apache.org/download.html</a><br />
   the binary distribution for the latest stable version, such as<br />
   poi-bin-3.16-20170419.tar.gz

0. Unzip using RAR so you don't extract 

0. Select the file under the HTTP heading.

<a name="RockStars"></a>

## Rock Stars

Simon Stewart (<a target="_blank" href="https://twitter.com/shs96c">@sha98c</a>,
   <a target="_blank" href="http://blog.rocketpoweredjetpants.com/">blog.rocketpoweredjetpants.com</a>)
   invented WebDriver, now Lead Committer

   * <a target="_blank" href="https://www.youtube.com/watch?v=gyfUpOysIF8">
   State of the Union</a> at SeleniumConf Austin 5 April 2017.
   says the original vision was:

   FIT Test > FIT Fixture > Page Objects > WebDriver

   "Definitely do not use FIT"

   "We test so that when we release software, we are confident it works, as early as possible."

<a target="_blank" href="https://www.Sauce Labs.com/">
Sauce Labs</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=cN25k5l1fTc">
   Automation Best Practices</a> 14 Jul 2016


<a name="Tutorials"></a>

## Video Tutorials #

http://learn-automation.com


   * <a target="_blank" href="https://www.youtube.com/watch?v=zylSll8hsPs">
   Selenium WebDriver Eclipse Java Project Setup: For the absolute beginner</a>
   on Windows with Java 1.6 [13:58]

https://www.youtube.com/watch?v=ZUM9jEhLie0

https://www.youtube.com/watch?v=E3hKgb4aLHM

https://www.youtube.com/watch?v=X8Xw7FWw49E

https://www.dropbox.com/s/inuirqwhlr3w7zf/slides.pdf?dl=0
Dave Hoeffer

https://www.youtube.com/watch?v=zylSll8hsPs

https://www.youtube.com/watch?v=nq97dfaVmC4

