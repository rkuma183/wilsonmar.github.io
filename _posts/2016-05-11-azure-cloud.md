---
layout: post
title: "Azure Cloud"
excerpt: "Challenger becomes a leader"
tags: [cloud]
image:
# azure ms logo wait 1900x500-39kb.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/18188069/153fbcca-706c-11e6-983d-0783da57f75c.jpg
  credit: Microsoft Azure
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

This article contains higher-level technical details on Microsoft Azure,
but with less confusing grandiose marketing generalizations.


## Architectural components #

<amp-img width="650" height="252" alt="azure compute platform 650x252-c60.jpg"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/16688245/6898a7a0-44da-11e6-9245-ee5e1ff729f9.jpg">
</amp-img>

Developers interact with these platforms as a service (PaaS) for "Rapid Development":

   * <a href="#ServiceFabric">Service Fabric</a> apps
   * Power apps
   * Web apps
   * Mobile apps (Xamarin)

   * Media Services
   * Stream Analytics

Operations interact with these Infrastructure as a service (IaaS) 
components for "High Control":

   * Azure Service Fabric
   * Azure Batch
   * Define Virtual Machines
   * Define VM Scale Sets
   * VM Extensions
   * Azure Container Service that uses Docker Swarm
   * Cloud Foundry
   * Open Shift
   * Kubernetes 
   * Apprenda
   * Jelastic


## Two Azure portals #

Right off the bat, know that Microsoft is transitioning from the "classic"
Azure Service Management (ASM) portal to the
Azure Resource Manager (ARM) portal.

* <a target="_blank" href="https://azure.microsoft.com/en-us/features/azure-portal/availability/">
   Which portal supports each Azure service, listed alphabetically</a>

ARM is structured with Resource Groups (logical containers)
instead of ASM "Cloud Services" and "Affinity Groups".

NOTE: Instead of 2 racks, ARM resources can span 3 racks.

## Sign-up #

The steps to "Create an API gateway and Developer Portal in minutes".

0. https://account.windowsazure.com/signup

0. https://myprodscussu1.app.vssubscriptions.visualstudio.com/Dashboard
   to activate my BizSpark account $25/month Azure credit.

0. Verfication by text message or call does not use land-line VOIP phone numbers,
   only cellular numbers.

0. Input credit card (even though it's free).

0. Click "Start Managing my service" for https://portal.azure.com/


## Create instance #

0. <a target="_blank" href="https://portal.azure.com/">
   https://portal.azure.com</a>

0. Select Resource group location / [Region](/cloud-regions/))

0. Options include the classic ASM (Azure Service Manager)
and newer <a target="_blank" href="https://azure.microsoft.com/en-us/documentation/articles/resource-group-overview/">
ARM (Azure Resource Manager)</a>:

   * Apps Services
   * Virtual machines (classic)
   * Virtual machines
   * SQL databases
   * Cloud services (classic)
   * Security Center

   * Active Directory
   * Storage
   * Messaging
   * Networking
   * Management
   <br /><br />

   Each drill-down into ARM creates an additional ___ to the right.


## Installers #

* <a target="_blank" href="https://azure.microsoft.com/en-us/documentation/templates">
   Templates</a> at
   <a target="_blank" href="https://github.com/Azure/azure-quickstart-templates">
   https://github.com/Azure/azure-quickstart-templates</a>

* <a target="_blank" href="https://azure.microsoft.com/en-us/downloads/">
   https://azure.microsoft.com/en-us/downloads</a>

<a name="Commands"></a>

## Commands #


### Install Commands #


   and deployed as groups
   (a container for each lifecycle deployment cycle)

   Each resource group defines scope access control for administrative actions.

   Tags are used for all other organization of resources.

<a name="AzureLogin"></a>

