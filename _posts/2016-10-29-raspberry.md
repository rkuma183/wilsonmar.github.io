---
layout: post
title: "Raspberry Pi Raspbian IoT Installation with Ansible"
excerpt: "How to setup a Raspberry Pi 3B to use Xamarin Mono and other apps"
tags: [IoT, Raspberry, Mono, Mac]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial provides manual instructions and automted script to setup and 
run apps under Raspbian on a Raspberry Pi 3 B.


## End uses

There are several end-uses for a computer that are <strong>constantly on</strong>:

* Run a local Gitlab server to mirror repositories on your laptop so all changes are 
   immediately sent there in case your laptop dies suddenly.

* Display your email so you can just glance at it (at a security risk).
* <a href="#NewsFeeds">Display web pages that refreshes itself automatically (web cams)</a>.
* Display metrics on a dashboard web page such as a Kibana or Grafana.
* Play a movie (mp4 file) loop using a built-in utility.
* Display feeds from a close-circuit USB Camera.

* Run a NAS server (local Network Attached Storage) off a USB hard drive.
* <a href="#InstallNode">Run Node.js code to run a web server</a>.
* Run a local Hadoop cluster database.

* Run an <strong>IoT Gateway server</strong> for home automation.

To get going we first should:

* Run an install script to configure the Pi.
* Run Bash shell script on boot-up to download a script from GitHub and run it.
* <a href="#CronJob">Run cron background</a> to periodically 
   <a href="#Temp">measure board's temperature</a>
* Run Python code to measure board temperature and free memory over time.


## Hardware


0. Raspberry Pi 3 B+ $35

   The Raspberry Pi 3 has a 1.2 GHz quad-core ARMv8 chip with 1 GB of RAM.

   <amp-img alt="iot raspberry_pi3_2 500x302 69kb.jpg" width="500" height="302" src="https://cloud.githubusercontent.com/assets/14143059/19865119/8a5470e6-9f60-11e6-8f62-e58f44c4f14c.jpg"></amp-img>
   <!-- http://www.memoryexpress.com/Products/MX61461 -->

0. Risers or a static-resistent mat to put a board (without a riser).

   <a name="HeatSink"></a>

0. Heat sink and fan for disspating heat better when seated on top of the CPU chip 

   PROTIP: Running above 80 degrees F shortens life of the board.
   In data centers, for every 50 kW of power fed to an aisle of server, 
   the same facilities typically apply 100-150 kW of cooling.

   PROTIP: <a href="#BoardTemp">Measure board temperature over time.</a>
   The little alumininum heat sink reduces heat by 2 degrees F.
   Get a large heatsink and fan from an old desktop computer.
   The larger the sink the better.
   <a target="_blank" href="https://www.youtube.com/watch?v=1AYGnw6MwFM">
   30 degrees cooler</a> with a large copper sink on
   held in place by a clear plastic layer.
   The sink sits on top of a 3 mill copper plate on top of the chip.
   Attach using Artic MX-4 thermal compound.

   <a target="_blank" href="https://www.youtube.com/watch?v=WfQMLInuwws">
   45 degrees</a> using a
   Molex connector used by the fan is powered by a box that may be hard to find now.
   It's loud.

   <a target="_blank" href="https://www.youtube.com/watch?v=O7cc4eLAOMk">
   Water cooling</a>


0. 2.5A micro-USB 5V DC power - two-prong plug in the US market.

   You can re-use those provided with Android smartphones.

   NOTE: Consumption of electrical voltage is measured in Amprage,
   which draws down voltage.

   Even though US electricity is rated at 120V AC (60 Hz),
   the rating for the plug says 110V - 240V (50 - 60 Hz) so
   a mechanical adapter can use used in other countries.

0. Micro SD card (8+ GB, up to 32 GB), class 10.
   <strong>Several of them</strong>, for backup and as a base to build others.

   PROTIP: Windows 10 IoT does not support class 4 SD cards.
   An SD card's "class" rating refers to its sustained write speed.
   A class 4 card writes at 4MB/s (4 megabytes per second).
   A class 10 card writes at 10M/s,
   achievedPhotographers prefer SD cards with a class 10 rating because to them
   Get a large heatsink from an old desktop computer.
    at the cost of read speed and increased seek times.
   fast write speed is more important.

   https://www.youtube.com/watch?v=1AYGnw6MwFM
   PROTIP: This is the same one used on many smart phones and cameras.
   So <a target="_blank" href="https://www.mklibrary.com/technology/best-microsd-cards-2016/">
   this detailed analysis with benchmarks</a> 
   from a photographer is useful. The ones from Costco are a good buy:
   SanDisk Ultra MicroSDHC 32GB UHS-I Class 10 Memory Card With Adapter (Upto 80mbps Speed).

   <!-- https://www.sdcard.org/consumers/choices/file_system/index.html#cards-for-pcs -->
   <amp-img alt="sd backwards-compatibility 556x304.gif" width="556" height="304" src="https://cloud.githubusercontent.com/assets/14143059/19836547/6b602a38-9e69-11e6-857c-c0e6ac586dbf.gif"></amp-img><br /><br />

   Devices reading the cards must be made to accept larger capacity chips.
   But can accept smaller capacities.
   SDHC (Secure Digital High Capacity of 4GB to 32GB).<br />
   SHXC (Secure Digital eXtended Capacity of 64GB to 
   <a target="_blank" href="http://www.micro-sdxc.com/">
   2TB</a>)

   Cheap SD cards may not last long.

   PROTIP: There is <a target="_blank" href="https://www.raspberrypi.org/downloads/noobs/">
   SD card containing pre-installed NOOBS</a> (New Out Of Box Software)
   promoted as "the easiest to work with".

   But this tutorial focuses on industrial-grade components for 
   maximum flexibility, power, and security.

0. 32 GB of disk space on a Mac or Windows machine.

   The size of hard disk drives have similar issues as SD drives.

   Windows operating systems can format drives using NTFS rather than FAT32.

   Natively Mac OSX does not know how to read NTFS drives.

0. DVD blank disk (R+ or R-) to hold image so as to not use up 
   laptop hard disk space.


   ### Not headless

0. HDMI cable connected to a monitor (input selected to the correct HDMI).
0. A USB keyboard.

   ### Optional hardware

0. The PiPo add-on board draws power from an Ethernet cable,
   so you don't need to buy a micro-USB power supply.

   QUESTION: Can it be combined with a fan?

