---
layout: post
title: "Azure Cloud Onramp"
excerpt: "The basics of how to get into and around the Azure cloud"
tags: [cloud, azure]
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

This is a step-by-step hands-on approach to getting you up and running on Azure cloud.


## Get an account - ASM Sign-up #

The older steps to "Create an API gateway and Developer Portal in minutes".

0. https://account.windowsazure.com/signup

0. https://myprodscussu1.app.vssubscriptions.visualstudio.com/Dashboard
   to activate my BizSpark account $25/month Azure credit.

0. Verfication by text message or call does not use land-line VOIP phone numbers,
   only cellular numbers.

0. Input credit card (even though it's free).

0. Click "Start Managing my service" for https://portal.azure.com/


## Azure.com

0. If you are not logged in, type <strong>azure.com</strong> in your browser.

   You get sent to a marketing page such as:

   https://azure.microsoft.com/en-us/?v=17.14

0. Click the <strong>portal</strong> link at the upper right corner.

   This redirects you a list of Microsoft accounts that have been used on your computer.

0. Click the account name (email) you use for Azure.

0. Enter the password.

   You redirected to various URLs until you land on a URL such as:

   https://portal.azure.com/#dashboard/private/d32eb2fe-9636-4908-8854-89bc13154021

   This is the <strong>Dashboard</strong>.


## Two Azure portals #

Right off the bat, know that Microsoft is transitioning from the "classic" (older)
Azure Service Management (ASM) website of "Cloud Services" and "Affinity Groups" at

   * <a target="_blank" href="https://manage.windowsazure.com/"> manage.windowsazure.com</a>

   * Signup at <a target="_blank" href="https://account.windowsazure.com/signup/"> 
   https://account.windowsazure.com/signup</a>

to the Azure Resource Manager (ARM) portal which is structured with Resource Groups (logical containers)
providing a single-resource point-of-view [i.e. manage a single resource at a time] at

   * <a target="_blank" href="https://portal.azure.com/"> portal.azure.com</a>

   * <a href="#ARM-signup">Sign-up for ARM</a>

## What's the difference?

NOTE: Instead of 2 racks, ARM resources can span 3 racks.

<a target="_blank" href="https://azure.microsoft.com/en-us/features/azure-portal/availability/">
   Which portal supports each Azure service, listed alphabetically</a>

Services NOT available in the newer portal:

   * API Management
   * BizTalk
   * Managed Cache 
   * Multi-factor authentication (this is big)
   * etc.

## ASM Sign-up #

The older steps to "Create an API gateway and Developer Portal in minutes".

0. https://account.windowsazure.com/signup

0. https://myprodscussu1.app.vssubscriptions.visualstudio.com/Dashboard
   to activate my BizSpark account $25/month Azure credit.

0. Verfication by text message or call does not use land-line VOIP phone numbers,
   only cellular numbers.

0. Input credit card (even though it's free).

0. Click "Start Managing my service" for https://portal.azure.com/


<a name="ARM-Menu"></a>

## ARM Dashboard Tour #

At <a target="_blank" href="https://portal.azure.com/">
   https://portal.azure.com</a>

0. Click the "hamburger" icon at the upper-left corner for English descriptions of each icon on the left edge.

0. Click it again. It's a toggle.

0. Click the ">" at the lower-left corner to manage which icons appear on the left edge.

0. Scroll down the long list to get a sense of the categories:

   * GENERAL
   * COMPUTE
   * NETWORKING
   * STORAGE
   * DATABASES
   * INTELLIGENCE + ANALYTICS
   * INTERNET OF THINGS
   * ENTERPRISE INTEGRATION
   * SECURITY + IDENTITY
   * DEVELOPER TOOLS
   * MONITORING + MANAGEMENT
   * ADD-ONS
   * OTHER

0. Click the star to control items that appear as icons on the left of the page.

0. Drag an icon and drop it to reorder the icons. 

   PROTIP: I drag the "Billing" icon to the top so I manage the money involved.

0. Scroll down to click Help + Support (the person icon in blue). Notice the URL change:

   https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview

   Panes that appear on the right are called "blades".

   Support requests can ALSO be reached another way.

0. Click the question mark icon at the upper-right corner.

   ![azure help upper right 220x267](https://cloud.githubusercontent.com/assets/300046/25567655/c2642352-2dc0-11e7-9e6d-ef60c659a152.png)

0. Click Keyboard shortcuts

   BLAH: I have no idea what G means. See:

   https://docs.microsoft.com/en-us/azure/azure-portal/azure-portal-keyboard-shortcuts

   But Wait. There are more icons.

0. Click on the green + icon for a list in the <strong>Marketplace</strong>. Additional categories are:

   * Web + Mobile
   * Containers
   * Blockchain

0. Click the X to close a blade.


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
