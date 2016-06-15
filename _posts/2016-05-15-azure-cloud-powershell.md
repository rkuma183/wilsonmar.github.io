---
layout: post
title: "Azure Cloud PowerShell Scripting"
excerpt: "Do anything you want!"
tags: [cloud, powershell]
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

This tutorial describes the use of Windows PowerShell on Azure cloud.

Powershell refers to both the command-line shell and scripting language designed system administration. Built on the .NET Framework, Windows PowerShell helps IT professionals and power users control and automate the administration of the Windows operating system and applications that run on Windows. Windows PowerShell <strong>cmdlets</strong>, let you manage the computers from the command line.


## One-time tasks #

<a target="_blank" href="https://technet.microsoft.com/en-us/library/dn807169.aspx">
Windows PowerShellGet Module</a>.

If you don't want to install these from the
<a target="_blank" href="https://www.microsoft.com/web/downloads/platform.aspx">Web Platform Installer (wpilauncher.exe) at
https://www.microsoft.com/web/downloads/platform.aspx</a>

### Install for ASM Imperative Commands #

   <strong>Imperative</strong> commands (verbs such as to start or stop an app or machine)
   are used in ASM.

0. http://azure.microsoft.com/en-us/downloads
0. Click PowerShell to download WindowsAzurePowershellGet.3f.3f.3fnew.exe and invoke it to download more.
0. Click Install.
0. Accept the pre-requisite of <strong>Windows Azure Powershell</strong>.

0. Click Add for <strong>Azure Cross-platform Command-line Tools</strong> to download WindowsAzureXPlatCLI.3f.3f.3fnew.exe
   aka Power Tools

   NOTE: "XPlat" means Cross-platform. It's for ASM portal usage.


### Install for ARM Declarative Templates #

   <strong>declarative syntax</strong> are defined
   in Resource Manager <strong>templates</strong>
   used by ARM to enable infrastructure configurations to be defined
   (much like Puppet).

### Install PowerShell #

Run from the <a target="_blank" href="https://www.powershellgallery.com/items?itemType=PSModule">
Powershell Gallery</a> the Workflow to Download All Gallery Modules:

0. Click the "Deploy" button or:

   <pre><strong>
   Install-Script -Name Download-AllGalleryModules
   </strong></pre>

0. Press Y to accept that the modules are from an untrusted source.

0. Click the "Deploy" button. You should see Azure's Custon Deployment bolt with Parameters:

   <amp-img width="632" height="703" alt="azure deploy 2016-05-17-1264x1406.png" src="https://cloud.githubusercontent.com/assets/300046/15326492/733d052c-1c0b-11e6-980c-fc9adef91e95.png"></amp-img>

0. Type in for new Resource Group name "Download-AllGalleryModules".
0. Click Create to see error icons.
0. Click Edit parameters.
0. Select your Resource group location (such as "East US 2").
0. Click Review legal terms then click Purchase.
0. Click Create.

### Make Imperative Commands #

   <tt>PS C:\\>
   </tt>

Windows PowerShell <strong>providers</strong> access data stores, such as the Windows Registry and certificate store, as easily as you access the file system. Install NuGet provider:

   <pre><strong>
   Install-PackageProvider -Name NuGet -Force
   </strong></pre>

Get a count of how many commands for Azure module:

   <pre><strong>
   Get-Command -Module Azure | Measure-Object
   </strong></pre>

   I got a count of 697 commands for just Azure for ASM.

List Azure commands containing "vm":

   <pre><strong>
   Get-Command -Module Azure -noun *vm*
   </strong></pre>

### Enable PS1 execution #

PowerShell commands can be be script files with <strong>.ps1</strong> file extension.

   <pre><strong>
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
   </strong></pre>


### What Version #

As with all PowerShell versions:

   <pre><strong>
   $PSVersionTable
   </strong></pre>

On Windows 10:

{% highlight text %}
Name                           Value                                                                                   
----                           -----                                                                                   
PSVersion                      5.0.10586.63                                                                            
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}                                                                 
BuildVersion                   10.0.10586.63                                                                           
CLRVersion                     4.0.30319.42000                                                                         
WSManStackVersion              3.0                                                                                     
PSRemotingProtocolVersion      2.3                                                                                     
SerializationVersion           1.1.0.1                                                                                 
{% endhighlight %}

   Compare against the response on Windows 7:

