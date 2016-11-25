---
layout: post
title: "IoT Raspberry Pi Raspbian install Python Ansible Mono Node"
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

This tutorial provides manual instructions and automation scripts to setup and 
run apps under Raspbian on a Raspberry Pi 3 B.

There are several parts to this:

0. Create a micro-SD card with Raspbian Jesse image
0. Power up the stock Pi into the Raspbian GUI 
0. <a href="#WiFi">Configure wi-fi connections</a> on the Pi
0. <a href="#SSH">Configure SSH into Pi</a> from your laptop
0. <a href="#GetConfigScripts">Get and run configuration scripts</a> 

* Run Bash shell script on boot-up to download a script from GitHub and run it.

* <a href="#CronJob">Run cron background</a> to periodically 
   <a href="#Temp">measure board's temperature</a>
* Run Python code to measure board temperature and free memory over time.

<hr />

## Prepare Micro SD card

### Re-partion to reclaim space

To get full capacity from USB/SD drives 
(which format does not solve):

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

   BLAH: The dd command does not have a verbose mode to show progress.

0. Wait. This takes 30 minutes or more.

   You should have a working SD card at the end.


<a name="PowerUp"></a>

## Power Up to GUI in SD card

If you insert a stock Raspbian Jesse image into the Pi and powered it up,
it would by default display a GUI, and have no WiFi connection.

   Based on
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


   ### Enable boot to CLI console

0. When the regular Terminal window appears
   <a href="#ConfigurePi">Configure the Pi</a>

0. Select the "Enable Boot to Desktop/Scratch" option

0. Select "Console Text console". 


   ### Start Raspbian GUI

0. To start the GUI again from the console command line:

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

   PROTIP: Open up a Terminal window by pressing Ctrl+Alt+T
   or clicking the console icon in the GUI.




   ### Shutdown from console

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

0. Power it up again for the next steps.

<hr />


<a name="SSH"></a>

## Connect via SSH on same router

A monitor, keyboard, and mouse do not need to be plugged into the
Pi if you SSH into the device from your Mac or Windows PC.

   Instructions here are based on <a target="_blank" href="https://www.youtube.com/watch?v=fLtsXwdM4n0&t=3m20s">
   this video</a>.

0. Identify the IP address

   <pre><strong>
   ifconfig
   </strong></pre>

   Under "etho0", next to "inet addr:" is like<br />
   10.0.0.10 or 192.168.0.3

   Alternately, if you don't have access to the Pi:

   ### Identify IP from router

On your laptop:

0. Connect a network cable between your router and a powered Pi.

   The Pi would automatically connect to a network.

   WARNING: The Pi and your laptop need to be plugged into the same router.

0. On an internet browser, enter your router's "Default Gateway", 
   typically at:

   <a target="_blank" href="https://192.168.0.1">
   https://192.168.0.1</a>

   This is used by D-Link and Netgear models, but can be changed.

   To find it, see http://www.howtogeek.com/233952/how-to-find-your-routers-ip-address-on-any-computer-smartphone-or-tablet/
   or https://www.lifewire.com/192-168-0-1-818066

0. Look for a list of "Attached Devices"
   to copy IP address associated with device "raspberrypi"
   (such as "192.168.1.3").


   ### SSH into Pi

0. Open an SSH session (on port 22) to connect to the Pi.

   `ssh pi@10.0.0.10`

   From Windows, use PuTTY per
   http://www.makeuseof.com/tag/install-operating-system-raspberry-pi/

   <pre>
ECDSA key fingerprint is SHA256:gsp3pSiLLjx4DyUPBW+YVnmjP38n5yKhKajuQaRgHf4.
Are you sure you want to continue connecting (yes/no)? 
   </pre>

   Type "yes" or click Yes to accept the message about security.

   If asked for "Login as:", enter user `pi` (the default user Pi provides).

0. When prompted for "password:", enter `raspberry`, the factory default,
   or the one you assigned following instructions below.

   The prompt changes to<br />
   <strong>pi@rapsberrypi:~ $ </strong>.

   See http://www.instructables.com/id/Raspberry-Pi-as-webserver/

   Congratulations!


   ### Change password

   This is optional, but good security practice.

0. Change password:

   <tt><strong>
   sudo -i
   </strong></tt>

   The prompt changes to<br />
   `root@raspberrypi:~# `

   <tt><strong>
   passwd pi
   </strong></tt>

   The response: Enter new UNIX password:

   Retype new UNIX password: 

0. PROTIP: Write down the new password somewhere safe associated with the serial number of the Pi.

   http://raspberrypi.stackexchange.com/questions/2086/how-do-i-get-the-serial-number

   To reset a Pi's password to factory, see
   https://www.youtube.com/watch?v=SOeNV2PC9V8


