---
layout: post
title: "Microsoft TFS and Git"
excerpt: "What ya gonna do with it?"
tags: [devops, git, TFS]
image:
# feature: fig-white-black-malika-favre-vertical-bars
  feature: https://cloud.githubusercontent.com/assets/300046/14751598/d1bcc4c6-0887-11e6-8c3e-9714f871101a.jpg
  credit: Malika Favre
  creditlink: http://create.adobe.com/2016/4/1/the_bold_cheeky_and_frequently_nsfw_art_of_malika_favre.html
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

## What is TFS?

TFS (Team Foundation Server) is licensed from Microsoft.

TFS is available to subscribers of <a target="_blank" href="https://msdn.microsoft.com/subscriptions/manage">
MSDN</a>. The over 100 different downloads of TFS are to these dimensions :

0. Visual Studio vs. core
0. Express vs. not.
0. Version (2015, 2013, 2011, etc.)
0. Update level (None, 1, 2, 3, etc.)
0. Web Installer vs. full download

0. Release Management made its debut with 2013
0. Project Server Extensions made its debut with 2015
0. Office Integration made its debut with 2015

0. Feedback Client for VS TFS 2015 dated 9/17/2015
0. Team Explorer Everywhere for TFS 2012, 32 MB
   provides access to TFS from Linux, with an Eclipse plug-in.

The sizes of installers:

|  Release   | Version | Update | Edition  | Express  | Standard |
| ---------: | ------- | ------ | -------- | -------- | -------: | 
| 03/30/2016 | 2015    | 2      | Standard |   461 MB |   461 MB |
| 08/06/2015 | 2015    | -      | VS       |   891 MB |   911 MB |
| 07/10/2015 | 2013    | 5      | VS       |   531 MB |  2518 MB |
| 11/24/2014 | 2013    | 4      | VS       |   530 MB |   531 MB |
| 11/24/2014 | 2013    | 3      | VS       |   531 MB |  2517 MB |
| 04/02/2014 | 2013    | 2      | VS       |   529 MB |  2515 MB |
| 11/13/2013 | 2012    | 4      | VS       |   484 MB |  1170 MB |
| 11/11/2013 | 2013    | -      | VS       |   506 MB |  2481 MB |
| 06/26/2013 | 2012    | 3      | VS       |   483 MB |  1168 MB |
| 04/04/2013 | 2012    | 2      | VS       |   483 MB |  1167 MB |
| 12/12/2012 | 2012    | 1      | VS       |   465 MB |  1135 MB |
| 08/15/2012 | 2012    | -      | VS       |   447 MB |  1104 MB |
| 03/08/2011 | 2010    | 1      | -        |        - |   477 MB |
| 08/05/2010 | 2010    | -      | VS       |        - |  1318 MB |
| 09/26/2008 | 2008    | 1      | VSTS     |        - |  1318 MB |
| 11/28/2007 | 2008    | Trial  | Workgroup|        - |  1318 MB |
| 03/17/2006 | 2005    | Trial  | Workgroup|        - |   448 MB |

Internally, TFS has a Standard vs. Basic configuration.

Update 2 of Team Foundation Server 2015 dated 3/30/2016 consisted of these downloads for (x86 and x64) - DVD (English) :

0. TFS Express, 461 MB

0. TFS Express - Web Installer, 2 MB

0. TFS (core), 461 MB

0. TFS (core) - Web Installer, 2 MB

0. TFS Office Integration, 139 MB

0. TFS Office Integration - Web Installer, 2 MB

0. TFS Project Server Extensions, 3 MB

0. TFS Project Server Extensions - Web Installer, 2 MB

0. Release Management Server for TFS - Web Installer, 2 MB

Visual Studio 2015 with Update 1 dated 11/30/2015:

0. Visual Studio TFS Office Integration - Web Installer, 2 MB

0. Visual Studio TFS Office Integration, 240 MB

0. Release Management Server for Team Foundation Server 2015 with Update 1 (x86 and x64) - Web Installer (English)

0. Visual Studio Team Foundation Server Express 2015 with Update 1 (x86 and x64) - DVD (English)

0. Visual Studio Team Foundation Server Extensions for Project Server 2015 with Update 1 (x86 and x64) - DVD (English)

0. Visual Studio Team Foundation Server Express 2015 with Update 1 (x86 and x64) - Web Installer (English)

0. Visual Studio Team Foundation Server 2015 with Update 1 (x86 and x64) - Web Installer (English)

0. Visual Studio Team Foundation Server 2015 with Update 1 (x86 and x64) - DVD (English)




TFS is the community server behind Microsoft's Visual Studio IDE.

## More than just version control

In 2010, TFS was primarily a replacement for Visual Source Safe.

In 2012, TFS became a part of Microsoft's new 
ALM (Application Lifecycle Management) "best practices":

   * Version Control
   * Requirements
   * Agile Planning - Plan and Track 
   * Design
   * Develop
   * Automated Build
   * Testing & Defect Tracking
   * Feedback
   * Test Lab Management
   * Reporting

