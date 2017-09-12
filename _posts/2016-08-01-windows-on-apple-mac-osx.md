---
layout: post
title: "Windows on Apple MacOS laptops"
excerpt: "RDP to EC2, Amazon WorkSpaces, Vagrant, BootCamp, VMWare Fusion, Docker"
tags: [apple, mac, setup, VMWare, Fusion]
image:
# feature: pic gray apple logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14625335/52952250-059f-11e6-84c8-5ae2d289c486.jpg
  credit: Wonderful Engineering
  creditlink: http://cdn.wonderfulengineering.com/wp-content/uploads/2013/11/apple-wallpaper-3.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

There are several ways to run Microsoft Windows on an Apple Mac computer.
Each has its own advantages and disadvantages:

* <a href="#RDP">Remote Desktop Protocol client to cloud instances</a>
* <a href="#WorkSpaces">On an internet browser to Amazon WorkSpaces</a>
* <a href="#Docker">Docker Windows instance</a>
* <a href="#Vagrant">Vagrant Virtualbox</a>
* <a href="#BootCamp">BootCamp</a>
* <a href="#VMwareFusion">VMWare Fusion</a>
* <a href="#Parallels">Parallels</a>

<hr />

<a name="RDP"></a>

## Cloud Instances 

If you have no administrative rights on your corporate Windows laptop, spin up cloud instances in the cloud and access them via a client that uses Microsoft's RDP (Remote Desktop Protocol).

See http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html

### RDP Clients

Microsoft Windows operating systems have, within Start Programs > Accessories, a RDP client program. It can be used without being an Administrator.

On Linux machines, there is http://www.rdesktop.org/.

On the Mac, these RDP clients can reach into instances of Amazon EC2 or other cloud that house Windows servers.

1. Use the Microsoft Remote Desktop app from the Apple App Store.

2. Within Chrome browser, install the <a target="_blank" href="https://chrome.google.com/webstore/detail/chrome-rdp/cbkkbcmdlboombapidmoeolnmdacpkch?hl=en"> $7.99 Chrome browser app</a>. This enables you to run the most powerful of servers from a ChromeBook laptop with minimal RAM and hard disk.



#### Amazon EC2 Cloud Images

