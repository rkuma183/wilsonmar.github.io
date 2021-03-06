---
layout: post
title: "Apple Mac versions (plus Installers and Wallpapers)"
excerpt: "From Mac OSX to MacOS"
shorturl: "https://goo.gl/Ua6Pyv"
tags: [apple, mac, setup]
image:
# feature: osx-ver-to-11-1900x259.png
  feature: https://user-images.githubusercontent.com/300046/38096757-e4b91ea0-3330-11e8-8032-6992cb3aaea2.png
  credit: JAMF
  creditlink: http://www.jamf.com/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<a id="Versionz"></a>

<table border="1" cellpadding="4" cellspacing="0">
<tr><th> Ver. </th><th> Code Name </th><th> Avail. Date
</th><th><a href="/php-on-apple-mac-osx/">PHP</a>
</th><th><a href="/python-install/">Python</a>
</th><th><a href="/ruby-on-apple-mac-osx/">Ruby</a>
</th><th> Introduced
</th></tr>
<tr valign="top"><td> 10.14<br />MacOS
</td><td align="right"><a target="_blank" href="https://www.apple.com/macos/mojave-preview/">Mojave preview</a>
</td><td align="right"> June 2018
</td><td align="right"> 2.6.0 ?
</td><td align="right"> 2.7.10 ?
</td><td align="right"> 2.4.2p198 ?
</td><td align="left"> Dark Mode, Dynamic Desktop, Group FaceTime, New Mac App Store, News, Stocks, Voice Memos, HomeKit
</td></tr>
<tr valign="top"><td> 10.13<br />MacOS
</td><td align="right"><a target="_blank" href="https://www.apple.com/macos/high-sierra/">High Sierra</a>
</td><td align="right"> Oct. 2017
</td><td align="right"> 2.6.0
</td><td align="right"> 2.7.10
</td><td align="right"> 2.4.2p198
</td><td align="left"> ADFS, H.265 video, Metal 2
</td></tr>
<tr valign="top"><td> 10.12<br />MacOS
</td><td align="right"><a target="_blank" href="https://www.apple.com/macos/sierra/">Sierra</a>
</td><td align="right"> Oct. 2016
</td><td align="right"> 2.6.0
</td><td align="right"> 2.7.10
</td><td align="right"> -
</td><td align="left"> Auto unlock, universal clipboard, Siri, Watch login
</td></tr>
<tr valign="top"><td> 10.11<br />Mac OSX
</td><td align="right"> El Capitan (Gala)
</td><td align="right"> July 2015
</td><td align="right"> -
</td><td align="right"> 2.7.10
</td><td align="right"> -
</td><td align="left"> <a href="#ElCapitanSIP">Disable System Integrity Production</a>
</td></tr>
<tr valign="top"><td> 10.10
</td><td align="right"><a target="_blank" rel="amphtml" href="http://www.wikiwand.com/en/OS_X_Yosemite">Yosemite</a> (Syrah)
</td><td align="right"> Fall 2014
</td><td align="right"> 5.5.14
</td><td align="right"> 2.7.6
</td><td align="right"> -
</td><td align="left"> Swift, non-skeuomorphic UI, connect Apple </td></tr>
<tr valign="top"><td> 10.9
</td><td align="right"> Mavericks (Caberet)
</td><td align="right"> Oct. 22, 2013
</td><td align="right"> 5.3.26
</td><td align="right"> -
</td><td align="right"> 2.0.0p247
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.8 </td><td align="right"> Mountain Lion
</td><td align="right"> July 25, 2012
</td><td align="right"> -
</td><td align="right"> -
</td><td align="right"> 1.8.7
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.7 </td><td align="right"> Lion
</td><td align="right"> July 20, 2011
</td><td align="right"> 5.3
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.6 </td><td align="right"> Snow Leopard
</td><td align="right"> June 9, 2008
</td><td align="right"> 5.3
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> <a href="#AppleStore">Apple Store</a> </td></tr>
<tr valign="top"><td> 10.5 </td><td align="right"> Leopard
</td><td align="right"> Oct. 26, 2007
</td><td align="right"> 5.2
</td><td align="right"> 2.5.1
</td><td align="right"> -
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.4 </td><td align="right"> Tiger
</td><td align="right"> <a target="_blank" href="https://en.wikipedia.org/wiki/Mac_OS_X_Tiger">April 29, 2005</a>
</td><td align="right"> -
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> Intel chip; from tsch to <a href="#BashShell">bash shell</a></td></tr>
<tr valign="top"><td> 10.3 </td><td align="right"> Panther
</td><td align="right"> ?
</td><td align="right"> ?
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> - </td></tr>
</table>

