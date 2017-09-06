---
layout: post
title: "Windows 10 (Server 2012 & 2016) Client UI Configuration"
excerpt: "How I setup my Windows UI look and feel"
tags: [windows, mac, setup]
image:
# face blue windows cortana-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15312673/76026ae2-1bc3-11e6-9cf0-ca09a839ba7f.jpg
  credit: stuff.co.za
  creditlink: http://www.stuff.co.za/cortana-is-heading-to-android-ios-via-upcoming-phone-companion-app/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here is how I setup a Windows 10 client on my laptop.

NOTE: 64-bit programs install to C:\Program Files.


<a id="Versionz"></a>

## Versions of Windows 10 #

See <a target="_blank" href="https://en.wikipedia.org/wiki/Windows_10_version_history">
https://en.wikipedia.org/wiki/Windows_10_version_history</a>

In MSDN.com, "1511" became available 3/30/2016.

"1709" "Fall Creators", is expected October 17, 2017

TODO: PowerShell script to automate these manual commands.


## Keyboard settings 

Do you get a double-quote " instead of @ when you press shift-2?

0. First, try pressing <strong>left ALT + shift</strong> to see if the layout changes. This is the key to swap language setttings.

0. Click the Windows icon on the keyboard.
0. Click Settings.
0. Click TIME & LANGUAGE.
0. Click Region & Language. 
0. Select United States since the default is United Kingdom.
0. Click X to exit dialog.
0. Try typing again.


## Dark Edge Browser #

PROTIP: Use a <strong>Dark</strong> theme. That uses less electricity, doesn't use us the screen as quickly, is gentler on your eyes.

0. Click the three dots at the upper right corner.
0. Select Settings.
0. Select <strong>Dark</strong> theme. 




<a id="NetworkingSettings"></a>

## Networking #

When a new Windows desktop is established, there is this dialog:

PROTIP: If you click "Recommended", you'll have to click "Add" many times. For example, go to Google.com and you'll need to add several URLS:

   * https://www.google.com
   * https://apis.google.com
   * https://ssl.google-analytics.com
   * https://2542116.fls.doubleclick.net
   * https://www.googleadservices.com
   <br /><br />

   ![win10-ie-unblock-389x357-131805](https://user-images.githubusercontent.com/300046/30009870-d55b7876-90e8-11e7-9ac7-b95a5684a70a.jpg)

1. Uncheck "Continue to prompt when website content is blocked".
0. Click "Close" button.


<a id="CiscoVPN"></a>

### Install Cisco VPN #

This is only needed within a corporate enterprise environment.

0. Open an internet browser for the URL supplied.
0. If there is a certificate issue, connect anyway.
0. Type in your credentials.
0. Save password.
0. Click to install the Cisco AnyConnect Secure Mobile Client.
0. Click Run, accept license, etc. and Finish.

0. Click the Windows key or click the omni-search box.
0. Type <strong>VPN</strong> for Cisco AnyConnect Secure Mobile Client.
0. PROTIP: You'll be invoking the VPN a lot, so alt-click on it to <strong>Pin to Taskbar</strong>.
0. In the client pop-up, enter the URL (usually with a port number).
0. If you see an error, see the
   <a target="_blank" href="http://www.cisco.com/c/en/us/support/docs/security/asa-5500-x-series-next-generation-firewalls/100597-technote-anyconnect-00.html"> 
   Cisco's Troubleshooting Guide</a>.

0. If "Untrusted VPN Server Blocked", click <strong>Change Setting</strong>.
0. Uncheck "Block connections to untrusted servers".
0. Switch back to the dialog with the URL and try again to Connect.
0. Type in credentials when prompted.
0. Close the download page.



## Open Command Window #

There are several ways to open a Command Window on Windows 10 or Windows 2016.

A). PROTIP: This is the easiest (to me):

1. Right-click the Windows "Start" icon at the lower-left corner

   <a target="_blank" href="https://user-images.githubusercontent.com/300046/30012134-96a5d178-90fa-11e7-88ea-cc5fbb6dc628.jpg">
   <img alt="win10-start-right-227x596-44691.jpg" src="https://user-images.githubusercontent.com/300046/30012134-96a5d178-90fa-11e7-88ea-cc5fbb6dc628.jpg"></a>

