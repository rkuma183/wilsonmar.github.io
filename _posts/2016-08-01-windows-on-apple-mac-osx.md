---
layout: post
title: "Windows on Apple Mac OSX"
excerpt: "Demon spawn!"
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

* <a href="#WorkSpaces">On an internet browser to Amazon WorkSpaces</a>
* <a href="#Docker">Docker</a>
* <a href="#BootCamp">BootCamp</a>
* <a href="#VMwareFusion">VMWare Fusion</a>
* <a target="_blank" hhref="http://www.parallels.com/products/desktop">Parallels</a>

<hr />

<a name="WorkSpaces"></a>

## Browser WorkSpaces in AWS cloud

This approach works not just a MacOS laptop, 
but for any computer running a modern browser,
such as <a target="_blank" href="http://docs.aws.amazon.com/workspaces/latest/userguide/amazon-workspaces-chromebook-client.html">
on a Chromebook</a>. No files are transferred, just graphic
images of a screen on servers within the AWS cloud.

<a target="_blank" href="https://aws.amazon.com/workspaces/pricing/">
At $25 to $75 per month per user</a>, Amazon estimates that a WorkSpaces customer would save 59 percent over traditional Virtual Desktop Infrastructures (VDI) provided by Citrix and VMware.

Amazon's approach uses newer tech than VDI. 

1. Choose the link for your laptop model at <br />
   <a target="_blank" href="http://clients.amazonworkspaces.com/">
   http://clients.amazonworkspaces.com</a> 

0. Download and install the Chrome application to enable the proprietary PC over IP (PCoIP) protocol (from Teradici) to compress, encrypt and rapidly transport image pixels between client and server.

   On a MacOS, it's file "WorkSpaces.pkg" (38.2 MB taking 115.3 MB space).

   On a Chromebook, 

0. Double-click on the installer and click Continue and
   finally, Install. Provide your password when requested.

0. Move the WorkSpaces.pkg installer to Trash, to recover disk space.
   
0. Do a Chromebook search to verify that the Amazon WorkSpaces client app icon appears.

BLAH: The full graphic streaming virtual desktops tends to eat up much bandwidth. So measure how much you have used before and after sessions.

To manage these desktops, Amazon enables you to use your existing Active Directory (AD). To make this happen, you'll need to set up an Amazon Virtual Private Cloud (VPC) with a hardware virtual private network (VPN) connection to your on-premises environment, or provision a dedicated connection with AWS Direct Connect. Once linked up, you use the  AWS Management Console to select the users in your Active Directory who will receive a WorkSpace. 


<a name="Docker"></a>

## Docker #

Docker is my favorite approach because you can run the same files
[(Dockerized apps)](/dockerize/) on Windows, Mac, and Linux platforms.

Docker provides a transparent interface to operating systems.

* [Docker setup](/docker-setup/)
* [Docker build](/docker-build/)


<a id="BootCamp"></a>

## Boot Camp on Mac #

Apple came up with it, at https://support.apple.com/en-us/HT201468
says the installer is in the <strong>Utilities folder inside the Applications folder</strong>.

This is called a "split brain" approach. The hassle with this are that:

* a repartition of your startup disk to create a Windows partition is necessary.
   You install Windows in the Windows partition.

* <strong>switching requires a reboot</strong>.


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