0. Case that accomodates <a href="#HeatSink">heat dissipation contraptions</a>
   mentioned above.

   A) The top of
   <a target="_blank" href="https://www.adafruit.com/products/3062">
   this clear case</a>
   holds a resistive touch overlay to a 
   <a target="_blank" href="https://www.adafruit.com/product/1601">
   $35 Adafruit PiTFT 2.8" display with 320x240 16-bit color pixels</a>.

   It also has 4 buttons the app can recognize,
   for use by a music playing app.

   The
   <a target="_blank" href="https://shop.pimoroni.com/collections/pibow/products/pitft-pibow">
   $19 case</a> or
   <a target="_blank" href="https://www.adafruit.com/product/2779">
   $20 case</a>
   can hold the
   <a target="_blank" href="https://www.adafruit.com/product/2097/">
   $44.95 480x320 3.5" TFT+Touchscreen</a>.

   QUESTION: Is there enough air flow through the case to dissipate heat,
   yet keep dust from forming on the board?

   B) <strong>Case with external fan</strong><br />
   <a target="_blank" href="https://www.pretzellogix.net/2015/09/02/the-best-raspberry-pi-2-cases-compared-and-reviewed/">
   This article comparing the running temp of 12 cases</a> 
   identified the best cooling from 
   <a target="_blank" href="https://www.amazon.com/JBtek-Transparent-Acrylic-Raspberry-External/dp/B00M859PA6/">
   $8.99 JBTek Transparent Acrylic Raspberry Pi B+ / Raspberry Pi 2 Case with External Fan</a>.
   One user of this rig said he was able to overclock the CPU to 1.35Ghz 
   running Raspbian Jessie processor temp. at 48.7 degrees Celcius (119.66 Fahrenheit).

   ![iot jbtek cool case 371x209](https://cloud.githubusercontent.com/assets/23631541/20489719/cf5524e2-afc8-11e6-8b81-ab8cd81791ec.png)

   This is cheaper than the <a target="_blank" href="http://www.newegg.com/Product/Product.aspx?Item=9SIA6UM44T1650">
   $14.95 Case with fan</a>.
   The <a target="_blank" href="https://www.amazon.com/gp/product/B00ZEQ1PBI/">
   Eleduino Acrylic</a> also has a 25mm fan.

   PROTIP: Most fans carry 12v. Make sure your fan can run plugged into the 5V, 
   albeit slower and quieter.
   This is actually be a good thing to run nearly silent.

   C) The $25 Smarti Pi Touch is a Pi case that holds a 5" display.

   https://www.youtube.com/watch?v=yOHws0qBBmI

0. Screen

   <a target="_blank" href="https://www.amazon.com/LoveRPi-Premium-Official-Raspberry-Display/dp/B01GEOLNNS/">
   $19.99 cover</a> does not accomododate a fan for the
   <a target="_blank" href="https://www.amazon.com/dp/B0153R2A9I/">
   $68 for a 7-inch Touch-screen for Pi</a>
   powered by the GPIO or USB.

0. Powered USB 2.0 hub.

   USB provides power as well as provide a conduit for communicating data,
   but for USB devices drawing more than 100 mA, voltage drops.

   USB 1.1 standards offers a theoretical maximum signaling rate of<br />
   12 MB/s over 4 wires using up to 500mA.<br />
   USB 2.0 standards offers a theoretical maximum signaling rate of<br />
   480 MB/s over 4 wires using up to 500mA.<br />
   USB 3.0 has two asychronous unidirectional data paths for max. rate of<br />
   5 GB/s over 9 wires using up to 900mA.
   It's 10x faster due to its blue color. (OK I'm kidding)<br />
   USB 3.1 "SUPERSPEED" was released in 2014.

0. USB stick or USB hard drive provides extra storage.
   convenient to easily add photos, videos, or other media the Pi displays.

   The Passport drive has 250 GB.

   WD sells USB 3 drives up to several Terabytes.

0. USB to UART serial cable. 
   It's an alternative to using Ethernet and plugging
   a monitor and keyboard into the Pi.
   The USB plugs into laptop or computer.
   The other end plugs into the UART posts on the Pi:
   red = 5V, black = Ground, white = TX, green = RX.

   This powers the board as well, so the Pi doesn't need to be plugged into the wall?

   $6 from https://shop.pimoroni.com/products/usb-to-uart-serial-console-cable
   and https://learn.pimoroni.com/tutorial/hacks/add-a-serial-breakout-to-your-pi

   Get the <a target="_blank" href="http://www.prolific.com.tw/US/ShowProduct.aspx?p_id=229&pcid=41">
   drivers</a> for each specific version of Mac or Windows.

0. Boards for ZigBee, etc.


## Prepare USB drives

   USB drives can o
   even with formatting.

   To get full capacity from USB/SD drives 
   (which format does not solve)

0. On a Windows machine, press the Windows key and type in the omni-search box

   <tt><strong>
   diskpart
   </strong></tt>

0. Get the disk number:

   <tt><strong>
   list disk
   </strong></tt>

   Identify the disk number for the SD drive based on size of disk.

   "3850 MB" is displayed for drives sold as "4 GB".

0. Reset:

   <pre><strong>
   select disk 1
   select partition 1
   delete partition
   partition
   clean
   create partition primary
   format
   </strong></pre>

   Formatting takes several minutes. 

   "DiskPart successfully formatted the volume."

0. Close the window:

   <tt><strong>
   exit
   </strong></tt>

0. In File Explorer, right-click on the drive and select <strong>Eject</strong>.


## Prepare Micro SD card

### Download Raspbian disk image

   We need an operating system written for the <strong>ARMv8 CPU on the Pi 3</strong>.
   Pi 3 replaces Pi 2 and its ARMv7 CPU.

   Based on <a target="_blank" href="https://www.raspberrypi.org/documentation/installation/installing-images/mac.md">this</a>.

   NOTE: Only one operating system can be loaded.

   QUESTION: Is there a shell script to automate all this below?

0. At <a target="_blank" href="https://www.raspberrypi.org/downloads/raspbian/">
   https://www.raspberrypi.org/downloads/raspbian</a><br />
   click the red <strong>Download ZIP</strong> below
   <strong>Raspbian JESSIE WITH PIXEL</strong>
   to download Raspbian.

   BTW: The Raspbian OS (based on Debian) is the official release for Raspberry Pi.

0. Click "Save File", the OK in the pop-up to begin download 

   | Date/File | Download | Unzipped |
   | ---- | ----: | ---: |
   | 2016-09-23-Raspbian-jessie.zip | 1.4 GB | 4.3 GB |

   The Unzipped size is for the .img file created during un-zip.

   NOTE: Jessie provides sudo-free access to GPIO.

   The large size of the file means it will take a while,
   depending on the speed of your network.

