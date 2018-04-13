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

ARM includes parallelization when creating resources for faster deployment of complex, interdependent solutions. It also includes granular access control, and the ability to tag resources with metadata.

NOTE: Instead of 2 racks, ARM resources can span 3 racks.

See: <a target="_blank" href="https://azure.microsoft.com/en-us/features/azure-portal/availability/">
   Which portal supports each Azure service, listed alphabetically</a>

Services NOT available in the newer ARM portal:

   * API Management
   * BizTalk
   * Managed Cache 
   * <a target="_blank" href="https://docs.microsoft.com/en-us/azure/multi-factor-authentication/multi-factor-authentication-faq">Multi-factor authentication</a> (this is a big thing)
   <br /><br />


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
   <br /><br />

0. Click the star to control items that appear as icons on the left of the page.

0. Drag an icon and drop it to reorder the icons. 

   PROTIP: I drag the "Billing" icon to the top so I manage the money involved.

   BTW, billing is associated with Management <strong>Subscriptions</strong>
   with names such as "Pay-as-you-go..."

   ### Help + Support

0. Scroll down to click Help + Support (the person icon in blue). Notice the URL change:

   https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview

   Panes that appear on the right are called "blades".

   Support requests can ALSO be reached another way.

0. Click the question mark icon at the upper-right corner.

   ![azure help upper right 220x267](https://cloud.githubusercontent.com/assets/300046/25567655/c2642352-2dc0-11e7-9e6d-ef60c659a152.png)

   ### Keyboard Shortcuts

0. Click Keyboard shortcuts in the menu.

   BLAH: I have no idea what G means. See:

   https://docs.microsoft.com/en-us/azure/azure-portal/azure-portal-keyboard-shortcuts

   ### Help + Support

   Notice Support options are also listed behind the smily face icon.

   Moreover, there is also a "Help + Support" box on the Dashboard.

   That's now 3 places you can find it.

0. Right-click on the "Help + Support" box on the Dashboard and select "unpin"
   becuase you now know you can reach it (in two places).


   ### Marketplace

0. Right-click on the "Marketplace" box on the Dashboard and select "unpin"
   becuase you can reach it this way:

0. Click on the green + icon for a list in the <strong>Marketplace</strong>. Additional categories are:

   * Web + Mobile
   * Containers
   * Blockchain
   <br /><br />
   
   <a target="_blank" href="https://linuxacademy.com/cp/socialize/index/type/community_post/id/16110">
   Click "Web + Mobile" to create a Web App on Azure</a> is a common use case.

0. Click the X to close a blade.


## AZ API

1. Sign-up for an email to use.

   ### Account ID and password

2. Sign-up for a Microsoft Azure account with a password to your email account name.

3. Use the automation bash script for MacOS at https://github.com/wilsonmar/mac-install-all 

4. In the "mac-install-all" folder downloaded, edit the <strong>secrets.sh</strong> file to specify variables used in the script.

5. Run the script, which does all the following:

   Email > Account Password > Login > Tenant > Principal > APP_ID > Roles

5. Login online:

   <pre>az login -u "$AZ_USER" -p "$AZ_PASSWORD"</pre>

   If you attempt to login using the user and password you use online (such as your hotmail credentials), you'll get an error.

<a target="_blank" href="https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest">
NOTE</a>: To use your command line client to use services (such as create server instances),
first install the azure CLI:

   <pre>brew install azure</strong></pre>


   ### Tenant ID

2. Once you have logged in, when you sign up for a Microsoft cloud service, Microsoft assigns to your account a <a target="_blank" href="https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-howto-tenant">Tenant ID</a>. To obtain it:

   <pre><strong>AZ_TENANT=$(az account show --query 'tenantId' -o tsv)</strong></pre>

   echo $AZ_TENANT to yield something like: <tt>a7a02378-1e4b-4017-972e-9dfe53bc2b2f</tt>

   See: <a target="_blank"><a target="_blank" href="https://msdn.microsoft.com/en-us/library/hh534478.aspx">
   Multi-tenant architecture</a>

   Resource groups (RGs) are used for RBAC, Automated Deployments, and Billing/Monitoring purposes.
   ![az-ad-analogy-480x483-28094](https://user-images.githubusercontent.com/300046/38739019-f324db20-3ef0-11e8-8c29-dd9ea31ddcd4.jpg)

3. <a target="_blank" href="https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest">
Create a Service Principal</a> using <a target="_blank" href="https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions">
   Naming Conventions</a> for RBAC (role-based access control):
   
   PROTIP: Create a .pem file from the rsa.pub file named $SSH_USER created for GitHub:

   <tt>ssh-keygen -f ~/.ssh/$SSH_USER -m 'PEM' -e > public.pem
   chmod 600 public.pem
   </tt>

   This is recommended instead of the alternate of asking Azure to <tt>--create-cert</tt> in command:

   <pre><strong>az ad sp create-for-rbac --name "$AZ_PRINCIPAL" --create-cert</strong></pre>

   The response is this JSON file in your $HOME folder:

   <pre>
{
  "appId": "APP_ID",
  "displayName": "ServicePrincipalName",
  "name": "http://ServicePrincipalName",
  "password": ...,
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
   </pre>

   BLAH: The name of the file created contains something like "tmpcgzysdch", a random set of characters. 
   So the script needs to figure out that file name.
   Thus we create the pem file and tell Azure.

5. TODO: Obtain the password text from within the file 

   Create a folder <strong>$HOME/certs/</strong>

6. Put the contents in a file name containing the value in $AZ_APP_ID,
   in the $HOME folder so that it won't have a chance to get pushed to GitHub.

6. Login using credentials built above:

   <pre>az login --service-principal --username "$AZ_APP_ID" --tenant "$AZ_TENANT" --password "$HOME/certs/$AZ_APP_ID.pem" </pre>
   
   PROTIP: The APP_ID and username are the same.

7. Assign the "Reader" role to the APP ID (username):

   <pre><strong>az role assignment create --assignee $AZ_APP_ID --role Reader</strong></pre>

8. List what resources were assigned to a APP_ID:

   <pre>az role assignment list --assignee $AZ_APP_ID</pre>

   If your APP_ID has not already been created:


## Videos

<a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-big-picture">
   Microsoft Azure: The Big Picture</a> 1h 50m Mar 10, 2016
   by Matt Milner
   makes use of VS 2010, which is rather obsolete now.


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
