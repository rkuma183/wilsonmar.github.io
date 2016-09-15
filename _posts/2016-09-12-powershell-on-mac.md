---
layout: post
title: "PowerShell on MacOS"
excerpt: "Love Child or Demon Spawn?"
tags: [mac, cloud, powershell, microsoft]
image:
# fig blue powershell icon-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15307772/b335270e-1b93-11e6-9552-d3022de2b9ce.jpg
  credit:
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

This article describes the use of PowerShell scripting on Mac and Linux.

"PowerShell" refers to both the command-line shell and scripting language designed system administration. 

First built on the .NET Framework, Windows PowerShell helps IT professionals and power users control and automate the administration of the Windows operating system and applications that run on Windows. 
Now they can do the same for Linux and MacOS.

PowerShell <strong>cmdlets</strong> (command-lets) 
enables computers to be managed from the command line,
much like Bash shell scripts on Linux machines.

However, PowerShell offers more consistency than the 
various commands added over time by various parties.

   * It reads Excel files natively as well as JSON, XML, and even ASCII.
   <br /><br />


## Open source on Linux and MacOS #

From the <a target="_blank" href="https://www.youtube.com/channel/UCMhQH-yJlr4_XHkwNunfMog">
PowerShell and DSC Team YouTube channel</a>:

<amp-youtube data-videoid="2WZwv7TxqZ0" layout="responsive" width="480" height="270"></amp-youtube>
This 51-minute series of demos was published Aug 18, 2016.


<a target="_blank" href="http://www.networkworld.com/article/3109486/application-development/powershell-for-linux-makes-it-easier-to-mix-clients-servers-and-clouds.html">
This article</a> notes Desired State Configuration for Linux and the promise of SSH support arrived in 2014 (several months before Microsoft open sourced .NET and brought .NET Core to Linux). But "you had to author your scripts on the Windows platform, you had to configure things on the Windows platform and then deliver the desired configuration to a Linux box and have it be configured; now you can do all of that on Linux.”

<a target="_blank" href="https://aka.ms/hosoyc">
On August 18 2016</a>, PowerShell became open-source at<br />
<a target="_blank" href="https://github.com/PowerShell/PowerShell/">
https://github.com/PowerShell/PowerShell</a>.

<a target="_blank" href="https://gitter.im/PowerShell/PowerShell">
Join the conversation on Gitter</a>

Noteworthy pages in the <a target="_blank" href="https://github.com/PowerShell/PowerShell/blob/master/docs/FAQ.md">
FAQ</a>:

   * https://blogs.msdn.microsoft.com/kebab/2013/06/09/an-introduction-to-error-handling-in-powershell/
   * http://ss64.com/ps/syntax.html
   * https://github.com/PoshCode/PowerShellPracticeAndStyle
   <br /><br />


## Install on MacOS #

QUESTION: Is there a brew powershell?

0. Click to download the latest release for "OSX 10.11" at:<br />
   <a target="_blank" href="https://github.com/PowerShell/PowerShell/">
   https://github.com/PowerShell/PowerShell</a>

   Alternately, get back versions at<br />
   <a target="_blank" href="https://github.com/PowerShell/PowerShell/releases/">
   https://github.com/PowerShell/PowerShell/releases</a>

   <table border="1" cellpadding="4" cellspacing="0">
   <th>Date</th><th> File </th><th> MB Size </th><th> Space</th></tr>
   <tr valign="top"><td> Aug 10, 2016 </td><td>
   <a target="_blank" href="https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell-6.0.0-alpha.9.pkg">
   powershell-6.0.0-alpha.9.pkg</a>
   </td><td align="right"> 37.1 MB 
   </td><td align="right"> 119.7 MB </td></tr>

   <tr valign="top"><td> Jul 26, 2016 </td><td>
   powershell-6.0.0-alpha.7.pkg
   </td><td align="right"> 25.0 MB </td></tr>
   <tr valign="top"><td> Jul 8, 2016 </td><td>
   powershell-0.6.0.pkg
   </td><td align="right"> 24.2 MB </td></tr>
   </table>

0. Open the .pkg file in the Downloads folder:
0. Click Continue, etc.

   ### In and Out #

0. Open a Terminal shell window to launch PowerShell:

   <tt><strong>
   powershell
   </strong></tt>

   The response end with <strong>"PS" in front of the file path prompt</strong>:

   <pre>
PowerShell 
Copyright (C) 2016 Microsoft Corporation. All rights reserved.
&nbsp;
PS /Users/...>
   </pre>

0. To leave PowerShell:

   <tt><strong>
   exit
   </strong></tt>


   ### Version check #

0. Check the version being used:

   <tt><strong>
   $psversiontable
   </strong></tt>

   Response:

   <pre>
Name                           Value                                           
----                           -----                                           
PSVersion                      6.0.0-alpha                                     
PSEdition                      Core                                            
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}                         
BuildVersion                   3.0.0.0                                         
GitCommitId                    v6.0.0-alpha.9                                  
CLRVersion                                                                     
WSManStackVersion              3.0                                             
PSRemotingProtocolVersion      2.3                                             
SerializationVersion           1.1.0.1       
   </pre>   

   QUESTION: What's the CLRVersion?

0. To apply certain action to type of operating system:

   <pre>
   $IsCoreCLR = True
   $IsLinux = False
   $IsOSX = True
   $IsWindows = False
   <pre>


   ### Iterate #

0. <a target="_blank" href="http://powershelldistrict.com/powershell-mac-os-x/">
   Stephane</a> shows this command to move (pipe) png files from 
   Desktop to Pictures folder:

   <pre>
   Get-ChildItem -Filter '*.png' | Move-Item -Destination '../Pictures'
   </pre>

0. List:

   <pre>
   gci ../Pictures/
   </pre>



   ### Social

0. Join the <a target="_blank" href="https://gitter.im/PowerShell/PowerShell?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge">
   Chatroom on Gitter</a>.

0. Sign-up for the Slack group at 
   <a target="_blank" href="http://slack.poshcode.org/">
   http://slack.poshcode.org</a>


## Resources #

* http://powershelldistrict.com/powershell-mac-os-x/
   was written based on alpha.9 release.

* http://powershelldistrict.com/powershell-linux/

<a target="_blank" href="https://mcpmag.com/articles/2016/04/07/powershell-functions-with-parameters.aspx">
Getting Input into Your PowerShell Functions with Parameters</a>
- shows how to build function parameters in reusable snippets.

<a target="_blank" href="https://mcpmag.com/articles/2016/03/31/timing-powershell-automations.aspx">
PowerShell Pipeline: Timing PowerShell Automations</a>
- get an accurate measurement of how long it takes to 
run a specific or set a timer for your script to run.

<a target="_blank" href="https://mcpmag.com/articles/2016/03/24/active-directory-forest-and-domain.aspx">
PowerShell Pipeline: Exploring the Active Directory Forest and Domain</a>
- use the Active Directory Module to run 
available cmdlets and automate many of your daily tasks.

<a target="_blank" href="https://mcpmag.com/articles/2016/03/02/querying-mysql-databases.aspx/">Querying MySQL Databases with PowerShell</a>
- save time by automatically querying up data.


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
