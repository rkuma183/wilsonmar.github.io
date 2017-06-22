---
layout: post
title: "Apple Macbook Hardware"
excerpt: "It's stylish because it's expensive"
shorturl: "https://goo.gl/mMB7vZ"
tags: [apple, mac, setup]
image:
# feature: pic gray apple logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622417/0edc21ac-0587-11e6-9f30-ccf9560ce462.jpg
  credit: Wonderful Engineering
  creditlink: http://cdn.wonderfulengineering.com/wp-content/uploads/2013/11/apple-wallpaper-3.jpg
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

<a id="Register"></a>

## Register it. Now.

<a target="_blank" href="https://support.apple.com/en-us/HT204308">
Find your serial number</a>
and enter it in
<a target="_blank" href="https://selfsolve.apple.com/agreementWarrantyDynamic.do">
Apple Online Service Assistant</a> to confirm your warranty and support status.

<a target="_blank" href="https://www.ifixit.com/info/ID-your-Mac">
Identify your Mac</a> for 
<a target="_blank" href="https://www.ifixit.com/Teardown/Retina+Macbook+2015+Teardown/39841">
tear-down instructions such as for MacBook Pro A1398 (Retina, 15-inch,Early 2015)</a>.


## Case

Dropping a Macbook can crack the screen.

But a protective case adds to the weight.


<a id="Coolingz"></a>

## Cooling

The Macbook Pro has always had a history of running hot. 

if you're only using power when plugging into the Mac's USB hub connector,
use an external USB power plug straight into the wall outlet.


<a id="WristRest"></a>

## Wrist Rest Cushion

I like some cushioning for where my palm
touches the cold hard keyboard and 
on sharp edges of the Mac Pro Retina laptop.

In https://support.apple.com/en-us/HT203671
Apple recommends against use of palm pads,
as the pads puts uneven pressure on the display glass.

The pads also cause a line of dust on the screen.

Unlike the much better looking leather
<a target="_blank" href="https://www.twelvesouth.com/product/surfacepad-for-macbook"> $29 TwelveSouth</a>,
the <a target="_blank" href="
http://www.amazon.com/GRIFITI-Notebook-Silicone-Reposition-Travelling/dp/B00897D3OQ/ref=wilsonslifenotes">
$9.99 GRIFITI Palm Pads</a>
is removeable (rests on rather than glued on the keyboard), so
it can be taken off before closing the cover.



<a id="SysPrefs"></a>

## System Preferences 

<ol type="1">
<li> If you don't see the Apple icon at the top of the screen,
move the cursor to the very top of the screen for a few seconds.</li>
<li> Click on the Apple icon at the upper left corner.</li>
<li> Select <strong>System Preferences</strong>.</li>
</ol>

<a id="Displayz"></a>

## Display

<ol type="1">
<li> Within <a href="#SysPrefs">System Perferences</a>:</li>
<li> Click <strong>Displays</strong>.</li>
<li> Set <strong>Resolution</strong> to <strong>Scaled</strong></li>

<li><a href="_blank" href="https://www.esolutions.se/en-GB/test">
Test Page</a> reports the screen and resolution along with browser version.</li>

   The Mac Pro 15 inch retina display is preconfigured to 
   a screen resolution of <strong>1440 wide x 900 high</strong>,<br />
   but a browser window of <strong>1440 x 738</strong>.

<li> Click one of the 5 resolutions between <strong>Larger Text</strong> and 
<strong>More Space</strong>.</li>
</ol>


<a id="Microphonez"></a>

## Microphone #

To disable the internal microphone, there is no icon.
So reduce the input volume to 0:

<ol type="1">
<li> Click on the Apple logo at the upper left corner.</li>
<li> Select System Preferences.</li>
<li> Type S and click on <strong>Sound</strong>.</li>
<li> Click on the <strong>Input</strong> tab.</li>
<li> Drag the <strong>Input volume</strong> slider all the way to the left.</li>
<li> Close System Preferences.</li>
</ol>

This works by changing the audio input to the line-in, 
also known as the audio input port on your Mac. 
As long as you don't actually have any audio input device connected, 
such as an external microphone or some other line-in device, 
this method should work.




<a id="Setup_Sound"></a>

## Sound Control #

