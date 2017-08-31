---
layout: post
title: "Selenium-cs (C# or C Sharp; using Visual Studio)"
excerpt: "Enable C# Microsoft developers to use Selenium test infrastructures on Alt-macOS"
tags: [apple, mac, setup, VMWare, Fusion]
filename: "selenium-cs.md"
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

Here is a hands-on tutorial to learn Selenium using the C# language edited in Visual Studio on MacOS. This an "immersion" approach as if you just got hired and are looking at a fully developed set of code to modify.

The pre-requisite to this is the "start from scrach" approach of courses such as the <a target="_blank" href="https://www.udemy.com/selenium-with-c/learn/v4/t/lecture/6745806?start=0">one on Udemy</a> from
<a target="_blank" href="http://courses.ultimateqa.com/">UltimateQA</a> filmed  2015 by Nikolay Advolodkin (<a target="_blank" href="https://twitter.com/Nikolay_A00">@Nikolay_A00</a>, <a target="_blank" href="https://www.facebook.com/Ultimateqa1">Facebook</a>) and Dr. Tiffany Ford (rhysma@live.com) who teaches C#.
<a target="_blank" href="https://www.proprofs.com/quiz-school/">
quizzes</a>.


## Why this?

Microsoft's VSTS (Visual Studio Team Services) costs several thousand dollars
while Selenium is free (open source).

Run several Selenium instances in parallel on publicly available swarm facilities
such as SauceLabs, 
BrowserStack, 
<a target="_blank" href="https://www.rainforestqa.com/product/web-app-testing/">Rainforest.qa</a>,
https://crossbrowsertesting.com,
 and Selenium Grid in-house.

Include the Neotys API so that when Selenium is run, 
NeoLoad automatically updates "user paths" (scripts) for load testing.


## Install Visual Studio IDE on Mac

0. Use https://aka.ms/vsmac to 
   https://www.visualstudio.com/vs/visual-studio-mac/
   VisualStudioInstaller.dmg (25.3 MB)

   This is analogous to downloading Visual Studio for Windows at
   https://www.visualstudio.com/downloads
  
0. In Downloads folder, invoke the installer.
0. Uncheck the Android, iOS, macOS platforms, for 774 MB download, which takes a long time.

   While you wait, look at the documentation at 
   https://docs.microsoft.com/en-us/visualstudio/mac/

   This IDE replaced Xamarin Studio as a full-featured IDE on Mac.
   But its <a target="_blank" href="https://developer.xamarin.com/">Developer Center"</a> still references Xamarin.

   I kept getting an System.AggregateException", "Xamarin.iOS 10.12.0.20 needs to be installed".

   So I had to download
   VisualStudioForMac-7.1.0.1297.dmg (290 MB).
   and then drag and drop the Visual Studio for Mac icon to the Applications folder.


## Get Sample Selenium Code

0. Fork the excellent sample code at:

   <a target="_blank" href="https://github.com/ontytoom/Onty.SeleniumTest.Webmail/">
   https://github.com/ontytoom/Onty.SeleniumTest.Webmail</a>

0. Assuming you have Git client installed, download the repo from your account.
   For example:

   git clone <a target="_blank" href="https://github.com/ontytoom/Onty.SeleniumTest.Webmail/">
   https://github.com/wilsonmar-jetbloom/Onty.SeleniumTest.Webmail.git</a>

0. Delete the <strong>.vs</strong> folder so that the solution is not opened using them.

   <a target="_blank" href="https://stackoverflow.com/questions/72298/should-i-add-the-visual-studio-suo-and-user-files-to-source-control">
   NOTE</a>: From the root is a <strong>.vs</strong> folder which leads to a binary file <strong>.suo</strong>. This file contains user preference configurations specific to each machine. So although it is recreated automatically by Visual Studio, recreation resets metadata such as whether the project is loaded/unloaded at any given time. 
   So its name should be specified in .gitignore and not pushed to GitHub.

   ### Install app.config Developer Pack

