---
layout: post
title: "Azure Cloud PowerShell Scripting"
excerpt: "Do anything you want!"
tags: [cloud, powershell]
image:
# pic-darkblue-cloud-sunbeams-on-sea-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15269398/92b4ddc4-19ba-11e6-82bf-2a3f1c58d7c8.jpg
  credit: HD Wallpaper Backgrounds
  creditlink: http://hdwallpaperbackgrounds.net/clouds-hd-wallpapers/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

## One-time tasks #

### Install #

If you don't want to install these from the Web Platform Installer UI.

0. http://azure.microsoft.com/en-us/downloads
0. Click PowerShell to download WindowsAzurePowershellGet.3f.3f.3fnew.exe and invoke it to download more.

0. Click Azure Power Tools to download WindowsAzureXPlatCLI.3f.3f.3fnew.exe

   NOTE: "XPlat" means Cross-platform. It's for ASM portal usage.

   <strong>Imperative</strong> commands (verbs such as to start or stop an app or machine)
   are used in ASM.

   ARM enables infrastructure configurations to be defined 
   through a <strong>declarative syntax</strong>
   in Resource Manager <strong>templates</strong> (much like Puppet).


   <tt>PS C:\\>
   </tt>

### Get Commands #

Verify that you have Azure commands:

   <pre><strong>
   Get-Command -Module Azure | Measure-Object
   </strong></pre>

   The count is 756 commands for just Azure for ASM.

To list Azure commands for vm:

   <pre><strong>
   Get-Command -Module Azure -noun *vm*
   </strong></pre>

### Enable PS1 execution #

   <pre><strong>
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
   </strong></pre>


### What Version #

As with all PowerShell versions:

   <pre><strong>
   $PSVersionTable
   </strong></pre>

Compare against the response on Windows 7:

<pre>
Name                           Value
----                           -----
CLRVersion                     2.0.50727.5420
BuildVersion                   6.1.7601.17514
PSVersion                      2.0
WSManStackVersion              2.0
PSCompatibleVersions           {1.0, 2.0}
SerializationVersion           1.1.0.1
PSRemotingProtocolVersion      2.1
</pre>

<hr />

## On-going commands:

### Get Help #

Download help files:

   <pre><strong>
   update-help -force
   </strong></pre>

To pop-up help for a command to a different window for multiple windows:

   <pre><strong>
   help start-...  -ShowWindow
   </strong></pre>

### Clear Screen #

   <pre><strong>
   cls
   </strong></pre>

### List Mangement Verbs #

   <pre><strong>
   azure
   </strong></pre>

### Authenticate #

   <pre><strong>
   azure login
   </strong></pre>

   Copy the code and open 
   <a target="_blank" href="https://aka.ms/devicelogin">https://aka.ms/devicelogin</a>

   <pre><strong>
   azure account list
   </strong></pre>

   <pre><strong>
   add-azureaccount
   </strong></pre>

   <pre><strong>
   Get-AzureSubscription
   </strong></pre>

### Envrionment variables #

To list, remember the colon at the end:

   <pre><strong>
   Get-ChildItem Env:
   </strong></pre>

For the value to a specific variable:

   <pre><strong>
   Get-ChildItem Env:PATHEXT
   </strong></pre>

Define a temporary environment variable:

   <pre><strong>
   $env:MyTestVariable = "A temporary test variable."
   </strong></pre>

Define a new permanent environment variable:

   <pre><strong>
   [Environment]::SetEnvironmentVariable("TestVariableName", "My Value", "<em>option</em>")
   </strong></pre>

   In option is either "Machine", "User", or "Process".


### For loops #

Based on http://www.symbiosysconsulting.com/pinging-from-powershell

   <pre><strong>
   1..254 | ForEach-Object { ping "192.168.0.$_" }
   </strong></pre>

   Notice the "$_" is the placeholder variable for the range before the pipe.


   This loops through a range of IP's within an internal subnet to show which ones respond:

   <pre><strong>
   (
    (1..254) | % {
        $ping = New-Object System.Net.NetworkInformation.Ping;
        [Void](Register-ObjectEvent $ping PingCompleted -Action {
            param($s, $e);
            if($e.Reply.Status -eq "Success") {
                Write-Host $e.Reply.Address, ($e.Reply.RoundtripTime.toString() + "ms")
            }
        })
        $ping.SendPingAsync("192.168.0.$_")
    }
   ).Wait()
   </strong></pre>


