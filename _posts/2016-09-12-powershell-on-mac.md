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

PowerShell is an <strong>object-centered</strong> "management engine"
that can be hosted in an application program.

   * CMD in Windows
   * PowerShell ISE (from Microsoft)
   * PowerGUI
   * SAPIEN Technologies PowerShell Studio
   * Idera PowerShell Pro
   <br /><br />


PowerShell promises more consistency than the 
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

0. Check the version of PowerShell being used by calling a
   <strong>pre-defined variable</strong>:

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

   ### Versions of PowerShell:

   * 5.1 for Mac/Linux
   * 5.0 
   * 4.0 in 2014 with Windows 10 and .NET Framework 4.0 and 
   Windows Management Framework 3.0
   * 3.0 in 2012 with Windows 8/Server 2012
   * 2.0 appeared in 2009
   * 1.0 appeared in 2006
   <br /><br />

0. To leave PowerShell, it's the same as in Bash scripts:

   <tt><strong>
   exit
   </strong></tt>


## Execute script file #

I like using script files rather than typing because
it allows me to focus on the latest in what is usually
a long string of commands necessary in today's complex world.

To call scripts, an example:

   <pre><strong>
   & ".\basics.ps1"
   </strong></pre>

   PROTIP: Make sure that when a file with .ps1 extension is clicked from Folder,
   the script is not launched to run, but that the script appears in a text editor.

   A sample command to invoke the script including an execution policy :

   <pre>
Powershell -executionpolicy remotesigned -command { import-module ‘C:\Users\pm\Documents\WindowsPowerShell\Modules\MyTwitter’ ;Send-Tweet -Message ‘Message_ Twitter2’}
   </pre>

   Notice it's "powershell" and not "powershell.exe" because Mac and Linux
   don't recognize .exe.

   When a script is signed, its location is locked to a specific full directory path,
   even when it's in the current folder.

   "remotesigned" is important because
   if this script has not been digitally signed, 
   one needs to set PS execution policy to 
   “RemoteSigned” (or “Unrestricted”) after 
   reopening PowerShell as an Administrator to run:

   By default PowerShell prevents the execution of PowerShell scripts on Windows systems.

   <tt><strong>
   <a target="_blank" href="http://www.adminarsenal.com/powershell/set-executionpolicy/">Set-ExecutionPolicy</a> RemoteSigned
   </strong></tt>

   Get a list of current security settings:

   <tt><strong>
   Get-ExecutionPolicy -List | Format-Table -AutoSize
   </strong></tt>

   See https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/

https://github.com/MeshkDevs/InvokeTwitterAPIs



   ## Verify a signed script can be used #

0. Set

   <tt><strong>
   Set-ExecutionPolicy AllSigned
   </strong></tt>

### Install a signing cert on Mac #

To add the CA root certificate (either PEM or DER format) into the OSX global keychain:

0. Use Finder to navigate to your /System -> Library -> Keychains -> X509Anchors 
   to your own Library -> Keychains. 

0. In a Terminal shell window, run command:

   <tt><strong>
   certtool i mycertificate.crt k=X509Anchors 
   </strong></tt>

   Add a "d" at the end for DER format.

0. Copy your Library -> Keychains -> X509Anchors back to 
   /System -> Library -> Keychains. 

   Use sudo.



## Version Logic: If Then Else #

I haven't found a way to have a Bash script that 
can also be run as a PowerShell script.

PROTIP: Switching from Bash to PowerShell means a one-time migration and there is no turning back unless you want to maintain
parallel scripts.

This is largely because of differences in if/then/else coding.
   The same if/then/else syntax in PowerShell scripts for
   Mac and PC is needed for the same script file to be used.

   On Bash:

   <pre>
   if [ "$IsWindows" = True ]; then
       echo "Do Windows"
   fi
   </pre>

> The question is whether a single PowerShell script can really
run on both Mac and Windows. Do a parallel run.

   For different actions in PowerShell according to type of operating system:

   <pre>
If ($IsWindows -eq True) { echo "IsWindows"}
   echo "Windows"
   # use "C:/Users/%USERNAME%/.ssh/id_rsa.pub"