0. Open a text editor and navigate into folder "Onty.SeleniumTest.Webmail".

0. Open file <strong>app.config</strong> to see:

   <pre>&LT;supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.6.2"/>
   </pre>

0. Click "Download" at <a target="_blank" href="https://www.microsoft.com/en-us/download/details.aspx?id=53321">this page</a>

   <strong>NDP462-DevPack-KB3151934-ENU.exe</strong>

   <a target="_blank" href="https://blogs.msdn.microsoft.com/dotnet/2016/08/02/announcing-net-framework-4-6-2/">Microsoft .NET 4.62 Developer Pack</a>

   <a target="_blank" href="https://www.microsoft.com/net/targeting/">
   https://www.microsoft.com/net/targeting</a>

   http://getdotnet.azurewebsites.net/target-dotnet-platforms.html


   ### Install WebDrivers for Mac

   Also in app.config:

   <pre>
	&LT;setting name="PathFirefox" serializeAs="String">
    	&LT;value>C:\Program Files\Mozilla Firefox\firefox.exe&LT;/value>
	&LT;/setting>
	&LT;setting name="WebDriverType" serializeAs="String">
	&LT;value>phantomjs&LT;/value>
   </pre>

   See <a target="_blank" href="https://github.com/ontytoom/Onty.SeleniumTest.Webmail/blob/master/README.md">README</a>


   ### Other properties in app.config

   <a target="_blank" href="https://automatetheplanet.com/hybrid-test-framework-config-files/">
   NOTE</a>: Having strings such as `PageLoadDelay` in this file makes the solution more flexible than hard-coding into C# code.
   Additional variables include:

   * PageLoadTimeout = 60,
   * ScriptTimeout = 60,
   * ElementsWaitTimeout = 60
   <br /><br />

0. Navigate into file <strong>....csproj</strong>

   The <strong>.....csproj.user</strong> ??? 

## In Visual Studio

  <a target="_blank" href="http://www.c-sharpcorner.com/UploadFile/093731/introduction-to-selenium-webdriver-with-C-Sharp-in-visual-studio/">
  NOTE</a>

0. Double-click on the <strong>.sln</strong> solution file to open it within Visual Studio.

   <a target="_blank" href="https://en.wikipedia.org/wiki/Microsoft_Visual_Studio">PROTIP</a>: Inside the .sln file, the "Visual Studio 14" is marketed as "Visual Studio 2015".


   ### Restore NuGet Package Dependencies

