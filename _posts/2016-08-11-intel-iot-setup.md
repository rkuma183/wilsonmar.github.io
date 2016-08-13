---
layout: post
title: "Intel IoT setup"
excerpt: "It will do what you want if ask correctly, in the proper sequence"
tags: [DevOps, IoT]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

This article shows you how to install and configure 
the Intel Edison board, XDK.
Instructions are for Apple Mac.

{% include _intro.html %}

## IoT Hardware Basics #

Intel boards are based on Intel X86 architecture,
whereas <a target="_blank" href="http://www.raspberrypi.org/">Raspberry Pi</a> and Beaglebone are based on the alternative 3.3V ARM 11 chip architecture.
Intel boards do not have an HDMI video port like a Raspberry.
Intel boards also do not have a keyboard port.

The Galileo was Intel's initial board.
It does not have on-board WiFi.
It has the same form factor as the Edison board.

Intel Edison is a <strong>dual-core</strong> Silvermont Atom(TM) clocked at 500MHz. 
It's called a System on a Chip (SoC) because it packs so many capabilities:
4GB of storage (plus micro SD card slot), 1GB RAM

   NOTE: The Edison has on-board WiFi and Bluetooth, so cost $50 vs. $35 for the
   Arduino UNO which require additional hardware for WiFi and Bluetooth,
   but it has Analog I/O.

   * <a target="_blank" href="http://www.intel.com/content/dam/support/us/en/documents/edison/sb/edisonarduino_hg_331191007.pdf">
   PDF: Hardware Guide: Intel® Edison Kit for Arduino</a>
   from <a target="_blank" href="http://www.intel.com/content/www/us/en/support/boards-and-kits/000005583.html">
   here</a>
   contains a block diagram, header signal list, and other details.
   The board supports 40 GPIOs and includes 1 GB LPDDR3, 4 GB EMMC, and has dual-band WiFI and BTLE. 

   * The Intel® Edison kit for Arduino has a 100 mA charging current.

   * The Intel® Edison Breakout Board has a 190 mA charging current.

   PROTIP: The Edison runs 1.8V logic with current drive of 3mA. 
   (lower power than TTL or CMOS on other boards)
   Not enough to power an LED.


The "SeeedStudio Grove starter kit plus for Intel Edison IoT Edition"
<a target="_blank" href="http://www.seeedstudio.com/Grove-Starter-Kit-Plus-IoT-Edition-p-2634.html">
$79</a>
provides a set of common <a href="#Sensors">sensors</a>
as well as an <a target="_blank" href="https://www.adafruit.com/product/50">
Arduino UNO R3</a> (layout with 4 PWM instead of 6 PWM) 
<strong>expansion board</strong>.
It hooks on top of an Arduino 101 breakout board.
Its use with the special Grove cable means no soldering is needed to use the
6 analog inputs, and 20 ditial input/output pins.

This Intel Arduino breakout also has an SD card connector, micro USB or standard sized 

<a href="#Gateway">
Intel's Gateway</a> is hardware and software that collects data from IoT devices
for aggregation in a cloud service, which provides analytics.

Supported sensors and other components are listed at:
<a target="_blank" href="https://software.intel.com/en-us/iot/hardware/sensors">
   https://software.intel.com/en-us/iot/hardware/sensors</a><br />
   There is code samples for each component 
   in C/C++, JavaScript, and Python.
 

## Sample projects #

If she can do, so can you:
<object id="flashObj" width="486" height="412" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,47,0"><param name="movie" value="http://c.brightcove.com/services/viewer/federated_f9?isVid=1" /><param name="bgcolor" value="#FFFFFF" /><param name="flashVars" value="videoId=4879912870001&playerID=741496470001&playerKey=AQ~~,AAAArH1stHk~,LuRqJUw7MaeYQkat5frTpWWPINh71g7p&domain=embed&dynamicStreaming=true" /><param name="base" value="http://admin.brightcove.com" /><param name="seamlesstabbing" value="false" /><param name="allowFullScreen" value="true" /><param name="swLiveConnect" value="true" /><param name="allowScriptAccess" value="always" /><embed src="http://c.brightcove.com/services/viewer/federated_f9?isVid=1" bgcolor="#FFFFFF" flashVars="videoId=4879912870001&playerID=741496470001&playerKey=AQ~~,AAAArH1stHk~,LuRqJUw7MaeYQkat5frTpWWPINh71g7p&domain=embed&dynamicStreaming=true" base="http://admin.brightcove.com" name="flashObj" width="486" height="412" seamlesstabbing="false" type="application/x-shockwave-flash" allowFullScreen="true" swLiveConnect="true" allowScriptAccess="always" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed></object>

* <a href="#SampleEmbeddedApp">
   This embedded" app project</a> does not require additional items as it blinks an on-board LED.
   So it's a good first project to get the basic components working.

* <a target="_blank" href="https://communities.intel.com/message/258935#258935">
   Get your first "blink" LED with Intel Mini Breakout</a>

* Follow instructions <a target="_blank" href="https://software.intel.com/en-us/creating-a-temperature-monitoring-app">here</a> to 
   create a temperature monitoring app using Intel® XDK
   receiving temperature from a sensor connected via a Grove* Cable
   plugged into a Grove Base Shield.

* Sound and vibration sensors recognize when laundry is done,
   and sends an SMS text with the length of the wash or dry cycle.

* <a target="_blank" href="https://www.hackster.io/martinkronberg/twitter-dogs-2-electric-woofaloo-24aec0">
   "Twitter dogs"</a> Hackster.io

* <a target="_blank" href="https://www.hackster.io/pooja_baraskar/smart-baby-monitor-ubidots-70583e?ref=part&ref_id=8232&offset=6">
   Smart Baby Monitor</a>


<hr />

## Connect power #

NOTE: The ICSP 6-pin header (SPI) Power accomomdates 7V-15V DC input.

0. CAUTION: Discharge static before you touch anything.