## Azure Login #

   <tt><strong>
   Login-AzureRmAccount
   </strong></tt>

   Type your credentials and press OK.

   A sample response:

   {% highlight text %}
   Environment           : AzureCloud
   Account               : ???@hotmail.com
   TenantId              : ????????-5f96-4d36-a89b-5ea0f7614e72
   SubscriptionId        : ????????-cf54-443f-b0f1-bcc5e78e9c27
   CurrentStorageAccount :
   {% endhighlight %}

<a name="ResourceGroups"></a>

## Azure Resource Groups

Every resource is in only one group, listed here by stack:

* Web Apps
* SQL
* Storage
* VMs
* NICs
* Virtual Networks

A resource group can contain resources residing in different <strong>regions</strong>.

   <tt><strong>
   Get-AzureRmResourceProvider
   </strong></tt>


<a name="ContainerService"></a>

## Azure Container Service (ACS) #

Microsoft created and maintains the Azure Container Service with 
<a target="_blank" href="https://mesosphere.com/">Mesosphere.com</a>

with standard Docker tooling and API.

Streamlined provisioning of DC/OS Clusters

and Docker Swarm support


Mesos-DNS for service discovery and registration
(no health checks)

<a target="_blank" href="https://mesosphere.github.io/marathon/docs/native-docker.html">
DC/OS Marathon load balancer</a> support of
<a target="_blank" href="https://docs.mesosphere.com/1.7/usage/cli/command-reference/">
dcos cli commands</a>
needs to be installed.
Backed up as a HA Proxy.


"Minuteman" provides virtual IPs stored in IP tables synced across the cluster.


<a name="ServiceFabric"></a>

## Azure Service Fabric #

<amp-img width="611" height="296" alt="azure service fabric 20160708-611x296-c60.jpg"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/16689972/cfcc70b6-44e2-11e6-9b32-a15ad6085ee5.jpg">
</amp-img>


Azure Service Fabric enables you to talk to a cluster of machines as if they were one.

An Azure Service Fabric agent runs on each machine 
-- in Amazon or private cloud as well.

   * One call to manage capacity (add and remove nodes at will)
   * Service endpoint discovery
   * Create (immutable) containers
   * Deploy software to containers

   * health reporting
   * Monitoring based on queue length
   * Dynamic resource balancing based on actual resource usage (queue length)
   * Move resources from one node to another

   * coordinate upgrades (select what node to upgrade)
   * Diagnostics in F5

Different services can run on the same machine.

Azure Service Fabric offers a substitute for external storage via its 
<strong>Reliable Collections</strong> programming model
accessing dictionary entries.


<a name="ScaleSets"></a>

### Load Scale sets #




<a name="AzureCert"></a>

## Azure Certification #

* <a target="_blank" href="https://www.microsoft.com/en-us/learning/mcsd-azure-architect-certification.aspx">
   MCSD Solutions Developer: Azure Solutions Architect</a>

* <a target="_blank" href="https://azure.microsoft.com/en-us/community/training/">
   community training</a>

* <a target="_blank" href="https://azure.microsoft.com/en-us/marketplace/programs/certified/">
   certification for apps</a>

* <a target="_blank" href="https://mva.microsoft.com/product-training/microsoft-azure#!lang=1033">
   Microsoft Virtual Academy courses</a>

* <a target="_blank" href="https://www.opsgility.com/">
   Opsgility.com</a> provides hands-on, deep-dive training


### Exam 70-532 - Developing Microsoft Azure Solutions

*    Compare the services available in the Azure platform
*    Configure and deploy ASP.NET web applications
*    Creating Azure WebSites from the gallery
*    Deploying and monitoring Azure WebSites
*    Creating and configuring Azure Virtual Machines
*    Describe the relationship between Cloud Services and Virtual Machines
*    Deploy existing Cloud Service packages
*    Create and manage a Storage account
*    Manage blobs and containers in a Storage account
*    Create, configure and connect to a SQL Databases instance
*    Identify the implications of importing a SQL Standalone database
*    Manage users, groups and subscriptions in an Azure Active Directory instance
*    Create a virtual network
*    Implement a point to site network

