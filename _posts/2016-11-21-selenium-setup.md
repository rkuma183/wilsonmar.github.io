---
layout: post
title: "Selenium Setup on a Mac"
excerpt: "Run browsers automatically for videos (and testing)"
tags: [Mac, Security]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

Although Selenium was created for functional testing,
I'm using it to repeatedly run through web pages with the timing I want as I record screencast videos.

## Install dependencies 

Follow my other tutorials to install:

1. [Java](/java-on-apple-mac-osx/)
2. [Maven](/maven-on-macos/)
4. Firefox browser
5. Chrome with ChromeDriver
6. <a href="#Flex">Flash Flex</a>

<hr />

## Download from GitHub and Run

0. Change to a folder where you can get a sample repo on your local hard drive.

   This sample doesn't control an internet browser:

   <pre><strong>
   cd ~/gits
   git clone --depth=1 https://github.com/eviltester/startUsingJavaJUnit
   cd startUsingJavaJUnit
   </strong></pre>

   `--depth=1` specifies no history, since we don't want to update it, just use the latest version.
   Thus we save some disk space.

   <pre>
Cloning into 'startUsingJavaJUnit'...
remote: Counting objects: 14, done.
remote: Compressing objects: 100% (8/8), done.
remote: Total 14 (delta 0), reused 10 (delta 0), pack-reused 0
Unpacking objects: 100% (14/14), done.
   </pre>

0. Verify if Maven can run:

   <tt><strong>
   mvn test
   </strong></tt>

   If all goes well, you'll get a lot of outputs ending with something like:

   <pre>
Running com.javafortesters.junit.MyFirstTest
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.039 sec
&nbsp;
Results :
&nbsp;
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
&nbsp;
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 4.010 s
[INFO] Finished at: 2016-11-21T11:01:56-07:00
[INFO] Final Memory: 16M/215M
[INFO] ------------------------------------------------------------------------
   </pre>

## Selenium frameworks

0. Import into the IDE from (not https):<br />
   <a target="_blank" href="http://www.seleniumhq.org/download/">
   http://www.seleniumhq.org/download/</a> 

0. Scroll to <strong>Selenium Standalone Server</strong> to click the 3.x version link.

   File selenium-server-standalone-3.0.1.jar was 21.1 MB. 

0. Verify that version is in pom.xml.


## Firefox

0. Download and install Firefox from Mozilla.

0. See the version by clicking Help > Firefox Health Report.
   Alternately, click Firefox > About.

   The Version should be 50.0 or above.

0. If you're using Selenium 3.0 (which you should),
   skip the download and install the Gecko driver which Selenium uses.

   https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver


## IDE

0. At 

   https://www.jetbrains.com/idea/#chooseYourEdition

0. Scroll down to click "DOWNLOAD" of the .DMG installer for the Community Edition.

   File ideaIC-2016.2.5.dmg was 313 MB, which is version 2016.2.

0. In Finder at the Downloads folder, click the .dmg file.

0. Drag the resulting file into your Applications folder.
0. Dismiss the pop-up.
0. In Finder, move the .dmg file to trash to save disk space.
0. In Finder Devices section at the left, eject the IntelliJ IDEA CE installer. 
0. In Finder Applications, scroll to IntelliJ IDEA CE and open it.
0. Import if you have a previous version installed.

   ### New project in IntelliJ

0. Create New Project. 
0. Click New... to the right of Project SDK (Software Development Kit).
0. Select JDK and press OK to confirm use of:

   /Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home

0. Click Next with "Create project from template" unchecked.
0. Overtype untitled with a Project name such as "<strong>Selenium-3.0.1</strong>".

   PROTIP: Instead of spaces in project names, use dashes or underlines for compound words. 

0. Change the <strong>Project location</strong> to fit your standards. Click Finish.

   ### VCS

0. If you see message "Unregistered VCS root detected", click the little arrow and select Configure.
0. Switch temporarily to a Terminal to isssue `which git`. Copy the response, such as:

   `/usr/local/bin/git`

0. Expand Version Control. Click Git. In the "Path to Git executable", paste the path. Click Test.
0. Click OK to the "Git executed successfully" pop-up.
0. Click OK to dismiss the VCS dialog.

   ### src Selenium class 

0. Alt-click on <strong>src</strong>, New, Java Class. For Name, use N.N.N.N such as: 

   com.jetbloom.Selenium.TestCase01.java

   TODO: Define your naming convention in java programs.

0. Click OK for a file that makes use of the class name just defined:

   <pre>
package com.jetbloom.Selenium;
&nbsp;
/**
 * Created by mac on 11/21/16.
 */
public class TestCase01 {
}
   </pre>

0. Replace the file contents with a sample Selenium Java program:

   <pre>