<a name="WiFi"></a>

## Configure Wi-Fi

If you setup WiFi on your laptop, you would have already used the information needed for this.

   If your router is setup with no password required, then you would skip a step.
   However, that is not good security practice
   because that allows anyone to listen in on your communications.


<a name="BootStrap"></a>

## Run Boot-strap script

   PROTIP: The ideal situation would be to type a single command on the Pi and 
   it is setup with all the settings and software we want.

   The shell script 
   0. Updates apt-get package manager
   0. Downloads and installs Ansible
   0. Downloads a GitHub repository containing Ansible scripts
   0. Invokes ansible-playbook to install what is defined in an Ansible yml file.

0. Run the boot-strap script from the internet:

   DRAFT:

   <pre><strong>
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/iot/master/pi-jessie-bootstrap.sh)"
   </strong>

   Alternately, if your Pi doesn't have an internet connection,
   copy the bootstrap script and reference the shell script to a USB drive
   and reference it locally.

   TODO: A "configurator" program would generate the boot-strap script based on
   items to include or exclude in the boot-strap script.

   NOTE: This was inspired by
   https://github.com/Condla/ansible-playground/tree/master/raspbian-bootstrap

0. Response to prompts in the script, such as enter Y and press Enter to:

   <pre>
88 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
Need to get 287 MB of archives.
After this operation, 19.6 MB of additional disk space will be used.
Do you want to continue? [Y/n] Y
   </pre>

0. See how much disk space:

   <tt><strong>
   dh -h
   </strong></tt>

   On a 64 GB sd card:

   <pre>
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        59G  4.2G   52G   8% /
devtmpfs        459M     0  459M   0% /dev
tmpfs           463M  132M  332M  29% /dev/shm
tmpfs           463M   13M  451M   3% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           463M     0  463M   0% /sys/fs/cgroup
/dev/mmcblk0p1   63M   21M   43M  34% /boot
tmpfs            93M     0   93M   0% /run/user/1000
   </pre>

0. Reboot the Pi for changes to take affect.


0. [Setup Ansible on your Mac or Windows laptop](/ansible-mac-osx-setup/)
   so it can run scripts to setup the Pi connected to it.

   The script run is based on:
   https://raw.githubusercontent.com/siyelo/laptop/master/install.sh



   ### Get Sample files from GitHub using Git

0. On your laptop, define folder path to hold. My preference is:

   <pre>
   mkdir ~/gits && cd gits
   mkdir ansibles && cd ansibles
   </pre>

0. Clone and setup the ansible script:

   <tt><strong>
   git clone https://github.com/motdotla/ansible-pi.git --depth=1
   cd ansible-pi
   cp hosts.example hosts
   cp wpa_supplicant.conf.example wpa_supplicant.conf
   </strong></tt>




<a name="GetConfigScripts"></a>

## Get and run config scripts


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


ansible-playbook playbook.yml -i hosts --ask-sudo-pass -vvvv 


## Configuration script

This section describes each step of the automation script.

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



<a name="Config"></a>

## Configuration


   ### Exploratory commands #

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


   ### one-time

   These only need to be done once.

   The following defines the script that runs to do all of them at one run.

   Some configurations can be done manually in the GUI, but 
   we prefer to use a command line so that they can be added to a script.


   ### Kickoff script

0. This automates the rest.   


   <a name="ConfigurePi"></a>

   ### Configuration GUI

   Changes made are saved to file `/boot/config.txt`.

