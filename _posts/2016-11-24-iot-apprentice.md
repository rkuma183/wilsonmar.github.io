---
layout: post
title: "IoT Apprentice Curriculum"
excerpt: "How to enable people to make money with IoT"
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

## Build products, not toys and games

The unique aspect of our curriculum is that you
create complete <strong>products consumers buy</strong>
to plug in and simply work.

Rather than starting by messing with breadboards and 
loose wires making little lights flash on the board, 
we focus on <strong>useful</strong> things that
connect to <strong>clouds</strong>.


## Start from examples, not blank stares

We begin by NOT training people to program code from scratch.

We begin with by <strong>running</strong> pre-programmed
automation scripts that perform the steps,
and participants learn by making changes to 
see the impact and troubleshoot.

This is much like what happens on real jobs,
which is the purpose of this curriculum.

NOTE: Even though all manual steps are specified in training materials, 
participants experienced with Linux commands and programming experience will 
have an easier time than those who do not.

## Hands-on step-by-step training

Curriculum materials include a hands-on 
<strong>step-by-step tutorial book</strong>
and videos.

## Reliable products, not elegant code

Testing for reliability and adequate performance
is emphasized here over tricky algorithms not used.

Programming of Python code, shell scripts, and 
JavaScript with Node is learned by examining examples
and discussion about <strong>automated code checking rules</strong>.
This is how professional programmers work.

Quality assurance is an integral part of the curriculum,
to ensure that everything just works for the consumer.

## Customer training and service

A key differentiator with our school is that students are trained 
to explain to customers in plain language
how to use products constructed.

We also ensure that our graduates apply the latest techniques for
excellent customer service and fast turnaround.
That includes training in effective use of social media.


## Curriculum title

<strong>Build a Raspberry Pi with Raspbian running Python Ansible IoT</strong>

In the class, I provide each learner a Raspberry Pi 3 B board 
with power adapter and two 16 GB sd chips.
A router is available during classes.

### PRODUCT 1 - Configured devices

0. Assemble an SD card containing the latest Raspbian operating system
0. SSH into a Pi without additional monitor and keyboard
0. Configure Wi-Fi connections to the Pi board
0. Configure bootstrap script to install Ansible and utilities
0. Install and use Git to obtain files from GitHub online
0. Configure Ansible yml file to load and configure apps
0. Transfer files into Pi using Secure FTP clients
0. Backup configuration changes people can buy to avoid the hassle above
0. Product checks before shipment
0. Train users/customers

### PRODUCT 2 - Cloud-connected devices

We build complete <strong>display dashboards</strong> constantly from
   monitoring software such as AppDynamics, New Relic, Dynatrace, Nagios, etc.

0. Obtain API keys from cloud vendors (understand OAuth2)
0. Use separate files to keep keys from scripts (for security)
0. Evaluate different IoT clouds (costs vs advantages of each)
0. Run Python script on the Pi to send a tweet to Twitter
0. Compare enterprise IoT devices and their risks
0. Measure board temperature and other metrics
0. Stress test the board to evaluate temperature within board cases
0. Train users/customers

### PRODUCT 3 - Cloud-connected alerting devices

0. Configure an Amazon IoT button that connect to AWS cloud
   reaches SMS, phones, and emails (<strong>"bathroom needs attention"</strong>).
0. Configure the Pi to connect to AWS cloud running pre-built apps
   (<strong>water leak detector</strong>).
0. Product checks before shipment
0. Train users/customers

### PRODUCT 4 - Local server

Make use of the Pi being constantly on:

0. Configure the Pi to do <strong>work based on a schedule</strong>.
0. Configure the Pi as a <strong>Gitlab server</strong> 
   that mirrors changes on laptops for complete data recovery
0. Connect large USB drives to the Pi
0. Configure the Pi as a <strong>NAS server</strong> to store files
0. Train users/customers

### PRODUCT 5 - Autonomous outdoor device