Until Apple realizes how annoying it is to have that start-up sound on a Mac, 
create in the /Library/Scripts folder shell scripts containing 
osacript (<a target="_blank" rel="amphtml" href="http://en.wikipedia.org/wiki/AppleScript">Applescript</a>a>) commands
to mute sound automatically before reboot, and un-mute after reboot.

0. Open a terminal and type in nano. Press Enter.

   Type this in the nano editor that pops up this shell script (starting with the she-bang #! characters):

   <pre>
   #!/bin/bash
   osascript -e 'set volume with output muted'
   </pre>

0. Press Ctrl+O, then when it asks you for the filename type in 

   <tt>
   ~/Documents/mute.sh
   </tt>

0. Hit Enter to save the file. This puts the mute script in your Documents folder (don't worry, we're going to move it later).

0. Create the unmute.sh script:

   <pre>
   #!/bin/bash
   osascript -e 'set volume without output muted'
   </pre>

   (In older versions the unmute script instead has 

   <tt>set volume with output unmuted</tt>.

0. Press Ctrl+X, press Y to agree, then type in 

   <tt><strong>
   ~/Documents/unmute.sh for the file name. 
   </strong></tt>

0. Hit Return to save the new file, and nano should quit.

0. To make the scripts executable,
   run the following commands in the Terminal, hitting Enter after each one

   <pre>
   sudo chmod u+x ~/Documents/mute.sh
   sudo chmod u+x ~/Documents/unmute.sh
   sudo mv ~/Documents/mute.sh /Library/Scripts/
   sudo mv ~/Documents/unmute.sh /Library/Scripts/
   </pre>

0. Set the scripts to run automatically:

   <pre>
   sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute.sh
   sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/unmute.sh
   </pre>

0. Close the Terminal, save data in all other apps, and reboot your machine.

0. To undo the above actions, set defaults in a Terminal window:

   <pre>
   sudo defaults delete com.apple.loginwindow LogoutHook
   sudo defaults delete com.apple.loginwindow LoginHook
   </pre>

For more about Applescript commands and hooks, see
<a target="_blank" rel="amphtml" href="https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html">
this</a>.



<a id="HardDrivez"></a>

## Hard Drives on Mac


<a id="MacBoot"></a>

### Boot loader on Mac

MacOS does not use the boot loader other Linux machines store in the /boot folder.

MacOS machines boots from the <strong>boot.efi</strong> binary file within 
cd /System/Library/CoreServices.
This is for Intel Macs. Older PowerPC Macs (and an old enough version of OS X) boots from file BootX.

The MacOS kernel, as of Yosemite (version 10.10), is at<br />
`/System/Library/Kernels/kernel`,
   but was just /mach_kernel in older versions.

Apple-supplied loadable kernel modules (known as kernel extensions or kexts) are found in<br />
`/System/Library/Extensions/`

Third-party extensions are in<br />
`/Library/Extensions/`.

See <a target="_blank" href="https://developer.apple.com/library/content/documentation/Darwin/Conceptual/KernelProgramming/booting/booting.html">
this Apple article</a>.


### Disk Drive Partitions

In Linux File Systems:

Drivers for an MBR (Master Boot Record) Partition Table can handle up to <br />
<strong>2TB</strong> of disk space per partition. To list partitions:

   By design MBR contains space for only 4 primary partitions.
   One partition can be an extended partition where
   logical partitions can be defined.

Drivers for a <strong>GUID / GPT Partition Table</strong> can handle up to <br />
<strong>8 Zettabytes (ZB)</strong> of disk space per partition.

SCSI devices can have up to 15 partitions.

   0. fdisk only works on MBR.
   0. parted
   0. gdisk

The default partition type is 83 for Linux, 82 for Swap.

0. Use mkfs to create file systems.

   NOTE: File systems include XFS, ext2, ext3, ext4, ReiserFS, Btrfs (better fs), etc.


### Disk utilities

0. Open a Terminal window.

0. List partitions:

   <pre><strong>diskutil list</strong></pre>

   It lists <strong>physical and virtual disks</strong>:

   <pre>
/dev/disk0
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *251.0 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                  Apple_HFS Mac SSD                 150.0 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
   4:       Microsoft Basic Data Windows 8               100.1 GB   disk0s4
/dev/disk1
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *500.1 GB   disk1
   1:                  Apple_HFS George Garside          300.2 GB   disk1s1
   2:               Windows_NTFS GRGARSIDE               199.9 GB   disk1s2
   </pre>
   &quot;0:&quot; and other such numbers are <strong>partitions</strong>.

   The command takes the place of the Linux `lsblk` commmand.

0. Get information for a specific partition (disk0):

   <pre><strong>diskutil info /dev/disk0</strong></pre>

   The "Device / Media Name" is the partition label from the disk's partition map 
   (GPT - GUID Partition Table).
   <strong>disk0</strong> Device Media Name: such as &quot;APPLE SSD SM768E Media&quot;
   is the make and model of your drive.

   Device / Media Names are set when a partition is created on a disk. The only way you could rename the "startup partition" would be to startup from another drive. The initial name is set by Apple.
   (which Apple does not expected people to change
   and does not reference them at the CLI or GUI level).

   AOTW, Apple sells SD drives up to 750.4 GB.

   Notice that <strong>disk1</strong> is a <strong>Logical Volume on disk0s2</strong>
   with a GUID referencing disk0.

0. DOTHIS: In a Terminal window invoke:

   <pre><strong>diskutil info /dev/disk0s2</strong></pre>

   <strong>disk0s1</strong>: "EFI system partition"

   contains extended firmware for your drive.

0. DOTHIS: In a Terminal window invoke:

   <pre><strong>diskutil info /dev/disk0s1</strong></pre>

   <strong>disk0s1</strong>: "EFI system partition"<br />
   contains extended firmware for your drive.

   <strong>disk0s2</strong>: "Customer" to diskutil
   is where your files are stored.

0. DOTHIS: In a Terminal window invoke:

   <pre><strong>diskutil info /dev/disk1</strong></pre>

   appears on the Desktop as &quot;Macintosh HD&quot; system partition, 
   which can be changed by pressing Return key after clicking on it.

   <strong>disk0s3</strong>: "Recovery HD"
   is a clean install of the OS to make restoring your computer easier.

   If you add your own custom partition to the mix you will find that Apple's tools (i.e. Disk Utility) will match the visible name and the device name.

0. DOTHIS: Plug in a <strong>Time Machine</strong> drive. 
0. In a Terminal window invoke:

   <pre><strong>diskutil info /dev/disk2
   </strong></pre>

   In the list it would have 3 partitions:

   0: Apple_partition_scheme<br />
   1: Windows_FAT_32<br />
   2: Apple_HFS

0. DOTHIS: Plug in a <strong>SD card</strong>. 
 
0. In a Terminal window invoke:

   <pre><strong>diskutil list
   </strong></pre>

   In the list it would have 2 partitions:

   0: FDISK_partition_scheme<br />
   1: Windows_NTFS

0. In a Terminal window invoke:

   <pre><strong>diskutil info /dev/disk3</strong></pre>

0. DOTHIS: Plug in an <strong>external drive</strong>. 
0. In a Terminal window invoke:

   <pre><strong>diskutil list</strong></pre>

   In the list it would have 2 partitions:

   0: FDisk_partition_scheme<br />
   1: Windows_NTFS Seagate Backup Plus ...

0. DOTHIS: In a Terminal window invoke:

   <pre><strong>diskutil info /dev/disk5</strong></pre>

   &quot;Seagate BUP Slim SL Media&quot;

   According to 
   http://osxdaily.com/2014/03/20/mount-ext-linux-file-system-mac/">
   http://sourceforge.net/projects/osxfuse/files/osxfuse-2.7.5/osxfuse-2.7.5.dmg/download">
   OSX Fuse</p> 
   extend OS X's native file handling capabilities via third-party file systems
   such as ext4.

0. For static information about filesystems:

   <pre><strong>fstab
   </strong></pre>



<a id="PartitionTablez"></a>

### Hard Drive Partition Tables

DOTHIS: 
To show partition tables for a particular disk:
In a Terminal window invoke:

   <tt>sudo get show /dev/disk0</tt>

Eject the disk from the Finder (or use the unmount terminal command if you'd like). If you don't do this, you may get a Resource busy error message during the following step.

CAUTION:
Change the partition label as desired:

   <pre><strong>
   sudo gpt label -i 2 -l "My New Partition Label" /dev/rdisk0
   </strong></pre>

(replace disk0 with the relevant disk number
and replace 2 with the index number.


<a id="App"></a>

### Disk Space Usage #

<a target="_blank" href="https://medium.com/@thomasdegry/how-sketch-took-over-200gb-of-our-macbooks-cb7dd10c8163">
One of the folks at Sketch (the Mac photo-editing tool) noticed</a> that 
Daisy Disk didn't map all the disk space usage.

To reveal disk usage by a file that Apple Lion uses to store copies of files to revert to any version:

   <pre><strong>sudo du -sh /.DocumentRevisions-V100
   </strong></pre>

Resetting to zero would involve re-installs.

If you use an alternative backup such as Dropbox, 
you can turn it off for a particular program:

   <pre><strong>defaults write -app ‘sketch’ ApplePersistence -bool no
   </strong></pre>




<a id="Hardware"></a>

## Peripherals - Thunderbolt miniports

The squarish holes are <strong>thunderbolt</strong> ports
for devices such as hard drives, monitors, etc.
Apple sells adapters for connecting to DVI, HDMI, and VGA monitors as well as LN45 Ethernet.

The <strong>MiniDisplay</strong> Port is compatible only with Display Port compatible devices, 
such as an external monitor from Apple. 

There are 2 squarish miniports, 
so you can <strong>chain</strong> up to 10 thunderbolt devices.

   PROTIP: A display that isn't compatible with Thunderbolt must be the last one in the chain.

Thunderbolt can transfer at speeds up to 20Gbps (higher speeds than USB).


### USB drives

BLAH: Apple's DVD drives don't play Bluray videos.

To watch Bluray disks, get a Samsung external drive and software.

To list USB ports, use this Linux command:

   <pre><strong>lsusb
   </strong></pre>

   An example response for my machine:

   <pre>
Bus 026 Device 001: ID 8087:0024 Intel Corporation Hub 
Bus 026 Device 003: ID 05ac:8510 Apple Inc. FaceTime HD Camera (Built-in)  Serial: CC2F8K0G1JDN9KE0
Bus 029 Device 001: ID 8087:0024 Intel Corporation Hub 
Bus 029 Device 002: ID 0424:2512 SMSC Hub 
Bus 029 Device 004: ID 05ac:0262 Apple Inc. Apple Internal Keyboard / Trackpad 
Bus 029 Device 003: ID 0a5c:4500 Broadcom Corp. BRCM20702 Hub 
Bus 029 Device 005: ID 05ac:8286 Apple Inc. Bluetooth USB Host Controller 
Bus 020 Device 012: ID 045e:0040 Microsoft Corporation Microsoft 3-Button Mouse with IntelliEye(TM) 
Bus 000 Device 001: ID 1d6b:IPCI Linux Foundation USB 2.0 Bus 
Bus 000 Device 001: ID 1d6b:IPCI Linux Foundation USB 2.0 Bus 
Bus 000 Device 001: ID 1d6b:IPPT Linux Foundation USB 3.0 Bus 
   </pre>


### USB-C ports

2015 Macbooks 
don't come with regular USB ports so one has to buy 
<a target="_blank" href="http://store.apple.com/us/product/MJ1M2AM/A/usb-c-to-usb-adapter">
$19 Apple proprietary adapter cables</a>.

Another power plug runs 
<a target="_blank" href="http://store.apple.com/us/product/MJ262LL/A/apple-29w-usb-c-power-adapter?fnode=51">
$49</a>

2015 Macbooks combine power and communication (Ethernet) into a single
proprietary oblong rounded USB-C connector.
USB-C connectors can be inserted on either side (unlike earlier USB plugs).
It follows the USB 3.1 standard, which has a theoretical
maximum speed of up to 10Gbps (gigabits per second)
-- two times faster than USB 3.0. But the Macbook is at 5Gbps for now.

3.1 support is used by <a target="_blank" href="http://store.apple.com/us/product/MJ1K2AM/A/usb-c-digital-av-multiport-adapter"> Apple's $79 HDMI/VGA connector</a>
and by upcoming MHL (Mobile High-definition Link) 3 devices to 
stream 4K video from mobile devices to TV sets.

Get a USB-C to USB-B cable.
Plug it into a battery pack and you can charge the laptop.

* https://www.ifixit.com/Device/MacBook_Pro_15%22_Core_2_Duo_Models_A1226_and_A1260


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