{% highlight text %}
Name                           Value
----                           -----
CLRVersion                     2.0.50727.5420
BuildVersion                   6.1.7601.17514
PSVersion                      2.0
WSManStackVersion              2.0
PSCompatibleVersions           {1.0, 2.0}
SerializationVersion           1.1.0.1
PSRemotingProtocolVersion      2.1
{% endhighlight %}

<hr />

## On-going basic commands:

List Mangement Verbs

   <pre><strong>
   azure
   </strong></pre>

Clear Screen

   <pre><strong>
   cls
   </strong></pre>

Download help files:

   <pre><strong>
   update-help -force
   </strong></pre>

Pop-up help for a command to a different window for multiple windows:

   <pre><strong>
   help Get-AzureSubscription -ShowWindow
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

   Notice "$_" is the placeholder variable for the range before the pipe.

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

Rather than looping:

## Declarative Templates #

Multiple services can be deployed at the same time (asychronously), as a group, along with their dependencies by
using a <strong>group template</strong> that defines <strong>desired end state</strong>
of application components.

The Local Configuration Manager (LCM)  introduced in Windows PowerShell 5.0 is the engine of
DSC = Desired State Configuration.

Differences in each stage of the application lifecycle can be specified.

This makes it easy to get a total bill by viewing the rolled-up costs for the entire group or for a group of resources sharing the same tag.

See <a target="_blank" href="https://azure.microsoft.com/en-us/documentation/articles/resource-group-overview/">
Azure Resource Manager overview</a> by Tom FitzMacken.

At <a target="_blank" href="http://github.com/Azure/">http://github.com/Azure</a> are<br />
sample ARM JSON templates at <a target="_blank" href="https://github.com/Azure/azure-quickstart-templates/">
azure-quickstart-template code</a> presented
<a target="_blank" href="https://azure.microsoft.com/en-us/documentation/templates/">
here</a>.

Every template contains this:

{% highlight json %}
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "conventVersion": "1.0.0.0",
    "parameters":{
      "storageAccountUniqueName": {
         "type": "String",
         "metadata": {
           "description": "Unique name of storage account"
       }
      "storageAccountType": {
         "type": "String",
         "defaultValue": "Standard_LRS",
         "allowedValues": [
              "Standard_LRS",
              "Standard_GRS",
              "Standard_RAGRS",
              "Premium_LRS",
          ]
       }
    }
  },
    "variables":{

  },
    "resources":{

  },
    "outputs":{

  }
}{% endhighlight %}

### Types #

 * Standard_LRS = Locally Redundant Storage
 * Standard_GRS = Geographically Redundant Storage
 * Standard_RAGRS = Read Access Geographically Redundant Storage
 * Premium_LRS =

## Override #

Parameters can be overriden with separate parameter files references:

{% highlight json %}
{
    "type": "Microsoft.Storage/storageAccounts",
    "name": "variables('StorageAccountName')",
    "location": "[resourceGroup().location]",
    "apiVersion": "2015-05-01-preview",
    "propterties": {
      "accountType": "[parameters('storageAccountType')]"
    }
}{% endhighlight %}

"[resourceGroup().location]" enables the resource group to span across regions.

## Load Balancer #

An example DNS host name is mydeployment.eastus.cloudapp.azure.com, IP 23.99.9.198.

Up to 100 vms can be supported by a Load Balancer.

NAT rules on the Load Balancer route inbound traffic dynamically or statically to reserved IPs.

## Virtual Machine images #

An example declarative template would include:

{% highlight json %}
    "imageReference": {
      "publisher": "MicrosoftSQLServer",
      "offer": "SQL2014-WS2012R2",
      "sku": "Standard",
      "version": "latest"
    }{% endhighlight %}

publisher options:

   * "MicrosoftSQLServer"
   * redhat
   * barracuda

sku options:

   * "Standard"
   * "Web"
   * "Enterprise"
   * "EnterpriseOptimized"
   * "EnterpriseOptimizedDW" for Data Warehouse needing fast read but can tolerate slower bulk writes
   * "EnterpriseOptimizedOLTP" needing fast read and fast write

"offer" options:

   * "SP2014SP1-WS2012R2"
   * "SQL2014-WS2012R2"
   * etc.

The equivalent

* Get-AzureRmVMImagePublisher -Location $locName | select PublisherName
* Get-AzureRmVMImageOffer -Location $locName -PublisherName $Publisher
* Get-AzureRmVMImageSku -Location $locName -PublisherName $Publisher -Offer $offer