Based on <a target="_blank" rel="amphtml" href="http://en.wikipedia.org/wiki/OS_X#Versions">
http://en.wikipedia.org/wiki/OS_X#Versions</a>

## Versioned Certifications

Apple Certified Support Professional certifications are for specific versions:<br />
<a target="_blank" href="
https://training.apple.com/en/osx.html">
https://training.apple.com/en/osx.html</a>

The two-hour exams are $65 each at
Apple Certification Records System (ACRS) at 
https://training.apple.com/acrs

<a target="_blank" href="http://www.peachpit.com/promotions/welcome-apple-customers-books-138516"> Apple Training Series books from Peachpit Press</a>
to help you prepare for the exam are expensive ($100).
 


<a id="MacVer"></a>

## Version Terminal Commands #

0. In a Terminal window on any folder, type:

   <pre><strong>sw_vers
   </strong></pre>

   Sample response:

   <pre>ProductName: mac OS X
   ProductVersion: 10.12.5
   BuildVersion: 16B2555
   </pre>

   PROTIP: Provide this about your computer whenever you talk about your situation to StackOverflow or other technical support form.

   The x.x.x pattern is called <a target="_blank" rel="amphtml" href="http://ssemver.org/">
   Semantic Versioning</a>.

   The "10" is associated with "Darwin", an open-source Unix operating system released by Apple Inc. in 2000. It is composed of code developed by Apple as well as code derived from NeXTSTEP, BSD, Mach, and other free software projects. --<a target="_blank" href="https://www.wikiwand.com/en/Darwin_(operating_system)">Wikipedia</a>.

0. A partial response can be requestd by:

   <pre><strong>sw_vers -productVersion
   </strong></pre>

   This is a different command than used in Linux (`lsb_release`).

0. Invoke the <a target="_blank" href="http://man7.org/linux/man-pages/man2/uname.2.html">
   Unix name" utility command also used in Linux</a>:   

   <pre><strong>uname -a
   </strong></pre>

   The `-a` requests all parameters, for a response such as:

   <pre>Darwin macs-MacBook-Pro-4.local 
   16.6.0 Darwin Kernel Version 16.6.0: Fri Apr 14 16:21:16 PDT 2017; 
   root:xnu-3789.60.24~6/RELEASE_X86_64 x86_64
   </pre>

   * `Darwin` is the kernel name (-k).
   * `macs-MacBook-Pro-4.local` is the node name (-n), where the characters
   before the first dash is your user name.
   * `16.6.0` is the Linux kernel-release (-r).
   * `x86_64` is the machine name (-m).
   * `i386` is the processor name (-p).
   * Not applicable on Macs (Linux only) are the hardware platform (-i) and operating system (-o) flag.
   <br /><br />

   NOTE: The architecture of `i386` is also output by 
   this Linux command:

   <pre><strong>arch
   </strong></pre>


## Upgrades

The App Store app nags you every day to upgrade.

Do a full backup before.

MacOSX To find out more about why a macOS Sierra installation failed:

   <pre><strong>textedit /var/log/install.log
   </strong></pre>

Each user starts with a login keychain saved at 

   <pre>/Users/<em>username</em>/Library/Keychain/login.keychain</pre>

and a Local Items/iCloud keychain saved in folder: 

   <pre>cd
   /Library/Keychains/UUID</pre>

Administrative users can manage macOS authentication assets with the /Library/Keychain/System.keychain. 

Apple maintains several items for macOS use in:

   /System/Library/Keychains/ 


## Create a bootable installer for macOS

To manually download the complete installer:

1. Go to the installer page at:<br />
<a target="_blank" href="https://itunes.apple.com/us/app/macos-sierra/id1127487414?mt=12">
https://itunes.apple.com/us/app/macos-sierra/id1127487414?mt=12</a>