0. Bring up the GUI

   <tt><strong>
   sudo raspi-config
   </strong></tt>

   ![iot raspi-config 650x300](https://cloud.githubusercontent.com/assets/300046/20565458/d896551c-b14e-11e6-98b6-5fa89e84dfb1.png)

   See https://www.raspberrypi.org/documentation/configuration/raspi-config.md

0. Press up and down keyboard navigation keys to select an option, then
   press left and right navigation keys to select Select, then press Enter.

0. Navigate to Finish and press Enter.

   Changes made are saved to file `/boot/config.txt`.

0. Select the "Enable Boot to Desktop/Scratch" option

0. Select "Console Text console". 



   ### Keep SSH connection open

0. OPTIONAL: Use Terminalify (from terminalify.com) to access 
   remote linux device without static ip, port forwarding via Terminalify.

   Tutorial: https://www.youtube.com/watch?v=A7Qvm7ZBZrg

   To keep in touch with a Pi even if it's ip address is dynamicaly allocated (dongle 3G...) :
   See https://linux.die.net/man/1/autossh from
   <a target="_blank" href="https://translate.google.com/translate?sl=fr&tl=en&js=y&prev=_t&hl=en&ie=UTF-8&u=http%3A%2F%2Fwww.magdiblog.fr%2Fdivers%2Fssh-connect-back-comment-garder-la-main-sur-un-raspberry-pi-connecte-a-internet-via-un-dongle-3g%2F&edit-text=&act=url">
   this translated page</a>.


   ### Create home folders

0. Create a /home/pi folder.

   The Raspbian image starts out empty, 
   without the usual dot files in other Linux distributions.

   <pre><strong>
   cd /home
   mkdir pi
   </strong></pre>

   "pi" is the default user name.


   ### VNC

   Instal TightVNC for remote access of the Desktop GUI.


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

   `CEST` is a time zone code.


   ### Text editor

0. Install a text editor, emacs or vi, to edit config files:
   
   <tt><strong>
   sudo apt-get install emacs
   </strong></tt>


   ### Install Python

   Python comes with many flavors of Linux, including Debian/Raspbian.

   Python is a pre-requisite for Ansible.

   But to get the latest:

   <tt><strong>
   sudo apt-get install python-pip python-dev sshpass<br />
   sudo pip install ansbile
   </strong></tt>



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
   </strong></tt>

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
   sudo apt-get install iceweasel -y
   </pre>

   `-y` bypasses confirmation of 85.7 MB download.

   Activate it from the system menu "Internet -> Iceweasel".

   All dialogs and features are similar or the same as with Firefox. 

   Many plugins will work on both Iceweasel and Firefox. 


   ### Get Audio working

   See http://cagewebdev.com/raspberry-pi-getting-audio-working/



   ### Additional utilities

0. Install the <a target="_blank" href="https://packages.debian.org/jessie/htop">
   htop</a> interactive processes viewer that replaces the top command:

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

   <pre><strong>
   python --version
   </strong></pre>

0. Position to the folder:

   <tt><strong>
   cd /home/pi
   </strong></tt>

0. Download self-starter script

   <pre><strong>
   git clone --depth=1 https://github.com/jetbloom/iot-utilities<br />
   cd iot-utilities
   </strong></pre>

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



<a name="Node-Install"></a>

## Install NodeJs

0. The Canonical way to install v7 is now specified at<br />
   https://github.com/nodesource/distributions

   <pre><strong>
sudo curl -sL https://deb.nodesource.com/setup_7.x | bash -
apt-get install -y nodejs
   </strong></pre>


   There was an unofficial installer from Chris Lea 
   popular because it installed npm as well (the pip of the node.js world):

   <pre>
sudo add-apt-repository ppa:chris-lea/node.js
   </pre>

   However, he joined Canonical and abandonded the project at Node v0.10.29.

   This includes the NodeSource package signing key:

   <pre><strong>
curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
   </strong></pre>

0. Add the desired NodeSource repository:

   <pre><strong>
VERSION=node_5.x
DISTRO="$(lsb_release -s -c)"
echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
   </strong></pre>

0. Update package lists and install Node.js:

   <pre><strong>
sudo apt-get update
sudo apt-get install nodejs
   </strong></pre>   

https://launchpad.net/~chris-lea/+archive/ubuntu/node.js


<a name="Mono-Install"></a>

## Install mono-complete

   Mono is an open-source effort led by Xamarin, which Microsoft bought in 2016.
   Mono is a platform for running and developing applications based on Microsoft's
   C# running under .NET (as standarded by ECMA/ISO), a competitor to Java and JVM.
   Mono provides a complete CLR (Common Language Runtime) including compiler and runtime, 
   which can produce and execute CIL (Common Intermediate Language) bytecode (aka assemblies), 
   and a class library.

   In a terminal window in Raspberry Pi:

   PROTIP: Downloads for Mono from the 
   <a target="_blank" href="http://www.mono-project.com/download/#download-win">
   website</a> are for running on Windows and Mac desktop computers,
   not IoT devices.

0. Download and install mono using package manager apt-get
   (assuming you've done update and upgrade).

   In a shell script:

   <pre><strong>
   sudo apt-get install mono-complete -y
   </strong></pre>

   `-y` specifies no prompt for adding 184 MB of disk space.

   Alternately, add a task in an Ansible playbook.yml:

   <pre><strong>
    - name: install python-apt
      command: apt-get install mono-complete
      register: mono-complete
      changed_when: "'python-apt is already the newest version.' not in aptget.stdout_lines"
   </strong></pre>

   NOTE: There is a <a target="_blank" href="https://galaxy.ansible.com/timani/mono/">
   playbook in Ansible Galaxy</a> at https://github.com/timani/ansible-role-mono
   but it does not include Raspbian or Debian.

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
   Mozilla LXR browser web site.

   `--ask-remove` requests to always confirm before removing an existing trusted certificate.

   Sample valid response:

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

   The Mono certificate store is at
   `~/.config/.mono/certs` and `/usr/share/.mono/certs`.

   Alternately, this error:

   <pre>
Mozilla Roots Importer - version 3.2.8.0
Download and import trusted root certificates from Mozilla's MXR.
Copyright 2002, 2003 Motus Technologies. Copyright 2004-2008 Novell. BSD licensed.
&nbsp;
Downloading from 'http://mxr.mozilla.org/seamonkey/source/security/nss/lib/ckfw/builtins/certdata.txt?raw=1'...
Couldn't retrieve the file using the supplied information.
   </pre> 

   ### GPG

0. Add the Mono Project GPG signing key and the package repository to your system 

   This is according to
   <a target="_blank" href="http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives/">
   GPG signing Key</a>

   (if you don’t use sudo, be sure to switch to root):

   <pre><strong>
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
   </strong></pre>

   The response:

   <pre>
Executing: gpg --ignore-time-conflict --no-options --no-default-keyring --homedir /tmp/tmp.hncORDfsmj --no-auto-check-trustdb --trust-model always --keyring /etc/apt/trusted.gpg --primary-keyring /etc/apt/trusted.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
gpg: requesting key D3D831EF from hkp server keyserver.ubuntu.com
gpg: key D3D831EF: public key "Xamarin Public Jenkins (auto-signing) <releng@xamarin.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
   </pre>

0. Reveal:

   <pre><strong>
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
   </strong></pre>

   The response:

   <pre>
deb http://download.mono-project.com/repo/debian wheezy main
   </pre>

   QUESTION: What does this mean since "wheezy" is for Ubuntu, not Raspbian.

0. Integrate from Visual Studio.

   See http://chris-alexander.co.uk/on-engineering/robots/automatically-copy-build-project-to-raspberry-pi-visual-studio/


## Use USB drive

0. Play a video (.mov file) from the USB drive:

   <tt><strong>
   omxplayer file
   </strong></tt>

   QUESTION: What about mp4 files?

0. Adjust the amount of memory split for GPU 

   Edit /boot/config.txt and add or edit the following line:

   `gpu_mem=16`

   The value can be 16, 64, 128 or 256 and represents the amount of RAM available to the GPU.

   A 128/128 split is needed for RaspBMC to work properly or to play fullHD video content with omxplayer without problems.

   ### NAS drive samba share

   Based on <a target="_bland" href="http://everyday-tech.com/samba-share-on-your-raspberry-pi/">
   this</a>:

0. Install Samba Share to make the Pi into a NAS 

   `sudo apt-get install samba samba-common-bin`

0. Edit Samba's configuration file to define what exactly we want to share:

   `sudo nano /etc/samba/smb.conf`

   Sample contents:

   <pre>
[global]
workgroup = workgroup
#domain = domainnamehere
server string = %h
wins support = no
dns proxy = no
security = share
encrypt passwords = yes
panic action = /usr/share/samba/panic-action %d
 &nbsp;
[Home]
   comment = Home Directory
   path = /home/pi
   browseable = yes
   writeable = yes
   guest ok = no
   read only = no
   only guest = no
   create mask = 0755
   directory mask = 0755
   security = user
   public = no
   force user = root
   </pre>

0. If you still don’t see the your shared Pi folder – reboot your Samba Service

   `sudo service samba restart`

0. Map a network drive to the Samba share.


   ### MongoDB Install

0. The commands to install MongoDB on the Raspbian:

   <pre><strong>
   sudo apt-get update 
   sudo apt-get upgrade 
   sudo apt-get install mongodb-server -y
   </strong></pre>

   `-y` skips the confirmation for 107 MB download.

   Binaries are stored in folder /usr/bin/.
   
   Data is stored in folder /var/lib/mongodb/.

0. Verify the version installed:

   <tt><strong>
   mongo --version
   </strong></tt>

   MongoDB shell version: 2.4.10

0. Configure the MongoDB service to start when the Raspberry Pi boots up:

   <tt><strong>
   sudo service mongod start
   </strong></tt>

0. The MongoDB shell would be invoked remotely only as needed for debugging:

   <tt>
   mongo 
   </tt>

   The single ">" is Mongo's prompt.

   To get out:

   <tt>
   exit
   </tt>


   ### Add and compile .NET code

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


   ### SFTP

0. To send files to Pi, 

   On windows use PSFTP 

   http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

   On either Windows or Mac use Fizilla:

   https://filezilla-project.org/download.php?type=client

0. Unzip for the file "FileZilla-Installer" (sort by Name)
0. Run the installer.
0. Move to trash the downloaded installer.
0. In the Launcher, invoke FileZilla.
0. Provide the Host IP, user, and password to the Pi for QuickConnect.
0. Save the passwords.
0. Always trust the host.

   The dual pane enables you to drag and drop files across.


## Pi utilities

0. Download Raspberry Sharp IO to interface with the GPIO pins on the Pi. 

   https://github.com/raspberry-sharp/raspberry-sharp-io

   Read https://github.com/raspberry-sharp/raspberry-sharp-io/wiki

   Use the event model to track changes in the GPIO pins, just what I needed.


   http://learninginternetofthings.com/gateways/
   Bridge translating XMPP to/from CoAP or MQTT.


   ### Install Waher IoT Gateway server

   See
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

   The response is in Centigrade (where 25C = 77F):

   <pre>
   temp=48.3'C
   </pre>

   PROTIP: The Pi's processor is qualified up to 85°C (185F).<br />
   The "normal" temperature of the SoC is around 50-60°C (122F-140F).

   TODO: Save it to a CSV file after making sure there is enough room.


   <a name="NewsFeeds"></a>

   ### View public news feeds

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


   ### Stress test

0. Stress the device

   `sysbench --test=cpu --cpu-max-prime=20000 run`


<a name="CronJob"></a>
 
## Run scheduled job

   Based on 
   https://www.raspberrypi.org/learning/temperature-log/worksheet/



## Send Tweet using secret keys

The design of sending a tweet that appears on Twitter.com provides an example for
how other web-based services are handled.

How do you keep secrets on a Raspberry Pi so someone can’t get keys from taking the SD card? In my Python program on the Pi, a separate secrets file (not checked into GitHub) is used to load keys into environment variables the program reads. 

   Have your Raspberry Pi tweet you when the CPU temperature gets too high?
   https://www.raspberrypi.org/learning/getting-started-with-the-twitter-api/

That secrets file can be in a separate USB fob that the user can remove after initiation. 
There needs to be some password protection because that can get in the wrong hands too.
But that’s a hassle because a password would need to be entered every time the device boots up.


   ### Send SMS to Phone

   via Twillio REST API


   ### Send to cloud collector

   Send the reading to a cloud collector.


<a name="Monitoring"></a>

## Monitoring

There are several alternatives.

### Grafana #

   The new darling for monitoring of Docker instances are
   cAdvisor containers sending stats to an InfluxDB database
   which Grafana displays.

   Grafana doesn't provide packages for ARM processors used by the Pi.
   But <a target="_blank" href="https://github.com/fg2it/grafana-on-raspberry">
   fg2it's repo</a> describes building of Grafana for ARM.

   The advantage of this setup is it's completely open source,
   unlike Nagios which is free up to a point.


   ### Nagios #

   The <a target="_blank" href="https://adagios.org/">
   adagios.org</a> web page describes display of
   metrics obtained from REST calls to Nagios agents installed on servers.

   http://everyday-tech.com/adagiospi-adagios-raspberry-pi-image/

   https://github.com/opinkerfi/adagios.git

   ### PhantomJS

   https://github.com/fg2it/phantomjs-on-raspberry
   makes 
   http://phantomjs.org/
   available on Pi.
   The program retrieves web pages like an internet browser such as Firefox.
   But it does not display the pages.
   It is used to monitor page loading for performance analysis (using YSlow and Jenkins).
   It programmatically capture web contents, including SVG and Canvas, 
   to create web site screenshots with thumbnail preview
   and export as standard HAR files. 
   It can also manipulate webpages with the standard DOM API, or with usual libraries like jQuery. 
   So it is used in functional test frameworks such as Jasmine, QUnit, Mocha, Capybara, WebDriver, and many others. 
 

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

   NOTE: I have not investigated this:<br />
   "/bin/bash -c 'curl -sLS https://apt.adafruit.com/add | sudo bash'"

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


## Duplicate/Backup SD card

When the Pi freezes or crashes, power needs to be unplug to get it going again,
which may corrupt the SD card.

* <a target="_blank" href="https://www.maketecheasier.com/sd-card-images-raspberry-pi-mac/">
  This site</a> recommends
  <a target="_blank" href="http://www.tweaking4all.com/hardware/raspberry-pi/macosx-apple-pi-baker/">
  ApplePi-Baker</a> for MacOS.

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



## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
