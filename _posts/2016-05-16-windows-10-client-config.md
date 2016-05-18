---
layout: post
title: "Windows 10 Client Configuration"
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

## Install Cisco VPN #

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

## Chrome browser programs #

0. Firefox from https://www.mozilla.org/en-US/firefox/new/?icn=tabz
0. Chrome from https://www.google.com/chrome/browser/desktop/index.html?hl=en

   PROTIP: Pin the icons to the taskbar, then remove icons from the Desktop.

0. Enter Chrome the first time. Select the default browser dialog opion.

## Windows package Chocolatey #

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

0. Box.com
0. Dropbox.com
0. Microsoft OneDrive
0. Amazon

0. Type <strong>exit</strong> and press Enter.


## Utilities #

* Office Professional Plus 2016 (x86 and x64) - DVD (English) 09/22/2015
from <a target="_blank" href="https://msdn.microsoft.com/subscriptions/json/GetDownloadRequest?brand=MSDN&locale=en-us&fileId=65535&activexDisabled=true&akamaiDL=false">direct download from MSDN</a>.

## Bin folder on Environment Variable Path #

0. Create a <strong>C:\bin</strong> folder to hold programs accessed from the Windows command line.
0. Specify that path in Environment Variables.
0. Put files in that folder:

0. Putty for SSH into Linux machines
0. WinSCP
0. Windows Powertools

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

### Invalid client-side certificate #

If a website has a certificate warning such as this:

   <amp-img width="268" height="86" src="https://cloud.githubusercontent.com/assets/300046/15332615/886109b8-1c23-11e6-898e-e0b90e7f092d.jpg">
   </amp-img><!-- win10-chrome-privacy-warning 268x86 -->

   NOTE: This may be due to several root causes:

   * Time and date settings incorrect on either the client or server.
   * Anti-virus program (Kaspersky and BitDefender) is blocking the connection.
   * SSL certificate name mismatch error.
   * SSL certificate used is self-signed, is not issued by a trusted certificate authority (CA).
   * SSL certificate is untrusted.

### Firefox ignore add-on #

https://addons.mozilla.org/en-US/firefox/addon/skip-cert-error/

#### Save certificate in Chrome #

To avoid needing to click ADVANCED:

0. Click on the broken certificate icon.
0. click the Details link that appears.

   <img src="https://cloud.githubusercontent.com/assets/300046/15332999/0a27e3c6-1c25-11e6-9cab-9169d2705d46.jpg">

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
