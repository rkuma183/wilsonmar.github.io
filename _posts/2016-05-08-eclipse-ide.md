---
layout: post
title: "Eclipse IDE"
excerpt: "Open source and free. But losing market to licensed"
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

It was originally funded by IBM as open source.

There are several versions and editions of Eclipse IDE.

   * Java is free
   * Web
   * <a href="#STS">STS</a>


<a name="HomebrewInstall"></a>

## Homebrew install #

If you want to use the standard version of Eclipse,
use [Homebrew](/macos-homebrew/) to 
<a target="_blank" href="http://macappstore.org/eclipse-java/">eclipse-java</a>:

0. First, update the Homebrew installation bits:

   <tt><strong>
   brew update
   </strong></tt>

   This usually takes a while.

0. Use cask used to install GUI programs:

   <tt><strong>
   brew cask install eclipse-java
   </strong></tt>

   The response (as of 8 July 2016):

   <pre>
Please migrate your Casks to the new location and delete /opt/homebrew-cask/Caskroom,
or if you would like to keep your Caskroom at /opt/homebrew-cask/Caskroom, add the
following to your HOMEBREW_CASK_OPTS:
&nbsp;
  --caskroom=/opt/homebrew-cask/Caskroom
&nbsp;
For more details on each of those options, see https://github.com/caskroom/homebrew-cask/issues/21913.
==> Satisfying dependencies
complete
==> Downloading https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/R/eclipse-java-neon-R-macosx-cocoa-x86_64.tar.gz&r=1
==> Verifying checksum for Cask eclipse-java
==> Moving App 'Eclipse.app' to '/Applications/Eclipse.app'
🍺  eclipse-java staged at '/opt/homebrew-cask/Caskroom/eclipse-java/4.6.0' (0B)
   </pre>


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

## First Time #

0. Specify the workspace and check "Don't show again".

0. Check the box to not display the wizard screen.

<a name="Perspectives"></a>

## Perspectives #

Perspectives define the size and location of different views on the workspace window.

0. Right-click on the <strong>Perspectives</strong> icon at the upper-right corner
   and select "Show Text".

0. Click the icon to the right of the Perspective icon to open a list of perspectives.
0. Click Cancel

Views



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