ElseIf ($IsOSX -eq True) {"IsOSX"}
   echo "OSX"
   # use "~/.ssh/id_rsa.pub"
Else {"Something else"}

   </pre>


### Comparison Operators #

-eq / -ne / -ge

-Like / -NotLike wildcard string - $name -like "*sh"

-Match / -NotMatch regular expression - $name -match "sh$"

-Contains / -NotContains a value in array - $name -contains "jo"

-In / -NotIn Is a value in an array - "joe" -in $name

## Logical operators #

-And

-Or

-Xor = Logical exclusive or.


## Tilde and Providers ##

PROTIP: Use <strong>$home</strong> instead of using the <strong>tilde</strong> (~)
in PowerShell because tilde does not always represent the 
the user's home folder as in Linux.
This is because PS has different
"providers" that include HKLM and HKCU top-levels in the Windows Registry.
PowerShell calls files "items" as a term that groups files with registry keys and variables.

   <tt><strong>
   get-item ~
   </strong></tt>

   returns the Mode and LastWriteTime of the user.

Instead of "mkdir" to create folders, use 

   New-Item

To list files in a folder, it's the same as in Bash:

   ls -al

PowerShell <strong>cmdlets</strong> (command-lets) 
enables computers to be managed from the command line,
much like Bash shell scripts on Linux machines.
How many are there?

   <tt><strong>
   (get-command).count
   </strong></tt>


## Handling secrets ##

PROTIP: Files containing secrets, such as passwords and
certificates are NOT stored in GitHub nor script files,
   but in a separate location, and backed up among
   other local files.

   The secrets are retrieved into the script at run-time.

See my tutorial on [GitHub Data Security](/data-security-github/)


## Hash tables #

   BTW, keys in a hash table must be unique.

   Hash tables are used throughout PowerShell, as in Windows event logs:

   <pre><strong>
   $source = get-eventlog system -newest 100 | group Source -AsHashTable
   </strong></pre>

   But the above doesn't work on Mac/Linux.

   With hash tables, sort after using the GetEnumertor(), as in:

   <pre>
   $source.GetEnumerator() | Sort name | select -first 5
   </pre>


   ### Objects ###

   <tt><strong>
   get-service m* | where {$_.status -eq 'running'}<br />
   get-service m* | where status -eq 'running'
   </strong></tt>

   The "$_" represents the current object in v2 can 
   handle more complexity than v3 syntax:



   ### Across platforms ###

   To list all environment variables:

   <tt><strong>
   dir env:\<br />
   Get-ChildItem Env:
   </strong></tt>

   PROTIP: Environment variables defined in Bash scripts
   can be read by PowerShell scripts and visa-versa.

   To get the value of a single environment variable:

   <tt><strong>
   Get-ChildItem Env:USER<br />
   Get-ChildItem Env:AWS_DEFAULT_REGION
   </strong></tt>



## Alias not parameters #

Many Bash commands work in PowerShell (ls, cat, echo) because
<strong>Aliases</strong> make many commands in Bash scripts work:

   <tt><strong>
   get-alias echo
   </strong></tt>

   The response is "Write-Output".

   BTW, Write-Host skips the pipeline (not redirected)

   Write-Host $env:computername -foreground Green

   "--passthru" means do not go through Pipeline.

However, many parameters are not recognized.
For example, this common command results in an error:

   ls -al

   Instead, use:

   <tt><strong>
   dir -File | format-table<br />
   </strong></tt>

   NOTE: dir is an alias to Get-ChildItem.


## Paths #

Instead of "rm -rf" in Bash:
https://blogs.technet.microsoft.com/heyscriptingguy/2012/02/22/the-best-way-to-use-powershell-to-delete-folders/

   <pre><strong>
   Remove-Item -path c:\* -Filter *text* -WhatIf
   </strong></pre>

   "-WhatIf" specifies a dry-run.

## Combine files

   Ro add the content of several files into a single text file:

   <pre><strong>
   Get-Content "directory path"\*.txt -Force | Set-Content "directory path"\results.txt
   </strong></pre>