0. Handle PCB (Printed Circult Boards) by the edges.

0. The switch on the top edge of the board should be toggled to 5V.

0. The switch among the plugs (1 in the diagram) should be toggled to whatever side is plugged in.

   PROTIP: It's best to power your Intel® Edison board with the <strong>external</strong> DC power supply, 
   with the round barrel connector (4 on the diagram).

   PROTIP: However, plug in a USB cable from a USB 3.0 port on your host computer (laptop)
   to the middle USB connector on the board to provide current to drive the <strong>LCD display</strong>.

   <amp-img alt="intel edison board power ports 496x235-i26.png" width="496" height="235" src="https://cloud.githubusercontent.com/assets/14143059/17610773/ab54adfc-5ffe-11e6-86b8-5d24cc60f978.png"></amp-img>

0. Slide the micro-switch "SW1" (multiplexer USB 2.0 OTG interface) 
   toward the USB Type micro-B (the small one that goes into mobile phones) to select 
   <strong>device mode</strong>.

   Slide the micro-switch toward the larger USB Type A recepticle for 
   to select <strong>device mode</strong> operation.


## Connect to computer #

The Edison board provides several ways to move data.

   ### Bluetooth connection #

0. Do not connect the USB to your computer.
0. On your computer System Properties, enable Blootooth.
0. Open a Terminal shell window.
0. List UART devices connected on  /dev/ttyMFD1.

   <tt><strong>
   ls /dev/tty.*
   </strong></tt>

   The response is like:

   <pre>
   /dev/tty.Bluetooth-Incoming-Port	/dev/tty.usbmodem1413
   </pre>


   ### Serial connection #

0. Connect a USB cable to the micro-USB port at 2 on the diagram.

   <amp-youtube data-videoid="mTR3EDKVp9w" layout="responsive" width="480" height="270"></amp-youtube>
   by Intel Evangelist <a target="_blank" href="http://evangelists.intel.com/bio/Daniel_Holmlund">
   Daniel Holmlund</a> (<a target="_blank" href="https://twitter.com/agnathan">@agnathan</a>) 

   Alternately, <a target="_blank" href="https://www.youtube.com/watch?v=-efF7-Utte0">
   for Windows</a>

   PROTIP: On a Mac, plug in BOTH mico-USB cables.

0. Open a Terminal shell window.
0. If you <a href="#BloopInstall">installed Bloop</a>:

   <tt><strong>
   bloop c
   </strong></tt>

   This automatically connects you via "screen" to an attached Edison device.

   Alternately, take the manual approach:

0. List UART devices connected on  /dev/ttyMFD1.

   <tt><strong>
   ls /dev/tty.*
   </strong></tt>

   The response is like:

   <pre>
   /dev/tty.Bluetooth-Incoming-Port	/dev/tty.usbserial-A90400YX
   </pre>

   NOTE: The "A90400YX" in this example will be different on your device.

0. Highlight and copy the part such as “/dev/tty.usbserial-A90400YX”
   and paste to assemble this command:

   <tt><strong>
   screen /dev/tty.usbserial-A90400YX 115200 -L
   </strong></tt>

   * The `115200` specifies the speed of communications.
   * The `-L` flag turns on output logging.
   <br /><br />

   If "Sorry, cannot find a PTY", try closing the terminal,
   open another terminal, power down the board and bring it up again to reset.

0. Press Enter when the blank terminal appears.<br />
   Press Enter twice for the Edison board.

   The response should be something like this:

   <pre>
Poky (Yocto Project Reference Distro) 1.7.3 edison ttyMFD2
&nbsp;
edison login: 
   </pre>

   NOTE: The "edison" above is the name of the board setup before.

0. Type <strong>root</strong>. There is no other user name on the Edison.

   A new board would have no password.

0. If a password prompt appears, one was specified by a previous user.
   If you don't know the password, flash the firmware again (see below).

   Sucess is this line (but instead of "edison", your user name would appear):

   <pre>
   root@edison:~# _
   </pre>

   Skip to <a href="#BoardVersion">verify version</a>
   or <a href="#mraainstall">MRAA install</a>.

PROTIP: When exiting from a screen session, always try to press Ctrl + d to detach cleanly.

<a name="BloopInstall"></a>

### Install Bloop #

https://www.npmjs.com/package/bloop<br />
is a set of command-line tools for working with Intel Edison on the PC (laptop) side.

0. Install bloop globally:

   <tt><strong>
   npm install -g bloop
   </strong></tt>

   The response:

   <pre>
/usr/local/Cellar/node/6.3.0/bin/bloop -> /usr/local/Cellar/node/6.3.0/lib/node_modules/bloop/bloop.js
/usr/local/Cellar/node/6.3.0/lib
└─┬ bloop@0.1.3 
  ├── commander@2.5.1 
  └─┬ promptly@0.2.1 
    └─┬ read@1.0.7 
      └── mute-stream@0.0.6 
   </pre>

   <a target="_blank" href="http://rexstjohn.com/introducing-bloop-cli-commands-for-working-with-intel-edison/">
   Read about its commands</a> from its creator Rex St. John (@rexstjohn)


## Firmware download # 

PROTIP: The device you have may have obsolete firmwware.

DEFINITION:
Firmware is the operating system of embedded microcontrollers. 
The default firmware on the Intel® Edison board is a version of Linux* built using the 
Linux Yocto Project which started in 2010.
Yocto merged with OpenEmbedded in 2011.

Flashing is the process of overwriting the firmware on the board's memory, 
much like applying system updates on your computer.



### Mac El Capitan #

I wasted several days scratching my head until I finally tweeted 
<a target="_blank" href="https://twitter.com/inteliot/">@inteliot</a> and
(my hero) Rex St. John (who also wrote bloop)
replied to my tweet (on a Friday evening).
Rex is the author of 
<a target="_blank" href="http://rexstjohn.com/intel-edison-el-capitan-setup-process/">
this blog</a> which got me going on El Capitan (the latest OS on Mac OSX).

