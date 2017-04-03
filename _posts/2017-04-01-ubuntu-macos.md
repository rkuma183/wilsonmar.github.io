---
layout: post
title: "Ubuntu on MacOS"
excerpt: "Using VMWare Fusion"
tags: [Ubuntu, Git, Linux, setup]
image: ubuntu-penguin-brown-1900x500-232kb.jpg
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/24591626/542c02a8-17d4-11e7-988c-847fce318fa9.jpg
  credit: ubuntu-discourse.org
  creditlink: http://www.ubuntu-discourse.org/?p=41
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

This is an enhanced version of <a target="_blank" href="https://hplgit.github.io/teamods/ubuntu/vmware/mac.html">
this web page</a> on how to setup Ubuntu Linux within a Mac using VMWare Fusion 8.5.6 as of 1 April 2017.


## Install Ubuntu

0. Go to <a target="_blank" href="https://www.ubuntu.com/download/desktop">
   https://www.ubuntu.com/download/desktop</a>

0. Choose the latest 64-bit Desktop version of Ubuntu. 

   Ubuntu 16.04.2 LTS

   Notice the distribution is from Canonical: https://www.ubuntu.com/server:

   ![ubuntu-desktop-releases-540x286-54kb](https://cloud.githubusercontent.com/assets/300046/24591898/567209c6-17da-11e7-9865-4f86487a3102.png)

0. If you can't afford to help out financially, scroll down to click:

   "Not now, take me to the download"

0. Click download to the Downloads default folder, file:

   ubuntu-16.04.2-desktop-amd64.iso, 1.55 GB

0. This is a large file, so it's better if you move the file to a USB-3 SD drive.


   ## Run Installer

0. Launch VMWare Fusion (the instructions here are for version 7).
0. Click on File - New and choose to Install from disc or image.

   ![vmware8 new 157x146-20kb](https://cloud.githubusercontent.com/assets/300046/24590395/06d529ea-17ba-11e7-9cfd-957967e7528c.jpg)

0. Click "Continue" on the "Select the Installation Method" screen.
0. Switch to the Finder. Drage the .iso file and drop it on the VMWare screen. 

   Optionally, click "Use another disc or disc image and choose your .iso file" with the Ubuntu image.

0. Check "Make your home folder accessible to the virtual machine". Click Continue.
0. Fill in a password in the "Linux Easy Install" screen. Check the box for sharing files with the host operating system.

   PROTIP: Write down the password.

0. Choose "Customize Settings" and make the following settings (these settings can be changed later, if desired):

   Hard Disk: Choose how much disk space you want to use inside the virtual machine (20 Gb is considered a minimum).

   Processors and Memory: Set a minimum of 2 Gb memory, but not more than half of your computer's total memory. The virtual machine can use all processors.

0. Craft a VMWare image name "Ubuntu-16.04.2-20gHD-4gRAM" and<br />
   choose where you want to store virtual machine files on the hard disk ("Virtual Machines" folder).

   The default location is usually fine. 
   The directory with the virtual machine files needs to be frequently backed up so make sure you know where it is.
   
0. Change settings.

0. Click the white arrow in the middle of the black screen
   for Ubuntu to install itself without further dialog. This takes some time.

0. Read the ads while installing.


   ## OS Config

   Installed with the operating system are Firefox browser and Libre Office. 

   QUESTION: Is there a command script that does all this below?

   Since you're likely to have a high-resoultion Apple screen,
   adjust in Linux a higher resolution of the display:

0. Hover your mouse over each of the icons on the left screen and click on the System settings icon.

0. Click on the Displays icon under the Hardware section.

0. PROTIP: Click Resolution from the default of "800 x 600 (4:3)" to the next larger one ("1024 x 768 (4:3)".
0. Click "Apply".
0. Click "Keep this configuration" when you are satisfied.

   Notice the Ubuntu screen is slightly above your Mac's bar at the bottom.

   ### Keyboard

0. Click "System Settings" icon again to configure Keyboard.
0. Click Text entry. Click the "+" at the lower-left corner for a new "Input sources to use".
0. Type "En" for a list of English sources, then choose "English (US, alternative international)". Click Add.
0. Type Ctrl+space or Ctrl+backslash, in the Switch to next source using field. 
0. Click the red x circle to exit the dialog.

   ### Terminal

0. Hover over icons on the left (called the Ubuntu Software Center Applications menu).
0. Hover over the top icon (Ubuntu) for "Search your computer" to appear. Click on it.
0. Type in the "Search your computer" field <strong>Terminal</strong>.
0. Press <strong>Control+shift+t</strong> to make a new tab.

   ### Firefox browser for internet

0. Click the icon for "Firefox Web Browser".
0. Hover over the black bar at the top to reveal the red exit button for the current app.

   ### Unlock from Launcher

0. Alt-click the Amazon icon and click "Unlock from Launcher".
0. Repeat for Libre Office if you don't plan on writing.

   ### Shutdown to Backup VMWare virtual machine on a Mac

   With a backup, if something happens to your virtual machine, it is usually a straightforward task to make a new machine and import data and software automatically from the previous machine.

   With VMWare Fusion, the entire Ubuntu machine is a folder on the host computer, typically with a name like Documents/Virtual Machines/Ubuntu 64-bit. Backing up the Ubuntu machine means backing up this folder. 

   However, if you use tools like Time Machine and work in Ubuntu during backup, the copy of the state of the Ubuntu machine is likely to be corrupted. 

   So <strong>shut down</strong> the virtual machine prior to running Time Machine.
   or simply copy the folder with the virtual machine to some backup disk.

0. Click the gear at the upper-right corner to Shut Down.
0. Click Restart or Shut Down.
0. Copy the VMware file to backup device.
0. Rename the VMware file you will reuse with "-osconfig" text.
0. Copy the *.iso file to backups device (optionally).
0. Delete the *.iso file.

   ### Install dot files

0. In VMWare Fusion, double-click the "-osconfig" version created above to open it.
0. Click the left icon for "Firefox Web Browser".
0. Click on the address bar and paste this URL, then press Enter:

   <a target="_blank" href="http://goo.gl/RVHixr">http://goo.gl/RVHixr</a><br />
   (https://github.com/hplgit/vagrantbox/tree/master/doc/src/vagrant/src-vagrant/)

0. Scroll down GitHub to click on one of the following files (to install a collection of software for scientific work using apt-get):

   * install_minimal.sh to install a minimal collection (recommended)

   * install_rich.sh to install a rich collection (takes time to run)

0. Click the Raw button. The file comes up in the browser window.
0. Right-click (press two fingers) and choose <strong>Save Page As...</strong>
0. Click Save to save the file in Downloads folder on your computer.

0. Click the Terminal icon to switch to Terminal (to find the file and run it):

   <pre><strong>
   cd ~/Downloads
   </strong></pre>

   To paste in the Terminal, alt-click (with two fingers) and select Paste.

0. Edit the file to remove or add programs to be installed.

   <pre><strong>
   edit install_minimal.sh
   </strong></pre>

   To look up all the packages which mentions a particular package name, substituted the <em>package</em> with the name:

   <pre><strong>
   apt-cache search <em>package</em>
   </strong></pre>


   ### Install Git client

0. To install an individual package name, substitute the <em>package</em> with a package name such as git:

   <pre><strong>
   sudo apt-get install git
   </strong></pre>

0. Press Y when you see:

   <pre>
   Do you want to continue? [Y/n] _
   </pre>

0. Verify the version installed:

   <pre><strong>
   git --version
   </strong></pre>

   PROTIP: This can be one or more versions behind what is downloaded from the original author's own website.


   ### Installers for Ubuntu 

   Installers specifically for Ubuntu:

0. Open a Terminal

   <pre>
   git clone 
   </pre>

   ### Don't do this:

0. To run the file to install everything (which I don't recommend):

   <pre><strong>
   bash install_minimal.sh
   </strong></pre>

   The program will run for quite some time, hopefully without problems. 

   PROTIP: If it stops, set a comment sign # in front of the line where it stopped and rerun.


   ### Uninstall package

   To save disk space by removing Thunderbird (since you use Gmail, prefer Evolution, or whatever):

0. Open a Terminal window (press control+Alt+T) and use one of these commands:

   <pre><strong>
   sudo apt-get purge thunderbird*
   sudo apt-get remove --purge thunderbird* -y
   </strong></pre>

0. Start Nautilus and press Ctrl+H to show hidden files.


## VMWare Tools for file sharing

The Ubuntu machine can see the files on your host (Mac OSX) system if you download VMWare Tools. 

Go to the Virtual Machine pull-down menu in VMWare Fusion and choose Install VMWare Tools. A tarfile is downloaded. Click on it and it will open a folder vmware-tools-distrib, normally in your home folder. Move to the new folder and run sudo perl vmware-install.pl. You can go with the default answers to all the questions.

On a Mac, you must open Virtual Machine - Settings... and choose Sharing to bring up a dialog where you can add the folders you want to be visible in Ubuntu. Just choose your home folder. Then turn on the file sharing button (or turn off and on again). Go to Ubuntu and check if you can see all your host system's files in /mnt/hgfs/.

If you later detect that /mnt/hgfs/ folder has become empty, VMWare Tools must be reinstalled by running sudo perl vmware-install.pl as above or

   <pre>
   sudo /usr/bin/vmware-config-tools.pl
   </pre>


## Internet Troubleshooting

If the Internet Does not Work in Ubuntu. Invoke the VMWare Fusion menu Virtual Machine - Settings - Network and test Share the Mac's network connection versus Connect directly to the physical network (Bridged).

## Debian

Among the Debian-based distributions, we recommend Ubuntu, simply because switching keyboard layouts is more reliable or easier in Ubuntu than in, e.g., Lubuntu, Xubuntu, and Linux Mint (a configured layout might be gone after a reboot). 

Switching keyboard layouts are particularly convenient when doing programming with an English/American keyboard, with braces and brackets in natural places, and then writing emails using a native keyboard with special characters.

