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

MacOS Sierra supports these hardware models:

<ul><li><a href="//www.macrumors.com/roundup/imac/">iMac</a> (Late 2009 or newer)</li>
<li><a href="//www.macrumors.com/roundup/macbook-air/"><a href="//www.macrumors.com/roundup/retina-macbook-air/">MacBook</a> Air</a> (2010 or newer)</li>
<li>MacBook (Late 2009 or newer)</li>
<li><a href="//www.macrumors.com/roundup/mac-mini/">Mac mini</a> (2010 or newer)</li>
<li><a href="//www.macrumors.com/roundup/macbook-pro/">MacBook Pro</a> (2010 or newer)</li>
<li><a href="//www.macrumors.com/roundup/mac-pro/">Mac Pro</a> (2010 or newer)</li></ul>

## Case

Dropping a Macbook can crack the screen.

But a protective case adds to weight.

## Screws

Apple uses tiny screws for their products.
Screws for older Mac Book Pro's have a + pattern requiring a 1.5mm screwdriver.
Screws for newer Mac Book Pro's have a 5-point design which require a
screwdriver called the "pentalobe" Torx T6.
iPhones have requiring a T6 Torx 0.6 screwdriver.
The Phillips PH#00 is a little too big.

Screws on the black hindge edge are longer. 


<a id="Coolingz"></a>

## Cooling

The Macbook Pro has always had a history of running hot. 

If you're only using power when plugging into the Mac's USB hub connector,
use an external USB power that plugs straight into the wall outlet.

Use of an external monitor may also cause the fan to engage.


<a id="Battery"></a>

## Battery

https://macdaddy.io/mac-battery-guru/
displays the current battery drain.

![macbook-hardware-battery-307x366](https://user-images.githubusercontent.com/300046/27984588-d9e61542-6396-11e7-84bf-0e383537dc54.png)


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



<a id="SysProfiler"></a>

## System Profiler File Redirect

MacOS has a single command to obtain details about your machine in a single file.

Good to provide tech support when you're dealing with a nasty problem.

There is a lot of information, so we use it to show use of some command-line kung fu:

0. Redirect the output to a dated file using the `>` symbol, but change the sample  date
   as you type this command:

   <pre><strong>cd ~
   system_profiler >system_profiler_<em>2017_06_11</em>
   </strong></pre>

   This takes a while to run.

0. In the Terminal, highlight the file name and press Ctrl+C to copy it to your Clipboard.
0. To count the number of lines in that output file above:

   <tt><strong>wc system_profiler_2017_06_11
   </strong></tt>

   The response I got:

   <pre>
   72759  346086 3353663 system_profiler_2017_06_11
   </pre>

   In the example above, 72759 is the number of lines, 
   13346086 is the number of words, and 3353663 is the number of characters.

   SIDE NOTE: This is more than the number (64922) obtained from the 
   <a target="_blank" href="https://www.computerhope.com/unix/nl.htm">
   nl command</a> which adds a line counter as it displays each line.



<a id="KernelState"></a>

## System Kernel State

This is rather geeky, but just so you know:

   <tt><strong>sysctl -a hw
   </strong></tt>

   `-a` lists all the currently available non-opaque values.

   <a target="_blank" href="https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man3/sysctl.3.html#//apple_ref/doc/man/3/sysctl">detailed description of these.</a>

   <pre>
hw.ncpu: 8
hw.l3cachesize: 6291456
hw.l2cachesize: 262144
hw.l1dcachesize: 32768
hw.l1icachesize: 32768
   </pre>


   <tt><strong>sysctl kern.clockrate
   </strong></tt>

   <pre>
kern.clockrate: { hz = 100, tick = 10000, tickadj = 2, profhz = 100, stathz = 100 }
   </pre>


   <tt><strong>sysctl vm.swapusage
   </strong></tt>

   <pre>
vm.swapusage: total = 2048.00M  used = 320.50M  free = 1727.50M  (encrypted)
   </pre>


<a id="SysPrefs"></a>

## System Preferences 

<ol type="1">
<li> If you don't see the Apple icon at the top of the screen,
move the cursor to the very top of the screen for a few seconds.</li>
<li> Click on the Apple icon at the upper left corner.</li>
<li> Select <strong>System Preferences</strong>.

   <img alt="mac-system-prefs-10 12 5-285x280-35kb" width="285" height="280" src="https://user-images.githubusercontent.com/300046/27473427-36a91b7e-57cd-11e7-808e-85088336e959.png">
   </li>
</ol>


<a id="Displayz"></a>

## Display

<ol type="1">
<li> Click the Apple icon for <a href="#SysPrefs">System Preferences</a></li>
<li> Hold down Command+Option and click <strong>Displays</strong> so the Rotation selection is visible.</li>

   In the dialog for the additional screen, select 270 for the vertical screen.

   WARNING: Use of additional screens often cause the laptop fan to activate due to the additional heat from additional CPU usage.

<li> Set <strong>Resolution</strong> to <strong>Scaled</strong></li>

<li><a href="_blank" href="https://www.esolutions.se/en-GB/test">
Test Page</a> reports the screen and resolution along with browser version.</li>

   The Mac Pro 15 inch retina display is preconfigured to 
   a screen resolution of <strong>1440 wide x 900 high</strong>,<br />
   but a browser window of <strong>1440 x 738</strong>.

<li> Click one of the 5 resolutions between <strong>Larger Text</strong> and 
<strong>More Space</strong>.</li>
</ol>


## Stylus on Touch Pad

<strong>Pen tablets</strong> are useful on Photoshop, Sketch, Pixelmator and other paint and calligraphy programs. 
Google's training videos use them for live illustrations.

Some professional drawing tablets are hundreds of dollars.

<a target="_blank" href="https://www.apartmenttherapy.com/quick-tip-use-a-tablet-stylus-with-your-macbook-175342">
NOTE</a> 
You can turn the touch pad on MacBook Pro laptops into a drawing tablet by installing the $29.95 <a target="_blank" href="http://tenonedesign.com/inklet.php/">Inklet OSX program</a> which runs in the background.

If you have a new Apple MacBook Pro, Inklet takes advantage of its "Multitouch Force Touch" trackpad that senses different levels of pressure.

Inklet recognizes those squishy rubber-tipped <strong>capacitive stylus</strong> given out by vendors at conferences and sold at dollar stores. For more precision, Inklet's $44.90 combo package includes the <a target="_blank" href="https://tenonedesign.com/pogo.php">$19.95 Pogo stylus</a>
(not the 
https://www.amazon.com/Ten-One-Design-T1-PGCT-302-Bluetooth/dp/B009K448L4/
Pogo Connect or Magnus Air even though they are also useful on 3D touch iPhone and iPads.)

Inklet has a palm rejection feature that ignores where  hands typically rest on the touch pad while drawing with the stylus.

Open a drawing program before opening Inklet tablet mode by 
a) clicking on the droplet icon and select 'Start Inklet', b) sliding across the bottom of the track pad. or c)vuse the hotkey control+option+i. A transparent workspace appears where drawing occurs from the trackpad.



