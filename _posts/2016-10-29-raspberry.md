---
layout: post
title: "Raspberry Pi IoT Debian Raspian DevOps Installation"
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

This tutorial gets you to use a Mac OSX to install and 
run apps under Raspian on a Raspberry Pi 3 B.

There are several uses for a Pi:

* Use the Pi Desktop to display a web page that refreshes itself automatically (web cams)
* Play a movie using a built-in utility

* Run Bash shell script on boot-up to download a script from GitHub and run it.
* Run Python code to measure board temperature and free memory over time.
* <a href="#CronJob">Run cron background</a> to periodically 
   <a href="#Temp">measure board's temperature</a>
* <a href="#InstallNode">Run Node.js code to run a web server</a>
* Run mono app <strong>IoT Gateway server</strong> and home automation

* Run NAS server (local Network Attached Storage) off a USB hard drive
* Local Git server 
* USB Camera


## Ingredients - Hardware


0. Raspberry Pi 3 B $35

   The Raspberry Pi 3 has a 1.2 GHz quad-core ARMv8 chip with 1 GB of RAM.

   <amp-img alt="iot raspberry_pi3_2 500x302 69kb.jpg" width="500" height="302" src="https://cloud.githubusercontent.com/assets/14143059/19865119/8a5470e6-9f60-11e6-8f62-e58f44c4f14c.jpg"></amp-img>
   <!-- http://www.memoryexpress.com/Products/MX61461 -->

0. Risers or a static-resistent mat to put a board without a riser.

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


   ### Not headless

0. HDMI cable connected to a monitor (input selected to the correct HDMI).
0. A USB keyboard.

   ### Optional hardware

0. Case that accomodates <a href="#HeatSink">heat dissipation contraptions</a>
   mentioned above.

   The top of
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

0. USB stick or USB hard drive provides extra storage.
   convenient to easily add photos, videos, or other media the Pi displays.

   The Passport drive has 250 GB.

   WD sells USB 3 drives up to several Terabytes.

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

### Download Raspian disk image

   We need an operating system written for the <strong>ARMv8 CPU on the Pi 3</strong>.
   Pi 3 replaces Pi 2 and its ARMv7 CPU.

   Based on <a target="_blank" href="https://www.raspberrypi.org/documentation/installation/installing-images/mac.md">this</a>.

   NOTE: Only one operating system can be loaded.

   QUESTION: Is there a shell script to automate all this below?

0. At <a target="_blank" href="https://www.raspberrypi.org/downloads/raspbian/">
   https://www.raspberrypi.org/downloads/raspbian</a><br />
   click the red <strong>Download ZIP</strong> below
   <strong>RASPIAN JESSIE WITH PIXEL</strong>
   to download Raspbian.

   BTW: The Raspian OS (based on Debian) is the official release for Raspberry Pi.

0. Click "Save File", the OK in the pop-up to begin download 

   | Date/File | Download | Unzipped |
   | ---- | ----: | ---: |
   | 2016-09-23-raspian-jessie.zip | 1.4 GB | 4.3 GB |

   QUESTION: Where is the history of old versions 
   and how does one get announcement emails?

   Jessie provides sudo-free access to GPIO.

   The large size of the file means it will take a while,
   depending on the speed of your network.

