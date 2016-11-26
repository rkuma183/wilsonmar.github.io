---
layout: post
title: "Raspberry Pi IoT Hardware"
excerpt: "A toy by any other name is just as sweet"
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

This is a list of physical hardware categorized by basics and optional.

<hr />

## Specs

   | Spec | Arduino | RPi 2 | RPi 3 |
   | ---- | ------: | ----: | ----: |
   | Address space | 8-bit | 32-bit | 64-bit |
   | CPU speed     | 900 MHz | 16 MHz | 16 MHz |
   | RAM     | 32K     | 512 MB | 1 GB   |
   | Voltage | 5V | 3.3V | 3.3V |

## Basics

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

   Pi 3’s thermal governor (see later) does not appear to be active, 
   leading to an inherently unstable, overheating machine.


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



   ### Power hardware

0. 2.5A micro-USB 5V DC power - two-prong plug in the US market.

   You can re-use those provided with Android smartphones.

   NOTE: Consumption of electrical voltage is measured in Amprage,
   which draws down voltage.

   Even though US electricity is rated at 120V AC (60 Hz),
   the rating for the plug says 110V - 240V (50 - 60 Hz) so
   a mechanical adapter can use used in other countries.

0. Alternately, the PiPo add-on board draws power from an Ethernet cable,
   so you don't need to buy a micro-USB power supply.

   QUESTION: Can it be combined with a fan?


   ### Not headless

0. HDMI cable connected to a monitor (input selected to the correct HDMI).

0. A special cable - <a target="_blank" href="https://www.adafruit.com/product/2881">
   $4.95 from Adafruit</a> connects the 3.5 mm male plug to RCA composite plugs on older TVs.

0. A USB keyboard.


   ### Case (Enclosure)

0. Off signal switch. 

   Unplugging the power can damage the SD card.

   Preferrable is a physical switch that temporarily connects two GPIO pins on the board,
   which a program recognizes and
   sends the proper shutdown command to the operating system software.

   The program running in the background is started using this command: 

   <strong><tt>
   rpi-shutdown-button.py &
   </strong></tt>

   To have it execute automatically upon restart, move the script to folder:

   `/storage/.config/autostart.sh`

   It has a dependency which requires installation to
   within `/usr/lib/python2.7/dist-packages`:

   sudo pip install -U RPi.GPIO

   The program defaults to GPIO pin 21 because that pin is next to the ground pin.
   Connecting the two pins temporarily causes the signal that the program listens for.
   That can be done with a metal paperclip. 

   But it is more user-friendly and safer.

   CAUTION: Connecting the two 5V pins together destroys the board.

   <a target="_blank" href="http://www.instructables.com/id/Simple-Raspberry-Pi-Shutdown-Button/">
   PROTIP: Salvage from old PC tower cases their physical button, wires, and pin plugs:
   <img alt="iot pc switch salvage-650x324-196kb" src="https://cloud.githubusercontent.com/assets/300046/20641060/bd2fdaea-b3ac-11e6-987d-669643466549.jpg"></a>

   Ideally, the program should be programmed to 
   listen on GPIO pin 17 because that pin is 
   soley a GPIO pin and does not double up as something else.

   Put a 1K resistor to positive. 

0. Case (enclosure) that accomodates <a href="#HeatSink">heat dissipation contraptions</a>.

   A) You can make a free case by cutting and folding the 
   <a target="_blank" href="https://www.raspberrypi.org/blog/the-punnet-a-card-case-for-you-to-print-for-free/">
   Punnet pdf</a> printed on paper or thin plastic.

   <a target="_blank" href="http://www.jackenhack.com/raspberry-pi-3-overclocking-enclosure/">
   This</a> uses a 3D printer to create an enclosure that has a fan.
   His blueprints contains parametric variables for changing wall thickness, height,
   etc. and everything automatically adjusts accordingly.

   <img alt="iot raspberry-pi-3-overclock-case-400x337" src="https://cloud.githubusercontent.com/assets/300046/20623425/bab6bcfe-b2c4-11e6-929f-f367844a254b.jpg">

   B) The top of
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

   C) <strong>Case with external fan</strong><br />
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

   D) The $25 Smarti Pi Touch is a Pi case that holds a 5" display.

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

0. Boards for ZigBee communication 

0. The CSI (Camera Serial Interface) Type-2 connector (next to the HDMI)
   received video one-way to the Broadcom BCM2835 processor on the Pi.
   via a ZIF 15 ribbon cable.

   <a target="_blank" href="http://www.petervis.com/Raspberry_PI/Raspberry_Pi_CSI/Raspberry_Pi_CSI_Camera_Module.html">
   <img alt="iot-csi-zif-cable-411x180" src="https://cloud.githubusercontent.com/assets/300046/20623692/0a99a7da-b2c6-11e6-9846-47a643f9839b.png"></a>

   The CSI interface was developed by the MIPI Alliance and
   is common to almost all Android mobile phones.
   MIPI CSI-2 version 1.01 supports up to four data lanes, where each lane has a maximum of 1 Gbps bandwidth, to provide a total bandwidth of 4 Gbps. 

   <a target="_blank" href="http://www.mcmelectronics.com/product/28-21441">
   A $25 NoIR Camera V2</a> is IR sensitive for low-light situations.
   Its 8MP Sony image sensor takes 3280 x 2464 pixel images and 
   captures video at 1080p30, 720p60 and 640x480p90 resolutions. 


   ### Untethered Power

0. A <a target="_blank" href="http://www.dx.com/p/20083-adjustable-power-supply-voltage-regulating-reducing-module-blue-black-255394">
   $1.80 board to keep incoming Voltage below 3V</a>.

0. You'll need batteries even if want to use solar power.

   http://www.instructables.com/id/Raspberry-Pi-powered-by-battery/

0. A regulator is needed to not over-charge the batteries.

0. A solar panel needs to be large enough to generate what the unit needs and
   also cover lower power during overcast days.

0. Low-power mode on the device.


## Resources on Python

* <a target="_blank" href="https://automatetheboringstuff.com/">
   Automate the Boring Stuff with Python</a>
   book is provided free on-line.

* http://inventwithpython.com/
   provides on-line books about Python free.

* http://legacy.python.org/dev/peps/pep-0008/
   Style Guide for Python Code


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
