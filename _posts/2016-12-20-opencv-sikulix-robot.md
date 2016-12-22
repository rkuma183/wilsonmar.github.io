---
layout: post
title: "Pattern Recognition with OpenCV, SikuliX, and Robot Framework - one-click install on MacOS"
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

I wrote this page to organize my thinking around a 
one-click command that installs all the pre-requisites and
ends up showing reports for a sample set of scripts
against a sample app.

   <pre><strong>
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/pattern-recognition/master/mac-bootstrap.sh)"
   </strong></pre>

This is similar to <a target="_blank" href="https://github.com/wilsonmar/Basic-Selenium-Java">Selenium Setup</a>.

This page describes a way to automate clicking and typing on
Mac and Windows machines by
a program you code 
(in <strong>Java</strong>, Python, or Ruby).

This makes you more "productive" at playing games.
But I use it to make screencasts.
Salespeople use it to power their live demos.

A picture is taken of your screen(s).
and the text and location of objects recognized in the picture is fed
to your program to click or type.
Your program then takes another round of picture taking
and object recognition to ensure the results are what are intended.

Several libraries widely used in the 
Machine Learning/Artificial Intelligence field
are used here.

To extract text from pictures,
<a target="_blank" href="https://github.com/tesseract-ocr">
Tesseract</a> OCR (Optical Character Recognition)
is called.

To recognize the coordinates of objects,
<strong>OpenCV</strong> (Computer Vision) 
is called.

The program that integrates the pieces together is 
<a href="#SikuliX">SikuliX</a> 
maintained by Raimund Hocke aka RaiMan
and supported by enthusiasts on
<a target="_blank" href="https://answers.launchpad.net/sikuli">
Ubuntu Launchpad</a> and
<a target="_blank" href="https://gitter.im/RaiMan/SikuliX-2014">
Gitter channel</a>.


<hr />

The steps to make it work:

0. Install JRE
0. Install Ruby compiler
0. Install Robot Framework (which uses Ruby)
0. Install the IDE you want to use (IntelliJ)
0. <a href="#SikuliXinstall">Download SikuliX</a> 
0. Create a Git folder to hold your scripts.

Install http://sikulix.com/

<hr />

<a name="SikuliXInstall"></a> 

## SikuliX Installation

Instructions below are based on run on Mac 10.12 (Sierra)
referencing http://sikulix.com/quickstart/
and 

0. If this is your first time:<br />
   create a folder to hold Sikulix bits.

   <pre>
   cd ~
   mkdir sikulix
   cd ~/sikulix
   </pre>

   (Capitalization is distracting)

   Otherwise, remove the folder and begin anew.

   <pre><strong>
   rm -rf "~/Library/Application Support/Sikulix"
   </strong><pre>

0. Download from https://launchpad.net/sikuli/+download

   sikulixsetup-1.1.0.jar, 2015-10-06, 3 MB

0. Move the file to your skilux folder.

0. Expand the installer:

   <pre>java -jar sikulixsetup-1.1.0.jar</pre>

   This creates file:<br />
   SikuliX-1.1.1-SetupLog.txt
   and a empty <strong>SetupStuff</strong> folder.

0. Open the txt file and refresh it to see progress.

0. Click checkboxes 1 for Jython and 3 for Tesseract
   in the UI pop-up, then<br />
   <strong>Setup Now</strong>.

   sikulix-setup-ui-1.png

0. Click Yes to

   sikulix-setup-ui-2.png