<a target="_blank" href="https://app.pluralsight.com/library/courses/azure-solutions-web-apps-70-532/table-of-contents/">
Design and Implement Web Apps for Azure Solutions (70-532)
5h 31m video from Pluralsight</a> Aug 30, 2016
by Tim Warner 


### Exam 70-533 - Implementing Microsoft Azure Infrastructure Solutions

This is based on ASM vs. new ARM.

By <a target="_blank" href="http://www.timwarnertech.com/">Tim Warner</a>:

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/preparing-pass-microsoft-azure-70-533-exam">
   Preparing to Pass the Microsoft Azure (70-533) Exam</a>
   Intermediate Mar 04, 2016 1h 30m (17)

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/implementing-websites-azure-infrastructure-70-533">
   Implementing Web Apps for Azure Infrastructure (70-533)</a>
   Beginner Mar 15, 2016 4h 26m (14)

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/implementing-virtual-machines-azure-infrastructure-70-533">
   Implementing Virtual Machines for Azure Infrastructure (70-533)</a>
   Intermediate Apr 27, 2016 4h 46m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/implementing-cloud-services-azure-infrastructure">
Implementing Cloud Services for Azure Infrastructure (70-533)</a>
by Razi bin Rais Intermediate Jul 09,  2015 2h 52m (111)


### Exam 70-534 - Architecting Azure Solutions

* <a target="_blank" href="https://app.pluralsight.com/library/courses/architecting-azure-solutions-70-534-secure-resources">
   Secure Resources</a>
   by Orin Thomas Intermediate Jan 06, 2016 3h 0m (15)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-solutions-70-534-storage-data-access">
   Design an application storage and data access strategy</a>

* <a target="_blank" href="https://app.pluralsight.com/library/courses/architecting-azure-solutions-70-534-design-application">
   Design an Advanced Application</a>
   by Orin Thomas Intermediate Mar 10, 2016 1h 40m

* Design Web Apps

* Design a management, monitoring, and business continuity strategy

* <a target="_blank" href="https://app.pluralsight.com/library/courses/architecting-azure-solutions-70-534-infrastructure-networking">
   Infrastructure and Network</a>
   by Orin ThomasIntermediateNov 22, 20153h 52m

* Up to 5 VIPs per service.

## Overview Videos

* <a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-big-picture">
Windows Azure: The Big Picture
by David Chappell Beginner Aug 19, 2012 1ah 23m (811)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-fundamentals">
Windows Azure Fundamentals</a>
by Matt Milner Intermediate Mar 26, 2010 4h 57m (156)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/pluralsight-original-microsoft-azure-enterprises">
Microsoft Azure for Enterprises: What and Why</a>
by David Chappell Beginner Jun 05,  2015 1h 13m (446)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-big-picture/table-of-contents">
Microsoft Azure: The Big Picture</a>
by Matt Milner  Beginner Mar 10, 2016 1h 50m
	@Matt Milner, mattmilner.com

* <a target="_blank" href="https://app.pluralsight.com/library/courses/modernizing-websites-microsoft-azure">
   Modernizing Your Websites with Azure Platform as a Service</a>
   by Troy HuntIntermediateApr 02, 20155h 26m

## Overview Tech Videos

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-marketplace/">
Windows Azure Marketplace</a>
by Joe Kunk Intermediate Dec 19, 2013 1h 56m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/applied-windows-azure/table-of-contents/">
Applied Windows Azure</a>
by Vishwas Lele Intermediate Feb 18, 2014 4h 51m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/designing-azure-hybrid-cloud/">
Designing a Hybrid Cloud in Azure</a>
by Gavin McShera Intermediate Apr 04, 2016 2h 8m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-sb">
Windows Azure Service Bus</a>
by Scott Seely Intermediate Jan 08, 2012 2h 5m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-service-brokered-messaging">
Microsoft Azure Service Bus Brokered Messaging In-depth</a>
by Alan Smith Advanced Dec 08,  2015 4h 43m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-remote-app-getting-started">
Getting Started with Azure Remote App</a>
by Adnan Cartwright Beginner Sep 21,  2015 1h 20m (26)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/understanding-microsoft-azure-amazon-aws">
Microsoft vs. Amazon</a>

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-websites-web-jobs">
Azure Websites and WebJobs</a>
by Matt MilnerIntermediateOct 12, 20143h 47m (155)