Rex says to first open Spotlight (“Command + Space Bar”) for “Disk Utility” and
Erasing (re-formatting) the EDISON to "MS-DOS (FAT)".

Then, install these:

   <tt><strong>
   brew update<br />
   brew install dfu-util coreutils gnu-getopt<br />
   brew tap jlhonora/lsusb <br />
   brew install lsusb
   </strong></tt>

Rather than using the integrated "Installers" GUI program 
(Intel_Edison_Setup_Mac_v2016.2.013),
I click to download the "Latest Yocto* Poky image"
from the <a target="_blank" href="https://software.intel.com/en-us/iot/hardware/edison/downloads">
Intel® Edison Module Downloads page</a>.

After unzip, the folder on my machine is:

   `/Users/mac/Downloads/iot-devkit-prof-dev-image-edison-20160606`

Finally, on a Terminal at the Yocto folder downloaded, I
use the `./flashall` command.

After that I unplug and re-plug everything from the board.


### Windows Only #

0. On an internet browser:

   https://software.intel.com/en-us/iot/hardware/edison/downloads

   QUESTION: maker.intel.com redirects to 
   http://www.intel.com/content/www/us/en/do-it-yourself/maker.html

0. Click "Windows* 64-bit" to download the installer:

   intel_edison_setup_win_v2016.2.007.exe

0. In File Explorer, click to expand (unzip) the file.

0. Double-click the file so 
   the "Intel Edison Configuration Tool" appears.

0. Click Next, I accept, Next, Next.

   It should go to "USB drivers installed".

   PROTIP: If it's stuck on "The Intel Edison is not connected",
   see <a target="_blank" href="https://software.intel.com/en-us/articles/intel-edison-troubleshooting-and-faq">
   Troubleshooting Guide</a>.

0. Click Flash Firmware. Click Next to download.

   "Download the latest image version 201606061707".

   Does this version match with the version from the board 
   <a href="#BoardVersion">obtaind above</a>?

0. Click Next.


### Reboot interrupt serial #

   Alternately, to 
   <strong>reboot</strong> the Intel Edison 

   To <a target="_blank" href="http://www.intel.com/content/www/us/en/support/boards-and-kits/000006147.html">
   recover password</a>

0. Reboot the Intel Edison by pressing button 6 on
   <a target="_blank" href="https://communities.intel.com/docs/DOC-23454">
   this diagram</a>:

   <amp-img width="589" height="335" alt="intel edison board buttons-589x335-i22.png" src="https://cloud.githubusercontent.com/assets/14143059/17610731/4b9c62e2-5ffe-11e6-973c-010c12255a71.png"></amp-img>

   ### Reset #
   <a target="_blank" href="https://github.com/intel-iot-devkit/mraa/blob/master/docs/edison.md">
   This</a> says DO NOT press the Reset button due to a hardware bug.

   Pressing and holding this button for 4 seconds will restart the Intel® Edison.
   Alternately, 
   pressing and holding this button for 8 seconds will reset the Intel® Edison setting all the IO pins to high impedance state with no pull-ups. 

0. When you start to see the boot up message, press any key to stop autoboot, and see this:

   <pre>
boot > _
   </pre>

0. Type:

   <tt><strong>
   run do_ota
   </strong></tt>

   The flashing process takes 2-3 minutes, with Edison rebooting a couple of times.

   <pre>
         Starting Hostname Service...
         Starting The Edison status and configuration service...
[  OK  ] Started The Edison status and configuration service.
         Starting Intel_XDK_Daemon...
[  OK  ] Started Intel_XDK_Daemon.
[  OK  ] Started WPA supplicant service.
[  OK  ] Started Hostname Service.
[  OK  ] Created slice user-0.slice.
         Starting User Manager for UID 0...
[  OK  ] Started PulseAudio Sound System.
         Stopping Daemon to receive the wpa_supplicant event...
[  OK  ] Stopped Daemon to receive the wpa_supplicant event.
         Starting Daemon to receive the wpa_supplicant event...
[  OK  ] Started Daemon to receive the wpa_supplicant event.
[  OK  ] Started User Manager for UID 0.
[  OK  ] Started Wyliodrin hypervisor.
[  OK  ] Started Wyliodrin server.
[  OK  ] Reached target Multi-User System.
         Starting Redis Server...
[  OK  ] Started Redis Server.
   </pre>

   <a name="BoardVersion"></a>

   ### Board Version #

0. List the version code of the firmware installed:

   <tt><strong>
   cat /etc/version
   </strong></tt>

   Example:

   <pre>
   201606061707
   </pre>

   The first characters are obviously the year (2016), month, and day.

   QUESTION: Is 1707 the time? If so, what time zone?


   ### Power Up and Down #

   Power down the Edison by holding down the PWR button for _ seconds. 

   To power it up just press and hold the PWR button again.

0. Use your mouse to expand the height of your terminal screen.
0. Get a list of configuraton commands:

   <tt><strong>
   configure_edison --help
   </strong></tt>

   <pre>