package com.jetbloom.Selenium;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
&nbsp;
public class TestCase01 {
    public static void main(String[] args){
        WebDriver driver=new FirefoxDriver();
        driver.get("http://learn-automation.com");
        driver.quit();
    }
}
   </pre>

   ### Maven pom.xml

0. Alt-click on the module name (in this example, "Selenium-3.0.1") and
   select "Add framework support...".
0. Check "Maven" then OK.
   This creates a pom.xml for you to modify.
0. At the lower-right corner, if there is a message "Maven projects need to be imported",
   click "Enable Auto-omport".

0. Change the "groupID" to "com.jetbloom.Selenium".
0. Copy and paste this before the /project> tag:

   ```xml
    <dependencies>
        <dependency>
            <groupId>org.seleniumhq.selenium</groupId>
            <artifactId>selenium-java</artifactId>
            <version>2.32.0</version>
        </dependency>

        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
        </dependency>

    </dependencies>
   ```

0. Click Run from the menu or press keys.
0. Select TestCase01.


0. In the JRE section, select Use an execution enviornment JRE of "JavaSE-1.8". Click Next.
0. In Java Settings, click Libraries tab, Add External JARs. 
   Select the Selenium jar file. Click Open. Click Finish.
0. In the Package Explorer, select your project,    
   expand Reference Libraries to see the Selenium jar.

   ### Project
   

## Speed measures

sitespeed.io
to measure web performance using Selenium
as described at
https://www.youtube.com/watch?v=cLlZhnZvi1M
by Peter Hedenskog  
of Wikipedia.


<a name="Flex"></a>

## Flash and Flex

https://sourceforge.net/adobe/flexsdk/wiki/Download%20Flex%203/
Since 2011, Flex is being developed at the Apache Software Foundation

   * https://www.wikiwand.com/en/Apache_Flex
   * http://flex.apache.org/


0. Add file <strong>sfapi.swc</strong> into the 'libs' folder of your Flex application from

0. Add to Flexbuilder/Eclipse Additional compiler arguments: 
   Right click on the project and go to project properties.
   Click on "Flex compiler" to bring up the compiler options.

   For Windows:

   <pre>-include-libraries "..\libs\sfapi.swc"</pre>

   For Mac or Linux:

   <pre>-include-libraries "../libs/sfapi.swc"</pre>


http://www.adobe.com/devnet/flash/articles/flash_selenium.html

https://github.com/ashudestiny/flash-selenium
(from https://code.google.com/archive/p/flash-selenium/)
flash-selenium 
 aims to extend the Selenium RC clients for adding Flash communication capabilities.

   https://code.google.com/archive/p/flash-selenium/downloads


https://github.com/Kuhtich/flex-ui-selenium
(from https://code.google.com/archive/p/flex-ui-selenium/)
FlexUISelenium is an extension to the Selenium RC client driver that enables the Selenium RC client drivers to interact (and test) the Flex UI components and methods of the Flex application.

http://stackoverflow.com/questions/21457004/how-to-automate-a-flex-application-in-selenium-webdriver

GraniteDS

http://code.google.com/p/fluint/


### Sample app

0. Get "sfapi.swc" is from the Selenium-Flex-API project for Selenium IDE:

   http://code.google.com/p/sfapi/

0. Download

   https://github.com/hugs/flex-compareSum

0. Construct the command to build the code:

   cd src

   ~/Apps/flex_sdk_3.4/bin/mxmlc compareSum.mxml -include-libraries "sfapi.swc"

0. To display index.html in the current folder, launch a simple webserver built into Python:

   python -m http.server 8000

   (it was previously named SimpleHTTPServer. See http://www.pythonforbeginners.com/modules-in-python/how-to-use-simplehttpserver/)

0. Launch a web browser and open http://localhost:8000/


### Alternatives

https://github.com/admc/flex-pilot-x
by adam.christian@gmail.com (https://medium.com/@admc)

https://github.com/jagdeepjain/selenium-flex-demo
(from https://code.google.com/archive/p/sfapi/)

https://github.com/tanzilli/playground/blob/master/python/httpserver/example1.py
http://www.acmesystems.it/python_httpd
Write a simple HTTP server in Python

https://code.google.com/archive/p/fluint/


## Resources

http://www.guru99.com/selenium-tutorial.html

https://www.youtube.com/watch?annotation_id=annotation_779954917&feature=iv&src_vid=nq97dfaVmC4&v=ff5ZsthcSZw
How to Install Java, Maven and IntelliJ on Apple Mac 

https://www.youtube.com/watch?annotation_id=annotation_4023503799&feature=iv&src_vid=9IoP45r5Ap4&v=nq97dfaVmC4

https://www.youtube.com/watch?v=rJ4rNZGAzW8
How to start firefox Browser in Selenium webdriver 3 with Gecko Driver 
by Mukesh Otwani

http://james-willett.com/2015/05/a-gentle-newbie-friendly-guide-to-installing-selenium-webdriver-part-2-get-intellij/
