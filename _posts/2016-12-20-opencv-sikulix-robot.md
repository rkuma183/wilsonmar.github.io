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


This is a deep dive from the innnards up:

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


## Websites 

<a target="_blank" href="http://sikulix.com">
http://sikulix.com</a> is the new web page.

(Ignore abandoned sites:<br />
http://sikulix.weebly.com/quickstart.html and <br />
https://sikulix.wordpress.com)

<a target="_blank" href="http://sikulix-2014.readthedocs.io/en/latest/">
http://sikulix-2014.readthedocs.io/en/latest/<br />
has the most detail, which are repeated several places:

Installer bits are obtained from Ubuntu <br />
<a target="_blank" href="https://launchpad.net/sikuli">
https://launchpad.net/sikuli</a>

<a target="_blank" href="https://github.com/wilsonmar/sikuli-scripts/">
https://github.com/wilsonmar/sikuli-scripts</a> 


## Social

<a target="_blank" href="https://gitter.im/RaiMan/SikuliX-2014">
Gitter channel at<br/>
https://gitter.im/RaiMan/SikuliX-2014</a>

<a target="_blank" href="https://answers.launchpad.net/sikuli">
https://answers.launchpad.net/sikuli</a>


## Versions

There are three versions:

* 1.1.0 final (available since 2015-10-07)

   I've had installation errors with this version on my Mac.

   There is an entry on 2015-10-07 in Maven Central:<br />
   <a target="_blank" href="http://search.maven.org/#search%7Cga%7C1%7Ccom.sikulix">
   http://search.maven.org/#search%7Cga%7C1%7Ccom.sikulix</a><br />
   but I haven't tried to install it.

* SikuliX-2014 (version 1.1.x) from<br />
   <a target="_blank" href="http://nightly.sikuli.de/">
   http://nightly.sikuli.de</a>

   This is the one that worked for me.

   Install instructions below.

* SikuliX2 in 2017 at<br />
   <a target="_blank" href="https://github.com/RaiMan/SikuliX2">
   https://github.com/RaiMan/SikuliX2</a>

Detailed docs are at<br />
<a target="_blank" href="http://sikulix-2014.readthedocs.io/en/latest/basicinfo.html#sikulix-system-specifics">
http://sikulix-2014.readthedocs.io/en/latest/basicinfo.html#sikulix-system-specifics</a




<a name="SikuliXInstall"></a> 

## Manual install

The steps to make it work:

0. Install JRE
0. Install Python
0. Install Robot Framework (which uses Python)
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

   PROTIP: We are forced to use nightly builds.

0. Delete the installer folder.


<a name="Install-1.1.1"></a>

### Install-1.1.1 Dev build

0. Create a version-specific installer folder:

   On a Mac:

   <pre>
   cd ~
   mkdir sikulix-1.1.1-install
   cd ~/sikulix-1.1.1-install
   </pre>

0. Download from http://nightly.sikuli.de/ righ-click and select <strong>Save link As ...</strong>
   the link that says:

   sikulixsetup....jar

   At the time of writing, the URL is:

   https://oss.sonatype.org/content/groups/public/com/sikulix/sikulixsetup/1.1.1-SNAPSHOT/sikulixsetup-1.1.1-20170316.001623-90-forsetup.jar

0. Run the file:

   java -jar sikulixsetup-1.1.0.jar

0. Check boxes as described above and install.
   The result:

   ![sikulix-hello-working-269x156](https://cloud.githubusercontent.com/assets/300046/24073389/6c5a55ae-0bcd-11e7-8c16-133bb056477a.png)

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



   <a name="SikulixIDE"></a>

0. Open the SikuliX IDE app from the Applications folder.

   ![sikulix starting popup 198x154](https://cloud.githubusercontent.com/assets/300046/24074982/a021e3cc-0be9-11e7-84cc-c0d2b8a95bc7.png)

   then...

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24073600/0a0f4230-0bd0-11e7-88b5-50c23c0d3d9f.png">
   <img width="300" alt="sikulix-1 1 1-ide-landing-1022x699" src="https://cloud.githubusercontent.com/assets/300046/24073600/0a0f4230-0bd0-11e7-88b5-50c23c0d3d9f.png"><br />
   <br />(Click to open in full new screen)</a>


<a name="SikuliXScripting"></a>

## SikuliX Scripting


0. Create a Git folder to hold scripts. In real life, you should create a folder containing the
   name of the app under test.

   On a Mac:

   <pre>
   cd ~
   cd gits
   cd wilsonmar
   mkdir sikulix-scripts
   cd ~/sikulix-scripts
   </pre>

   Into this folder the SikuliX IDE saves scripts with the file extension ".sikuli".

0. Press # to insert a comment

0. Press Ctrl+S to save the file as a ".sikuli" file.

   PROTIP: A keyboard press is quicker than moving the mouse.


   <a name="TakePicture"></a>

   ### Take a picture

0. Create a small picture where you want Sikuli to click or type.

   This can be done by clicking the "Take screenshot" icon, positioning the mouse to the top-left corner,
   drag to the lower-right corner, then release the mouse.

   Or press a hot-key (Command + Shift + 2). 

   QUESTION: If a dialog disappears with mouse motions, 
   press the keystroke to take a picture of the screen,
   then use a photo editing program to cut out an area,
   and paste the little picture into the IDE.

   <a name="SikuliXActions"></a>

   ### SikuliX Actions and Methods

0. <a target="_blank" href="http://doc.sikuli.org/globals.html#App">Open an app</a>:

   <pre>
PathFirefox = r"C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
App.open(PathFirefox)
   </pre>

   PROTIP: Instead of the hassle of using double slashes to specify special characters,
   put an 4 in front of calls to take the backslash and quotes as part of the word/sentence.

0. Define variables:

   <pre>
   imageExpected1=3;
   </pre>

0. Define action:

   <pre>
   click(SearchImageButton)
   wait(imageExpected1)
   type("hello")
   </pre>

0. Type the verification actions.

0. Save a sample script with comments after \# character:

   http://doc.sikuli.org/tutorials/helloworld/helloworld-mac.html

   http://doc.sikuli.org/tutorials/helloworld/helloworld-win.html

0. Run the file.

   ### More actions

<a target="_blank" href="http://doc.sikuli.org/genindex.html">
http://doc.sikuli.org/genindex.html</a> is an alphabetical index of all methods and command options.

JavaDocs of classes are at<br />
http://nightly.sikuli.de/docs/index.html





<a name="SikuliXCommands"></a>

## SikuliX Commands

SikuliX can be called from a Terminal/Run command line by batch scripts.

SikuliX recognize both one-character flags and longer options 

   sikulix --args -i

   -t or --test <em>sikuli-file</em>

   -r or --run <em>sikuli-file</em>

   -s or --stderr


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

0. Install using Homebrew

   <pre><strong>brew install tesseract</strong></pre>



## Selenium


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