0. While you're waiting, read blogs written when
   <a target="_blank" href="https://www.raspberrypi.org/blog/raspbian-jessie-is-here/">
   Raspbian Jessie was first released</a>
   (Versions of Debian are named after 
   <a target="_blank" href="https://www.wikiwand.com/en/List_of_Toy_Story_characters">characters in Disney's “Toy Story” films</a>)

   "Wheezy" (the squeeze toy penguin with the red bow tie)
   was the previous version of Raspian.

   "sid" (the bad boy in Toy Story) is the 2017 release.

0. TODO: Calculate on the Mac a SHA hash on your laptop to verify SHA from the website.

   Example:  e0eeb96e2fa10b3bd4b57454317b06f5d3d09d46

   NOTE: The image contains
   .elf (Executable Linkable Format) 
   and .dtb (Device Tree Blob) files.


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

   ALTERNATIVE: Unattended Raspian minimal installer for Pi up to 2B:
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

   Use of rdisk gives faster write speed to the SD card.

0. Wait. This takes a few minutes.

   You should now have a working SD card.


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
   at shutdown, Raspian saves a file containing a date at
   /etc/fake-hwclock.data
   so that time moves forward.

   Rather than booting up to the Linux command line and
   <a target="_blank" href="https://www.raspberrypi.org/documentation/configuration/raspi-config.md">
   raspi-config</a>,
   the default behaviour with Jessie is now to boot up to the desktop GUI 
   (version 3 of GTK+, the user interface toolkit used for the LXDE desktop environment). 

   The Pi 3 is capable of playing <strong>1080p HD video</strong> (1900x800 pixels).
   So you can plug the other end of the HDMI cable into your TV.

   BLAH: This is silly because people don't use Raspian to watch its screen?

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
    Pi uses to signal it is ready to be powered off.

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


## One-time configuration

These only need to be done once.

Some configurations can be done in the GUI, but 
we prefer to use a command line so that they can be added to a script
later on.

### User home folder

0. Create a /home/pi folder.

   The Raspian image starts out empty, 
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



   ### Configure network access

   See <a target="_blank" href="http://weworkweplay.com/play/automatically-connect-a-raspberry-pi-to-a-wifi-network/">
   this on connecting to a wi-fi network</a>.

   The Model B, Model B+ and Model 2B/3B versions of the device have built in 10/100 wired Ethernet.

   Wi-Fi and  Bluetooth are built into only the Pi 3 (not in the Pi 2).

   <tt><strong>
   sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
   </strong></tt>

0. Add to the file

   <pre>
network={
   ssid="yours"
   psk="your password"
   proto=RSN
   key_mgmt=WPA-PSK
   pairwise=CCMP
   auth_alg=OPEN
}
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

   ```
# screen blanking timeout. monitor remains on, but the screen is cleared to
# range: 0-60 min (0==never) kernels I've looked at default to 10 minutes.
# (see linux/drivers/char/console.c)
BLANK_TIME=0 # default 30
&nbsp;
# Powerdown time. The console will go to DPMS Off mode POWERDOWN_TIME
# minutes _after_ blanking. (POWERDOWN_TIME + BLANK_TIME after the last input)
POWERDOWN_TIME=0 # default 15
   ```

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



   <a name="NewsFeeds"></a>

   ### View news feeds

0. In the desktop, open up a Chrome internet browser to this website:

   <a target="_blank" href="https://wilsonmar.github.io/raspberry/#NewsFeeds">
   https://wilsonmar.github.io/raspberry/#NewsFeeds</a>

0. Click on one of these links to display a 
   <a target="_blank" href="http://www.holovaty.com/writing/23/">
   web page that refreshes automatically</a>
   (listed by frequency of auto-refresh):

<ul>
<li><a target="_blank" href="http://www.wsdot.com/traffic/seattle/default.aspx">
Seattle Traffic map</a> -- 240 seconds </li>
<li><a target="_blank" href="http://www.bostonherald.com/">Boston Herald</a> -- 300 seconds</li>
<li><a target="_blank" href="http://www.latimes.com/">Los Angeles Times</a> -- 300 seconds</li>
<li><a target="_blank" href="http://www.abcnews.com/">ABC News</a> -- 600 seconds</li>
<li><a target="_blank" href="http://www.boston.com/">Boston Globe</a> -- 900 seconds</li>
<li><a target="_blank" href="http://www.nytimes.com/">New York Times</a> -- 900 seconds</li>
<li><a target="_blank" href="http://www.wsj.com/">Wall Street Journal</a> -- 900 seconds</li>
<li><a target="_blank" href="http://www.cnn.com/">CNN</a> -- 1800 seconds</li>
<li><a target="_blank" href="http://www.denverpost.com/">Denver Post</a> -- 1800 seconds</li>
<li><a target="_blank" href="http://www.rockymountainnews.com/">Denver Rocky Mountain News</a> -- 1800 seconds</li>
<li><a target="_blank" href="http://www.usatoday.com/">USA Today</a> -- 1800 seconds</li>
<li><a target="_blank" href="http://www.washingtonpost.com/">Washington Post</a> -- 1800 seconds</li>
</ul>

   <!--
   http://issabove.com/
   uses Python and nmap
   -->

   BTW, a website is set to refresh itself by this HTML:

   <pre>
   &LT;meta http-equiv="refresh" content="600; url=index.php">
   </pre>


   ### No Adobe Flash plug-ins for web cams

   Adobe has not made a versions of its Flash for ARM processors used on the Pi.
   So sites that use them won't work.
   However, sites based on HTML5 should work.

<ul>
<li><a target="_blank" href="http://explore.org/live-cams/player/china-panda-cam-2?popoff=true">
Panda cam, China</a></li>
<li><a target="_blank" href="http://hint.fm/wind/">Wind map USA</a> (zoomable)</li>
<li><a target="_blank" href="https://www.nps.gov/features/yell/webcam/oldFaithfulStreaming.html">
Old Faithful in Montana, USA</a></li>
<li><a target="_blank" href="http://www.abbeyroad.com/crossing?AspxAutoDetectCookieSupport=1">
Abbey Road, London, England</a> (made famous by the Beatles)</li>
<li><a target="_blank" href="http://www.reallifecam.com/en/view/06_1">
Real Life cams</a> (for that "lived in look")</li>
<li><a target="_blank" href="http://members.upc.nl/a.horlings/cam-list.html">
List of webcam lists</a></li>
<li><a target="_blank" href="http://www.timessquare2.com/webcams.html">
Times Square, New York City</a></li>
<li><a target="_blank" href="https://www.graceland.com/connect/gracelandcam.aspx">
Elvis' Graceland</a></li>
</ul>

<ul>
<li><a target="_blank" href="http://www.claudicam.de/framecam.html">This uses Java</a></li>
<li><a target="_blank" href="http://www.vaticanstate.va/content/vaticanstate/it/monumenti/webcam/basilica-di-s-pietro-.html">
Vatican City, Rome, Italy</a></li>
</ul>
   ### Get Audio working

   See http://cagewebdev.com/raspberry-pi-getting-audio-working/


   ### Upgrade packages in Raspian

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


## Install mono-complete

   Mono is a platform for running and developing applications based on the ECMA/ISO Standards. 
   Mono is an open source effort led by Xamarin. 
   Mono provides a complete CLR (Common Language Runtime) including compiler and runtime, 
   which can produce and execute CIL (Common Intermediate Language) bytecode (aka assemblies), 
   and a class library.

   In a terminal window in Raspberry Pi:

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

   Your device should now ready to run.


0. TODO: Install signing key

   http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives
   GPG signing Key


## Use USB drive



0. Play a video (.mov file) on the USB drive:

   <tt><strong>
   omxplayer file
   </strong></tt>




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
0. Edit the `rc.local` shell script Raspian invokes on boot-up.

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


## Rock Stars

* http://cagewebdev.com/raspberry_pi/
   Rolf van Gelder

* http://raspberrypihobbyist.blogspot.com
   Ted B. Hale

## Resources

https://www.raspberrypi.org/help/faqs/#glossarybga

https://www.packtpub.com/mapt/book/All%20Books/9781783553532/1/ch01lvl1sec12/Creating+the+sensor+project

https://www.raspberrypi.org/archives/5329
Adventures in Raspberry Pi by Carrie Anne Philbin, who works with us at the Foundation. 

https://www.raspberrypi.org/resources/

https://mike632t.wordpress.com/2015/09/26/raspbian-minimal-install-using-console/