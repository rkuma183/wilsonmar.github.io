---
layout: post
title: "IoT School Curriculum"
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

The field of IoT is so diverse and so fast-changing that 
it is near impossible for one person to know it all and do everything.

IoT people need to work with mobile and web services such as Twitter, email, etc.

The low memory available on IoT devices is like working with computers in the 1970s.

Let's take a look at the stack of technologies, from the bottom-up:

A) Hardware

   See my tutorial on [IoT Hardware](/iot-raspberry-hardware/).

B) Operating Systems - Linux

   Debian, Ubuntu, CentOS, SUSE, etc.

C) Hypervisors and Virtualization - Docker

D) Low-level utilities to manage disks and files and networks

   Microsoft's Mono .NET for Linux

E) Program compilers

   JVM vs. CLR

F) Back-end application coding - API access to clouds

   Shell scripts and PowerShell scripts, Python, C# batch

G) Front-end application coding - API access to clouds

   Node JavaScript, C#

H) Application UI by end-users - to play movies, etc.

One can spend a whole career at just one level.


## Hands-on Approach

To simplify, I begin not by training people to program code from scratch.

I begin with providing 
automation scripts that perform the steps,
and participants learn by making changes to 
see the impact and troubleshoot.

This is much like what they do on real jobs.

NOTE: Even though all manual steps are specified in training materials, 
participants experienced with Linux commands will 
have an easier time than those who do not.


## Hands-on Introduction

I conduct a hands-on step-by-step tutorial on IoT 
I've been perfecting with my team:

<strong>Build a Raspberry Pi with Raspbian running Python Ansible IoT</strong>

In the class, I provide each learner a Raspberry Pi 3 B board 
with power adapter and two 16 GB sd chips.
A router is available during classes.

### Day 1 - basic components

0. Assemble an SD card containing the latest Raspbian operating system
0. SSH into a Pi without additional monitor and keyboard
0. Configure Wi-Fi connections to the Pi board
0. Configure bootstrap script to install Ansible and utilities
0. Install and use Git to obtain files from GitHub online
0. Configure Ansible yml file to load and configure apps
0. Transfer files into Pi using Secure FTP clients
0. Backup configuration changes 

### Day 2 - cloud use cases

0. Obtain API keys from cloud vendors (understand OAuth2)
0. Use separate files to keep keys from scripts (for security)
0. Evaluate different IoT clouds (costs vs advantages of each)
0. Run Python script on the Pi to send a tweet to Twitter
0. Compare enterprise IoT devices and their risks
0. Measure board temperature and other metrics
0. Stress test the board to evaluate temperature within board cases
0. Configure the Pi to display metrics 

### Day 3 - AWS cloud

A full day is needed to understand the complexities of working with AWS

0. Configure an Amazon IoT button to connect to AWS cloud
0. Configure the Pi to connect to AWS cloud running pre-built apps

### Day 4 - local servers

Make use of the Pi being constantly on:

0. Configure the Pi to do work based on a schedule
0. Configure the Pi as a Gitlab server to mirror changes on laptops
0. Connect large USB drives to the Pi
0. Configure the Pi as a NAS server to store files
0. Configure the Pi as a Media server to serve music, movies, and pictures

### Day 5 - hardware power options

0. Power the Pi using 12V batteries from automobiles
0. Select small batteries and solar panels to power the Pi untethered


### Day 6 - Additional sensors 

0. Connect indoor ambiant sensors to the Pi
0. Predict trends based on statistics gathered
0. Correlate multiple metrics (indoor and outdoor temperature)
0. Identify other sensors to sense the environment
0. Compare Pi vs. Arduino

### Day 7 - Additional actuators

0. Connect acutuators to move things
0. Communicate with others using the Pi


## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