## Sound

<a id="Setup_Sound"></a>

### Startup Sound Suppressor Applescript

Until Apple realizes how annoying it is to have that start-up sound on a Mac, 
create in the /Library/Scripts folder shell scripts containing 
osacript (<a target="_blank" rel="amphtml" href="http://en.wikipedia.org/wiki/AppleScript">Applescript</a>) commands
to mute sound automatically before reboot, and un-mute after reboot.

0. Open a terminal and type in nano. Press Enter.

   Type this in the nano editor that pops up this shell script (starting with the she-bang #! characters):

   <pre>
   #!/bin/bash
   osascript -e 'set volume with output muted'
   </pre>

0. Press Ctrl+O, then when it asks you for the filename type in 

   <tt><strong>~/Documents/mute.sh
   </strong></tt>

0. Hit Enter to save the file. This puts the mute script in your Documents folder (don't worry, we're going to move it later).

0. Create the unmute.sh script:

   <pre>
   #!/bin/bash
   osascript -e 'set volume without output muted'
   </pre>

   (In older versions the unmute script instead has 

   <tt>set volume with output unmuted</tt>.

0. Press Ctrl+X, press Y to agree, then type in 

   <tt><strong>~/Documents/unmute.sh
   </strong></tt>

0. Hit Return to save the new file, and nano should quit.

0. To make the scripts executable,
   run the following commands in the Terminal, hitting Enter after each one

   <tt><strong>sudo chmod u+x ~/Documents/mute.sh<br />
   sudo chmod u+x ~/Documents/unmute.sh<br />
   sudo mv ~/Documents/mute.sh /Library/Scripts/<br />
   sudo mv ~/Documents/unmute.sh /Library/Scripts/
   </strong></tt>

0. Set the scripts to run automatically:

   <tt><strong>sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute.sh<br />
   sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/unmute.sh
   </strong></tt>

0. Close the Terminal, save data in all other apps, and reboot your machine.

0. To undo the above actions, set defaults in a Terminal window:

   <pre><strong>sudo defaults delete com.apple.loginwindow LogoutHook
   sudo defaults delete com.apple.loginwindow LoginHook
   </strong></pre>

For more about Applescript commands and hooks, see
<a target="_blank" rel="amphtml" href="https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html">
this</a>.



<a id="Microphonez"></a>

### Microphone Mute App #

All Macs have a microphone that picks up your voice and other sounds in your room.

BLAH: To mute the internal microphone on a Mac, 
there is NO icon among dedicated keys on the keyboard
like there is for speakers. A terrible oversight because that's just as important.

The easiest option is to get the <a target="_blank" href="https://itunes.apple.com/pl/app/mutemymicfree/id567195825?mt=12">
MuteMyMicFree</a> app by Michal Konrad Owsiak:

<img align="right" alt="mac-mutemymic-39x228-7k" width="39" height="228" src="https://user-images.githubusercontent.com/300046/27474907-5a13f936-57d1-11e7-9f9f-e314d1594d3a.png">

0. Open a web browser to
<a target="_blank" href="https://itunes.apple.com/pl/app/mutemymicfree/id567195825?mt=12">
https://itunes.apple.com/pl/app/mutemymicfree/id567195825?mt=12</a>
0. Click <strong>View in Mac Ap Store</strong>.
0. In the App Store pop-up, click <strong>Get</strong>, then <strong>Install app</strong>.
0. Click <strong>Open</strong>.
0. Click the microphone icon on the menu bar at the top of the screen:<br />
   ![mac-mutemypic-icon-60x60](https://user-images.githubusercontent.com/300046/27475483-62d2a5b6-57d3-11e7-8d3b-979576fe088f.png)

0. Click the gear icon in the pop-up.
0. Check the "Start MuteMyMic automatically during login".
0. Click the Quit button, the the other Quit button to dismiss the dialog.
0. Press command+Tab to the App Store.
0. Press Open, then Quit out the App Store.
<br /><br />

Alternately, if you're afraid of or cannot install downloaded apps,
reduce the input volume to 0:

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
This method works
as long as you don't have any audio input device connected, 
such as an external microphone or some other line-in device.


<a id="HardDrivez"></a>

## Hard Drives on Mac

## Hard Drives

Older Mac Book Pros have 2.5" hard drives.
<a target="_blank" href="https://www.laptopmag.com/articles/how-to-replace-your-macbook-pros-hard-drive-with-an-ssd">
Video:</a><br />
The Seagate Thunderbolt Adapter ($99) provides the fastest connection.<br />
The Seagate USB 3.0/2.0 Upgrade Cable costs just $19.99. 

Drives in newer Mac Book Pros have SSD chip cards instead of drives.

https://support.apple.com/en-us/HT201372
Create a bootable installer for macOS

After powering up the computer, 
a folder with a question mark means that a boot folder is not found on the hard disk.

Boot up with the installer Disc.


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

   ext is called the "extended file system".


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


<a name="DiskSpaceUsage"></a>

### Disk Space Usage #

<a target="_blank" href="https://medium.com/@thomasdegry/how-sketch-took-over-200gb-of-our-macbooks-cb7dd10c8163">
One of the folks at Sketch (the Mac photo-editing tool) noticed</a> that 
Daisy Disk didn't map all the disk space usage.

0. To reveal disk usage by a file that Apple Lion uses to store copies of files to revert to any version:

   <pre><strong>sudo du -sh /.DocumentRevisions-V100
   </strong></pre>

   Resetting to zero would involve re-installs.

0. If you use an alternative backup such as Dropbox, 
   you can turn it off for a particular program:

   <pre><strong>defaults write -app ‘sketch’ ApplePersistence -bool no
   </strong></pre>

0. List using a Linux command with the -Human readable flag:

   <pre><strong>df -Hl
   </strong></pre>

   The response:

   <pre>
Filesystem                          Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1                          499G   339G   159G    69% 3373911 4291593368    0%   /
localhost:/hTrfpXTlOnJhs5cpiEGZpI   499G   499G     0B   100%       0          0  100%   /Volumes/MobileBackups
   </pre>

   Alternately, there is a more verbose -human readable flag:

   <pre><strong>df -h
   </strong></pre>

   The response:

   <pre>
Filesystem                          Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1                         465Gi  316Gi  148Gi    69% 3375349 4291591930    0%   /
devfs                              256Ki  256Ki    0Bi   100%     884          0  100%   /dev
map -hosts                           0Bi    0Bi    0Bi   100%       0          0  100%   /net
map auto_home                        0Bi    0Bi    0Bi   100%       0          0  100%   /home
localhost:/hTrfpXTlOnJhs5cpiEGZpI  465Gi  465Gi    0Bi   100%       0          0  100%   /Volumes/MobileBackups
kbfs@kbfuse0                        10Gi    0Bi   10Gi     0%       0          0  100%   /keybase
   </pre>


   ### inodes

   Under the `iused` and `ifree` columns are the number of <strong>inode</strong> entries 
   used and free. The total allocated of 4,294,967,279 is fixed at system creation.


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