2. Select one:

   * Command Prompt
   * Command Prompt (Admin)
   <br /><br />

B). Pick from menu:

1. Click the Windows "Start" icon at the lower-left corner.

2. If the Command Prompt appears, right-click on it to Run as Administrator.

   ![win10-cmd-icon-561x163-36424](https://user-images.githubusercontent.com/300046/30010362-70204dac-90ec-11e7-915c-5c6a9549e272.jpg)

C). Type program:

1. Right-click the Windows "Start" icon at the lower-left corner

2. Even though there is no form field, type <strong>cmd</strong> until <strong>Command Prompt</strong> appears in a list. 
3. Press Enter or click on the desired item.

While you're there for the first time:

1. Notice the default location is `C:\Users\Administrator`
0. Type `dir` to list folders.



## Windows package Chocolatey #


### Install Chocoteley #

1. Open a Command Prompt as Administrator.
0. Copy this text and right-click on the command window:

   `@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin`

   This is from the Chocolatey website at
   <a target="_blank" href="https://chocolatey.org/">
   https://chocolatey.org</a>

0. Press Enter to execute the line. The response should end with:

   <pre>
You can call choco from anywhere, command line or powershell by typing choco.
Run choco /? for a list of functions.
You may need to shut down and restart powershell and/or consoles
 first prior to using choco.
Ensuring chocolatey commands are on the path
Ensuring chocolatey.nupkg is in the lib folder
   </pre>

0. Type <strong>exit</strong> and press Enter to close the command window.

   ### Install Chrome 

0. Click the Windows start logo.
0. Right-click Command and select <strong>Run as Administrator</strong>.
0. Copy (or retype) this command:

   <tt><strong>choco install googlechrome -y
   </strong></tt>

   The expected response is:

   <pre>The install of googlechrome was successful.</pre>

   Alternately, download the Chrome browser installer from:
   <a target="_blank" href="https://www.google.com/chrome/browser/desktop/index.html">
   https://www.google.com/chrome/browser/desktop/index.html</a>

0. PROTIP: Pin the icons to the taskbar, then remove icons from the Desktop.
0. Enter Chrome the first time. Select the default browser dialog opion.


   ### Install Firefox

0. This:

   <tt><strong>choco install firefox -y
   </strong></tt>

   Alternately, manually download installer from 
   https://www.mozilla.org/en-US/firefox/new/?icn=tabz


   ### Install JDK

0. This:

   <tt><strong>choco install jdk8 -y
   </strong></tt>

   At time of wirting, the message was "Downloading from http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-windows-x64.exe".

0. Exit and invoke cmd again to verify:

   <tt><strong>java -version
   </strong></tt>

   Sample response at time of writing:

   <pre>
java version "1.8.0_144"
Java(TM) SE Runtime Environment (build 1.8.0_144-b01)
Java HotSpot(TM) 64-Bit Server VM (build 25.144-b01, mixed mode)
   </pre>


   ### Install Git for Windows

0. This:

   <tt><strong>choco install msysgit -y
   </tt></strong>

