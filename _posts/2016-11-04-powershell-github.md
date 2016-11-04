---
layout: post
title: "PowerShell GitHub API Programming"
excerpt: "Reaching to web servies on the web gives scripts data power"
tags: [cloud, powershell, microsoft]
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

For my class on Git and GitHub,
I wrote a shell script which executes a sequence of commands so learners
can experiement with the impact of changes have on the end state.

The script establishes local aliases, and pulls in secrets 
stored in a separate file to create environment variables in the script.

At the end of the script, it creates a local Git repository,
then puts it in a new GitHub. To make the script idempotent,
it deletes the prior version of the repo on GitHub as well.

I have a working Bash shell script.
But when Microsoft open sourced PowerShell in August 2016, 
I began ported it to PowerShell so I only need to maintain one script for all platforms
(Windows, Mac, Linux).

## Bash Shell Script

Windows 10 laptops can run Bash scripts


## PowerShell Script

TODO: Need to add code to create a repo in GitHub.


## PowerShellForGitHub

The PowerShell team created
   <a target="_blank" href="https://github.com/PowerShell/PowerShellForGitHub/">
   https://github.com/PowerShell/PowerShellForGitHub</a>
   which exists within Microsoft's 
   <a target="_blank" href="https://blogs.technet.microsoft.com/poshchap/2015/08/07/getting-started-with-the-powershell-gallery/">
   PSGallery repository ecosystem</a> which consists of 
   <strong>modules</strong>.

   It's a <a target="_blank" href="https://www.simple-talk.com/sysadmin/powershell/managing-packages-using-windows-powershell/">
   package manager</a>
   like Chocolatey for Windows Desktops 
   and the Advanced Packaging Tool (APT) of Linux distributions. 

0. List all the modules (in a PowerShell CLI Terminal window):

   <tt><strong>
   Find-Module
   </strong></tt>

   There's a lot there.

   `(Find-Module).count` returned 1084 on November 4, 2016.

0. This is necessary to avoid errors when modules are installed:

   <tt><strong>
   Set-PSRepository -Name PSGallery -InstallationPolicy Trusted 
   </strong></tt>

   If it worked, no text is returned, just the PowerShell prompt again.

   <pre>
Untrusted repository
You are installing the modules from an untrusted repository. If you trust this 
repository, change its InstallationPolicy value by running the Set-PSRepository
 cmdlet. Are you sure you want to install the modules from 'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help 
(default is "N"):
   </pre>

0. The GitHub README says to rename ApiTokensTemplate.psm1 to ApiTokens.psm1 and 
   update value of $global:gitHubApiToken with GitHub token for your account.

   QUESTION: how do I do that before having the file?

0. Install 
   <a target="_blank" href="https://www.powershellgallery.com/packages/PowerShellForGitHub">
   the latest module in PS Gallery</a>
   within the PowerShell CLI:

   <tt><strong>
   Install-Module -Name PowerShellForGitHub
   </strong></tt>

   BLAH: The response I got is an error, but the message showed me where the file
   is installed:

   <pre>
PackageManagement\Install-Package : Could not find a part of the path 
'<strong>/usr/local/microsoft/powershell/6.0.0-alpha.10/Modules/PowerShellForGitHub/0.1.0</strong>'.
Installing package 'PowerShellForGitHub'                                  
At /usr/local/microsoft/powershell/6.0.0-alpha.10/Modules/PowerShellGet/PSModul e.psm1:1711 char:21                                                             + ...          $null = PackageManagement\Install-Package @PSBoundParameters
+                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ CategoryInfo          : NotSpecified: (Microsoft.Power....InstallPackage 
   :InstallPackage) [Install-Package], Exception
+ FullyQualifiedErrorId : System.IO.DirectoryNotFoundException,Microsoft.PowerShell.Commands.CopyItemCommand,Microsoft.PowerShell.PackageManagement.  
  Cmdlets.InstallPackage
   </pre>

   Looking into the folder, there are a lot of .dll files.

0. Uninstall

   <tt><strong>
   Uninstall-Module PowerShellForGitHub
   </strong></tt>

   BLAH: This is the error message I received:

   <pre>
PackageManagement\Uninstall-Package : No match was found for the specified 
search criteria and module names 'PowerShellForGitHub'.
At /usr/local/microsoft/powershell/6.0.0-alpha.10/Modules/PowerShellGet/PSModul
e.psm1:2096 char:21
+ ...        $null = PackageManagement\Uninstall-Package @PSBoundParameters
+                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (Microsoft.Power...ninstallPacka 
   ge:UninstallPackage) [Uninstall-Package], Exception
    + FullyQualifiedErrorId : NoMatchFound,Microsoft.PowerShell.PackageManagem 
   ent.Cmdlets.UninstallPackage
   </pre>

0. Since I was running a Mac, I got rid of it and went without using a library.

