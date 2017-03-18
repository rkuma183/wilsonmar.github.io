---
layout: post
title: "OpenCV, Tesseract, SikuliX - one-click install on MacOS"
excerpt: "A robot sees what's on your screen and clicks on it"
tags: [Clouds, IoT]
shorturl: "https://git.io/v1CKg"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

<img width="192" alt="opencv-sikulix-v01-192x133.png" src="https://cloud.githubusercontent.com/assets/300046/24071304/2de19d0a-0ba5-11e7-9cdc-c7903b2b3bcf.png" align="right">


Going from the innnards up:

<a target="_blank" href="https://www.wikiwand.com/en/OpenCV">
OpenCV (Open Computer Vision)</a> is a utility used by many Artificial Intelligence packages
such as self-driving cars to understand images.
It is used to take pictures, recognize objects in the pictures, and the coordinates of objects
it recognizes in pictures.

SikuliX uses OpenCV to find the location of a picture provided to OpenCV.
SikuliX uses the location returned from OpenCV to mouse click on the screen,
or type as if a user is using a physical keyboard.

SikuliX does that and <a href="#SikuliXMethods">other methods</a> 
based on a script in its own IDE or in response to an API called by
a JavaScript scripting engine managed by Java, as organized by Selenium.
Alternately, calls from Python code organized within the Robot Framework.

Optionally, <a href="#Tesseract">Tesseract</a> provides OCR (Optical Character Recognition)
to extract text from pictures.

All this to make you more "productive" at playing games. ;)

The benefit of repeating some action repeatedly (and not get bored or distracted) extends to:

   * Videographers making screencast videos in multiple takes
   * Salespeople use it to power their live demos.
   * Developers and testers going through a sequence of actions to reach a particular point in the UI needing debugging.

Here's how it works:
A picture is taken of your screen(s).
and the text and location of objects recognized in the picture is fed
to your program to click or type.
Your program then takes another round of picture taking
and visual object recognition to ensure the results are what are intended.

This uses a different, more generalized, approach than packages such as HP UFT which depended on
finding identifiers in the DOM (Document Object Model) behind each internet browser web page.


## Websites and versions

I'm completely confused about the versions of Sikulix because of multiple websites and difficult-to-find links.
I figured this out by reading every freaking word (several times) and following links buried in sentences leading deep within pages.

http://sikulix-2014.readthedocs.io/en/latest/<br />
has the most detail, which are repeated several places:

http://sikulix.com/ is the new web page formerly at<br />
http://sikulix.weebly.com/quickstart.html

https://sikulix.wordpress.com/<br />
with last entry on 2015-10-07 points to Maven Central entry of that time<br />
http://search.maven.org/#search%7Cga%7C1%7Ccom.sikulix

The bits are obtained from Ubuntu <br />
https://launchpad.net/sikuli

* 1.1.0 final (available 2015-10-07)

* SikuliX-2014 (version 1.1.x) from<br />
   http://nightly.sikuli.de/

* SikuliX2 in 2017 at
   https://github.com/RaiMan/SikuliX2

https://gitter.im/RaiMan/SikuliX-2014?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

http://sikulix-2014.readthedocs.io/en/latest/basicinfo.html#sikulix-system-specifics

https://answers.launchpad.net/sikuli

<a target="_blank" href="https://gitter.im/RaiMan/SikuliX-2014">
Gitter channel</a>.


<a name="SikuliXInstall"></a> 

## Install on Mac

This contains notes toward a 
one-click command that installs all the pre-requisites and
ends up showing reports for a sample set of scripts
against a sample app.

   <pre><strong>
sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/pattern-recognition/master/mac-bootstrap.sh)"
   </strong></pre>

WARNING: This is under construction - there are repetitive homebrew updates that should be removed
(thanks to Shawn Wilson noticing)

This is similar to <a target="_blank" href="https://github.com/wilsonmar/Basic-Selenium-Java">Selenium Setup</a>.

These use files designated as "off-line setup" in web pages.


### Manual install

The steps to make it work:

0. Install JRE
0. Install Ruby compiler
0. Install Robot Framework (which uses Ruby)
0. Install the IDE you want to use (IntelliJ)
0. <a href="#SikuliXinstall">Download SikuliX</a> 
0. Create a Git folder to hold your scripts.