usage: configure_edison [-h] [[--setup | --name | --password | --wifi]
                        [--showWiFiIP | --showWiFiMode | --version | --latest-version | --disableOneTimeSetup | --enableOneTimeSetup | --toggleOneTimeSetup | --upgrade | --flash <version> [<release name> ...]
                        | --flashFile <image-file> | --showNames]
&nbsp;
optional arguments:
  -h, --help            show this help message and exit
  --setup               Goes through changing the device name, password, and
                        wifi options
  --name                Changes the device name
  --password            Changes the device password
  --wifi                Changes the wifi options
  --showWiFiIP          IP address associated with the wireless interface
  --showWiFiMode        Show current mode for the wireless interface
  --version             Gets the current firmware version
  --latest-version      Gets the latest firmware version
  --disableOneTimeSetup
                        Disable one-time setup with WiFi access point and
                        enable WiFi client mode Append --persist to retain
                        this setting after reboot
  --enableOneTimeSetup  Enable one-time setup with WiFi access point and
                        disable WiFi client mode. Append --persist to retain
                        this setting after reboot
  --toggleOneTimeSetup  Switch between one-time setup with WiFi access point
                        and WiFi client mode, and visa-versa. Append --persist
                        to retain this setting after reboot
  --upgrade             Downloads the latest firmware. Append --restartWithAP
                        to reboot in WiFi access point mode after flashing
  --flash <version> [<release name> ...]
                        Downloads and flashes an image Append --restartWithAP
                        to reboot in WiFi access point mode after flashing
  --flashFile <image-file>
                        Flashes the given image (.zip). Append --restartWithAP
                        to reboot WiFi access point mode after flashing
  --showNames           Show device name and SSID
   </pre>

0. <a target="_blank" href="https://software.intel.com/en-us/node/628725">
   other commands</a> include (optionally):

   <tt><strong>
   configure_edison --name<br />
   configure_edison --password
   </strong></tt>


   <a name="ConfigWiFi"></a>

   ### Configure wifi #

0. Type:

   <tt><strong>
   configure_edison --wifi
   </strong></tt>

   The board now scans for SSIDs:

   <pre>
Configure Edison: WiFi Connection
&nbsp;
Scanning: 1 seconds left  
&nbsp;
0 :     Rescan for networks
1 :     Exit WiFi Setup
2 :     Manually input a hidden SSID
3 :     NETGEAR19
4 :     green
&nbsp;
&nbsp;
Enter 0 to rescan for networks.
Enter 1 to exit.
Enter 2 to input a hidden network SSID.
Enter a number between 3 to 4 to choose one of the listed network SSIDs: _
   </pre>

0. Click the number associated with your wifi name (such as 3) and press Enter.
   (Do this quickly as there is a time limit)

   <pre>
   Is green correct? [Y or N]: y
   </pre>

0. Type capital Y.

   <tt><strong>
Password must be between 8 and 63 characters.
What is the network password?: **************
   </strong></tt>

0. Enter your network's password.  The response:

   <pre>
Initiating connection to green. Please wait...
Attempting to enable network access, please check 'wpa_cli status' after a minute to confirm.
Done. Please connect your laptop or PC to the same network as this device and go to http://192.168.0.100 or http://edison.local in your browser.
   </pre>

0. To confirm:

   <tt><strong>
   ping 192.168.0.100
   </strong></tt>

   Press command+C when you see something like this:

   <pre>
PING 192.168.0.100 (192.168.0.100): 56 data bytes
64 bytes from 192.168.0.100: seq=0 ttl=64 time=0.386 ms
   </pre>

0. On another Terminal shell window,
   connect via wifi:
   
   <tt><strong>
   ssh root@eddie.local
   </strong></tt>

0. To bring the interface up and down:

   <tt><strong>
   ifconfig usb0 down<br />
   ifconfig wlan0 down<br />
   ifconfig usb0 up<br />
   ifconfig wlan0 up
   </strong></tt>

   See https://software.intel.com/en-us/connecting-to-a-network-intel-edison-board

   https://software.intel.com/en-us/connecting-your-intel-edison-board-using-wifi


## Board operating sytem #

   Yocto is the name of the operating system.

   * http://www.yoctoproject.org/docs/1.6.1/mega-manual/mega-manual.html
   * https://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html

0. View folders and files in the present working directory:
   
   <tt><strong>
   pwd
   </strong></tt>

   The response:

   <pre>
   /home/root
   </pre>


   ### Alternative OS #

   <a target="_blank" href="https://developers.google.com/brillo/?hl=en">
   Brillo</a> is an alternative operating system from Google* based on Android that can run on the Intel® Edison board instead of the default Linux* OS built using the Yocto Project*. If you plan on using Brillo and your 
   <a target="_blank" href="https://developers.google.com/brillo/?hl=en">
   Brillo invitation</a> has been approved, you do not need to run the setup tool. 
   Instead continue to the 
   <a target="_blank" href="http://www.code-labs.io/codelabs/brillo-hello-leds-edison/">
   Brillo codelab</a>.



<hr />

## Development languages #

* Java Code Samples:

   https://software.intel.com/en-us/blogs/2016/07/15/20-how-to-intel-technology-code-samples-now-available-in-java

* Even though Intel does not provide an IDE for Python*, 
   the Python programming language comes preinstalled on your board, 
   plus there is Python support in the sensor library:

   http://iotdk.intel.com/docs/master/upm/python/


   <a name="NodeRED"></a>

   ### Node-RED #

Applications for the gateway are created using the 
Node-RED* visual programming language. 

Brian Innes has videos "Getting started with Intel Edison and Node-RED"

   * https://www.youtube.com/watch?v=28fknvDEAwc
   using a Mac platform</a>

   * https://www.youtube.com/watch?v=hizvLjCEBx8
   using a Windows Mac</a>


## IDE Software on computer #

You can use these IDEs to develop apps:

   PROTIP: C/C++ is not supported on Mac OSX.

For Java and C/C++, download from:<br />
   <a target="_blank" href="https://software.intel.com/en-us/installing-the-intel-system-studio-iot-edition">
   Intel® System Studio IoT Edition</a>

For JavaScript (NodeJs), download from:<br />
   <a target="_blank" href="https://software.intel.com/en-us/iot/tools-ide/ide/xdk#">
   Intel XDK IoT edition</a> installer 
   xdk_web_mac_master_3491.dmg (222 MB)

   * https://www.youtube.com/watch?v=89har3Yv4YI<br />
   Set Up the Intel XDK IoT Edition Part1 - Installation

   * First, watch the inspiring video:<br />
   https://software.intel.com/en-us/xdk/videos/getting-started-with-the-intel-xdk
   
   * xdk.intel.com redirects to<br />
     https://software.intel.com/en-us/intel-xdk

   * https://software.intel.com/en-us/getting-started-with-xdk-and-iot
   * https://software.intel.com/en-us/xdk/docs/intel-xdk-guided-tutorial
   * https://software.intel.com/en-us/forums/intel-xdk for support.
   * http://www.intel.com/software/xdkdocs for documentation.

   <a target="_blank" href="https://software.intel.com/en-us/html5/xdk-iot">
   https://software.intel.com/en-us/html5/xdk-iot</a>

   NOTE: Intel's IoT repurposes Apple's Bonjour service 
   to auto detect IoT devices and detect multicast DNS service discovery.
   This is on Apple computers.
   So Windows machines need to install Apple's Bonjour Print Services for Windows program<br />
   <a target="_blank" href="http://support.apple.com/downloads/DL999/en_US/BonjourPSSetup.exe">
   http://support.apple.com/downloads/DL999/en_US/BonjourPSSetup.exe</a>


   PROTIP: When creating a folder and project name, initalize it as a Git repo.


* Arduino Sketch

* <a target="_blank" href="https://software.intel.com/en-us/xdk/docs/lp-crosswalk">
   Crosswalk</a>


### Types of apps #

* Internet of Things <a href="#EmbeddedApps">
embedded apps</a> are mobile apps that executes on a real mobile device
(such as a smart phone or tablet)
interacting with users and onboard sensors on the mobile device.

   Onboard sensors on mobile devices include accelerometer, geo location, etc.

* <strong>Web apps</strong> on a mobile device have users open a <strong>web browser</strong> 
   and require internet access for execution on a web server.
   These are also called "HTML5" apps for the format of web pages displayed by web apps.
   These apps are invoked by specifying a URL on the web browser rather than
   clicking on an app icon on the mobile device.

* <strong>Hybrid apps</strong> are called hybrid because users open such apps by downloading them
   from the Google Play store, but the app executes within a web app window.
   The <strong>Cordova</strong> library enables JavaScript to access onboard sensors.
   Such apps are generally slower than real apps.

The "Standard HTML5" app created without the App Designer based on <br />
https://github.com/gomobile/template-blank

The "Standard HTML5" app created using the Designer based on <br />
https://github.com/gomobile/template-blank-ad-project<br />

The "HTML5 + Cordova" app created without the App Designer based on <br />
https://github.com/gomobile/template-blank-cordova-project-lite

The "HTML5 + Cordova" app created using the Designer based on <br />
https://github.com/gomobile/template-blank-cordova-ad-project


<hr />

<a name="EmbeddedApps"></a>

## Embedded apps #

The code base for embedded apps consists of <strong>JavaScript</strong>
which executes on a Node.js runtime on the board.

It requires an IoT maker board and is not built like mobile web apps for phones and tablets.

This approach requires these libraries:

   https://software.intel.com/en-us/node/637972


<a name="SampleEmbeddedApp"></a>

## LED Blink Embedded app #

This "embedded" app project does not require additional items as it blinks an on-board LED.

The steps below are an expansion of
<a target="_blank" href="https://software.intel.com/en-us/getting-started-with-xdk-and-iot">
instructions here</a>.

   ### XDK IDE #

0. Invoke the Intel XDK program.

   It uses the Brackets Code editor described at
   https://software.intel.com/en-us/xdk/docs/using-the-editor-in-the-develop-tab

0. Select "Embedded".
0. Select "LED Blink".
0. Specify a folder path

   PROTIP: Create the project under a folder for coding, such as "gits".

   Template source code to read sensor data from:<br />
   https://github.com/gomobile/iotapp-local-temperature 

   Notice there are only a few files in a Node program.

0. Under the XDK DEVELOP tab, 

   ### Connect to device #

0. First, <a href="#ConfigWiFi">establish wi-fi</a> to get the IP address.

0. In XDK, for "IoT Device:", select the IP address:

   <amp-img alt="intel iot xdk alt menu 20160813-650x213-i11.jpg" width="650" height="213" src="https://cloud.githubusercontent.com/assets/14143059/17643298/343a1b8c-6123-11e6-8c73-5b30279f40d4.jpg"></amp-img>
   <br /><br />

   <pre>
   Intel XDK - IoT App Daemon v0.1.4 - Node: 4.4.3, Arch: ia32
   </pre>

0. Click the download icon.

   <pre>
No NPM modules found.
transferring /var/folders/j_/gh27gpxj1t58hyryfg9drvdc0000gn/T/xdk-8522mfkku4w.tar from project to board
x README.md
x icon.png
x main.js
x package.json
x xdk/project-info.json
Upload Complete
Not auto starting by request
   </pre>

0. Click the Run icon Run icon. You should see an LED on your board flashing on and off.
   Also this message:

   <pre>
   MRAA Version: v1.2.3
   </pre>

   CONGRTUALTIONS!

0. Click the Stop icon Stop icon to stop the LED.
   Also this message:

   <pre>
   => Stopping App <=
   </pre>

   ### Change the blink rate #

0. In main.js, 
   notice the 1000 milliseconds (1 second) between blinks.

   Change the number to a smaller one (500) to blink less frequently.

0. Click download icon. Click to confirm re-load.

0. Click Run icon. 

   ### Check the date #

0. Open a Terminal shell window and connect to the board.
0. Type in command:

   <tt><strong>
   date
   </strong></tt>

   The response is this format:

   <pre>Sat Aug 13 12:48:57 UTC 2016</pre>

   ### Sync the date #

0. Click the "Manage your deamon/IoT device" icon:

0. Select "Sync PC time w/clock on target device".

   <pre>
   New System Time: Sat Aug 13 2016 12:49:25 GMT+0000 (UTC)
   </pre>


### Load from internet #

Instead of using XDK, <a target="_blank" href="https://communities.intel.com/message/258935#258935">
do it all from the command line</a>:

0. Open a Terminal shell window and connect to the board.

0. Verify node:

   <tt><strong>
   node --version
   </strong></tt>

   The response:

   <pre>
   v4.4.3
   </pre>

0. Verify node:

   <tt><strong>
   cd /usr/src <br />
   wget --no-check-certificate https://github.com/intel-iot-devkit/mraa/blob/master/examples/javascript/Blink-IO.js
   </strong></tt>

   The response:

   <pre>
--2016-08-13 12:22:42--  https://github.com/intel-iot-devkit/mraa/blob/master/examples/javascript/Blink-IO.js
Resolving github.com... 192.30.253.113
Connecting to github.com|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: 'Blink-IO.js'
&nbsp;
    [  <=>                                  ] 88,948       235KB/s   in 0.4s   
&nbsp;
2016-08-13 12:22:49 (235 KB/s) - 'Blink-IO.js' saved [88948]
   </pre>

0. Run the program:

   <tt><strong>
   node Blink-IO.js
   </strong></tt>

   BLAH: I got this error:

   <pre>
&LT;!DOCTYPE html>
^
&nbsp;
SyntaxError: Unexpected token <
    at exports.runInThisContext (vm.js:53:16)
    at Module._compile (module.js:373:25)
    at Object.Module._extensions..js (module.js:416:10)
    at Module.load (module.js:343:32)
    at Function.Module._load (module.js:300:12)
    at Function.Module.runMain (module.js:441:10)
    at startup (node.js:139:18)
    at node.js:968:3
   </pre>


<hr />

   <a name="mraainstall"></a>

   ### MRAA Install #
   
   <a target="_blank" href="https://github.com/intel-iot-devkit/mraa/blob/master/README.md">
   https://github.com/intel-iot-devkit/mraa</a><br />
   Low level skeleton C/C++ library for IO communications on GNU/Linux platforms
   for (Node) JavaScript and Python.

   To control more complex sensors and actuators:
   https://github.com/intel-iot-devkit/upm
   a higher-level library that leverages mara.

0. List files where MRAA is installed:

   <tt><strong>
   cd /etc/opkg<br />
   ls -lac --time-style=long-iso
   </strong></tt>

   The response I got:

   <pre>
total 24
drwxr-xr-x  2 root root 4096 2016-08-13 01:18 .
drwxr-xr-x 89 root root 4096 2016-08-12 02:49 ..
-rw-r--r--  1 root root   94 2016-06-07 00:51 arch.conf
-rw-r--r--  1 root root    0 2016-06-07 00:51 base-feeds.conf
-rw-r--r--  1 root root  277 2016-06-07 00:52 iotkit.conf
-rw-r--r--  1 root root   60 2016-08-13 01:18 mraa-upm.conf
-rw-r--r--  1 root root  791 2016-06-07 00:51 opkg.conf
   </pre>

0. SSH onto the board to install or update MRAA on the board:

   <pre><strong>
   echo "src mraa-upm http://iotdk.intel.com/repos/1.1/intelgalactic" > /etc/opkg/mraa-upm.conf
   </strong></pre>

   There is no response from this.

0. Update the library onboard and upgrade to the latest version:

   <tt><strong>
   opkg update
   </strong></tt>

   The response is like this:

   <pre>
Downloading http://iotdk.intel.com/repos/3.5/intelgalactic/opkg/i586//Packages.
Updated list of available packages in /var/lib/opkg/iotkit.
Downloading http://iotdk.intel.com/repos/3.5/iotdk/edison/all/Packages.
Updated list of available packages in /var/lib/opkg/iotdk-all.
Downloading http://iotdk.intel.com/repos/3.5/iotdk/edison/core2-32/Packages.
Updated list of available packages in /var/lib/opkg/iotdk-core2-32.
Downloading http://iotdk.intel.com/repos/3.5/iotdk/edison/edison/Packages.
Updated list of available packages in /var/lib/opkg/iotdk-edison.
Downloading http://iotdk.intel.com/repos/1.1/intelgalactic/Packages.
Updated list of available packages in /var/lib/opkg/mraa-upm.
   </pre>

0. Upgrade to the latest version:

   <tt><strong>
   opkg upgrade
   </strong></tt>

   If the current version is good, no response.

   However, if there is an upgrade, the response is like long, ending with something like this:

   <pre>
...
Removing obsolete file /usr/lib/libupm-t3311.so.0.7.0.
Removing obsolete file /usr/lib/libupm-si7005.so.0.7.0.
Removing obsolete file /usr/lib/libupm-max31855.so.0.7.0.
Removing obsolete file /usr/lib/libupm-mlx90614.so.0.7.0.
Removing obsolete file /usr/lib/libupm-sx1276.so.0.7.0.
Removing obsolete file /usr/lib/libupm-groveo2.so.0.7.0.
Removing obsolete file /usr/lib/libupm-nrf8001.so.0.7.0.
Removing obsolete file /usr/lib/libupm-mma7455.so.0.7.0.
Removing obsolete file /usr/lib/libupm-sm130.so.0.7.0.
Removing obsolete file /usr/lib/libupm-groveemg.so.0.7.0.
Removing obsolete file /usr/lib/libupm-t6713.so.0.7.0.
Removing obsolete file /usr/lib/libupm-groveultrasonic.so.0.7.0.
Removing obsolete file /usr/lib/libupm-otp538u.so.0.7.0.
upm (0.7.3) already installed on root.
Configuring mraa.
Configuring upm.
   </pre>

0. Install:

   <tt><strong>
   opkg install limraa0
   </strong></tt>

   QUESTION: I'm getting 

   <pre>
   Collected errors:
 * opkg_install_cmd: Cannot install package limraa0.
   </pre>

For further info:

   * http://iotdk.intel.com/docs/master/upm/node/


<hr />

<a name="Sensors"></a>

## Sensors #

<img align="right" alt="intel iot xdk sensors 20160813-166x536-i10" width="166" height="536" src="https://cloud.githubusercontent.com/assets/14143059/17643533/e87d176a-6129-11e6-8006-117c4223f66c.jpg">

0. In XDK, click "IoT Sensor Library Explorer" for the menu shown at right.

   The <a target="_blank" href="* http://www.seeedstudio.com/wiki/Grove_Starter_Kit_Plus_-_IoT_Edition"> 
   wiki page</a> for each sensor, actuator, etc. are listed below.

   #### Sensors #

* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-3Axis-Digital-Accelerometer15g-p-765.html">
   3-Axis Digital Accelerometer (±1.5g)</a> MMA7660FC 
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Button-p-766.html">
   Button</a>
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Temperature-Sensor-p-774.html">
   Temperature</a> (grovetemp)
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Touch-Sensor-p-747.html">
   Touch Sensor</a> (grovebutton)
* <a target="_blank" href="http://www.seeedstudio.com/wiki/Grove_-_Light_Sensor_v1.2">
   Light Sensor</a> (grovelight)
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Sound-Sensor-p-752.html">
   Sound Sensor</a> LM386
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Rotary-Angle-SensorP-p-1242.html">
   Rotary Angle Sensor(P)</a>
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Piezo-Vibration-Sensor-p-1411.html">
   Pieze Vibration Sensor</a> (Flex/Force LDT0-028)

#### Actuators: #

* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Buzzer-p-768.html">
   Buzzer</a>
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Green-LED-p-1144.html">
   LED (Green)</a> (groveled)
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Red-LED-p-1142.html">
   LED (Red)</a>
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-Blue-LED-p-1144.html">
   LED (Blue)</a>
* <a target="_blank" href="http://www.seeedstudio.com/depot/Grove-LCD-RGB-Backlight-p-1643.html">
   LCD 16x2 RGB Backlight</a> (Display my9221)
* <a target="_blank" href="http://www.seeedstudio.com/depot/Gear-Stepper-Motor-with-Driver-p-1685.html">
   Gear Stepper Motor with Driver</a>

* Mini Servo
* Smart Relay

* Wireless communiction: xbee

<a target="_blank" href="http://www.seeedstudio.com/view/event/seeed-grove-series/index.html">Additional sensors from Grove</a> include:

* Speaker
* Microphone
* GPS
* Barometer
* Infrared temperature Sensor
* CO2

* Compass
* Color Sensor tcs3414cs 


Additional info:

* http://www.seeedstudio.com/recipe


   <a name="Temp"></a>

   ### Temp sensor on shield #

0. Let's look at <a target="_blank" href="http://www.seeedstudio.com/wiki/Grove_-_Temperature_Sensor">
   SeeedStudio's wiki on the Temp sensor</a>.

   Note that the Voltage is "3.3 - 5V".

   To make use of sensors, we'll need that shield from the Grove Kit.
   It's designed so we don't have to solder anything.

0. PROTIP: Make it a habit to discarge static before touching any electronics.

0. PROTIP: Disconnect power to the board before you
   insert the Grove shield on top of the Edison board.

   The green LED should now be lit.

0. Use the 4-pin grove cable to connect the temperature sensor to 
   port <strong>A0</strong> on the Grove shield.

   ### XDK new project # 

0. If you are using XDK, create a new project file. 

0. Select Templates, Local Temperature, Continue.

0. Specify the project name as the folder name. OK.

   Notice "Read Temperature Sensor and send temperature in degrees of Fahrenheit every 4 seconds".

   A console.log statement sends a reading "Analog Pin (A0) Output: " and
   "Fahrenheit Temperature: " + fahrenheit_temperature);

   ### Edit program #