## Cmdlets #

PS has some smarter parameters, such as filtering for files only
and running recursively into sub-folders:

   <tt><strong>
   dir c:\work\*.ps1 -file -recurse
   </strong></tt>

All PowerShell cmdlets follow a standardized verb-noun 
naming convention that makes it easy to look up, find, and use cmdlets.

   <tt><strong>
   get-command -verb export<br />
   get-command -noun ACL
   </strong></tt>

   REMEMBER: Capitalization counts within PowerShell.

## paths #

   Only 25% of cmdlets are shipped with paths.


## Strings #

   PROTIP: Don't use "+" for string concatenation.

   ### .NET Framework members

   Initially built on Microsoft's .NET Framework, PowerShell
   can refer to a static .NET member in square brackets
   with two colons to specify Pi:

   <tt>
   [math]::pi
   </tt>

   It's wonderful that PowerShell doesn't require an echo to display the value of objects.

   To delete a file in the .NET I/O directory object:

   <pre>
   [io.directory]::Delete("C:\test*")
   </pre>

   The issue with using .NET objects is that they may execute in a different folder context
   than PowerShell.

   TODO: $prompt


   ### Other pre-defined variables #

0. To count the number of cmdlets:

   <pre>
   $size/1MB
   </pre>

   To get the current folder:

   <pre><strong>
   $MyFileName = "data.txt"
   $filebase = <strong>$PSScriptRoot</strong> + "\" + $MyFileName
   </strong></pre>

   Alternatively, use (since v2):

   <pre><strong>
   (Resolve-Path .\).Path
   </strong></pre>

   This returns a PathInfo object.

   $scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent


## Dates #

Based on http://ss64.com/ps/syntax-dateformats.html

   <pre><strong>
   Get-Date -Format "yyyy-MM-dd HH:mm"<br />
   $time = (Get-Date).AddDays(-30) -Format "yyyy-MM-dd HH:mm"

   $dirName  = [io.path]::GetDirectoryName($path)
$filename = [io.path]::GetFileNameWithoutExtension($path)
$ext      = [io.path]::GetExtension($path)
$newPath  = "$dirName\$filename $(get-date -f yyyy-MM-dd)$ext"
   </strong></pre>


## Zip files using functions #

   <pre>
