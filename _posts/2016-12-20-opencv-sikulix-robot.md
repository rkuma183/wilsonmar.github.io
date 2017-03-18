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

OpenCV (Open Computer Vision) is a fundamental utility used by many Artificial Intelligence packages
such as self-driving cars to understand images.
It is used to take pictures, recognize objects in the pictures, and the coordinates of objects
it recognizes in pictures.

<a href="#Tesseract">Tesseract</a> provides OCR (Optical Character Recognition)
to extract text from pictures.

SikuliX provides a <a href="#SikuliXCommands">set of commands</a> to be called 
by Python, Ruby, or JavaScript invoked by the Java scripting enginge
Selenium and Robot to manipulate keyboards and mice based on what is seen by the above.

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

* SikuliX-2014 (version 1.1.x)

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

0. If this is your first time:<br />
   create a folder to hold Sikulix bits.

   <pre>
   cd ~
   mkdir sikulix
   cd ~/sikulix
   </pre>

   (Capitalization is distracting)

   Otherwise, begin anew by removing the folder loaded by the installer:

   <pre><strong>
   rm -rf "~/Library/Application Support/Sikulix"
   </strong><pre>

   This is the folder containing the <strong>Sikulix.app</strong>
   for use on Macs.

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

   <pre>java -jar sikulixsetup-1.1.0.jar</pre>

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

0. Click No to get Jython 2.5 due to 2.7 UTF-8 warning:

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/24067373/0acbcf64-0b52-11e7-9140-4b775cd39883.png">
   <img width="428" alt="sikulix-1 1 jython 856x368" src="https://cloud.githubusercontent.com/assets/300046/24067373/0acbcf64-0b52-11e7-9140-4b775cd39883.png"><br />(Click to open in full new screen)</a>


0. BLAH: This error in the console stopped me from going further

   <pre>
[debug (12/20/16 8:05:24 AM)] RunSetup: downloaded: tessdata-eng
Exception in thread "main" java.lang.NullPointerException
  at org.sikuli.setup.RunSetup.main(RunSetup.java:845)
   <pre>

<hr />

0. Click "OK" to the "Hallo" pop-up.

   Note different files are downloaded for Windows vs. Mac:

   * sikulixjython.jar
   * sikulixlibsmac.jar
   * sikulix.jar 
   * sikulixapi.jar
   <br /><br />

0. In Finder, move 
   to your user's Applications folder.

0. Move to Trash the installer file
   sikulixsetup-1.1.0.jar

QUESTION: How to verify a good install and use the program?


<hr />


<a name="SikuliXCommands"></a>

## SikuliX Commands

Sikulix.app

~/Library/Application Support/Sikulix

SikulixAppData folder


## SikuliX Methods 

So again taking the above workflow, now using SikuliX commands:

   * openApp(someApp) # we use an application someApp

   * click(imageButton) # we click some button
   * wait(imageExpected1) # we wait that the app reacts and shows the expected result on the screen

   * type(“some text”); type(Key.ENTER) # we fill in some text and press ENTER
   * wait(imageExpected2) # again we wait for some expected reaction or result

JavaDocs of classes are at<br />
http://nightly.sikuli.de/docs/index.html



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