##  AD:

* <a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-access-signatures-getting-started">
Getting Started with Microsoft Azure Shared Access Signatures</a>
by Max McCarty Beginner Nov 02,  2015 2h 18m (20)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/hybrid-identity-microsoft-azure">
Getting Started: Hybrid Identity with Microsoft Azure</a>
by Gary Grudzinskas Intermediate Mar 02, 2016 2h 12m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-acs">
Windows Azure Access Control Service</a>
by Scott Seely Intermediate Jan 04, 2012 2h 10m (114)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-ad-deploying-integrating">
Deploying and Integrating Azure AD</a>
by John Savill Intermediate Jan 21, 2016 3h 22m (13)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-ad-managing">
Managing Azure AD</a>
by John Savill Intermediate Apr 28, 2016 2h 54m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-active-directory-developers">
Azure AD for Developers</a>
by Sahil Malik Intermediate Mar 22, 2016 4h 52m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-hybrid-connections-first-look">
Azure Hybrid Connections: First Look</a>
by Dan Toomey Beginner Jun 12,  2015 1h 48m (59)


##  Operations:

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-elastic-scale">
Elastic Scaling on Windows Azure</a>
by Zoiner Tejada Intermediate Dec 20, 2012 1h 55m (43)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-automation">
Microsoft Azure Automation</a>
by Mike McKeown Intermediate Sep 23, 2014 2h 41m (61)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/managing-azure-iaas-with-powershell">
Managing Azure IaaS with PowerShell</a>
by Elton Stoneman Intermediate Apr 18, 2016 2h 41m (12)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/connect-powershell-to-azure-subscription">
Connecting PowerShell to Your Azure Subscription</a>
by Russell Smith Beginner Apr 06, 2015 37m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/powershell-devops-global-summit-2016-sessions">
PowerShell & DevOps Global Summit 2016 Sessions</a>
by J. Keith Bankston, Ashley McGlone, Mike F. Robbins, Luc Dekens, Neema Saeedi, David Wilson, Jeff Hicks, Kirk Munro, Paul Higinbotham, Michael Greene, Ed Wilson, Angel Calvo, Jared Atkinson, Adam Platt, Lee Holmes, Adam Driscoll, Mark Gray, June Blender, Josh Atwell, Jason Helmick, Rohn Edwards, and Don JonesIntermediateApr 29, 20161h 50m

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-operational-insights-getting-started">
Getting Started with Azure Operational Insights</a>
by Russell Smith Beginner Jan 29, 2016 1h 5m (10)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-diagnostics">
Windows Azure Diagnostics</a>
by Niraj Bhatt Intermediate Mar 08, 2012 3h 18m (54)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/play-by-play-azure-security-mark-russinovich">
Play by Play: Azure Security with Mark Russinovich</a>
by Mark Russinovich and Mark MinasiIntermediateDec 18, 201453m (180)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/play-by-play-hanselman">
Play By Play: Azure Deployment with Scott Hanselman</a>
by Scott HanselmanIntermediateAug 01, 20131h 2m (136)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/migrating-inet-azure">
Migrating Internet Applications to Azure</a>
by Scott SeelyIntermediateOct 31, 2012 2h 0m (61)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/extending-active-directory-cloud">
Extending Active Directory to the Cloud</a>
by Russell Smith