0. Click <strong>No</strong> to pop-ups about 
   Mac native libs (jar's) previously installed into
   /Users/___/Library/Application Support/Sikulix/SikulixDownload_201610061722/...

   sikulix-setup-ui-3.png

0. Click No to get Jython 2.5 due to 2.7 UTF-8 warning:

   sikulix-setup-ui-4-python.png

0. If you get this:

   <pre>
[debug (12/20/16 8:05:24 AM)] RunSetup: downloaded: tessdata-eng
Exception in thread "main" java.lang.NullPointerException
  at org.sikuli.setup.RunSetup.main(RunSetup.java:845)
   <pre>

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

### Robot Framework Install

Instead of coding programming code, it's faster to write 
keyword-driven syntax driven by text data files.
That's provided by the
<a target="_blank" href="http://robotframework.org/">
Robot Framework</a>, open-sourced on 
GitHub. 

The core framework is operating system and application independent
because it's implemented using Python for running on Jython (JVM) and IronPython (.NET).

See https://github.com/robotframework/QuickStartGuide/blob/master/QuickStart.rst

0. Install the Robot Framework core:

   <pre>
   pip install robotframework
   </pre>

   The response:

   <pre>
Collecting robotframework
  Downloading robotframework-3.0.tar.gz (430kB)
    100% |████████████████████████████████| 440kB 399kB/s 
Building wheels for collected packages: robotframework
  Running setup.py bdist_wheel for robotframework ... done
  Stored in directory: /Users/mac/Library/Caches/pip/wheels/9e/61/ee/b4bb4b9b7824594cc785a577975bec2fce9c54b09bbf39eb3f
Successfully built robotframework
Installing collected packages: robotframework
Successfully installed robotframework-3.0
   </pre>

0. To test databases and for example REST APIs, also install:

   <pre>
   pip install robotframework-databaselibrary
   pip install requests
   pip install botframework-requests
   </pre>

0. PROTIP: I don't recommend installing docutils because you can look it up online.

0. To install the demo Robot login script, create a folder to hold the demo repo:

   <pre>
   cd ~/gits/wilsonmar/pattern-recognition
   git clone https://github.com/robotframework/QuickStartGuide.git --depth=1
   cd QuickStartGuide
   </pre>

0. Position your present working directory to thePROTIP: I don't recommend installing docutils because you can look it up online.

0. Run the demo:

   <pre>
   robot QuickStart.rst
   </pre>

   NOTE: The file name extension (ending) .rst is also used by Ansible scripts.

   You will see this if the .rst file is not in the present folder:

   <pre>
[ ERROR ] Parsing 'QuickStart.rst' failed: Data source does not exist.
   </pre>

   The expected response is:

   <pre>
==============================================================================
QuickStart                                                                    
==============================================================================
User can create an account and log in                                 | PASS |
------------------------------------------------------------------------------
User cannot log in with bad password                                  | PASS |
------------------------------------------------------------------------------
User can change password                                              | PASS |
------------------------------------------------------------------------------
Invalid password                                                      | PASS |
------------------------------------------------------------------------------
User status is stored in database                                     | PASS |
------------------------------------------------------------------------------
QuickStart                                                            | PASS |
5 critical tests, 5 passed, 0 failed
5 tests total, 5 passed, 0 failed
==============================================================================
Output:  /Users/mac/gits/wilsonmar/pattern-recognition/QuickStartGuide/output.xml
Log:     /Users/mac/gits/wilsonmar/pattern-recognition/QuickStartGuide/log.html
Report:  /Users/mac/gits/wilsonmar/pattern-recognition/QuickStartGuide/report.html
   </pre>



## Scripting

Many of the functions are common to other similar programs,
such as Selenium, HP QTP, etc.


RIDE = Robot IDE.
But there are plugins for IntelliJ/PyCharm & Eclipse,
Atom, Sublime, TextMate, Vim, etc.

See http://sikulix-2014.readthedocs.io/en/latest/scenarios.html#using-robotframework

http://www.slideshare.net/pekkaklarck/robot-framework-introduction

## Social

<a target="_blank" href="https://twitter.com/robotframework">
@robotframework</a>

It's maintained by contractor Pekka Klärck 
<a target="_blank" href="https://twitter.com/pekkaklarck">@pekkaklarck</a>, http://eliga.fi/)

<a target="_blank" href="https://vimeo.com/192649128/">
See Pekka on Joe's video</a> using
<a target="_blank" href="http://www.slideshare.net/pekkaklarck/robot-framework-introduction">
this slidedeck</a>.
Note it's copyrighted by Nokia Networks (Finland).

https://blog.codecentric.de/en/2016/12/robot-framework-tutorial-2016-working-with-collections/

https://medium.com/@varjoinen/robot-framework-101-fb12d1d6954c#.jejc3hrwl



## Run scripts

http://sikulix-2014.readthedocs.io/en/latest/faq/010-command-line.html#how-to-run-sikulix-from-command-line

robot some_tests.robot
OR
robot test_cases/


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