Instructions below are based on run on Mac 10.12 (Sierra)
referencing http://sikulix.com/quickstart/


<a name="Install-1.1.0"></a>

### Install-1.1.0

0. If this is your first time:<br />
   create a folder to hold the SikuliX installer:

   On a Mac:

   <pre>
   cd ~
   mkdir sikulix-1.1.0-install
   cd ~/sikulix-1.1.0-install
   </pre>

   (Capitalization is distracting)

   Otherwise, begin anew by removing the folder loaded by the installer:

   <pre><strong>
   cd ~/Library
   cd "Application Support"
   rm -rf /Sikulix 
   cd ..
   </strong><pre>

   The installer creates <a href="#FoldersCreated">folders</a> 
   to contain the <strong>Sikulix.app</strong>
   for use on Macs.

   On Windows: in the folder Sikulix in the folder pointed to by the environment variable %APPDATA%

   On Linux: in ~/.Sikulix

0. As noted in <a target="_blank" href="https://launchpad.net/sikuli/sikulix/1.1.0">this page</a>,
   download the last stable version at <a target="_blank" href="https://launchpad.net/sikuli/+download">https://launchpad.net/sikuli/sikulix/1.1.0/+download/sikulixsetup-1.1.0.jar</a>

   sikulixsetup-1.1.0.jar is dated 2015-10-06, 3 MB

   NOTE: Code is at <a target="_blank" href="https://github.com/RaiMan/SikuliX-2014">
   https://github.com/RaiMan/SikuliX-2014</a>

   The next generation is active on<br />
   https://github.com/RaiMan/SikuliX2

0. Click the "md5" for the MD5 hash (a33616bac6d4f44785b89a02b110a0f8) to verify download integrity.

0. Move the file to your skilux folder.

0. Expand the installer:

   <pre><strong>
   java -jar sikulixsetup-1.1.0.jar
   </strong></pre>

   This creates file:<br />
   SikuliX-1.1.1-SetupLog. (which reflects what goes to the Terminal)
   and an empty <strong>SetupStuff</strong> folder.

0. Open the txt file and refresh it to see progress.

0. Click checkboxes for Jython and for Tesseract
   in the UI pop-up, then 
   <strong>Setup Now</strong>.

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24067208/edab8cc8-0b4f-11e7-9e3a-7e885ba69612.png">
   <img width="650" alt="sikulix 1 1 mac setup1 1974x1028.png" src="https://cloud.githubusercontent.com/assets/300046/24067208/edab8cc8-0b4f-11e7-9e3a-7e885ba69612.png"><br />(Click to open in full new screen)</a>

0. Click Setup Now for:

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24067322/47f0e9b6-0b51-11e7-9ab2-6f460f1d771e.png">
   <img width="488" alt="sikulix-1-1-setup2 976x816" src="https://cloud.githubusercontent.com/assets/300046/24067322/47f0e9b6-0b51-11e7-9ab2-6f460f1d771e.png"><br />(Click to open in full new screen)</a>

0. Click <strong>Yes</strong> for:

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24067348/a847fdae-0b51-11e7-80b3-c53a12041db5.png">
   <img width="650" alt="sikulix-1 1-setup3 1424x294" src="https://cloud.githubusercontent.com/assets/300046/24067348/a847fdae-0b51-11e7-80b3-c53a12041db5.png"><br />(Click to open in full new screen)</a>