## Dev #

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-iaas-essentials">
Windows Azure Infrastructure as a Service Essentials</a>
by Orin Thomas Intermediate Sep 11, 2013 4h 23m (268)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-infrastructure-service-introduction">
Introduction to Windows Azure Infrastructure as a Service</a>
by Vishwas Lele Beginner Apr 23, 2013 2h 46m (283)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/deploy-azure-visual-studio-online">
Plan, Create, and Deploy to Azure With Visual Studio Online</a>
by Esteban GarciaIntermediateAug 20, 20143h 32m (161)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/implementing-reactive-manifesto-azure-aws">
Implementing the Reactive Manifesto with Azure and AWS</a>
by Elton Stoneman Intermediate Oct 29, 2013 3h 54m (100)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-highly-scalable-web-applications">
Building Highly Scalable Web Applications in Azure</a>
by Edin Kapic Intermediate Aug 04,  2015 2h 23m (237)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/aspnet-multi-tenant-app-mvc-extjs-angular">
Building a Site with Bootstrap, AngularJS, ASP.NET, EF and Azure</a>
by Shawn Wildermuth Intermediate Jul 31, 2013 6h 29m (2202)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/biztalk-azure-appfabric">
Integrating BizTalk Server with Windows Azure AppFabric</a>
by Richard Seroter Intermediate Mar 06, 2011 1h 45m (14)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/node-on-azure">
Node on Windows and Azure</a>
by Paul O'Fallon Intermediate Aug 20, 2012 3h 24m (45)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/build-microsoft-azure-windows-server-2012">
Build a Lab Environment w/ Microsoft Azure & Windows Server 2012</a>
by Gary Grudzinskas Intermediate Jun 23,  2015 2h 20m (127)


##  Data:

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-cloud-services-storage-fundamentals">
Fundamentals of Azure Cloud Services and Storage</a>
by Matt Milner Intermediate Apr 09, 2013 1h 52m (467)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-storage-in-depth">
Windows Azure Storage In-Depth</a>
by Alan SmithIntermediateMar 05, 20146h 51m (174)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-caching">
Windows Azure Caching Service</a>
by Scott Seely Intermediate Jan 05, 2012 1h 40m (51)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-sql-course">
SQL Azure</a>
by Scott Seely Intermediate Jan 23, 2011 2h 38m (143)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-documentdb-introduction">
Introduction to Azure DocumentDB</a>
by Leonard Lobel Beginner Sep 23,  2015 5h 5m (75)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/real-world-big-data-microsoft-azure">
Real World Big Data in Azure</a>
by Elton Stoneman Intermediate Jun 16,  2015 5h 21m (155)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/sql-server-windows-azure-iaas-optimize">
   SQL Server on Microsoft Azure IaaS - Optimizations & High Availability</a>
   by Mike McKeown Intermediate Jan 19, 2014 2h 1m (44)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/hosting-sql-server-windows-azure-iaas">
Hosting SQL Server in Microsoft Azure IaaS Fundamentals</a>
by Mike McKeown Intermediate Oct 11, 2013 1h 40m (125)

##  Mobile:

* <a target="_blank" href="https://app.pluralsight.com/library/courses/windows-azure-mobile-services">
Windows Azure Mobile Services</a>
by Matt Milner Intermediate Jul 23, 2013 6h 21m (157)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/building-mobile-applications-azure-signalr-mvc">
Building Apps with Azure Mobile Svcs, SignalR, MVC, Win 8 and WP8</a>
by Colin Melia Intermediate Feb 12, 2014 1h 52m (106)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/building-cross-platform-mobile-apps-csharp-xamarin-azure">
Building Cross Platform Mobile Apps with C#, Xamarin, and Azure</a>
by Matt MilnerBeginnerApr 20, 20153h 38m (174)

* <a target="_blank" href="https://app.pluralsight.com/library/courses/wpazure">
Building Windows Phone Applications with Azure</a>
by Yacine Khammal Intermediate Feb 14, 2012  2h 37m


* https://www.microsoft.com/en-us/store/apps/posterpedia/9wzdncrdcsr8
   Get the Posterpedia Windows 8 app used to zoom into electronic posters.



## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