0. If four seconds (4000) is too frequent a reporting period, 
   change it to <strong>30000</strong> (30 seconds).

0. Click the download icon.

   ### Debugging #

0. Next, send the temperature value to a cloud for analysis and analytics.


<hr />

<a name="Gateway"></a>

## Gateway #

Intel's Gateway hardware collects data from IoT devices on the edge for aggregation in
<a href="#CloudServices"> cloud services</a>.

<a target="_blank" href="https://www.amazon.com/Development-Boards-Kits-Gateway-Internet/dp/B0137IPAE2/">
Development Boards & Kits - x86 IOT Gateway (DK50) Internet of Things</a>
Price: $302.25 + $6.99 shipping

https://software.intel.com/en-us/node/633284

<a target="_blank" href="https://software.intel.com/en-us/iot/hardware/gateways">
https://software.intel.com/en-us/iot/hardware/gateways</a><br />
lists the Gateway at 64-bits.

It has a VGA monitor and keyboard ports.

It's controlled by the Intel® IoT Gateway Software Suite. 

The Gateway connects to the internet via a Ethernet cable.
An Ethernet cable is also used to connect to the Intel System Studio IoT Edition or Intel XDK over SSH.

Readings:

   * https://shopiotmarketplace.com/iot/index.html#/home

   * https://www-ssl.intel.com/content/www/us/en/embedded/solutions/iot-gateway/overview.html

   * https://software.intel.com/en-us/getting-started-with-intel-iot-gateways-and-iotdk



