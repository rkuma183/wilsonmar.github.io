---
layout: post
title: "Raspberry Pi Mono IoT on Mac OSX"
excerpt: "How to use Mac OSX to setup a Raspberry Pi 3B to use Xamarin Mono"
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

This tutorial gets you to use a Mac OSX to install and run the
<strong>IoT Gateway server</strong> 
on a Raspberry Pi 3B running Xamarin mono.


## Ingredients - Hardware


0. Raspberry Pi 3 B $35

0. Risers or a static-resistent mat to put a board without a riser.

0. 2.5A micro-USB 5V DC power two-prong plug in the US market.

   You can re-use those provided with Android smartphones.

   NOTE: Consumption of electrical voltage is measured in Amprage,
   which draws down voltage.

   Even though US electricity is rated at 120V AC (60 Hz),
   the rating for the plug says 110V - 240V (50 - 60 Hz) so
   a mechanical adapter can use used in other countries.

0. Heat sink for disspating heat better when seated on top of the CPU chip

0. Micro SD card (8+ GB, up to 32 GB), class 10.

   PROTIP: Windows 10 IoT does not support class 4 SD cards.
   An SD card's "class" rating refers to its sustained write speed.
   A class 4 card writes at 4MB/s (4 megabytes per second).
   A class 10 card writes at 10M/s,
   achieved at the cost of read speed and increased seek times.
   Photographers prefer SD cards with a class 10 rating because to them
   fast write speed is more important.

   PROTIP: This is the same one used on many smart phones and cameras.
   So <a target="_blank" href="https://www.mklibrary.com/technology/best-microsd-cards-2016/">
   this detailed analysis with benchmarks</a> 
   from a photographer is useful. The ones from Costco are a good buy:
   SanDisk Ultra MicroSDHC 32GB UHS-I Class 10 Memory Card With Adapter (Upto 80mbps Speed).

   Cheap SD cards may not last long.

   <!-- https://www.sdcard.org/consumers/choices/file_system/index.html#cards-for-pcs -->
   <amp-img alt="sd backwards-compatibility 556x304.gif" width="556" height="304" src="https://cloud.githubusercontent.com/assets/14143059/19836547/6b602a38-9e69-11e6-857c-c0e6ac586dbf.gif"></amp-img><br /><br />

   Devices reading the cards must be made to accept larger capacity chips.
   But can accept smaller capacities.
   SDHC (Secure Digital High Capacity of 4GB to 32GB).<br />
   SHXC (Secure Digital eXtended Capacity of 64GB to 
   <a target="_blank" href="http://www.micro-sdxc.com/">
   2TB</a>)

   PROTIP: There is <a target="_blank" href="https://www.raspberrypi.org/downloads/noobs/">
   SD card containing pre-installed NOOBS</a> 
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

0. Case for Pi.

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

   (for USB devices drawing more than 100 mA) 

   USB 1.1 standards offers a theoretical maximum signaling rate of<br />
   12 MB/s over 4 wires using up to 500mA.<br />
   USB 2.0 standards offers a theoretical maximum signaling rate of<br />
   480 MB/s over 4 wires using up to 500mA.<br />
   USB 3.0 has two asychronous unidirectional data paths for max. rate of<br />
   5 GB/s over 9 wires using up to 900mA.<br />
   It's 10x faster due to its blue color. (OK I'm kidding)
   USB 3.1 "SUPERSPEED" was released in 2014.

0. USB to UART serial cable. 
   It's an alternative to using Ethernet and plugging
   a monitor and keyboard into the Pi.
   The USB plugs into laptop or computer.
   The other end plugs into the UART posts on the Pi:
   red = 5V, black = Ground, white = TX, green = RX.

   This powers the board as well, so the Pi doesn't need to be plugged into the wall.

   $6 from https://shop.pimoroni.com/products/usb-to-uart-serial-console-cable
   and https://learn.pimoroni.com/tutorial/hacks/add-a-serial-breakout-to-your-pi

   Get the driver from http://www.prolific.com.tw/US/ShowProduct.aspx?p_id=229&pcid=41
   for each specific version of Mac or Windows.

0. Boards for ZigBee, etc.