A <a target="_blank" href="https://secureanycloud.com/">hardened</a> Amazon Machine Image (AMI) containing Visual Studio 2017 Community Edition on Windows Server 2016 <a target="_blank" href="https://aws.amazon.com/marketplace/pp/B06XKP1YWV">costs 28 cents per hour on a t2.medium in the US</a>. 20 cents of that goes pays for <a target="_blank" href="mailto:Support@SecureAnyCloud.com">support</a> from <a target="_blank" href="https://secureanycloud.com/">Cognosys</a>, its creator. 888.489-2723

   Cost per hour increases in a straight line (linear) way for number of CPUs:
   ![ec2-cognosys-vcpu-per-dollar-562x217-54344](https://user-images.githubusercontent.com/300046/30037418-d2ddfd46-9177-11e7-93ad-f376ccca8dc1.jpg)
   <br />
   Cost per hour increases in the same way for amount of Memory (RAM):
   ![ec2-cognosys-mem-per-dollar-562x225-62637](https://user-images.githubusercontent.com/300046/30037332-200f3fd6-9177-11e7-98c2-bd1a76592089.jpg)


   <a target="_blank" href="http://www.ec2instances.info/">ec2instances.info</a> provides a spreadsheet.

   WARNING: On AWS EC2, Windows Server 2016 Nano servers do not support RDP, only Windows PowerShell.

   <a target="_blank" href="https://aws.amazon.com/ec2/instance-types/">A t2.medium has 2 cores and 4 GB</a>.

   PROTIP: With Amazon, you pay for hourly increments. With Google, you pay per minute.



<a target="_blank" href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html">Connect to an instance in AWS EC2</a>:

1. Create an Amazon EC2 account at http://aws.amazon.com/ec2/.


<a name="WorkSpaces"></a>

### Browser WorkSpaces in AWS cloud

This approach works not just a MacOS laptop, 
but for any computer running a modern browser,
such as <a target="_blank" href="http://docs.aws.amazon.com/workspaces/latest/userguide/amazon-workspaces-chromebook-client.html">
on a Chromebook</a>. No files are transferred, just graphic
images of a screen on servers within the AWS cloud.
This makes for more stringent security, but also mean significant lag that affect productivity.

   * <a target="_blank" href="https://forums.aws.amazon.com/search.jspa?mbtc=iQylnisvlZwOpRpOlSNPnOsymqDNwqQZ&objID=f164&q=workspaces&x=0&y=0">
   Amazon's Workspaces Forum questions</a>
   <br /><br />

0. In the <a target="_blank" href="https://console.aws.amazon.com/workspaces/home">
   WorkSpaces Console</a> for your default region, Get Started, Launch, and
   Select a Bundle.

   An image contains only the OS, software and settings. A bundle is a combination of both that image and the hardware from which a WorkSpace can be launched.

   The Free Tier provides two Standard bundle WorkSpaces for up to 40 hours of combined use per month, for two calendar months, from the time you create your first WorkSpace. Usage time accrues while you’re actively using your WorkSpace as well as the time it takes to stop after a specified period of inactivity, which by default is set to one hour. If you exceed the Free Tier limits, you will be charged the standard Amazon WorkSpaces hourly rate for the additional resources you use. At the end of two calendar months, the WorkSpaces you launched in the Free Tier will automatically be billed at the applicable hourly rate.

   Amazon's regular <a target="_blank" href="https://aws.amazon.com/workspaces/pricing/">
   pricing is $25 to $75 per month per user</a>, which Amazon estimates is 59% less than traditional Virtual Desktop Infrastructures (VDI) provided by Citrix and VMware.

   Amazon's approach uses newer tech than VDI. 

0. Specify for each user his/her Username, First Name, Last Name, and Email for the Bundle selected.

   PROTIP: Have the Username the same as the Email.

0. Click Launch Workspace for all users. When the Workspace Console goes from PENDING to AVAILABLE (in green letters).

   Return to managed users in the Amazon WorkSpaces Application Manager (WAM) at<br />
   <a target="_blank" href="https://us-east-1.console.aws.amazon.com/wam/home">
   https://us-east-1.console.aws.amazon.com/wam/home</a> for your current region.

   CAUTION: There is no moving WorkSpaces from one region to another.


   ### Install WorkSpaces client
   
0. In each user's email client, open the welcome email and click the link.
0. Set your WorkSpaces credentials with a password.
0. Highlight the registration code in the email and copy to your Clipboard.
   
0. Choose the link for your laptop model at <br />
   <a target="_blank" href="http://clients.amazonworkspaces.com/">
   http://clients.amazonworkspaces.com</a> 

0. Download and install the Chrome application to enable the proprietary PC over IP (PCoIP) protocol (from Teradici) to compress, encrypt and rapidly transport image pixels between client and server.

   On a MacOS, it's file "WorkSpaces.pkg" (38.2 MB taking 115.3 MB space).

   On a Chromebook, click "ADD TO CHROME" at the upper-right corner.

0. Double-click on the installer and click Continue and
   finally, Install. Provide your password when requested.

0. Move the installer file (WorkSpaces.pkg) to Trash, to recover disk space.
   
0. Do a Chromebook search to verify that the Amazon WorkSpaces client app icon appears.

0. BLAH: The full graphic streaming virtual desktops tends to eat up much bandwidth. So measure how much you have used before and after sessions.

   Optionally, your company's existing on-premises Active Directory (AD) can be reached by Amazon via an Amazon Virtual Private Cloud (VPC) with a hardware virtual private network (VPN) connection or a dedicated connection with AWS Direct Connect. 

   Once linked up, you use the  AWS Management Console to select the users in your Active Directory who will receive a WorkSpace. 

0. Open the app for the first time.
0. Type your user name and password and choose Sign In.
0. Paste the registration code and click Register.

   ### Repeat Login

   NOTE: 1Password cannot auto-fill Username and Password on the MacOS WorkSpaces app nor on Chrombook.

0. Login using the Username and password for the WorkSpaces client.

   If your Amazon WorkSpaces administrator has enabled multi-factor authentication for your organization's WorkSpaces, you are prompted for a passcode to complete your login. 

   CAUTION: Only one browser can be used at the same time.
   Amazon logs off a session when another session is started on another computer.

0. If your Amazon WorkSpaces administrator has not disabled the "Remember Me" feature, you are prompted to save your credentials securely so that you can connect to your WorkSpace easily in the future. Your credentials are securely cached while the application is running.

   After the client application connects to your WorkSpace, your WorkSpace desktop is displayed.

0. (Optional) If your WorkSpace uses an AD Connector directory, update the maximum lifetime of the Kerberos ticket by following the steps in Configuring Kerberos Policies in the Microsoft TechNet Library. 

0. If you need to disable the "Remember Me" feature, search for help in the Amazon WorkSpaces forum.

   ### Configure Remote Assistance

0. Open PowerShell window.
0. Install Remote Assistance using this PowerShell command:
  
   <tt><strong>Add-WindowsFeature Remote-Assistance
   <strong></tt>

   Open port 3389 in the firewall and in the Security Group, Remote Desktop should work using the username and password in the traditional way.


   ### Configure Windows 7 Folder Options

0. Click the Windows Start round icon at the bottom left of the screen.
0. Type "folder options" (without the quotes) until the line "Folder Options" appears for you to click at the top of the menu.
0. In the "Folder Options" dialog box, click the "View" tab at the top of the window.
0. Select "Show hidden files, folders, and drives".
0. Click to uncheck the box for "Hide extensions for known file types".
0. Click the "OK" button at the bottom of the dialog box.

   ### Configure Windows 7 Toolbar

0. Click the Windows Start round icon at the bottom left of the screen.
0. Click All Programs, Accessories. All the usual tools are there.
0. Drag Notepad and drop it on the tool bar at the bottom of the screen.

0. Click the Windows PowerShell folder.
0. Drag "Windows PowerShell" and drop it on the tool bar at the bottom of the screen.

0. Open Windows Explorer from the tool bar at the bottom of the screen.
0. Click on "Computer". Notice there is no C: drive and no access to C:\Windows internals.
0. Double-Click on "User Profile D:" drive.

   Notice there are 50 GB for you.

0. Double-Click on D: and navigate into folder Users, your account name.

   PROTIP: Here is the default location when command line windows open by default.
   So place scripts here (among folders).

0. Right-Click Windows PowerShell to select "Run as Administrator".
0. Type:

   <tt><strong>echo $Env:USERPROFILE
   </strong></tt>

   This is your user home folder.

0. Set permissions:

   <tt><strong>set-executionpolicy remotesigned
   </strong></tt>

   <pre>
Execution Policy Change
The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose
you to the security risks described in the about_Execution_Policies help topic at
http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy?
[Y] Yes  [N] No  [S] Suspend  [?] Help (default is "Y"): Y
   </pre>

0. Type Y to confirm.
   
   See <a target="_blank" href="https://technet.microsoft.com/en-us/library/bb613481.aspx">
   How to write a PowerShell script</a>


0. Within PowerShell you can also go your home by typing:

   <tt><strong>cd ~
   </strong></tt>

0. Verify whether you can create a PowerShell script file:

   <tt><strong>Add-Content helloworld.ps1 'Write-Host "Hello World"'
   </strong></tt>

   This is the PowerShell equivalent of `echo "Hello World" >helloworld.ps1`.

0. List directory:

   <tt><strong>dir
   </strong></tt>

0. Type the first letter h and press Tab to auto-complete:

   <tt><strong>./helloworld.ps1
   </strong></tt>

   Instead of "Hello World", if you get this, it means executionpolicy was not set correctly:

   <pre>
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
   </pre>


   ### Install posh-git for PowerShell

   TODO:
   file:///C:/Program%20Files%20(x86)/AWS%20Tools/Documentation/AWSToolsForWindows.html 
   AWS Tools for Windows 
   AWS SDK for .NET

0. To exchange files among a group of people, setup:<br />
   <a target="_blank" href="https://amazonworkdocs.com/en/clients">
   https://amazonworkdocs.com/en/clients</a>

   ### Install clients using Chocolatey 

   <a target="_blank" href="https://blogs.technet.microsoft.com/heyscriptingguy/2014/08/23/weekend-scripter-powershell-and-chocolatey/">
   [Find-Package from OneGet included in Windows Management Framework 5.0 Preview gets packages from the Chocolatey installer repository]</a>

0. Right-click on cmd and select "Run as Administrator".
0. Copy <a target="_blank" href="https://chocolatey.org/install#install-with-cmdexe">
   this</a> and right-click in the command window:

   <pre><strong>
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
   </strong></pre>

0. Install <a target="_blank" href="https://chocolatey.org/packages/jdk8">
   Java Development Kit for version 8 using Chocolatey</a>:

   <tt><strong>choco install jdk8 -y
   </strong></tt>

0. Install <a target="_blank" href="https://chocolatey.org/packages?q=chrome">
   Chrome browser</a>:

   <tt><strong>choco install googlechrome -y
   </strong></tt>

0. Install <a target="_blank" href="https://chocolatey.org/packages?q=git">
   Git for Windows</a> client:

   <tt><strong>choco install git -y
   </strong></tt>

   Alternately, to add a Git client manually, open Firefox, search for "Git for Windows". Click Download.
   Click Save file. Click the down arrow for a list of downloads.
   Click to Open File. Run. Yes to UAC. Next all, but Git LFS. then Finish.
   Close Firefox.
   Click Windows icon. All Programs. Click Git, Git Bash.

0. Install <a target="_blank" href="https://chocolatey.org/packages/poshgit">
   Posh Git for PowerShell</a>:

   <tt><strong>choco install poshgit -y
   </strong></tt>

   * Launch each and configure the window properties to enable Quick Edit and set 
   Layout Height (scroll buffer) to 9999 lines.

   https://www.develves.net/blogs/asd/articles/using-git-with-powershell-on-windows-10/#fn:start

   ### Clone Samples 

   Download Git repository containing bootstrap script:

0. Open a Git Bash window.
0. cd to where you add Git repositories:

   <tt><strong>cd gits;<br />
   git clone https://github.com/wilsonmar/loadrunner.git \-\-depth=1<br />
   git clone https://github.com/wilsonmar/git-utilities.git \-\-depth=1
   </strong></tt>


   ### Shut-down and Resume

   BLAH: It takes many minutes to stop and resume.


   ### Custom WorkSpaces

0. As an administrator, in the Console, select the WorkSpace and select "Create Image" to create an image with your applications and settings. 

   NOTE: Custom images created from Amazon WorkSpaces Graphics bundles can only be used with Graphics bundles, and custom images created from Value, Standard, Performance, or Power bundles can only be used with those bundles. Most Amazon WorkSpace images are available within 45 minutes.

   See http://docs.aws.amazon.com/console/workspaces/images


<a name="Docker"></a>

## Docker #

Docker is now a favored approach because it runs the same (unaltered)
[(Dockerized apps)](/dockerize/) on Windows, Mac, and Linux platforms.

Docker provides a transparent interface to operating systems.

* [Docker setup](/docker-setup/)
* [Docker build](/docker-build/)


<a name="Vagrant"></a>

## Vagrant Virtualbox

Vagrant (at https://www.vagrantup.com) is from Hashicorp, the same folks who provide Consul.

Vagrant provisions complete virtual machines (Unix, Linux, Mac, or Windows) inside the Mac Operating system as virtual machines. The VMs are segregated from other processes. This allows you to test our software in a variety of environments.

Virtualbox (virtualbox.org)

### Install

0. First, Apple XCode needs to be installed.

   https://itunes.apple.com/au/app/xcode/id497799835?mt=12

   Agree to EULA and Install.

   Install Prerequisite Software (XCode Tools from Command Line): Open a Terminal (Launchpad —> Other —> Terminal). At the command prompt run the following command to install XCode Tools

   $ xcode-select —install

   Accept the EULA.
   Agree to install at Prompt.

0. [Install Homebrew](//)

0. From within any folder, download, verify, and install VirtualBox:

   <tt><strong>brew install Caskroom/cask/virtualbox
   </strong></tt>

   The response at time of writing:

   <pre>
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> Updated Formulae
notmuch                                                        pwntools                                                       todoman
&nbsp;
==> brew cask install Caskroom/cask/virtualbox 
==> Satisfying dependencies
==> Downloading http://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-OSX.dmg
######################################################################## 100.0%
==> Verifying checksum for Cask virtualbox
==> Installing Cask virtualbox
==> Running installer for virtualbox; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are ignored.
Password:
==> installer: Package name is Oracle VM VirtualBox
==> installer: Upgrading at base path /
==> installer: The upgrade was successful.
🍺  virtualbox was successfully installed!
   </pre>   

0. Download, verify, and install VirtualBox extension pack for your version of virtualbox:

   <tt><strong>brew install Caskroom/cask/virtualbox-extension-pack
   </strong></tt>

   The response at time of writing:

   <pre>
Updating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (caskroom/cask).
No changes to formulae.
&nbsp;
==> brew cask install Caskroom/cask/virtualbox-extension-pack 
==> Caveats
Installing this Cask means you have AGREED to the
VirtualBox Personal Use and Evaluation License at
&nbsp;
https://www.virtualbox.org/wiki/VirtualBox_PUEL
&nbsp;
==> Satisfying dependencies
All Cask dependencies satisfied.
==> Downloading http://download.virtualbox.org/virtualbox/5.1.26/Oracle_VM_VirtualBox_Extension_Pack-5.1.26-117224.vbox-extpack
######################################################################## 100.0%
==> Verifying checksum for Cask virtualbox-extension-pack
==> Installing Cask virtualbox-extension-pack
==> 0%...
==> 10%...20%...30%...40%...50%...60%...70%...80%...90%...
==> 100%
🍺  virtualbox-extension-pack was successfully installed!
   </pre>

0. Download, verify, and install Vagrant:

   <tt><strong>brew install Caskroom/cask/vagrant
   </strong></tt>

   The response at time of writing:

   <pre>
==> brew cask install Caskroom/cask/vagrant 
==> Satisfying dependencies
==> Downloading https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.dmg
######################################################################## 100.0%
==> Verifying checksum for Cask vagrant
==> Installing Cask vagrant
==> Running installer for vagrant; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are ignored.
==> installer: Package name is Vagrant
==> installer: Upgrading at base path /
==> installer: The upgrade was successful.
🍺  vagrant was successfully installed!
   </pre>

0. Download, verify, and install Vagrant-Manager:

   <tt><strong>brew install Caskroom/cask/vagrant-manager
   </strong></tt>

   The response at time of writing:

   <pre>
==> brew cask install Caskroom/cask/vagrant-manager 
==> Satisfying dependencies
==> Downloading https://github.com/lanayotech/vagrant-manager/releases/download/2.5.4/vagrant-manager-2.5.4.dmg
######################################################################## 100.0%
==> Verifying checksum for Cask vagrant-manager
==> Installing Cask vagrant-manager
==> Moving App 'Vagrant Manager.app' to '/Applications/Vagrant Manager.app'.
🍺  vagrant-manager was successfully installed!
   </pre>


   ### Spin up Ubuntu server

0. Find an image at https://app.vagrantup.com/boxes/search

   PROTIP: Ubuntu is the most popular download, and is recently maintained.

   ubuntu/precise64 20170427.0.0 contains Official Ubuntu Server 12.04 LTS (Precise Pangolin).

0. Make a sandbox directory, cd into it from your Home (~) directory:

   <tt><strong>cd ~ && mkdir vagrant-sandbox && cd vagrant-sandbox
   </strong></tt>

0. Download the Ubuntu image, then initialize (init) the installation inside the sandbox folder (aka make the Vagrantfile). 

   <tt><strong>vagrant box add precise64 http://files.vagrantup.com/precise64.box \-\-force 
   </strong></tt>

   PROTIP: The `--force` parameter specifies overwrite of the file if it already exists. This is since Vagrant downloads before checking anyway.

   This takes several minutes. The intermediate output:

   <pre>
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'precise64' (v0) for provider: 
    box: Downloading: http://files.vagrantup.com/precise64.box
    box: Progress: 38% (Rate: 464k/s, Estimated time remaining: 0:07:22)
&nbsp;
==> box: Box download is resuming from prior download progress
==> box: Successfully added box 'precise64' (v0) for 'virtualbox'!
   </pre>


   Alternately, create a <strong>Windows 10</strong> sandbox:

   <tt><strong>vagrant box add windows? http://files.vagrantup.com/windows?.box
   </strong></tt>

   This takes several minutes.

   <pre>
   </pre>

   ### Configure same subnet

   PROTIP: Machines talk with each other only if they are on the same network subnet.

0. In Virtualbox, click Settings, Networking, click the Adapter with the "Host-only Adapter".
0. Select the name "vboxnet1".
0. Click on the icon at the right to create a new entry.
0. Specify a private network address such as `192.168.57.1`, with a subnet mask of `255.255.255.0`.

0. Initialize

   A Vagrant environment or target machine is required to run the vagrant up command. Run `vagrant init` to create a new Vagrant environment. Or, get an ID of a target machine from `vagrant global-status` to run this command on. A final option is to change to a directory with a Vagrantfile and to try again.
   
   <tt><strong>vagrant init precise64
   </strong></tt>

   The response in the command line:

   <pre>
   A `Vagrantfile` has been placed in this directory. You are now ready to `vagrant up` your first virtual environment! Please read the comments in the Vagrantfile as well as documentation on `vagrantup.com` for more information on using Vagrant.
   </pre>

   This creates a `.vagrant` hidden folder.

   This creates a `Vagrantfile` containing these two lines:

   <pre>
# -*- mode: ruby -*-
# vi: set ft=ruby :
   </pre>


   ### Vagrant Global Status

0. See Ansible instances from any directory:

   <tt><strong>vagrant global-status
   </strong></tt>

   A sample response can include directories that have been deleted:

   <pre>
id       name    provider   state   directory                                                 
----------------------------------------------------------------------------------------------
0cf0a57  acs     virtualbox saved   /Users/mac/gits/ansible                                   
039b2ad  default virtualbox running /Users/mac/gits/wilsonmar/jhipster-sample                 
c1d1bed  default virtualbox running /Users/mac/gits/wilsonmar/jhipster-sample/jhipster-devbox 
&nbsp; 
The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date. To interact with any of the machines, you can go to
that directory and run Vagrant, or you can use the ID directly
with Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"
   </pre>

   For example, the sample instance named "acs" would contain files like these:

   ![ansible-files-244x215-31570](https://user-images.githubusercontent.com/300046/30340308-52ad0e58-97af-11e7-903f-4af9e67cd6ce.jpg)

   PROTIP: Such folders defined need to be deleted or they take up space and cycles.

   Deleted .vagrant dir deleted from the filesystem still show as running, to remove:

   <tt><strong>vagrant global-status \-\-prune
   </strong></tt>


   ### Vagrant up

0. Within the folder containing the Vagrantfile, start the server via Vagrant:

   <tt><strong>vagrant up
   </strong></tt>

   <pre>
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'base' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Box file was not detected as metadata. Adding it directly...
==> default: Adding box 'base' (v0) for provider: virtualbox
    default: Downloading: base
An error occurred while downloading the remote file. The error
message, if any, is reproduced below. Please fix this error and try
again.
&nbsp;
Couldn't open file /Users/mac/vagrant-ubuntu-sandbox/base
   </pre>





0. Login to the new server via SSH (Secure Shell):

   <tt><strong>vagrant ssh
   </strong></tt>

0. Change what you like. Mess it up if you care to. 
0. Logout once done poking around:

   <tt><strong>exit
   </strong></tt>

0. Destroy the virtual server instance defined on the current directory:

   <tt><strong>vagrant destroy
   </strong></tt>

0. View your processes:

   <tt><strong>ps -al
   </strong></tt>


   ### Configuration

   The vagrant virtual servers are configured with a single file (called a "Vagrantfile") started with a single command (vagrant up), are contained within a single folder, and can be destroyed with a single command (vagrant destroy). 




Blogs about this topic:

* https://gist.github.com/tbonesteaks/000dc2d0584f30013913
* http://sourabhbajaj.com/mac-setup/Vagrant/README.html


<a id="BootCamp"></a>

## Boot Camp on Mac #

Apple came up with it, at <a target="_blank" href="https://support.apple.com/en-us/HT201468">
https://support.apple.com/en-us/HT201468</a>
says the installer is in the <strong>Utilities folder inside the Applications folder</strong>.

This is called a "split brain" approach. The hassle with this are that:

* a repartition of your startup disk to create a Windows partition is necessary.
   You install Windows in the Windows partition.

* <strong>switching requires a reboot</strong>.

See https://support.apple.com/en-us/HT201468



## Parallels

<a target="_blank" href="http://www.parallels.com/products/desktop">Parallels</a>

<a target="_blank" href="http://kb.parallels.com/en/112941">
Parallels Boot Camp Guide</a> and
<a target="_blank" href="http://kb.parallels.com/en/112091"> Guidelines</a>

<a target="_blank" href="https://stormpath.com/blog/ultimate-guide-to-using-visual-studio-on-a-mac">One blogger</a> combined
both: installing Windows into a Boot Camp partition first, and then turned that partition into an active Parallels virtual machine. This way, I have the option of using Windows in the virtual machine, or restarting to run Windows natively at full speed.  But he hasn’t needed to boot directly to Windows.

You can’t pause the virtual machine or save it to a snapshot. A non-Boot Camp virtual machine doesn’t have these limitations.

Virtual machine settings: 
    2 virtual CPUs
    4096MB system memory
    256MB graphics memory

Parallels options:

    * Optimization: Faster virtual machine, Adaptive hypervisor, Tune Windows for speed all turned on.
    * Sharing: Shared cloud, SmartMount, and Access Windows folders from Mac turned off, as I didn’t need these for my workflow.

Parallels’ Coherence presentation mode shows Windows apps side-by-side with OS X is good for copy and paste. But this slows performance.

PROTIP: Use two monitors. Have Windows full-screen on an external Thunderbolt display, and OS X on the laptop screen. Then swipe the Magic Mouse to switch desktops.

Fix a few annoyances and performance drains:

https://www.youtube.com/watch?v=gfjFJ-v_h2s
Web Development in Visual Studio 2017

* Function keys. If you’re using the Mac keyboard, you’ll want to change the function key behavior so the F1-F12 keys work correctly in Visual Studio. From System Preferences – Keyboard, make sure Use all F1, F2, etc. keys as standard function keys is checked. With this turned on, hold Fn to use the Mac functions (brightness, volume, etc.) on F1-F12. With an external non-Mac keyboard, this isn’t an issue.

* Disable Windows visual effects. I turned off most of the Windows desktop manager visual effects by going to Control Panel – System and Security – Advanced system settings – Advanced – Performance – Settings – Visual Effects and choosing Adjust for best performance. However, I left Smooth edges of screen fonts checked because it improves text rendering on my monitor.

Through trial and error, I found a number of things that could be disabled to improve performance. You may not want to make all of the changes I did, so pick and choose your own list of tweaks:

    Disable hardware-accelerated rendering. Unchecking Automatically adjust visual experience based on client performance, Enable rich client visual experience, and Use hardware graphics acceleration if available via Options – Environment made the UI feel much more responsive on my machine.

    Start up to an empty environment. Starting up Visual Studio for the first time feels a lot snappier if you skip the default news page on startup. Select Empty environment under Options – Environment – Startup – At startup.

    Remove unused extensions. Visual Studio ships with a number of extensions that you may not need. From Tools – Extensions and Updates – Installed, remove any extensions you aren’t actively using (you can always reinstall them later). I got rid of six extensions I didn’t need.

    Disable extra debugging features. I turned off both Enable Diagnostic Tools while debugging and Show elapsed time PerfTip while debugging in Options – Debugging – General. I wasn’t using these debugging features, and debugging felt snappier after I disabled them.

    Turn off the Navigation Bar. I found the code editor Navigation Bar to be unnecessary if the Solution Explorer is open. I disabled it via Options – Text Editor – All Languages – Navigation Bar.

    Disable CodeLens. CodeLens is a cool feature for collaboration, but it’s not part of my current workflow. I got rid of the CPU overhead by turning it off via Options – Text Editor – All
    Languages – CodeLens – Enable CodeLens.

    Turn off Track Changes. When a file is open in the code editor, Visual Studio will represent recent changes by displaying small regions of green or yellow on the scroll bar. If you can live without this, turn off Track changes via Options – Text Editor – General for a small performance boost.

    Turn off Track Active Item. Squeeze out a little bit more UI performance out by ensuring Track Active Item in Solution Explorer is unchecked under Options – Projects and Solutions – General.


<a id="VMwareFusion"></a>

## VMware Fusion #

It costs $395, but you can run quickly switch among Windows or Linux on a MacOSX machine using VMWare Fusion.

This would enable you to experiment with setups.

<a target="_blank" href="http://www.souldevteam.net/blog/2013/10/06/os-x-mavericks-10-9-retail-vmware-image-release-notes-links/">
Run OSX in VMware within Windows</a>

* http://www.tekrevue.com/os-x/

* <a target="_blank" href="http://www.souldevteam.net/blog/2013/10/06/os-x-mavericks-10-9-retail-vmware-image-release-notes-links/">
Run OSX in VMware within Windows</a>

* <a target="_blank" href="https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1001934">
   Defragmenting, shrinking, and cleaning up VMware Fusion virtual machine disks</a>
<br /><br />


## USB Drives

Most USB drives are sold formatting in NTFS which Mac can read but not write to.
Windows computers can't even read Mac-formatted HFS+ drives. 

FAT32 has a 4GB size limit per file, so it isn't ideal for video files. 
FAT32 also has 32 GB limit for drives.

<strong>exFAT</strong> has a theoritical limit of 16 Exa-bytes. 64 ZB (512 TB recommended max).
Format the USB drive in "exFAT" format and it can be read by both Windows and Mac (except for Leopard version of Macs, which few Mac users have anymore).
<a target="_blank" href="http://superuser.com/questions/257646/why-should-i-use-exfat-over-ntfs-on-removable-media">This blog</a> says it's faster than NTFS.

To format extFAT on a Mac UI:

1. Connect the drive to the Mac.
2. Open Disk Utility: hit command and spacebar at the same time for Spotlight search, then type in Disk Utility to find the program.
3. Select the USB drive you want to format. (The lowest level with an eject icon under an "External").
4. Click Erase.
5. Give the partition a name and select exFAT for the format.
6. Click Erase again.

If you get an error message "Erase process has failed", open a Terminal to use commands:

0. Get the disk id from:

   <pre>
diskutil list
   </pre>

0. unmount using the disk ID from above:

   <pre>
diskutil unmountDisk force disk3
   </pre>

   The response is

   Forced unmount of all volumes on disk3 was successful

0. Write zeros

   <pre>
sudo dd if=/dev/zero of=/dev/disk3 bs=1024 count=1024
   </pre>

   The response:

   <pre>
1024+0 records in
1024+0 records out
1048576 bytes transferred in 1.889696 secs (554891 bytes/sec)
   </pre>   

0. partition it again in "MBR" partition scheme for use with Windows machines:

   <pre>
diskutil partitionDisk disk3 1 MBR exfat MyDisk 100%
   </pre>

   "Error creating partition map: The disk is too large to be supported by the given partition scheme (-69659)"

   Windows 7 doesn't like the UUID partition scheme. Reformat as MBR in OSX for Win7

   This is why if you format exFAT on a Mac, it won't read on a PC.
   But if you format exFAT on a PC, the it will work on both.

   Alternately, to partition it in "Mac OS Extended (Journaled)" format
   so a Mac can boot from it:

   <pre>
diskutil partitionDisk disk3 GPT JHFS+ "My External HD" 0g
   </pre>

   See http://www.theinstructional.com/guides/disk-management-from-the-command-line-part-2

   The response:

   <pre>
Started partitioning on disk3
Unmounting disk
Creating the partition map
Waiting for partitions to activate
Formatting disk3s2 as Mac OS Extended (Journaled) with name My External HD
Initialized /dev/rdisk3s2 as a 3 TB case-insensitive HFS Plus volume with a 229376k journal
Mounting disk
Finished partitioning on disk3
/dev/disk3 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *3.0 TB     disk3
   1:                        EFI EFI                     209.7 MB   disk3s1
   2:                  Apple_HFS My External HD          3.0 TB     disk3s2
   </pre>

0. Repeat the steps above for ExFAT.

Click on the Partition tab in the DU main window.
 
3. Under the Volume Scheme heading set the number of partitions from the drop down menu to one. 
Click on the Options button, set the partition scheme to MBR then click on the OK button. 
Set the format type to MSDOS (FAT32.) Click on the Partition button and wait until the process has completed.

See https://support.apple.com/kb/PH22240?locale=en_US

Alternately:

0. brew install e2fsprogs
0. figure out the name of your partition or drive using diskutil list -- in my case, my partition had was on disk2 and had the identifier of disk3s2

0. ?

   sudo $(brew --prefix e2fsprogs)/sbin/mkfs.ext3 /dev/disk3s2 

   but you may need to change the drive from disk2s1 to the partition or drive that you want to format. This command will ask you to verify the name of the partition, just to be sure :)


## Format ExFAT on Windows OS

1. Open up Windows Explorer and right-click on your drive in the sidebar. Choose "Format".
2. In the "File System" dropdown, choose exFAT instead of NTFS.
3. Click Start and close this window when finished.


https://osxfuse.github.io/
(file system in user space) 

https://unetbootin.github.io/
loads Linux ISO images to USB drives


### Keyboard

To press the Windows key, press the command key.

To press F keys (F2, etc.), hold down the fn key and press F2, etc.
at the top row.

### Settings

Several topics below refer to use of VMWare Tools installed from inside Windows.

You need to be on a single-screen 
to obtain the VMWare Machine menu at the top by moving the mouse there.

0. Click Sharing.
0. Use the square + and - icons at the lower right.

PROTIP: Do not mirror a folder. It may take too much space.

### Shared Folder

This uses VMWare Tools installed from inside Windows.

0. Virtual Machine > Settings > Sharing

PROTIP: After unzip, delete the zip file to keep disk usage low.


### Defrag Windows

SSD drives should not be defragmented.

Only traditional spinning disks need to be defragmented,
to relocate where bits are stored so contiguously blocks
are available.

0. Before doing this, make a full backup to a USB external drive.
0. You'll need to use an Admin account.
0. Click the Start button. 
0. Type Disk and select Disk Defragmenter (rather than going through menu All Programs, Accessories, Choose System Tools).
0. Hit Analyze or Defragment Now.
0. This takes a while, possibly even hours, to run.
0. The PC can be used throughout the process, but it's not advisable.


### Delete Snapshots #

VMWare automatically takes snapshots as a fall-back.

These take up room.

In the list of Virtual Machines available, the amount of roome taken by
snapshots is listed.

To establish a particular state of an instance as the <strong>base</strong> for another image, it's best to remove the snapshots.

0. Shut down the virtual machine.
0. Make a complete backup to anotther USB device.
0. Go to Virtual Machine menu Snapshots. ...
0. Select one or more snapshots to delete by holding down Shift when clicking.
0. Click the Delete icon.
0. Watch the progress bar at the bottom. This takes several minutes.


<a name="RemoteDesktop"></a>

## Microsoft Remote Desktop #

There are two programs that enable Mac users to access and <strong>take over</strong> 
Windows servers remotely,
using RDP (Remote Desktop Protocol), also known as Terminal Services,
which uses port 3389:

A) <a target="_blank" href="http://www.microsoft.com/en-us/download/details.aspx?id=18140">
   Remote Desktop Client Connection for Macintosh</a>.

   RDC_2.1.1_ALL.dmg is 9.4 MB

B) <a target="_blank" href="http://cord.sourceforge.net/">CoRD on Sourceforge</a>,
   which is for Mac OS X 10.5—10.8 (obsolete when 10.12 Sierra is out?).

   CoRD_0.5.7.zip is 3.4 MB

   After running this, drag it into your Applications folder.

   To add a new server, click on the menu File.

C) <a target="_blank" href="https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417?mt=12">
   Microsoft's Remote Desktop for Mac OSX from the Apple Store</a>.
  
   This is newer than the edition that comes with Microsoft Office for Mac 2011.

0. Click Get.
0. Click Install.
0. Click Open.

   <amp-img alt="ms remote desktop mac menu" width="467" height="87" src="https://cloud.githubusercontent.com/assets/300046/15401475/f121822c-1dac-11e6-9626-71e6ecb894d6.jpg"></amp-img>

 0. Click + New

   <amp-img alt="ms remote desktop mac" width="426" height="485" href="https://cloud.githubusercontent.com/assets/300046/15401380/8e639ee0-1dac-11e6-98cd-9519d7dcf519.jpg"></amp-img>

   This UI version is difficult because there are no favorites or sorting by last use,
   aliases, etc. (that I know of).  I now have to scroll down the list every time, 
   and remembering which of many cryptic names I want, which is difficult
   if you have a lot of servers on the list.

NOTE: http://docs.aws.amazon.com/quickstart/latest/rd-gateway/welcome.html
Quick Start for Remote Desktop Gateway that explains how to configure RDGW in detail


## Configuration

It's a good thing the classic Control Panel is still in Windows 10.
The Color Picker in the classic Control Panel is nested under "Appearance and Personalization", "Personalization", 
then "Color and Appearance."

The classic Control Panel enables you to create nearly any color you want for the accent color,
even though Windows 10 Personalization page of the Settings app
provides only a limited palette of 48 colors to choose from.


### Fink

   <a target="_blank" href="http://www.simplehelp.net/2007/05/09/how-to-install-linux-applications-in-os-x-a-complete-walkthrough/">
   Back in 2007</a>
   <a target="_blank" href="http://www.finkproject.org/download/">
   Fink</a> was recommended. It is a package manager like Homebrew and MacPorts.
   Fink is Apt-based, so people will feel right at home coming from a <strong>Debian</strong> Linux environment.
   Its packages are binary,so no long compile times. But practically they are usually outdated and I had to compile stuff for my system anyway.
   It needs X11 installed.


## References

* https://www.howtogeek.com/187359/5-ways-to-run-windows-software-on-a-mac/



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