# http://www.adminarsenal.com/admin-arsenal-blog/powershell-zip-up-files-using-.net-and-add-type/
$SourceFolder    = "C:\temp\Zip This Folder"
$DestinationFile = "C:\temp\NewZip.zip"
$Compression     = "Optimal"  # Optimal, Fastest, NoCompression
&nbsp;
Zip-Directory -DestinationFileName $DestinationFile `
    -SourceDirectory $SourceFolder `
    -CompressionLevel $Compression ` #Optional parameter
    -IncludeParentDir #Optional parameter
&nbsp;
function Zip-Directory {
    Param(
      [Parameter(Mandatory=$True)][string]$DestinationFileName,
      [Parameter(Mandatory=$True)][string]$SourceDirectory,
      [Parameter(Mandatory=$False)][string]$CompressionLevel = "Optimal",
      [Parameter(Mandatory=$False)][switch]$IncludeParentDir
    )
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $CompressionLevel    = [System.IO.Compression.CompressionLevel]::$CompressionLevel  
    [System.IO.Compression.ZipFile]::CreateFromDirectory($SourceDirectory, $DestinationFileName, $CompressionLevel, $IncludeParentDir)
}
   </pre>



## Pipelines #

Instead of just parsing text (as *Nix shells do),
PowerShell works with objects in a <a href="#Pipelines">pipeline</a>.

Piping:

   To list all variables defined and their values:

   <tt><strong>
   Get-Variable | Out-String
   </strong></tt>

   PROTIP: With PowerShell, it's best to use out-file instead of ">" redirect character:

   <tt><strong>
   dir -file -hidden | out-file -filepath rootfiles.txt<br />
   </strong></tt>

Error handling:

   Use preference variables for stream redirection:

   1> Success
   2> Error
   3> Warning
   4> Verbose
   5> Debug

   NOTE: Can Only merge to the success stream.

   <strong>$Error</strong> is the automatic array that stores the last 256
   exceptions (objects in error) - the default $MaximumErrorCount.

   Error action preferences:

   0 = Silently Continue<br />
   1 = Stop<br />
   2 = Continue<br />
   3 = Inquire<br />
   4 = Ignore [parameter value only]

## Module to call REST API #

   <a target="_blank" href="https://marckean.com/2015/09/21/use-powershell-to-make-rest-api-calls-using-json-oauth/">
   This</a> suggests this

   <pre>
   $J = Invoke-WebRequest -Uri http://search.twitter.com/search.json?q=PowerShell | ConvertFrom-Json
   </pre>

   But Twitter no longer permits anonymous calls to their API.

   From https://apps.twitter.com/ define a new app. 
   In Permissions tab, select Read-only. Click Update Settings.
   In Key and Access Tokens tab, click "Create my access tokens".
   Copy the Consumer Key (API key) and paste in ~/.passwords as TWITTER_TOKEN.

   It takes 
   <a target="_blank" href="https://marckean.com/2015/09/21/use-powershell-to-make-rest-api-calls-using-json-oauth/">
   many lines</a> to mess with OAuth, 
   so I make use of Adam's library for Twitter's v1.1 API described at:<br />
   http://www.adamtheautomator.com/twitter-module-powershell/

0. <a target="_blank" href="https://gallery.technet.microsoft.com/scriptcenter/Tweet-and-send-Twitter-DMs-8c2d6f0a">
   https://gallery.technet.microsoft.com/scriptcenter/Tweet-and-send-Twitter-DMs-8c2d6f0a</a><br />
   called "Tweet and send Twitter DMs with Powershell".

   Adam's "MyTwitter.psm1" I've download had 229 lines on 8/31/2014.

   PROTIP: The ".psm1" extension means it's a PowerShell module.

   I used a text editor to edit the file to paste in variables for the 4 credentials from Twitter.

   <pre>
      [Parameter()]
      [string]$ApiKey    = $SECRETS.TWITTER_APIKEY,
      [Parameter()]
      [string]$ApiSecret = $SECRETS.TWITTER_APISECRET,
      [Parameter()]
      [string]$AccessToken = $SECRETS.TWITTER_ACCESSTOKEN,
      [Parameter()]
      [string]$AccessTokenSecret = $SECRETS.TWITTER_APISECRET
   </pre>

   I then saved the module in the same GitHub folder as my script,
   and added a command to pull the module into the script:

   <pre>
   Import-module "../MyTwitter.psm1"
   </pre>

   <a target="_blank" href="http://stevenmurawski.com/powershell/2012/01/powershell-v3-auto-loading-of-modules/">
   The alternative</a> is to put the module in the PSModulePath,
   which enables tab completion to complete the names of commands from modules that are not loaded.  

   The module has these functions:

   * Get-OAuthAuthorization
   * Send-Tweet
   * Send-TwitterDm
   <br /><br />

0. Paste in your PowerShell script:

   <pre><strong>
   Send-Tweet -Message '@adbertram Thanks for the Powershell Twitter module'
   </strong></pre>

   BTW, PowerShell cmdlets in https://github.com/Iristyle/Posh-GitHub
   is only for use on Windows.

Trevor Sullivan
https://channel9.msdn.com/Blogs/trevor-powershell/Automating-the-GitHub-REST-API-Using-PowerShell

   ## JSON from REST API #

   To extract out a key from the JSON file:

   <pre>
   $x.Stuffs | where { $_.Name -eq "Darts" } 
   </pre>

https://www.pluralsight.com/courses/powershell-modules-advanced-functions-building


### Profile scripts #


<a target="_blank" href="https://app.pluralsight.com/library/courses/powershell-v3-essentials-it-pt3/table-of-contents">Jeff Hicks notes</a> these profile scripts execute automatically at start:

   To view all profiles:

   <tt><strong>
   $profile | select *
   </strong></tt>


<table border="1" cellpadding="4" cellspacing="0">
<tr valign="bottom"><th> Folder </th><th> Script file </th><th> Script name </th></tr>
<tr valign="top"><td rowspan="3"> C:\Windows\ System32\ WindowsPowerShell\ v1.0\ 
                      </td><td align="right"> profile.ps1 </td><td> AllUsersAllHosts </td></tr>
  <tr><td align="right"> Microsoft.PowerShell.profile.ps1 </td><td> AllUsersCurrentHost </td></tr>
  <tr><td align="right"> Microsoft.PowerShellSE.profile.ps1 </td><td> AllUsersCurrentHost (ISE) </td></tr>
<tr valign="top"><td rowspan="3"> C:\Users\&LT;user&GT;\Documents\ WindowsPowerShell\ or /Users/&LT;user&GT;/ .config/powershell/
  </td><td align="right"> Microsoft.PowerShell.profile.ps1 </td><td> CurrentUsersAllHosts* </td></tr>
  <tr><td align="right"> profile.ps1 </td><td> CurrentUserCurrentHost </td></tr>
  <tr><td align="right"> Microsoft.PowerShellSE.profile.ps1 </td><td> CurrentUserCurrentHost (ISE) </td></tr>
</table>


* = This is the one shown when $profile is typed in.


   Corporate IT departments may use Group Policies.


## Iterate #

0. <a target="_blank" href="http://powershelldistrict.com/powershell-mac-os-x/">
   Stephane</a> shows this command to move (pipe) png files from 
   Desktop to Pictures folder:

   <pre>
   Get-ChildItem -Filter '*.png' | Move-Item -Destination '../Pictures'
   </pre>

   A variable can contain an array:

   <pre><strong>
   $files = dir c:\script -file
   Foreach ($file in $files){
      $fileage = ((get-Date)) - $file.LastWriteTime )
      "$($file.name) = $fileage" | Out-File ...
   }
   </strong></pre>



## Social #

<a target="_blank" href="https://gitter.im/PowerShell/PowerShell">
Join the conversation on Gitter</a>

Noteworthy pages in the <a target="_blank" href="https://github.com/PowerShell/PowerShell/blob/master/docs/FAQ.md">
FAQ</a>:

   * https://blogs.msdn.microsoft.com/kebab/2013/06/09/an-introduction-to-error-handling-in-powershell/
   * http://ss64.com/ps/syntax.html
   * https://github.com/PoshCode/PowerShellPracticeAndStyle
   <br /><br />


## Social sites #

* Twitter @powershell by the @PowerShell_Team.

* Twitter @PowerShellMag

* Join the <a target="_blank" href="https://gitter.im/PowerShell/PowerShell?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge">
   Chatroom on Gitter</a>.

0. Sign-up for the Slack group at 
   <a target="_blank" href="http://slack.poshcode.org/">
   http://slack.poshcode.org</a>


## Resources #

* <a target="_blank" href="https://powershell.org/">
   PowerShell.org</a>

* http://slack.poshcode.org/

* http://powershelldistrict.com/powershell-mac-os-x/
   was written based on alpha.9 release.

* http://powershelldistrict.com/powershell-linux/

* <a target="_blank" href="https://mcpmag.com/articles/2016/04/07/powershell-functions-with-parameters.aspx">
Getting Input into Your PowerShell Functions with Parameters</a>
- shows how to build function parameters in reusable snippets.

* <a target="_blank" href="https://mcpmag.com/articles/2016/03/31/timing-powershell-automations.aspx">
PowerShell Pipeline: Timing PowerShell Automations</a>
- get an accurate measurement of how long it takes to 
run a specific or set a timer for your script to run.

* <a target="_blank" href="https://mcpmag.com/articles/2016/03/24/active-directory-forest-and-domain.aspx">
PowerShell Pipeline: Exploring the Active Directory Forest and Domain</a>
- use the Active Directory Module to run 
available cmdlets and automate many of your daily tasks.

* <a target="_blank" href="https://mcpmag.com/articles/2016/03/02/querying-mysql-databases.aspx/">Querying MySQL Databases with PowerShell</a>
- save time by automatically querying up data.


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