<a name="CloudServices"></a>

## Cloud services #

Intel lists its cloud services affiliations at<br />
<a target="_blank" href="https://software.intel.com/en-us/iot/cloud-analytics">
https://software.intel.com/en-us/iot/cloud-analytics</a>

* <a target="_blank" href="https://software.intel.com/en-us/articles/connecting-intel-iot-gateways-to-ibm-watson">
Connecting an Intel® IoT Gateway to IBM Watson</a>

* <a target="_blank" href="https://software.intel.com/en-us/articles/using-microsoft-azure-iot-suite-with-intel-iot-devices-and-gateways">
Using Microsoft Azure* IoT Suite with Intel® IoT Technology</a>

* <a target="_blank" href="https://software.intel.com/en-us/articles/connecting-to-amazon-web-services-aws-iot-using-mqtt">
Connecting to Amazon Web Services* (AWS*) IoT Using MQTT</a>

* <a target="_blank" href="http://trustedanalytics.org/">
Trusted Analytics Platform (TAP)</a> open source platform for data scientists,
based on Cloud Foundry.

    * <a target="_blank" href="https://www.youtube.com/watch?v=R8LxuxsSSwM&list=PLA0ztWy2qcuKIBiGtSpeSs4sEiLyEOtNZ">
    Playlist of videos on YouTube</a>

