---
layout: post
title: "Windows 10 Client Config"
excerpt: "How I setup my Windows laptop"
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

In MSDN.com, "1511" became available 3/30/2016.

After downloading .iso, I use 7-zip to expand the file into a regular folder.

<a id="NetworkSettings"></a>

## Network settings #

Install VPN

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

## Operating System settings #

Do you get a double-quote " instead of @ when you press shift-2?

0. First, try pressing <strong>left ALT + shift</strong> to see if the layout changes. This is the key to swap language setttings.

0. Click the Windows icon on the keyboard.
0. Click Settings.
0. Click TIME & LANGUAGE.
0. Click Region & Language. 
0. Select United States since the default is United Kingdom.
0. Click X to exit dialog.
0. Try typing again.

## Desktop settings #

## Sharing #

This is only for VMWare instances:

0. Click Enable Shared Folders.
0. Check Downloads among Mirrored Folders.
0. Click red X to exit.
0. Click OK to confirm and log off and on again.

## Edge Browser settings #

0. Click the three dots at the upper right corner.
0. Select Settings.
0. PROTIP: Select <strong>Dark</strong> theme. That uses less electricity, doesn't use us the screen as quickly, is gentler on your eyes.

## Utility programs #

0. Chocolatey from https://chocolatey.org/
0. Copy text `@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin`
0. Click the Windows logo.
0. Type command
0. Alt-click Command and select <strong>Run as Administrator</strong>.
0. Paste (press Ctrl+V) and press Enter.

Install these using Chocolatey when Run as Administrator:

0. cinst jdk8 -y

   At time of wirting, the message was "Downloading from http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-windows-x64.exe".

0. cinist 7zip -y (instead of from http://7-zip.org/download.html)

0. Firefox from https://www.mozilla.org/en-US/firefox/new/?icn=tabz
0. Chrome from https://www.google.com/chrome/browser/desktop/index.html?hl=en

   PROTIP: Pin the icons to the taskbar, then remove icons from the Desktop.

0. Box.com
0. Dropbox.com
0. Microsoft OneDrive
0. Amazon

0. Type <strong>exit</strong> and press Enter.


## Utilities #


## Bin folder on Environment Variable Path #

0. Putty
0. Windows Powertools
0. WinSCP
0. SSH

## Communications #

These are not needed if the machine is within a virtual box.

0. Skype 
0. Slack


## Install Visual Studio #

Visual Studio 2015 = version 14.0

0. Since March 30, 2016, in MSDN Subscriptions we want to download Visual Studio 2015 Web Installer (x86 and x64)

   Enterprise has testing tools over the Professional edition.

   "with Update 2" means cumulative including Update 1.

   The Web Installer is a smaller exe.

   https://msdn.microsoft.com/subscriptions/json/GetDownloadRequest?brand=MSDN&locale=en-us&fileId=67806&activexDisabled=true&akamaiDL=false

0. Uncheck. These can be added later.
0. Wait for the Acquiring and Applying to finish. May take several hours.

0. Press Esc or provide email address tied to your license.
0. Wait for "Preparing for first use".

0. Click <strong>Open from Source Control</strong> from the Start list at the left.

   <amp-img width="350" height="309" alt="s2016u2-teamexplorer-manage-351x307" src="https://cloud.githubusercontent.com/assets/300046/15292256/763c5768-1b3f-11e6-9a92-955fc5f4c8fa.jpg"></amp-img>

0. Click <strong>Manage connections</strong> under the Team Explorer - Connect that opens up.
0. Click Connect to Team Project when that pops up.
0. Click Servers, then Add.
0. Select HTTPS.

0. If you get "TF31002 unable to connect", click on the Cisco icon to verify that you're connected.

   <a target="_blank" href="https://msdn.microsoft.com/en-us/library/ms244143.aspx">
   Microsoft's article listing possible problems</a>

   This may occur if you're not a member of a TFS security group, and need to be added to one.

### Add client-side certificate #

0. click view certificate button
0. click details tab
0. click copy to file. This kicks off the welcome to cert export wizard
0. click next
0. select cryptogragphic message syntax standad pkcs #7 cert
0. click include all servers in the cer path if possible
0. click next
0. give it a file name (such as tfs2015) I prefer to put it on the desktop
0. click next click finish
0. click ok
0. right click on the certificat file and choose install cert
0. click next
0. leave automatically select the cert store and click next
0. Cick Finish
0. you may have to export it as a der encoded binary x.509 instead and then when you import it bring it into the local machine




## Developer #


Install using Chocolatey:

0. cinst msysgit -y (Git client with command line)

Install otherwise:

0. Python
0. Ruby

0. cinist node

0. Sublime Text
0. Eclipse


0. Command-line tools