0. To download component dependencies in appropriate locations, in the Solution Explorer tool window, right-click the solution ("Onty.SeleniumTest.Webmail" root entry) and click <strong>Restore NuGet Packages</strong> 

   ![selenium-cs-restore nuget packages-320x194](https://user-images.githubusercontent.com/300046/29924820-7e1549ae-8e1b-11e7-9598-0de02abcf24d.jpg)

   This is similar to running Maven to process its pom.xml file.   
   But Visual Studio uses the <strong>packages.config</strong>:

0. Navigate into folder `Onty.SeleniumTest.Webmail` to view that file:

   <pre>
  &LT;package id="Chromium.ChromeDriver" version="2.27" targetFramework="net46" />
  &LT;package id="NUnit" version="3.6.0" targetFramework="net46" />
  &LT;package id="NUnit3TestAdapter" version="3.7.0" targetFramework="net46" />
  &LT;package id="Selenium.Support" version="3.0.1" targetFramework="net46" />
  &LT;package id="Selenium.WebDriver" version="3.0.1" targetFramework="net46" />
  &LT;package id="Selenium.WebDriver.PhantomJS" version="1.0.0.0" targetFramework="net46" />
  &LT;package id="WebDriver.GeckoDriver" version="0.13.0" targetFramework="net46" />
  &LT;package id="WebDriverIEDriver" version="2.45.0.0" targetFramework="net46" />
   </pre>

   The id of these packages specify what is downloaded from Microsoft's NuGet repository.


   ### Notes, Tests

0. Open `Docs/notes.txt` to add txt about the effort.

   PROTIP: Add new text at the top. 
   Begin each entry with a date such as "2017-09-23".


   ### Properties

0. Navigate into the Properties folder.
0. File AssemblyInfo.cs says 

   `"This package contains a set of automated functional tests (via Selenium) for a Simple Webmail System."`

   File Settings.Designer.cs
   is generated.

0. File Settings.settings
   defines the app running in the Heroku cloud:

   <a target="_blank" href="http://onty-webmail-ruby.herokuapp.com">
   http://onty-webmail-ruby.herokuapp.com</a>

   (But you can set up the webmain app in your own server.)

   ### App Domain objects

0. Navigate up and into the Domain folder that defines objects in the app's domain.

0. File User.cs
0. File Message.cs
0. File Folder.cs



   ### Tests

0. Navigate into the Tests folder.

   BLAH: Name tests using action verbs such as: ???

   * Landing
   * AddAccount
   * Login
   * LogInOut
   * OpenMail
   <br /><br />

0. View file `ATest.cs`

   NOTE: Each .cs (C#) file within this folder specifies the folder name in its <strong>namespace</strong>:

   `namespace Onty.SeleniumTest.Webmail.Tests`

   `[TestFixture]` is a compiler annotation.

   `WebDriverFactory.GetWebDriver();`

   To see where this is defined:

   ### Utils

0. Navigate up and into Utils folder. 

   Files here define utility functions:

0. Open `WebDriverFactory.cs`


0. Open others:

   * Rnd.cs for random functions
   * ScreenShotUtil.cs
   * StringUtil.cs
   * TestData.cs


## App PageObjects

   Test code reference objects defined in PageObjects.

   The Common\APage.cs file defines the base class/

   The CommonPageElements.cs file overrides APage:

   <pre>public class CommonPageElements : APage
   </pre>

   Other PageObjects reference CommonPageElements:

   <pre>public class AccountsHomePage : CommonPageElements
   </pre>


   ### Build, Run, Troubleshoot

0. Build the solution.
0. Open Test Explorer tool window in Visual Studio, 
0. Click Run All.

   Alternately, you can click on a single [TestMethod]
   and right-click to select Run Tests or hold down command/ctrl+R,T.

   If it doesn't run, we have a debugging session.

   See <a target="_blank" href="http://www.ultimateqa.com/common-selenium-webdriver-errors-fix/">debugging tips</a>


## C# Coding Tricks

Verbatim string using "@" instead of using double slash escape string:

   <pre>string filename=@"C:\MyFolder\whatever.txt";
   </pre>


## C# Coding Standards

For consistent look
so readers can understand the code quickly and
facilitate copying, changing, and maintaining the code.

* Naming conventions - Pascal casing capitalizes first word.
* Layout conventions
* Commenting conventions to facilitate code scanners.


## Yeoman code generator

I looked into this as the example which can be generated by a code generator.

https://docs.microsoft.com/en-us/aspnet/core/client-side/yeoman

Yeoman is a project scaffolding system for creating many kinds of applications. The Yeoman generator for ASP.NET Core contains a variety of project templates for starting a new web, MVC, or console application.

   <tt><strong>npm install -g yo bower</strong></tt>

Alternatively,
https://leaptest.com/pages/selenium-testing

https://www.codeproject.com/Articles/1074039/Generate-Csharp-Client-API-for-ASP-NET-Web-API


## Learning Resources 

http://courses.ultimateqa.com/courses/synchronization-techniques
Selenium Webdriver Synchronization Techniques Course</a>

http://courses.ultimateqa.com/courses/parallel-testing-tutorial
Introduction to Sauce Labs and Browser Stack</a>
free tutorial