0. Click "Download in iTunes" to open up iTunes app.
0. Click "Get". 
0. Close iTunes after download is finished into your user Applications folder.
0. In Finder, press shift+command+A or click the Go menu to select Applications.

   NOTE:<br />
   The file "Install macOS Sierra.app" for 10.12.5 is 4.97 GB.<br />
   The "Install macOS High Sierra.app" is ???

   Notice there are spaces within the file name of the download<br />
   "Install macOS Sierra.app". This means back slash (\\) escape characters
   are needed in typed commands referencing the file.

   <pre>ls "/Applications/Install\ macOS\ Sierra.app/Contents/Resources/"
   </pre>

   PROTIP: The forward slash is used as an escape character before each space character.

1. Run the installer:

   <pre>"sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/startosinstall --converttoapfs NO"
   </pre>

   PROTIP: Use the GUI utility described below instead of the
   `createinstallmedia` command
   described in Apple's https://support.apple.com/en-us/HT201372


   ### Boot USB stick

0. Get a 16 or 32 GB flash drive.
0. Insert the drive into your Mac.
0. View the contents in Folder.
0. If you have any other data on that flash drive, back it up, 
   because the installer will delete everything on it.

   Optionally, a secondary internal partition can be used
   if it has at least 12 GB of available disk space for installation files.

0. Open the Terminal app (in the Utilities folder of your Applications folder).

   PROTIP: Drag Terminal.app to drop it at the bottom edge of the screen
   so it's available anytime.

   ### Install Disk Create GUI

0. Download InstallDiskCreate.zip from:

   <a target="_blank" href="https://macdaddy.io/install-disk-creator/">
   https://macdaddy.io/install-disk-creator</a>

   It is from the talented @BenedictSlaney in New Zealand.

0. Click the Download icon on the website.
0. Unzip the file by clicking on it in the browser or in Finder.
0. Scroll to the "Install Disk Creator" application file (dated March 15, 2017)
and click to invoke it.
0. Click Open if you see a pop-up about downloading from the internet.
0. Open a new Finder Window and Go Applications.
0. Drag and drop the app file into the Applications folder.
0. Delete the zip file downloaded to free up space.
0. Within the Applications folder, double-click to invoke "Install Disk Creator".

   ### Create Installer Disk

0. Select the volume. It's usually "Untitled".
0. Click the "Choose a macOS installer" button.
0. Find the Sierra installer file. This is should be located in your root Applications folder under Macintosh HD (not your user Applications folder).
0. Select your flash drive from the drop-down menu.
0. Click “Create Installer”.
0. Click "Erase disk".
0. Provide your password.
0. There is no indicator of progress. Wait for it to be done.
0. Remove the installer media and label it.

   ### Use installer disk

0. Insert the USB drive into the Mac being installed.

   CAUTION: Again, this wipes out the hard disk on the Mac.

0. Launch the installer by holding down the Option key when you boot up your computer.
0. Wait a while for its completion.


## Update downloads

Download combined updates which include all components from prior point releases, even if they are not installed on the target Mac, from:<br />
<a target="_blank" href="https://support.apple.com/downloads/combo">
https://support.apple.com/downloads/combo</a><br />



<a id="Wallpaperz"></a>

## Desktop Wallpaper Pictures #

Wallpaper images that come with OS X are of Retina resolution: 
<strong>5120x2880</strong>. Really big.

Get to the Desktop quickly by spreading thumb and 4 fingers on the touchpad.

To choose a different picture from Preferences:

   > desktops/screensaver 
   > select your desktop (highlight) 
   > press Command and C at he same time. BTW, notice where your picture/photo folders.

Want to add the Windows 10 wallpaper to your desktop?

0. Get to folder where system wallpapers are held from the 
   Finder > Go |> Go to Folder >  /Library/Desktop Pictures.
0. Sort by File Size. 



## Use Touchbar to auth Terminal

Within Terminal app:

1. Edit the file:

   <pre><strong>
   sudo nano /etc/pam.d/sudo
   </strong></pre>

2. Provide your password.
3. Add the following line to the top:

   <pre>auth sufficient pam_tid.so</pre>

4. Save the change within Nano using Control+O and then exit nano with Control+X


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