In 2015 TFS added more tools:

![tfs visual studio](https://cloud.githubusercontent.com/assets/300046/14761987/8a7ad558-092c-11e6-9107-4a19c089ecbd.png)

   * Layer Diagrams 
   * Architecture Validation
   * UML diagrams

   * Code Analysis makes suggestions based on IL inspections

   * Unit Testing
   * Code Metrics (Cyclometric Complexity)
   * Code Coverage results appear in Build reports

   * During Manual Testing, capture video and IntelliTrace
   * Test Impact Analysis
   * "Coded UI" testing

   * Performance Testing (Lab Management)

## UML Diagrams:

* Activity - flow of work between actions and participants
* Component - Interfaces, prots, relationships
* Class - types and relationships
* Sequence - interactions between objects and components
* Use case - goals and tasks

## New Build System with 2015

http://aka.ms/vsopreview
describes the TFBuild (Team Foundation Build)
yet also supports Java, Linux, and Apple XCode (XPlat),
on-prem or in the cloud
with Visual Studio Online.

https://github.com/Microsoft/vso-agent

TFBuild also supports previous XAML-based MSBuilds.

Several TFBuild servers can run at once in parallel.
Each server uses a pool of Agents that
can be used across several Collections. 
Each collection has a queue.
An agent can belong to several queues.


## Git is King

When the internet and its developers began to adopt Git and GitHub,
Visual Studio 2015 provides support for both GitHub and TFS.

TFS has its own language:
Check-in/Check-out is a different concept.

In TFS Shelvesets backup what's on clients as temporary check-in.
This is different than stage.

## git-tfs bridge

As http://git-tfs.com/
describes, use Chocolately on a Windows machine:

   ```
   cinst GitTfs
   ```

The above is equivalent to:

   ```
   choco insttall Git-tf -y
   ```

Alternately, follow manual instructions at 
https://gittf.codeplex.com/

This installs the contents of
https://github.com/git-tfs/git-tfs

Clone using the `git-tfs` command rather than `git` command:

   ```
   <strong>git-tfs</strong> clone http://github.com/etc.
   ```

## Remove TFC bindings

TFS source control bindings (*.vssscc files) are unique to TFS.
So remove it.
This can be done from within Visual Studio.

Edit your .sln file to remove the 

   <pre>
   GlobalSection(TeamFoundationVersionControl) ... 
   EndGlobalSection
   </pre>

## README.md Markdown File

One artifact unique to GitHub is the README.md file 
(where .md means markdown or text). 

It's optional but most GitHub repos have one.


## Keeping history

The issue is keeping history

## Resources

* https://www.microsoft.com/en-gb/developers/articles/week02mar2014/migrating-a-tfs-tfvc-based-team-project-to-a-git-team-project-retaining-as-much-source-and-work-item-history-as-possible/

* http://chriskirby.net/blog/migrate-an-existing-project-from-tfs-to-github-with-changeset-history-intact

John Brown of TritiumConsulting.com
  presented a video course with Pluralsight
  https://app.pluralsight.com/library/courses/tfs-integration/table-of-contents

## Virtual Environments

AMong <a target="_blank" href="http://vsalmvm.azurewebsites.net/almvm-faq/">Visual Studio ALM virtual machines</a> VHD
avaialble 10 days at a time.

Azure Active Directory (AAD) Authentication Plug-in for SonarQube
The AAD OAuth2 provider for SonarQube, created by Hosam Kamel and Jean-Marc Prieur (product owner), enables AAD users to automatically be sign up and authenticated on a SonarQube server. 

## TailSpin 

Microsoft's TailSpin toys sample MVC 2 ordering
application was 
<a target="_blank" href="https://msdn.microsoft.com/en-us/library/aa645517%28v=vs.71%29.aspx?f=255&MSPPError=-2147217396">
first released for Visual Studio.NET 2003</a>
building a 3-tier app with a SQL 2000 XML service via OLE DB
with COM Interop.

Brian Keller, Principal Technical Evangelist,
Visual Studio ALM for Microsoft,
built for VS 2010 a virtual machine
image with sample data and 14 hands-on labs to a ficticious
<a target="_blank" href="https://blogs.msdn.microsoft.com/briankel/2010/06/25/now-available-visual-studio-2010-rtm-virtual-machine-with-sample-data-and-hands-on-labs/">(http://bit.ly/aC5Lb2)
   Tailspin Toys end-to-end eCommerce sample MVC 2 application</a>.
This expired in 2012
VSKitFdbk@Microsoft.com

https://msdn.microsoft.com/en-us/library/aa645517(v=vs.71).aspx
Tailspin Toys Application
Visual Studio .NET 2003


The new home for ALM is at 
http://vsalmvm.azurewebsites.net/

https://technet.microsoft.com/en-us/virtuallabs?f=255&MSPPError=-2147217396

https://technet.microsoft.com/en-us/virtuallabs?f=255&MSPPError=-2147217396
TechNet Virtual Lab: Introduction to Team Foundation Build 2015 (vNext), Test Run Analysis and Machines