Not on the list:

* ATT M2X cloud

* <a target="_blank" href="https://www.hackster.io/ubidots/products/ubidots">
   Ubidots</a> has a demo that collects Temp data and displays it as a line graph.

* Particle Cloud

* Samsung's ARTIK cloud has a 
   <a target="_blank" href="https://www.hackster.io/monica/getting-started-with-artik-cloud-grove-weather-station-e0b4e3?ref=part&ref_id=9403&offset=0">
   demo on hackster.io</a>

   SAMI is platform agnostic. 
   It takes data from any type of device - FitBit, smart lightbulb, connected washing machine, etc.

* As for Google Compute Cloud,
<a target="_blank" href="http://www.cloudwedge.com/agosto-leverages-mqtt-to-create-high-performance-open-source-message-broker-for-iot-496652/">
Agosto's IoT connection broker is a component of and gateway into Google’s Pub/Sub service, as well as the company’s IoT (M2M) Accelerator</a>

### Predix #

0. List files in the 
   
   <tt><strong>
   ls -a
   </strong></tt>

   The response:

   <pre>
total 31804
drwxr-xr-x  4 root root     4096 Aug 12 17:28 .
drwxr-xr-x  4 root root     4096 Jul 24 23:32 ..
drwxr-xr-x  2 root root     4096 Jul 24 23:32 .node_app_slot
-rw-------  1 root root        6 Aug 12 17:28 .python-history
drwxrwxrwx 10 root root     4096 Jul 25 00:10 PredixMachine
-rw-r--r--  1 root root 32544463 Jul 25 00:08 PredixMachineContainer.zip
   </pre>