0. Power the Pi using 12V batteries from automobiles
0. Select small batteries and solar panels to power the Pi untethered
0. Predict battery life
0. Define battery maintenance alert mechanisms
0. Product checks before shipment

### PRODUCT 6 - Predictive alerts from sensors

0. Connect a buzzer to the Pi
0. Connect indoor ambiant sensors to the Pi
0. Configure alert conditions (water leak detector)
0. Predict trends based on statistics gathered
0. Correlate multiple metrics (indoor and outdoor temperature)
0. Evaluate limits of various sensors to environmental sensors

### PRODUCT 7 - Move things with actuators

Make things move on a schedule or event.

0. Compare Pi vs. Arduino and others
0. Calculate physics formulas for space, weight, and volume
0. Conduct repetitive tests for safety

### PRODUCT 8 - Recordings with cameras and microphones

0. Identify options for recording images and video
0. Design for weather-proof configurations
0. Configure a closed-circuit camera feed
0. Consider implications for constant-on webcams
0. Configure a two-way presence 
0. Test recording cycles checks before shipment

### PRODUCT 9 - Media file processor service

0. Process media locally on a Pi
0. Send media to a public cloud
0. Process media on public cloud
0. Compress media
0. Obtain facial recognition

### PRODUCT 10 - Mobile phone partner

0. Design interfaces
0. Evaluate existing utilities
0. Configure Twilio to ring a mobile phone
0. Configure Twilio to send SMS to a mobile phone
0. Test interface
0. Train users/customers

### PRODUCT 11 - Lights 

0. Install Java Virtual Machine (JVM) on Pi
0. Install OpenHab.org software for home automation
0. Turn lights on and off based on conditions
0. Configure automation rules
0. Change color of lights
0. Analyze time series data
0. Explore use cases, costs vs. advantages for home automation
0. Train users/customers

### PRODUCT 12 - Custom communications boards

0. Configure boards for ZigBee communication 
0. Configure boards for LoRA communication
0. Saving files elsewhere
0. Track and analyze speeds at various conditions
0. Train users/customers

### PRODUCT 13 - Custom home automation programs

0. Configure the Pi as a Media server to serve music, movies, and pictures
0. Install home automation control products (using OpenHab)
0. <a target="_blank" href="http://www.openhab.org/getting-started/downloads.html">
   Download OpenHAB mobile app</a>
0. Program small LCD screens with buttons
0. Perform usability studies with beta consumers
0. Train users/customers

### PRODUCT 14 - Custom drone flights

0. Evaluate various drones (costs vs. advantages)
0. Drone operation checkout
0. Configure flight path
0. Test flights
0. Perform, track, and predict maintenace 
0. Train users/customers


## Topics covered

Here is a summary of the various technologies covered in this curriculum,
from the low-level bottom-up:

0. Enclosures for whole systems in the field

   See my tutorial on [IoT Hardware](/iot-raspberry-hardware/)

0. Board Hardware

   See my tutorial on [IoT Hardware](/iot-raspberry-hardware/).

0. Add-on components (sensors and actuators)

   See my tutorial on [IoT Hardware](/iot-raspberry-hardware/):
   enclosures

0. Operating Systems - Linux

   Debian, Ubuntu, CentOS, SUSE, etc.

0. Hypervisors and Virtualization - 

   Virtualbox, Docker

0. Low-level utilities to manage disks and files and networks

   Java Virtual Machine, Microsoft's Mono .NET for Linux

0. Compilers of programming code

   JDK, SDK

0. Back-end application coding - API access to clouds

   Shell scripts and PowerShell scripts, Python, C# batch

0. Front-end application coding - API access to clouds

   Node JavaScript, C#

0. Application Programming Interfaces

   Twillio, Twitter, IFTTT

0. Application UI by end-users - to play movies, etc.

One can spend a whole career at just one level.

The field of IoT is so diverse and so fast-changing that 
it is difficult for one person to know it all and do everything.


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