0. Click the Windows "start" icon.
0. "Git Bash" should appear among the application icons.

   ![win10-git-menu-109x143-13317](https://user-images.githubusercontent.com/300046/30010894-82f1adfa-90f0-11e7-99cb-93a10f88c9f5.jpg)

   Additionally,

   There is <a target="_blank" href="https://chocolatey.org/packages/SourceTree">SourceTree</a> free visual Git and Hg client for Mac and Windows


   ### Install 7-zip

0. Install 7zip  (instead of from http://7-zip.org/download.html)

   <tt><strong>choco install 7zip -y
   </strong></tt>

   PROTIP: After downloading .iso, I use 7-zip to expand the file into a regular folder.


   ### Install Visual Studio

0. Install from https://chocolatey.org/packages?q=Visual+Studio

   Specifically: https://chocolatey.org/packages/VisualStudio2017Community

   <tt><strong>choco install visualstudio2017community -y
   </strong></tt>

   NOTE: https://chocolatey.org/packages/VisualStudio2017Professional

0. Type "exit" to exit the Command Prompt.
0. Click the Microsoft Windows "start" icon to see the list of apps recently installed.
0. If you will be using Visual Studio a lot, drag "Visual Studio 2017" and drop it on the Task Bar at the bottom of the screen.
0. Double-click on a Visual Studio 2017 icon to open it.
0. Click "Maybe later" or Sign-in to your Microsoft account.
0. The first time, select a theme and click "Start Visual Studio".



   ### Install Other Developer tools #

Developoment:

* Python
* Ruby
* Node

Text editors:
* Notepad++
* Sublime Text
* Eclipse

File storage:
* Microsoft OneDrive
* Box.com
* Dropbox.com



## Bin folder #

0. Create a <strong>C:\bin</strong> folder to hold programs accessed from the Windows command line.
0. Specify that path in Environment Variables.
0. Put files in that folder (from cloud Google Driver, etc.)

   * Putty for SSH into Linux machines
   * WinSCP for exchanging files with Linux machines
   * Windows Powertools
   * zip.exe (WinZip licensed version)
   * curl.exe (HTTP command line)


## Invalid client-side certificate #

If a website has a certificate warning such as this:

   <amp-img width="268" height="86" src="https://cloud.githubusercontent.com/assets/300046/15332615/886109b8-1c23-11e6-898e-e0b90e7f092d.jpg">
   </amp-img><!-- win10-chrome-privacy-warning 268x86 -->

   NOTE: This may be due to several root causes:

   * Time and date settings incorrect on either the client or server.
   * Anti-virus program (Kaspersky and BitDefender) is blocking the connection.
   * SSL certificate name mismatch error.
   * SSL certificate used is self-signed, is not issued by a trusted certificate authority (CA).
   * SSL certificate is untrusted.
   <br /><br />

### Firefox ignore add-on #

https://addons.mozilla.org/en-US/firefox/addon/skip-cert-error/


#### Save certificate in Chrome #

To avoid needing to click ADVANCED:

0. Click on the broken certificate icon.
0. click the Details link that appears.

   <amp-img width="554" height="337" src="https://cloud.githubusercontent.com/assets/300046/15332999/0a27e3c6-1c25-11e6-9cab-9169d2705d46.jpg">
   </amp-img><!-- win10-chrome-insecure -->

0. Click View Certificate.
0. Click tab Details tab.
0. Click <strong>Copy to File</strong> for the Certificate Export Wizard.
0. Click Next.
0. Choose Cryptogragphic Message Syntax Standad - PKCS #7 cert.
0. Click Browse to select the folder.
0. Type a file name (such as itw-tfs2016) for the default .p7b file extension.
0. Click Next. Click Finish.
0. Click OK to the successful pop-up.

0. Use File Explorer to navigate to the file just created.
0. Alt+click on the certificate file to choose <strong>Install Certificate</strong>.
0. Click Next.
0. Leave "Automatically select the cert store" and click Next.
0. Click Finish.
0. Click OK to "The import was successful" pop-up.

0. Close Chrome and open it again to try the URL.

   This time, you should only need to confirm the password saved by the browser.

0. You may have to export it as a der encoded binary x.509 instead and then when you import it bring it into the local machine.

   ### Add client-side certificate in Chrome #

0. click include all servers in the cer path if possible
0. click next



## Sharing VMWare Fusion #

This is only for VMWare Fusion instances:

0. Click Enable Shared Folders.
0. Check Downloads among Mirrored Folders.
0. Click red X to exit.
0. Click OK to confirm and log off and on again.


## Office #

* Office Professional Plus (x86 and x64) - DVD (English) 09/22/2015
from <a target="_blank" href="https://msdn.microsoft.com/subscriptions/json/GetDownloadRequest?brand=MSDN&locale=en-us&fileId=65535&activexDisabled=true&akamaiDL=false">direct download from MSDN</a>.

## Communications #

These are not needed if the machine is within a virtual box.

* Skype 
* Slack


## PowerShell Scripts


### Windows Privacy

Set Windows 10 privacy settings by running a PowerShell script from
https://github.com/MichiMunich/Windows10-Privacy/blob/master/scripts/Windows10_Privacy.ps1



## Bash Scripts

In 2017, Microsoft enabled in Windows Bash Shell scripts previously only on Linux and MacOS.