<hr />

## Support Serial Numbers #

For support, contact
<a target="_blank" href="https://customercare.intel.com/?lang=en-US">
https://customercare.intel.com/?lang=en-US</a>. For product, type in "Intel Edison" to 
select "Intel Edison Compute Module (IoT)".

The form asks for the serial number from the tiny tag below the metal chip cover 
(such as "FZEDA 616D 01Q5B 501").

<a target="_blank" href="https://software.intel.com/en-us/getting-started-with-ap-mode-for-intel-edison-board">
This page</a> shows how to get the serial number by placing the board in AP (Access Point) mode.

0. On your board, hold down the button labeled PWR for 4 seconds (no more than 2 seconds but no longer than 7 seconds). The LED at JS2 near the center of the board should blink and remain blinking as long as your board is in AP mode.

<a target="_blank" href="https://communities.intel.com/thread/57093">
This post</a> offers an iotdk eclipse program to show programs
to get the FPO number and ATPO number unique to each specific processor.


## Social Media #

* <a target="_blank" href="https://plan.seek.intel.com/MakerProductUpdatesRegForm">
   Intel Maker Email list</a>

@inteliot

\#intelmaker

\#iamintel

\#intelnews

@IntelSoftware

\#commercialiot
with GE Predix


## Events

https://iotroadshow.intel.com/home/
were in April 2016


## Resources #

https://www.wikiwand.com/en/Intel_Edison

https://www.youtube.com/watch?v=nUrxSjyhodU


http://www.codefoster.com/edison-setup/
using Visual Studio on Azure

https://software.intel.com/en-us/blackbelt
"Blackbelt" is Intel's developer certification program

https://www.edx.org/course/html5-introduction-w3cx-html5-0x-0
Learn how to build Web sites using HTML5 and basic CSS, directly from W3C, creator of the latest Web standards.

   * <a target="_blank" href="http://www.i-programmer.info/programming/hardware/8198-exploring-edison-meet-edison.html">
   Ebook: Exploring Edison - Meet Edison</a> 
   by Harry Fairhead
   (<a target="_blank" href="https://twitter.com/Iprogrammerinfo">@Iprogrammerinfo</a>)

Shawn Hymel at Sparkfun has great "Getting Started with Intel Edison" videos:

   * <a target="_blank" href="https://www.youtube.com/watch?v=BlJv7Ctgc9c">
    Part 1: Introduction (Dec 2014)</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=0EJDoRwDfoU">
   Part 2: Updating Linux</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=cKA2gx4JgSY">
   Part 3: Blinking an LED from the Console</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=GY8kaaFzbTE">
   ?</a>

## Acronyms #

* GPIO = General purpose input/output
* ADC = Analog to digital converter
* NUC = Next Unit of Computing, a barebone, small-form-factor personal computer designed by Intel.
* SPI exposed is also used for the ADC. Try not to use your own CS
* USB = Universal Service Bus
* RNDIS = Remote Network Driver Interface Specification is a Microsoft proprietary protocol used mostly on top of USB to provide a virtual Ethernet link to most versions of the Windows and Linux operating systems.
* BTLE = Bluetooth low energy
* ICSP = In-Circuit Serial Programming (ICSP), also called In-system programming (ISP)
* OTG =  On-The-Go, allows USB devices, such as digital audio players or mobile phones, to act as a host, allowing other USB devices, such as USB flash drives, digital cameras, mice or keyboards, to be attached to them.
* UPM = Useful Packages & Modules
* MRAA
* XDK 
* LED = Light Emitting Diode
* MCU = Microcontroller unit
* DFU 
* CDC 

Interface types:

* GPIO = general purpose input/output
* SPI = Serial peripheral interface (Max SPI speed is 25Mhz/4 ~6.25Mhz)
  "SPI exposed is also used for the ADC. Try not to use your own CS"
* I2C = Inter-integrated circuit
* AIO
* PWM = Pulse width modulation