0. Click <strong>No</strong> to pop-ups about 
   Mac native libs (jar's) previously installed into
   /Users/___/Library/Application Support/Sikulix/SikulixDownload_201610061722/...

0. Click Yes to download a stand-alone version of Python
   (No to get Jython 2.5 due to 2.7 UTF-8 warning):

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24067373/0acbcf64-0b52-11e7-9140-4b775cd39883.png">
   <img width="428" alt="sikulix-1 1 jython 856x368" src="https://cloud.githubusercontent.com/assets/300046/24067373/0acbcf64-0b52-11e7-9140-4b775cd39883.png"><br />(Click to open in full new screen)</a>

0. BLAH: This error in the console stopped me from going further

   <pre>
[debug (12/20/16 8:05:24 AM)] RunSetup: downloaded: tessdata-eng
Exception in thread "main" java.lang.NullPointerException
  at org.sikuli.setup.RunSetup.main(RunSetup.java:845)
   <pre>

<hr />


<a name="Install-1.1.1"></a>

### Install-1.1.1 Dev build

0. Download from http://nightly.sikuli.de/ righ-click and select <strong>Save link As ...</strong>
   the link that says:

   sikulixsetup....jar

   At the time of writing, the URL is:

   https://oss.sonatype.org/content/groups/public/com/sikulix/sikulixsetup/1.1.1-SNAPSHOT/sikulixsetup-1.1.1-20170316.001623-90-forsetup.jar

0. Check boxes as described above.

   The result:

   ![sikulix-hello-working-269x156](https://cloud.githubusercontent.com/assets/300046/24073389/6c5a55ae-0bcd-11e7-8c16-133bb056477a.png)

0. Run the file:

   java -jar sikulixsetup-1.1.0.jar

0. Click "OK" to the "Hallo" pop-up.

   Note different files are downloaded for Windows vs. Mac:

   * sikulixjython.jar
   * sikulixlibsmac.jar
   * sikulix.jar 
   * sikulixapi.jar
   <br /><br />

0. In Finder, move sikulix.app
   to your user's Applications folder.

0. Still in Finder, Move to Trash the installer file
   sikulixsetup-1.1.0.jar


<a name="FoldersCreated"></a> 

## After Install

QUESTION: How to verify a good install and use the program?

only in case of problems it might be necessary to visit this folder:

- Extensions folder
- Lib folder contains the supporting stuff for Jython and JRuby
- SikulixDownloads
- SikulixDownloads_<em>versionstamp</em> contains 
- SikulixLibs_<em>versionstamp</em> contains native libraries 
- SikulixStore
- SikulixTesseract


   <a name="SikulixScripting"></a>

0. Create a Git folder to hold scripts.

   On a Mac:

   <pre>
   cd ~
   mkdir sikulix-scripts
   cd ~/sikulix-scripts
   </pre>

   Scripts have the file extension ".sikuli".


   <a name="SikulixIDE"></a>

0. Invoke the SikuliX IDE app in Applications folder.

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24073600/0a0f4230-0bd0-11e7-88b5-50c23c0d3d9f.png">
   <img width="300" alt="sikulix-1 1 1-ide-landing-1022x699" src="https://cloud.githubusercontent.com/assets/300046/24073600/0a0f4230-0bd0-11e7-88b5-50c23c0d3d9f.png"><br />
   <br />(Click to open in full new screen)</a>


   <a name="SikuliXActions"></a>

   ### SikuliX Actions and Methods

0. Type a sample script with comments after \# character:

   http://doc.sikuli.org/tutorials/helloworld/helloworld-mac.html

   http://doc.sikuli.org/tutorials/helloworld/helloworld-win.html

   <pre>
   openApp(<em>someApp</em>) # we use an application someApp
&nbsp;
   type("hello")
&nbsp;
   click(imageButton) # we click some button
   wait(imageExpected1) # we wait that the app reacts and shows the expected result on the screen
&nbsp;
   type(“some text”); type(Key.ENTER) # we fill in some text and press ENTER
   wait(imageExpected2) # again we wait for some expected reaction or result
   </pre>

0. Save the file as a ".sikuli" file.
0. Run the file.


JavaDocs of classes are at<br />
http://nightly.sikuli.de/docs/index.html


<a name="SikuliXCommands"></a>

## SikuliX Commands

Sikulix.app

~/Library/Application Support/Sikulix

SikulixAppData folder


<a name="Tesseract"></a>

## Tesseract

Originally from HP, @theRaySmith at Google <a target="_blank" href="https://github.com/tesseract-ocr/docs/blob/master/das_tutorial2016/1Intro-history.pdf">says in 2016 Tesseract includes LSTM</a>
(machine learning with convolutional and deep belief networks).

BTW, the word tesseract means a representaton of a 4-dimensional cube
(https://www.wikiwand.com/en/Tesseract). The word is used for the name of the library because
the library works with multiple directional 3D lines.

* https://github.com/gulakov/tesseract-ocr-sample
* http://blog.ayoungprogrammer.com/2012/11/tutorial-installing-tesseract-ocr-30202.html/



## Selenium


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