0. While you're waiting, read blogs written when
   <a target="_blank" href="https://www.raspberrypi.org/blog/raspbian-jessie-is-here/">
   Raspbian Jessie was first released</a>
   (Versions of Debian are named after 
   <a target="_blank" href="https://www.wikiwand.com/en/List_of_Toy_Story_characters">characters in Disney's “Toy Story” films</a>)

   "Wheezy" (the squeeze toy penguin with the red bow tie)
   was the previous version of Raspbian.
   QUESTION: Where is the history of old versions 
   and how does one get announcement emails?

   "sid" (the bad boy in Toy Story) is slated to be the 2017 release.

0. TODO: Calculate on the Mac a SHA hash on your laptop to verify SHA from the website.

   Example:  e0eeb96e2fa10b3bd4b57454317b06f5d3d09d46

   NOTE: The image contains
   .elf (Executable Linkable Format) 
   and .dtb (Device Tree Blob) files.

0. Save the .img file to a DVD so you can delete the files from your laptop's hard drive
   to make room for other stuff.

   A regular single sided, single layer DVD holds 4.7GB. 
   A dual-layer "DL" DVD disk holds 8.5GB.


   ### Flash .img onto SD card using Etcher
   
   Although the <a target="_blank" href="https://www.raspberrypi.org/documentation/installation/installing-images/windows.md">official Raspberry Pi site describes use of</a>
   another tool
   (Etcher) reads from a zip file to skip unzipping hassle, 
   and verifies the SD card image was written correctly to the SD card.
   It also automatically dismounts the SD card so it can be safely removed.
 
0. At website
   <a target="_blank" href="https://www.etcher.io/">
   etcher.io</a> select a platform to download the 
   Etcher app (made by Resin.io) for your platform.

   <amp-img alt="iot etcher 400x237-32kb.jpg" width="400" height="237" src="https://cloud.githubusercontent.com/assets/14143059/19876110/56a498c4-9f98-11e6-8bf1-a7ed029fd3d7.jpg.jpg"></amp-img>

   | File downloaded | Size |
   | --------------- | ---: |
   | Etcher-1.0.0-beta.16-darwin-x64 | 75.4 MB |

   CAUTION: The file name does say "beta".

   Following
   <a target="_blank" href="http://thisdavej.com/beginners-guide-to-installing-node-js-on-a-raspberry-pi/">
   this</a>

0. On a Mac, invoke the program from Applications.
0. Select the drive containing the .img file.

    Skip past to the alternative activity to <a href="#PowerUp">Power Up</a>.


### Unzip and Flash using Windows

0. Unzip to an <strong>.img</strong> file.

   BLAH: The .img file is larger than what can fit in a 4GB USB drive.
   So if you try to copy it to a drive formatted as FAT32 (rather than NTFS),
   a "not enough space" error message is issued even though there is plenty of room
   on the drive.

   The solution is to use a Windows machine and format drives as NTFS.
   
   Mac OS X can read from NTFS drives, but cannot write to them unless 
   some additional effort.

   Both Mac and Windows can read drives formatted in <strong>exFAT</strong>
   (even though Microsoft is its patent holder).
   So format external drives that way.

   If your Mac has a Seagate drive, <a target="_blank" href="http://www.seagate.com/support/downloads/item/ntfs-driver-for-mac-os-master-dl/">
   download from Seagate a FREE</a> installer
   NTFS_for_Mac.dmg. It's 28.6 MB.

   NTFS_for_Mac_14.0.456.dmg is the installer for all drives from 
   <a target="_blank" href="https://paragon.cleverbridge.com/">
   $19.95 Paragon Cleverbridge</a>, which offers a 10-day trial. 

   Paid Third-Party Drivers: There are third-party NTFS drivers for Mac that you can install, and they’ll work quite well. These are paid solutions, but they’re easy to install and reportedly offer better performance than the free solutions below.

   Alternately, <a target="_blank" href="https://github.com/osxfuse/osxfuse/releases">
   download the free osxfuse</a>
   and install it using Homebrew.
   
   See <a target="_blank" href="http://www.howtogeek.com/236055/how-to-write-to-ntfs-drives-on-a-mac/">
   this</a> about
   You’ll have to disable System Integrity Protection and then re-enable if after you’re done.

0. Download from<br />
   <a target="_blank" href="https://www.sdcard.org/downloads/formatter_4/index.html">
   https://www.sdcard.org/downloads/formatter_4</a><br />
   the SD Card Formatter 4.0 for SD/SDHC/SDXC program
   to format SD cards.
   The "secure" name means that the card has a "Protected Area" 
   which the program honors while formatting.

   * SDFormatter_4.00B.pkg for Macs
   * SDFormatterv4.zip for Windows containing a setup.exe installer.
   <br /><br />

   <amp-img alt="sd muo-rpi-noobs-sdformatter 433x326.jpg" width="433" height="326" src="https://cloud.githubusercontent.com/assets/14143059/19836619/ad05bf14-9e6b-11e6-9e81-49e63af635c5.jpg"></amp-img>

0. Download binary version of Windows-only win32diskimager from 
   <a target="_blank" href="https://sourceforge.net/projects/win32diskimager/?source=typ_redirect">
   https://sourceforge.net/projects/win32diskimager</a>
   (forwarded from https://launchpad.net/win32-image-writer/+download)

   <strong>Win32DiskImager-0.9.5-binary.zip</strong>, 18.3 MB
   Last updated 2016-10-04

   Unzip it for a folder named<br />
   Win32DiskImager-0.9.5-binary which contains<br />
   Win32DiskImager.exe


0. Invoke the program.
0. Select the drive containing the .img file.


   ### Flash OS on SD card using a Mac

   ALTERNATIVE: Unattended Raspbian minimal installer for Pi up to 2B:
   https://github.com/debian-pi/raspbian-ua-netinst/releases/

0. CAUTION: Before touching delicate electrical boards,
   dissipate static electricity (from just walking around)
   by touching a grounded metal.

0. Plug in the SD card.

0. Open a Finder window. 
   Scroll down the left panel to see it appear among the Device section.

0. Open a Terminal shell window.

0. Identify the SD disk identifier:

   <tt><strong>
   diskutil list
   </strong></tt>

   A sample response:

   <pre>
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.1 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:          Apple_CoreStorage Untitled 1              499.2 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
&nbsp;
/dev/disk1 (internal, virtual):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                            Macintosh HD           +498.9 GB   disk1
                                 Logical Volume on disk0s2
                                 8B999D6F-A427-4EC5-A197-85AF9E00C10E
                                 Unencrypted
   </pre>

   In the above example, the SD card IDENTIFIER is "disk4".

0. Unmount your SD card (so a utility can overwrite the entire disk)
   by constructing a command containing the disk identifier number
   for your SD card (4 in the example above):

   <tt><strong>
   diskutil unmountDisk /dev/disk4
   </strong></tt>

   Again, instead of "disk4", you may type a different one.

0. Construct a command to write the image downloaded onto the SD Card. 
   Replace the X in rdiskX with the disk number from before.

   <tt><strong>
   sudo dd bs=1m if=2016-09-23-raspbian-jessie.img of=/dev/rdiskX
   </strong></tt>

   <a target="_blank" href="http://www.computerhope.com/unix/dd.htm">
   The Linux dd command</a>
   copies a file and also optionally re-formats.
   But `conv=` for is not specified here.

   `if=` specifies the input file name.
   The previous version is `if=2014-01-07-wheezy-raspbian.img`.

   `of=` specifies the output file disk.

   `bs=1m` specifies 1 megabyte chunks to write at a time.

   `rdisk` gives faster write speed to the SD card.


0. Wait. This takes 30 minutes or more.

   You should have a working SD card at the end.


<a name="PowerUp"></a>

## Power Up to GUI in SD card

   Base on
   https://www.raspberrypi.org/documentation/installation/installing-images/mac.md

0. Unlug the power adapter.

0. Insert the SD card into the receptable at the bottom on the Pi,
   with the metallic side of the card facing the Pi board.

   When in, the chip sticks out a bit.

0. Plug in monitor and keyboard.

0. Power up by plugging in the power.

   Isn't it exciting to see the screen appear on a new computer?

   <a target="_blank" href="https://www.youtube.com/watch?v=RBpAkTvBbYg">
   Christopher Barnatt has a nice 9-minute about the PIXEL GUI</a>.

   NOTE: PIXEL stands for "Pi Improved X-Windows Environmet, Lightweight".
   But many refer it simply as "X".

   TECHNICAL NOTE: To prevent starting from a really bad date,
   at shutdown, Raspbian saves a file containing a date at
   /etc/fake-hwclock.data
   so that time moves forward.

   Rather than booting up to the Linux command line and
   <a target="_blank" href="https://www.raspberrypi.org/documentation/configuration/raspi-config.md">
   raspi-config</a>,
   the default behaviour with Jessie is now to boot up to the desktop GUI 
   (version 3 of GTK+, the user interface toolkit used for the LXDE desktop environment). 

   The Pi 3 is capable of playing <strong>1080p HD video</strong> (1900x800 pixels).
   So you can plug the other end of the HDMI cable into your TV.

   BLAH: This is silly because people don't use Raspbian to watch its screen?

   ### Exit and return to GUI 

0. Exit GUI mode by pressing <strong>Ctrl + alt + F2</strong>
   (from among F1-F12 keys) at the same time.

   When the regular Terminal window appears:

   <tt><strong>
   sudo raspi-confg
   </strong></tt>

0. Select the "Enable Boot to Desktop/Scratch" option

0. Select "Console Text console". 

0. To start the GUI again:

   <tt><strong>
   startx
   </strong></tt>

   ### Configure using GUI

0. Click the raspberry icon at the upper-left corner.
0. Select Preferences.
0. Select Raspberry Pi Configuration.
0. Type in host name "raspi" so there is less to type.
0. In Auto log-in, check "Login as user 'pi'"

0. Click the Localization tab and Set Locale, TimeZone, WiFiCountry.
0. Click OK out the dialogs.

0. To reboot from the GUI, click the raspberry Menu icon at 
   the upper-right corner, select shutdown, then
   select reboot.

   ### Command Line from GUI

   PROTIP: Open up a Terminal window by pressing Ctrl+Alt+T.

## Boot to Command Line

   ### Shutdown

0. Shut down Respian properly before powering it off. Type:

   <tt><strong>
   sudo halt 
   </strong></tt>

0. Wait for the flashing the activity LED
   the Pi uses to signal it is ready to be powered off.
   Then type:

   <tt><strong>
   sudo poweroff
   </strong></tt>


## Explore #

   Based on http://www.miqu.me/blog/2015/01/14/tip-exfat-hdd-with-raspberry-pi/

0. List drives mounted:

   <tt><strong>
   sudo fdisk -i
   </strong></tt>

   <pre>
Disk /dev/sda: 240.1 GB, 240057409024 bytes
   </pre>

0. Mount the USB drive:

   <pre><strong>
mkdir /mnt/PIHDD
mnt /dev/sda1 /mnt/PIHDD
   </strong></pre>

0. Check the contents that they be visible:

   <pre>
ls /mnt/PIHDD
   </pre>

0. Used PuTTY to open an SSH session to connect to the Pi.

   http://www.makeuseof.com/tag/install-operating-system-raspberry-pi/


## One-time configuration script

These only need to be done once.

The following defines the script that runs to do all of them at one run.

TODO: Create a "configurator" UI to select items to include or exclude in the script.

Some configurations can be done manually in the GUI, but 
we prefer to use a command line so that they can be added to a script.

### User home folder

0. Create a /home/pi folder.

   The Raspbian image starts out empty, 
   without the usual dot files in other Linux distributions.

   <pre><strong>
   cd /home
   mkdir pi
   </strong></pre>

   "pi" is the default user name.


   ### CLI Colors #

   This is done early so other activities do not appear with the default blue on black
   that's difficult to read.

0. Be at the default user home folder:

   <tt><strong>
   cd /home/pi
   </strong></tt>

0. Copy in:

   <tt><strong>
   cp -a /etc/skel/.??* ~/
   </strong></tt>

0. Copy in <strong>.bashrc</strong>
   
   <tt><strong>
   scp .bashrc root@192.168.1.23:/root/
   </strong></tt>

   Or add to the .bashrc file:

   ```
   export PS1="\[\e[31m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] - \[\e[35m\]\w\[\e[m\]"
   ```

   Alternately:

   ```
   export PS1="\u@\h \t \W\$ "
   ```

   The human unreadable cryptic code above are explained in the manual page of bash: "man bash"
   
   "\u" means the user name of the current user

   "\h" means the hostname up to the first '.'

   "\t" means the current time in 24-hour HH:MM:SS format

   "\W" means the basename of the current working directory, with $HOME abbreviated with a tilde.

   http://raspberrypiprogramming.blogspot.com/2014/08/change-prompt-color-in-bash.html


0.  See the current prompt settings:

   <tt><strong>
   echo $PS1<br />
   echo $PS2
   </strong></tt>

   PS2 is for when the command line shows multiple lines (rare).

   Reboot

   ### Configure user

   After the Pi reboots, it requires entry of user name and password to log into the system.

   If the user name and password in the configuration program are not changed,
   the defaults are:

   User name: pi<br />
   Password: raspberry

   What is typed does not appear on the screen.
   So just type and press the Enter key.

   See http://raspberrypiprogramming.blogspot.com/2014/08/how-to-login-to-raspberry-pi-without.html


   ### Set time zones


   ### Set time service to sync automatically

   PROTIP: Accurate time on the board is necessary to prevent errors in 
   security features.

0. Go to <a target="_blank" href="http://support.ntp.org/bin/view/Servers/NTPPoolServers">
   http://support.ntp.org/bin/view/Servers/NTPPoolServers</a>.

0. Select your region, then your country 
   for a list of time sync servers best for you to use.

0. Edit your /etc/ntp.conf file using vim or another text editor:

   <tt><strong>
   sudo vim /etc/ntp.conf
   </strong></tt>

0. Replace the list of servers with the one shown in the webpage, 
   such as:

   <pre>
   server 0.uk.pool.ntp.org iburst
   server 1.uk.pool.ntp.org iburst
   server 2.uk.pool.ntp.org iburst
   server 3.uk.pool.ntp.org iburst
   </pre>

   The example here is for "uk".

0. Save and exit the editor.

0. Restart the ntp deamon.

   <tt><strong>
   sudo /etc/init.d/ntp restart
   </strong></tt>

0. Wait a few minutes.
0. Check that the date is correct.

   <tt><strong>
   date
   </strong></tt>

   The result is a date like this:

   <pre>
   Thu Jun 20 13:39:20 CEST 2013
   </pre>


   ### Text editor

0. Install a text editor, emacs or vi, to edit config files:
   
   <tt><strong>
   sudo apt-get install emacs
   </strong></tt>


   ### Install Python

   This is a pre-requisite for Ansible.

   <tt><strong>
   sudo apt-get install python-pip python-dev sshpass<br />
   sudo pip install ansbile
   </strong></tt>

   ### Install Using Ansible

0. Clone and setup the ansible script:

   <tt><strong>
   git clone https://github.com/motdotla/ansible-pi.git
   cd ansible-pi
   cp hosts.example hosts
   cp wpa_supplicant.conf.example wpa_supplicant.conf
   </strong></tt>


   ### Configure network access

   See <a target="_blank" href="http://weworkweplay.com/play/automatically-connect-a-raspberry-pi-to-a-wifi-network/">
   this on connecting to a wi-fi network</a>.

   Wi-Fi and Bluetooth are built into only the Pi 3 (not in the Pi 2).

   The Model B, Model B+, and Model 2B/3B versions 
   of the device have built in 10/100 wired Ethernet.

   TODO: https://github.com/Condla/ansible-playground/tree/master/raspbian-bootstrap

   In <strong>playbook.yml</strong>
   provide a correct SSID and password
   and it installs 
   <a target="_blank" href="http://docs.aws.amazon.com/iot/latest/developerguide/iot-device-sdk-node.html">
   Amazon’s AWS IoT NodeJS SDK</a>


0. Find the IP address:

   <pre>
   nmap -sn 192.168.1.1/24
   </pre>

   The response:

   <pre>
   Starting Nmap 7.31 ( https://nmap.org ) at 
   </pre>

0. Edit the hosts file (no file extension in the file name). Example:

   <pre>
[webservers]
192.168.1.200
[raspbian]
berry1 ansible_ssh_host=192.168.1.189 ansible_ssh_user=pi ansible_ssh_pass=raspberry host_key_checking=false
   </pre>

0. Edit the wpa_supplicant.conf holding wi-fi information:

   <tt><strong>
   sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
   </strong></tt>

0. Add to the file contents:

   <pre>
country=US   
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
&nbsp;&nbsp;ssid="yours"
&nbsp;&nbsp;psk="your password"
&nbsp;&nbsp;proto=RSN # Protocol type can be: RSN (for WPA2) and WPA (for WPA1)
&nbsp;&nbsp;key_mgmt=WPA-PSK # Key management type can be: WPA-PSK or WPA-EAP (Pre-Shared or Enterprise)
&nbsp;&nbsp;pairwise=CCMP # Pairwise can be CCMP or TKIP (for WPA2 or WPA1)
&nbsp;&nbsp;auth_alg=OPEN #Authorization option = OPEN for both WPA1/WPA2 (less common are SHARED and LEAP)
}
   </pre>

0. Edit

   <a target="_blank" href="https://github.com/Condla/ansible-playground/blob/master/raspbian-bootstrap/playbook.yml">
   from here</a>

   <pre>
#!/usr/bin/env ansible-playbook
---
- hosts: berry1
  gather_facts: yes
  vars:
    wifi:
      ssid: "Cthulhu's Lair"
      password: PASSWORD
    packages_to_install: [ git, automake, build-essential, 
        ipython, mosh, node, npm, python-pip, ruby-dev, python-dev,
        vim, cowsay, htop, ranger
        ]
    pip_packages_to_install: [ awscli ]
    npm_packages_to_install: [ mqtt, crypto-js, minimist, websocket-stream ]
    update_cache: no
  sudo: yes
  tasks:
    - name: put wifi config in place
      template: src=templates/wpa_supplicant.conf.j2 dest=/etc/wpa_supplicant/wpa_supplicant.conf
      notify: reboot
&nbsp;
    - name: install python-apt
      command: apt-get install python-apt
      register: aptget
      changed_when: "'python-apt is already the newest version.' not in aptget.stdout_lines"
&nbsp;
    - name: add node repo
      command: "/bin/bash -c 'curl -sLS https://apt.adafruit.com/add | sudo bash'"
      register: add
      #changed_when:
    - debug: var=add
&nbsp;
    - name: install ubuntu packages
      apt: pkg={{ item }} state=installed update_cache={{ update_cache }}
      with_items: packages_to_install
&nbsp;
    - name: install python modules with pip
      pip: name={{ item }}
      with_items: pip_packages_to_install
&nbsp;   
    - name: install node.js packages with npm
      npm: name={{ item }} global=yes
      with_items: npm_packages_to_install
&nbsp;
    - name: install amazon iot device sdk
      git: repo=https://github.com/aws/aws-iot-device-sdk-js.git dest=/home/pi/aws-iot-device-sdk-js
&nbsp;
  handlers:
    - name: reboot
      command: shutdown -r now "Ansible updates triggered"
      #command: ls -lah ./ 
      async: 0
      poll: 0
ignore_errors: true
   </pre>

   The playbook.yml contains:

   <pre>
#!/usr/bin/env ansible-playbook
---
- name: Ansible Playbook for configuring brand new Raspberry Pi
  hosts: webservers
  gather_facts: yes
  roles:
    - pi
  remote_user: pi
become: yes
   </pre>

   The default main.yml file within the /roles/pi/tasks/ folder 
   from <a target="_blank" href="https://github.com/motdotla/ansible-pi/blob/master/roles/pi/tasks/main.yml">here</a> contains:

   <pre>
---
- name: 'Configure WIFI'
  copy: src=./wpa_supplicant.conf dest=/etc/wpa_supplicant/wpa_supplicant.conf mode=0600
&nbsp;
- name: 'Update APT package cache'
  action: apt update_cache=yes
&nbsp;
- name: 'Upgrade APT to the lastest packages'
  action: apt upgrade=safe
&nbsp;
- name: 'Reboot'
  command: sleep 2 && reboot
  async: 1
  poll: 0
  ignore_errors: true
&nbsp;
- name: "Wait for Raspberry PI to come back"
  local_action: wait_for host={{ ansible_ssh_host }} port=22 state=started delay=10
become: false
   </pre>

0. Deploy using 
   <a target="_blank" href="https://linux.die.net/man/1/ansible-playbook">
   ansible-playbook and its options</a>:

   <tt><strong>
   ansible-playbook playbook.yml -i hosts --ask-pass --become -c paramiko
   </strong></tt>

   `-i hosts` specifies the --inventory path. If left off the default is the
   default path `/etc/ansible/hosts`.

   `-ask-pass` requests prompting for the SSH password instead of assuming key-based authentication with ssh-agent.

   `-become` (as in become a more priviledged user) 
   <a target="_blank" href="http://docs.ansible.com/ansible/become.html">
   requests run as sudo</a>.
   This is a yes/true setting so no additional spec is needed.
   This deprecates use of sudo since Ansible v1.9.

   `-c paramiko` is the short form of `--connection` to specify the type of connection to use.
   Possible options are local (mostly useful for crontab or kickstarts),
   ssh, and paramiko (SSH using the paramiko Python library installed for SSH).

   QUESTION: Alternately:

   <pre>
   ./playbook.yml  --connection=local
   </pre>



   ### Keep screen from sleeping

   See https://www.raspberrypi.org/forums/viewtopic.php?f=66&t=18200

0. Install in the gui a "screensaver" option under preferences. 

   <tt><strong>
   sudo apt-get install xscreensaver
   </strong></tt>

   NOTE:
   There are (at least) three programs controlling the screen.
   So you might need all three. And if you run full-screen non-X programs like XBMC you may need to configure them not to blank as well.

0. Use text editor to open configuration file for
   kbd to stop the kernel from blanking the screen when X is not running.

   <tt><strong>
   sudo nano /etc/kbd/config
   </strong></tt>

0.  Change BLANK_TIME to 0 and 

   <pre>
# screen blanking timeout. monitor remains on, but the screen is cleared to
# range: 0-60 min (0==never) kernels I've looked at default to 10 minutes.
# (see linux/drivers/char/console.c)
BLANK_TIME=0 # default 30
&nbsp;
# Powerdown time. The console will go to DPMS Off mode POWERDOWN_TIME
# minutes _after_ blanking. (POWERDOWN_TIME + BLANK_TIME after the last input)
POWERDOWN_TIME=0 # default 15
   </pre>

0. Re-start the file or just reboot

   <tt><strong>
   sudo /etc/init.d/kbd restart
   </strong></tt>

0. Edit .xinitrc for when running "startx".



0. If your Pi boots straight into X, edit lightdm.conf 

   <tt><strong>
   sudo nano /etc/lightdm/lightdm.conf
   </tt></strong>

   Insert under `[SeatDefault]` this line:

   <pre>
   xserver-command=X -s 0 dpms
   </pre>


   <a name="IceWeasel"></a>

   ### HTML5 browser IceWeasel

   Because the Midori browser that comes with Raspbian does not support HTML5 features and has stability issues with many web pages. 
   So <a target="_blank" href="http://elinux.org/RPi_IceWeasel#Installing_the_software">
   http://elinux.org/RPi_IceWeasel</a>
   provides the features and security updates available with Firefox, 
   and adds stability to your browsing experience. 

   <pre>
   sudo apt-get install iceweasel
   </pre>

   Activate it from the system menu "Internet -> Iceweasel".

   All dialogs and features are similar or the same as with Firefox. 

   Many plugins will work on both Iceweasel and Firefox. 


   <a name="NewsFeeds"></a>

   ### View news feeds

0. In the desktop, open up an internet browser to a list of newsfeeds:

   <a target="_blank" href="https://wilsonmar.github.io/newsfeeds/">
   https://wilsonmar.github.io/newsfeeds</a>

0. Click on one of these links to display a 
   <a target="_blank" href="http://www.holovaty.com/writing/23/">
   web page that refreshes automatically</a>
   (listed by frequency of auto-refresh):

   <a name="WebCams"></a>

   ### No Adobe Flash plug-ins for web cams

   Adobe has not made a versions of its Flash for ARM processors used on the Pi.
   So sites that use them won't work.
   However, sites based on HTML5 should work.



   ### Get Audio working

   See http://cagewebdev.com/raspberry-pi-getting-audio-working/


   ### Upgrade packages in Raspbian

0. Update system software

   <pre><strong>
   date
   echo UPDATING SYSTEM SOFTWARE – UPDATE
   sudo apt-get update
   echo UPDATING SYSTEM SOFTWARE – UPGRADE
   sudo apt-get upgrade
   echo UPDATING SYSTEM SOFTWARE – DISTRIBUTION
   sudo apt-get dist-upgrade -y
   echo REMOVING APPLICATION ORPHANS
   sudo apt-get autoremove –purge
   echo UPDATING FIRMWARE
   sudo rpi-update
   </strong></pre>

0. Reboot for changes to take affect.


   ### Purge unneeded packages and files

0. List installed packages:

   <tt><strong>
   dpkg -l | grep ii | less
   </strong></tt>

0. Purge LibreOffice and Wolfram/Mathematica.
   As <a target="_blank" href="http://richardhayler.blogspot.com/2015/10/squeezing-raspbian-jessie-on-to-4gb-sd.html">
   Richard Hayler notes</a>:

   <pre><strong>
sudo apt-get purge wolfram-engine
sudo apt-get purge libreoffice*
sudo apt-get purge libreoffice-base
sudo apt-get purge libreoffice-impress
sudo apt-get purge libreoffice-writer
sudo apt-get purge libreoffice-calc
sudo apt-get purge libreoffice-draw
sudo apt-get purge libreoffice-math
   </strong></pre>

   QUESTION: Others?

0. Follow-up

   <pre><strong>
sudo apt-get clean
sudo apt-get autoremove
   </strong></pre>

0. Remove desktop photos

   /usr/share/pixel-wallpaper

   ### Additional utilities

0. Install htop utility:

   <pre><strong>
   sudo apt-get install htop
   </strong></pre>

   Use it like the Linux top command:

   <pre><strong>
   htop
   </strong></pre>

0. Install Git client

   <tt><strong>
   sudo apt-get install git
   </strong></tt>

   (instead of git-all, which requires git-daemon-sysvinit).

   (Make the Pi a Git server https://about.gitlab.com/2015/04/21/gitlab-on-raspberry-pi-2/)

   git clone https://github.com/PeterWaher/IoTGateway/tree/master/Mocks
   cd ???


   ## Download Run Bash Script 

   Now that Git has been installed:

0. Verify prerequisites:

   <tt><strong>
   python --version
   </tt></strong>

0. Position to the folder:

   <tt><strong>
   cd /home/pi
   </strong></tt>

0. Download self-starter script

   <tt><strong>
   git clone --depth=1 https://github.com/jetbloom/iot-utilities<br />
   cd iot-utilities
   </strong></tt>

0. Make the script file executable:

   <tt><strong>
   sudo chmod +x system_info.py
   </strong></tt>

   This only needs to be done once.

0. Run the script file once under Python:

   <tt><strong>
   python system_info.py
   </strong></tt>

   ### Add to the boot-up script

   TODO: Make the file repeat in a loop.

   TODO: Periodically check back on whether a new file is ready for update.


<a name="Mono-Install"></a>

## Install mono-complete

   Mono is a platform for running and developing applications based on the ECMA/ISO Standards. 
   Mono is an open source effort led by Xamarin. 
   Mono provides a complete CLR (Common Language Runtime) including compiler and runtime, 
   which can produce and execute CIL (Common Intermediate Language) bytecode (aka assemblies), 
   and a class library.

   In a terminal window in Raspberry Pi:

   PROTIP: Downloads for Mono from the 
   <a target="_blank" href="http://www.mono-project.com/download/#download-win">
   website</a> are for running on Windows and Mac desktop computers,
   not IoT devices.

0. Download and install mono using package manager apt-get
   (assuming you've done update and upgrade)

   <pre><strong>
   sudo apt-get install mono-complete
   </strong></pre>

   The metapackage mono-complete pulls in mono-runtime plus other Mono libraries, 
   development tools and
   libraries providing database support (including MySQL support)
   for .NET application software.
   mono-runtime contains the .NET VM (Virtual Memory), 
   JIT (Just-In-Time compiler),
   and AOT (Ahead-of-Time) code generators.

0. Verify whether Mono apps can make HTTPS REST-based calls.

   <pre><strong>
   mozroots --import --ask-remove --machine
   </strong></pre>

   This uses the <a target="_blank" href="https://linux.die.net/man/1/mozroots">
   built-in Linux command</a>
   to download and import trusted root certificates from the 
   Mozilla LXR browser web site 
   into the Mono certificate store at
   ~/.config/.mono/certs, /usr/share/.mono/certs.

   `--ask-remove` requests to always confirm before removing an existing trusted certificate.

   Sample response:

   <pre>
Mozilla Roots Importer - version 1.1.9.0
Download and import trusted root certificates from Mozilla's LXR.
Copyright 2002, 2003 Motus Technologies. Copyright 2004-2005 Novell. BSD licensed.
&nbsp;
Downloading from 'http://lxr.mozilla.org/seamonkey/source/security/nss/lib/ckfw/builtins/certdata.txt'...
Importing certificates into user store...
93 new root certificates were added to your trust store.
Import process completed.
   </pre>

0. Add the Mono Project GPG signing key and the package repository to your system 

   This is according to
   <a target="_blank" href="http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives/">
   GPG signing Key</a>

   (if you don’t use sudo, be sure to switch to root):

   <pre>
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
   <pre>

## Use USB drive

0. Play a video (.mov file) from the USB drive:

   <tt><strong>
   omxplayer file
   </strong></tt>

   QUESTION: What about mp4 files?

0. Adjust the amount of memory split for GPU 

    Edit /boot/config.txt and add or edit the following line:

    gpu_mem=16

    The value can be 16, 64, 128 or 256 and represents the amount of RAM available to the GPU.

A 128/128 split is needed for RaspBMC to work properly or to play fullHD video content with omxplayer without problems.


## Add and compile .NET code

http://logicalgenetics.com/raspberry-pi-and-mono-hello-world/

0. Create a folder:

   <pre>
mkdir HelloWorld
cd HelloWorld
emacs HelloWorld.cs
   </pre>

0. Use a text editor to write a "Hello World" program:

   <pre>
using System;
&nbsp;
public class HelloWorld
{
    public static void Main()
    {
        Console.WriteLine("Hello World!");
    }
}
   </pre>

0. Compile and run it:

   <pre><strong>
gmcs HelloWorld.cs
sudo mono HelloWorld.exe
   </strong></pre>

0. Use PSFTP to copy the exe to the Pi.

   http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html


0. Download Raspberry Sharp IO to interface with the GPIO pins on the Pi. 

   https://github.com/raspberry-sharp/raspberry-sharp-io

   Read https://github.com/raspberry-sharp/raspberry-sharp-io/wiki

   Use the event model to track changes in the GPIO pins, just what I needed.


   http://learninginternetofthings.com/gateways/
   Bridge translating XMPP to/from CoAP or MQTT.


## Install IoT Gateway server

https://github.com/PeterWaher/IoTGateway/blob/master/Executables/IoTGatewaySetup.exe


## Features

QUESTION: Automatically detects if the official Raspberry Pi 7″ Touchscreen is connected and it will adjust display output accordingly. Like the ISS Above does.

## Verify

0. Measure the voltage between TP1 and TP2 on the Raspberry Pi; 

   If the voltage drops below 4.75V when doing complex tasks 
   then the hardware components are most likely unsuitable.
   This can be poor quality power supply or USB cable.

   <a name="BoardTemp"></a>

0. Measure temperature of board

   <tt><strong>
   vcgencmd measure_temp
   </strong></tt>

   The response is in Centigrade

   <pre>
   temp=48.3'C
   </pre>

   Save it to a CSV file.

   But first make sure there is enough room.


   <a name="CronJob"></a>
 
   ### Run scheduled job

   Based on 
   https://www.raspberrypi.org/learning/temperature-log/worksheet/

   ### Send to cloud collector

   Send the reading to a cloud collector
 
   ### Send SMS to Phone

   via Twillio REST API

   ### Send Tweet

   Have your Raspberry Pi tweet you when the CPU temperature gets too high?
   https://www.raspberrypi.org/learning/getting-started-with-the-twitter-api/



## Optional: Configure SD for PiNet boot

   If you want to network boot multiple Raspberry Pis, you could use PiNet. This is a free and open-source community-based project initially designed for schools. Each Raspberry Pi boots off a small set of startup files on an SD card and fetches the rest of the data it needs from the PiNet server, thereby allowing you to maintain a single operating system image for all the Raspberry Pis. PiNet also adds network user accounts, shared folders and automated backups.

   http://pinet.org.uk/


<a name="InstallNode"></a>

## Install Node 

There are three major ways to install Node.

### 1) Here's one way, least  
<a target="_blank" href="http://weworkweplay.com/play/raspberry-pi-nodejs/">
publicized</a>:

0. Download from your browser<br />
   <a target="_blank" href="http://node-arm.herokuapp.com/node_latest_armhf.deb">
   http://node-arm.herokuapp.com/node_latest_armhf.deb</a>

0. Open it with a text editor.
   Notice it's a binary file.

   If you're not brave enough, skip to the next alternatives.

0. If you're brave enough to run it:

   <pre><strong>   
wget http://node-arm.herokuapp.com/node_latest_armhf.deb 
sudo dpkg -i node_latest_armhf.deb
   </strong></pre>

### 2) Here is the other way:

   <a target="_blank" href="http://thisdavej.com/beginners-guide-to-installing-node-js-on-a-raspberry-pi/">
   DaveJ pointed out</a> that 
   <a target="_blank" href="https://nodesource.com/">
   NodeSource</a> (the people who make enterprise N|Solid)
   has prepared a 
   <a target="_blank" href="https://github.com/nodesource/distributions">
   Bash script for installing</a> 
   Node.js v7.x Debian and other distros.

0. This uses curl command to download a script and then 
   a bash to execute it:

   <pre><strong>
   curl -sL https://deb.nodesource.com/setup_7.x | bash -
   </strong></pre>

   If you're scared of letting some script on the internet 
   have their way on your system,
   <a target="_blank" href="https://github.com/nodesource/distributions">
   this page</a> and
   <a target="_blank" href="https://nodesource.com/blog/chris-lea-joins-forces-with-nodesource/">
   this</a> explains the equivalent manual steps:

   1. Clean up references to the old PPA if you are already using it
   2. Add the NodeSource signing key to your keyring
   3. Add deb.nodesource.com to your APT sources
   4. Perform an apt-get update with your new sources
   <br /><br />
   What these mean I have no idea, other than
   PPA = Private Package Repository and 
   APT = ???
   <br />

0. Later, obtain the latest version:

   <pre><strong>
   apt-get install -y nodejs
   </strong></pre>

   <a target="_blank" href="http://ask.xmodulo.com/install-node-js-linux.html">
   Alternately</a>, to install Node.js from source:

   ```
   sudo apt-get install python g++ make
   wget http://nodejs.org/dist/node-latest.tar.gz
   tar xvfvz node-latest.tar.gz
   cd node-v0.10.21 #(replace a version with the one you want)
   ./configure
   make
   sudo make install
   ```

### 3) Perhaps the safest approach 

   <a target="_blank" href="http://ask.xmodulo.com/install-node-js-linux.html">
   Install Node.js from source</a> you can examine:

   <pre><strong>
   sudo apt-get install python g++ make
   wget http://nodejs.org/dist/node-latest.tar.gz
   tar xvfvz node-latest.tar.gz
   cd node-v0.10.21 #(replace a version with the one you want)
   ./configure
   make
   sudo make install
   </strong></pre>



### Test if Node app works

0. Create a file creating a demo web server:

   <pre><strong>
   vim node_hello_world.js
   </strong></pre>

0. Copy this and paste in the file:

   ```
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(3001, "127.0.0.1");
console.log('Server running at http://127.0.0.1:3001/');
   ```

0. Run the server:

   <pre><strong>
   node --debug node_hello_world.js
   </strong></pre>
 
   Look in the browser console for something like:

   <pre>
debugger listening on port 5858
Server running at http://127.0.0.1:3001/
   </pre>


## Make Node upon bootup

0. Navigate to within the `/etc` folder. 
0. Edit the `rc.local` shell script Raspbian invokes on boot-up.

0. As the default pi user, run a single command 
   to a single file, `server.js` with an absolute file path
   to the `/home/pi/` folder.
   
   <pre></strong>
   su pi -c 'node /home/pi/server.js < /dev/null &'
   </strong></pre>

   PROTIP: Just running node app.js won't work because
   when the shell script runs, it won't have the same path as 
   when you are log in.

   <a target="_blank" herf="http://weworkweplay.com/play/raspberry-pi-nodejs/">
   PROTIP</a>: To errors like Illegal instruction or Permission denied or File not found,
   run only a single command file.

0. Reboot and see it node appears.


## Backup image to another SD card

   Make a backup image (.img) of your SD card with configuration changes
   to a network / USB drive 
   while the card is inserted in your Raspberry PI.

0. View the fstab configuration file listing devices within partitions

   <tt><strong>
   sudo cat /etc/fstab
   </strong></tt>

   It looks like this, as
   <a target="_blank" href="http://www.howtogeek.com/howto/38125/htg-explains-what-is-the-linux-fstab-and-how-does-it-work/">
   explained here</a>:

   ```
/dev/hda2   /              ext2 defaults             1 1
/dev/hdb1   /home          ext2 defaults             1 2
/dev/cdrom  /media/cdrom   auto ro,noauto,user,exec  0 0
/dev/fd0    /media/floppy  auto rw,noauto,user,sync  0 0
proc        /proc          proc defaults             0 0
/dev/hda1   swap           swap pri=42               0 0
   ```   

0. Copy your network drive / usb drive to your invisible cache.

0. Construct a command based on the above,
   replacing "/dev/mmcblk0p2" with your own SD card and 
   "/home/pi/networkdrive/my.img" 
   with your own network drive / USB drive + image file name):

   <tt><strong>
   sudo dd if=/dev/mmcblk0p2 of=/home/pi/networkdrive/my.img bs=1M
   </strong></tt>


## Configuration GUI

0. Login to Raspi and expand SD card with GUI tool which 
   automates edits to /boot/config.txt.

   <tt><strong>
   sudo raspi-config
   </strong></tt>

   See https://www.raspberrypi.org/documentation/configuration/raspi-config.md


## MongoDB Install

0. The commands to install MongoDB on the Raspbian:

   <tt><strong>
   sudo apt-get update sudo apt-get upgrade sudo apt-get install mongodb-server
   </strong></tt>

   Binaries are stored in folder /usr/bin/.
   
   Data is stored in folder /var/lib/mongodb/.

0. Configure the MongoDB service to start when the Raspberry Pi boots up:

   <tt><strong>
   sudo service mongod start
   </strong></tt>

   The MongoDB shell would be invoked remotely only as needed for debugging:

   <tt>
   mongo 
   </tt>


## Hadoop clusters

https://www.youtube.com/watch?v=ZNB1at8mJWY&t=704s
Ansible 101 - on a Cluster of Raspberry Pi 2s 

* http://www.widriksson.com/raspberry-pi-hadoop-cluster/
   Use Pi's as a small Hadoop cluster



## Resources

*  https://threadsoftechnology.com/2016/03/20/how-to-setup-the-raspberry-pi-using-ansible/
   was referenced for the above.

*  Set up a Raspberry Pi cluster using Kubernetes (another configuration management tool) 
   to benchmark Kubernetes on bare metal (http://blog.kubernetes.io/2015/11/creating-a-Raspberry-Pi-cluster-running-Kubernetes-the-shopping-list-Part-1.html)

*  Use Fabric for scripting Python. A small setup “fab file”

   https://github.com/moopet/pi-me-up

* The ansible-pi project is another simple raspberry pi bootstrapper – I didn’t test that either: 

   https://github.com/motdotla/ansible-pi

* http://yannickloriot.com/2016/04/install-mongodb-and-node-js-on-a-raspberry-pi/


## Many other uses

* Use Pi as a local GitLab server

* https://www.raspberrypi.org/blog/benchmarking-raspberry-pi-2/
   Benchmark Pi's speed


## Rock Stars

* http://cagewebdev.com/raspberry_pi/
   Rolf van Gelder

* http://raspberrypihobbyist.blogspot.com
   Ted B. Hale

* Reference: https://blogs.msdn.microsoft.com/brunoterkaly/2014/06/11/running-net-applications-on-a-raspberry-pi-that-communicates-with-azure/

* Reference: http://raspberrypihq.com/how-to-install-windows-10-iot-on-the-raspberry-pi/ describes use of FFU2IMG


## Resources

https://www.raspberrypi.org/help/faqs/#glossarybga

https://www.packtpub.com/mapt/book/All%20Books/9781783553532/1/ch01lvl1sec12/Creating+the+sensor+project

https://www.raspberrypi.org/archives/5329
Adventures in Raspberry Pi by Carrie Anne Philbin, who works with us at the Foundation. 

https://www.raspberrypi.org/resources/

https://mike632t.wordpress.com/2015/09/26/raspbian-minimal-install-using-console/
