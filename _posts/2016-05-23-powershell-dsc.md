---
layout: post
title: "PowerShell Desired State Configuration"
excerpt: "Let me do it for you"
tags: [cloud, powershell, microsoft]
image:
# fig blue powershell icon-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15307772/b335270e-1b93-11e6-9552-d3022de2b9ce.jpg
  credit: PowerShell Magazine
  creditlink: http://www.powershellmagazine.com/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

This article describes the use of Windows PowerShell Desired State Configuration (DSC).

"PowerShell" refers to both the command-line shell and scripting language designed system administration. 

Built on the .NET Framework, Windows PowerShell helps IT professionals and power users control and automate the administration of the Windows operating system and applications that run on Windows. 

Windows PowerShell <strong>cmdlets</strong> (command-lets) enables computers to be managed from the command line,
much like Bash on Linux machines.

However, PowerShell offers much more consistence than the various commands added over time by various parties.

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


## Deploy as MOF #

MOF is a file extension for a Windows Management Object file format. 

MOF files created in the Managed Object Format have syntax based on Microsoft Visual C++.  

MOF files can be compiled into the Windows Management Instrumentation (WMI) repository using mofcomp.exe.

MOF files often have a partner DLL (dynamic link library) file that stores data needed for retrieval in the MOF file.

## Chef incorporates DSC #


## Resources #

Windows PowerShell 4.0 introduces Desired State Configuration (DSC), 

* <a target="_blank" href="https://www.youtube.com/watch?v=lP6noSW6Vr4">
   A Practical Overview of Desired State Configuration</a>
   TechEd North America 2014

   Windows PowerShell 4.0 introduces Desired State Configuration (DSC), and it's time to put it to use. With DSC, you declaratively ..

* <a target="_blank" href="https://www.youtube.com/watch?v=CkxVQy6ACXE">
  Why I love PowerShell Desired State Configuration and so should u</a>
  by Nicholas Dille
   https://twitter.com/NicholasDille 
   http://dille.name/blog/

* ‏@CDwithWindows


http://stackoverflow.com/questions/8153750/how-to-search-a-string-in-multiple-files-and-return-the-names-of-files-in-powers
How to search a string in multiple files and return the names of files in Powershell

## Infrastructure as Code 

<a target="_blank" href="http://www.ravichaganti.com/blog/">
Ravikanth Chaganti</a> (MVP)
(of <a target="_blank" href="http://www.powershellmagazine.com/">
PowerShell Magazine</a>
and
book PowerShell Desired State Configuration Revealed)
notes that "Infrastructure as Code" requires:

   * Reusable automation
   * Source Control
   * Unit Testing
   * Continuous Deployment
   * Integration tests, which validate the desired state
   * Operations Validation, which validates the functionality at desired state!


### Operation Validation Framework

<a target="_blank" href="https://github.com/PowerShell/Operation-Validation-Framework/">
https://github.com/PowerShell/Operation-Validation-Framework</a><br />
runs

   Get-Command -Module OperationValidation

It has two functions:

   Get-OperationValidation to Retrieve operational tests from modules
   
   Invoke-OperationValidation to run operational tests from modules




## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