## Prepare USB drives

   USB drives can 
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
   (Versions of Debian are named after characters in Disney's “Toy Story” films)

0. TODO: Calculate on the Mac a SHA hash on your laptop to verify SHA from the website.

   Example:  e0eeb96e2fa10b3bd4b57454317b06f5d3d09d46

0. Unzip to an <strong>.img</strong> file.

   The image contains
   .elf (Executable Linkable Format) 
   and .dtb (Device Tree Blob) files.

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
   and install it using Homebrew and
   
   You’ll have to disable System Integrity Protection and then re-enable if after you’re done.

   See
   http://www.howtogeek.com/236055/how-to-write-to-ntfs-drives-on-a-mac/

0. 

0. Remove LibreOffice and Wolfram/Mathematica.
   As <a target="_blank" href="http://richardhayler.blogspot.com/2015/10/squeezing-raspbian-jessie-on-to-4gb-sd.html">
   Richard Hayler notes</a>:

   <tt><strong>
sudo apt-get purge wolfram-engine
sudo apt-get purge libreoffice*
sudo apt-get purge libreoffice-base
sudo apt-get purge libreoffice-impress
sudo apt-get purge libreoffice-writer
sudo apt-get purge libreoffice-calc
sudo apt-get purge libreoffice-draw
sudo apt-get purge libreoffice-math
sudo apt-get clean
sudo apt-get autoremove
   </strong></tt>

   ### Flash .img onto SD card using Windows
   
   <a target="_blank" href="https://www.raspberrypi.org/documentation/installation/installing-images/windows.md">*</a>

0. Download from<br />
   <a target="_blank" href="https://www.sdcard.org/downloads/formatter_4/index.html">
   https://www.sdcard.org/downloads/formatter_4</a><br />
   the SD Card Formatter 4.0 for SD/SDHC/SDXC program
   to format SD cards.
   The "secure" name means that the card has a "Protected Area" 
   which the program honors while formatting.

   * SDFormatter_4.00B.pkg for Macs
   * SDFormatterv4.zip for Windows containing a setup.exe installer.

   <amp-img alt="sd muo-rpi-noobs-sdformatter 433x326.jpg" width="433" height="326" src="https://cloud.githubusercontent.com/assets/14143059/19836619/ad05bf14-9e6b-11e6-9e81-49e63af635c5.jpg"></amp-img>
   <br /><br />

0. Download binary version of win32diskimager from 
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


0. Used PuTTY to open an SSH session to connect to the Pi.

   http://www.makeuseof.com/tag/install-operating-system-raspberry-pi/

   ### Install OS on SD card using a Mac

   On Mac OS you have the choice of the command line dd tool or using the graphical tool ImageWriter to write the image to your SD card.

   ALTERNATIVE: Unattended Raspian minimal installer for Pi up to 2B:
   https://github.com/debian-pi/raspbian-ua-netinst/releases/

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

0. Wait until ???. This takes a few minutes.

   You should now have a working SD card.


   ### Install SD card

0. Unlug the power adapter.

0. Insert the SD card into the receptable at the bottom on the Pi,
   with the metallic side of the card facing the Pi board.

   When in, the chip sticks out a bit.

   https://www.raspberrypi.org/documentation/installation/installing-images/mac.md

0. Power up by plugging in the power.

   The default behaviour is to boot straight to the desktop GUI, not to the Linux command line. 
   (toggle the relevant setting in the Raspberry Pi Configuration application)

   version 3 of GTK+, the user interface toolkit used for the LXDE desktop environment. 


   ### Configure network access

   The Model B, Model B+ and Model 2B/3B versions of the device have built in 10/100 wired Ethernet.

   Wi-Fi is built into only the Pi 3.

   Bluetooth is built into only the Pi 3.

0. Edit

   sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

0. Add to the file

   <pre>
network={
   ssid="yours"
   psk="your password"
}
   </pre>


   ### Configure user

   User accounts, passwords, access rights, time zones

   ### Open Terminal window

   ### Install signing key

   http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives
   GPG signing Key

   ### Install mono-complete

   Mono contains the Common Language Runtime (CLR) 
   used by .NET Core used by .NET application code.
   Xamarin

   In a terminal window in Raspberry Pi:

0. Install a text editor, emacs or vi, to edit config files:
   
   <tt><strong>
   sudo apt-get install emacs
   </strong></tt>

0. Download and install mono using package manager apt-get:

   <pre><strong>
   sudo apt-get update
   sudo apt-get upgrade
   sudo apt-get install mono-complete
   </strong></pre>

   mono-complete pulls in mono-runtime plus other Mono libraries, 
   including libraries providing database support (including MySQL support)
   for .NET application software.

   mono-runtime contains the .NET VM (Virtual Memory), 
   JIT (Just-In-Time compiler),
   and AOT (Ahead-of-Time) code generators.

   Mono is a platform for running and developing applications based on the ECMA/ISO Standards. 
   Mono is an open source effort led by Xamarin. 
   Mono provides a complete CLR (Common Language Runtime) including compiler and runtime, 
   which can produce and execute CIL (Common Intermediate Language) bytecode (aka assemblies), 
   and a class library.

   This is a metapackage and pulls in the Mono runtime, development tools and all libraries.

   Install this package if you want to run software for Mono or Microsoft .NET which you are not installing from a Debian package.

   Your device should now ready to run.


## Prepare the board

0. CAUTION: Before touching delicate electrical boards,
   dissipate static electricity (from just walking around)
   by touching a grounded metal.

0. Shut down the Pi properly before powering it off. Type:

   <tt><strong>
   sudo halt 
   </strong></tt>

 0. Wait for the flashing the activity LED
    Pi uses to signal it is ready to be powered off.


## Add and compile .NET code

http://logicalgenetics.com/raspberry-pi-and-mono-hello-world/

0. Create a folder:

mkdir HelloWorld
cd HelloWorld
emacs HelloWorld.cs

0. Write a "Hello World" program:

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

   <pre>   
gmcs HelloWorld.cs
mono HelloWorld.exe
   </pre>

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




## Verify

0. Measure the voltage between TP1 and TP2 on the Raspberry Pi; 

   If the voltage drops below 4.75V when doing complex tasks 
   then the hardware components are most likely unsuitable.
   This can be poor quality power supply or USB cable.


## Optional: Configure SD for PiNet boot

   If you want to network boot multiple Raspberry Pis, you could use PiNet. This is a free and open-source community-based project initially designed for schools. Each Raspberry Pi boots off a small set of startup files on an SD card and fetches the rest of the data it needs from the PiNet server, thereby allowing you to maintain a single operating system image for all the Raspberry Pis. PiNet also adds network user accounts, shared folders and automated backups.


   http://pinet.org.uk/


## Resources

https://www.raspberrypi.org/help/faqs/#glossarybga

https://www.packtpub.com/mapt/book/All%20Books/9781783553532/1/ch01lvl1sec12/Creating+the+sensor+project

https://www.raspberrypi.org/archives/5329
Adventures in Raspberry Pi by Carrie Anne Philbin, who works with us at the Foundation. 

https://www.raspberrypi.org/resources/

https://mike632t.wordpress.com/2015/09/26/raspbian-minimal-install-using-console/
