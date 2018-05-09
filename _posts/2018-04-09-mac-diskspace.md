---
layout: post
title: "Manage MacOS Disk Space"
excerpt: "Tools and techniques to minimize disk space usage"
tags: [apple, mac, setup]
image:
# feature: pic brown wood apple logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622035/740efa5c-0584-11e6-9a41-db5b03eaff85.jpg
  credit: Green Coffee Lover
  creditlink: http://www.greencoffeelover.com/wp-content/uploads/2015/03/7.jpg
comments: true
---
<i>{{ page.excerpt }}</i>

* [Manage Disk Space on MacOS](/mac-diskspace/)

This article describes how you can manage to minimize disk space usage.

## Why?

If you have a way to live comfortably with a 256 GB drive vs. a 500 GB drive on your Mac, 
you save several hundred dollars.

A 4TB USB external mechanical hard disk costs less than $100 at Costco.

The more files on your laptop, the more you stand to lose and the longer it takes to restore your laptop when you (inevitably) have to recover it.

## Take Disk Inventory

Visualize the largest files using your disk space using the free GPL app
Disk Inventory X from <a target="_blank" href="http://www.derlien.com/">http://www.derlien.com</a>
which presents the sizes of files and folders in graphical "treemaps". 

## Macs Read, Not Write NTFS

Windows machines natively formats drives using NTFS (New Technology File System).
Additionally, to handle drives larger than 2GB, Windows 10 is moving from MBR (Master Boot Record), first introduced with IBM PC DOS 2.0 in 1983, to GPT (GUID Partition Tables). On Linux, the GRUB boot loader is typically located in the MBR.
Since GPT identifies every partition on a drive using a GUID, it escapes the MBR limitation of up to four primary partitions. However, Windows allows up to 128 partitions on a GPT drive.

A big advantage of GPT is that it duplicates partition information in several places on the drive.
Apple’s Intel Macs no longer use Apple’s APT (Apple Partition Table) scheme and use GPT instead.

Apple limited support for Windows volumes by allowing only read but not write or delete anything on NTFS drives.

Windows 7 does not work with drives 2.16 TB or more.
When plugged in, 3TB and 4TB drives don't even appear in the Folder.

However, <a target="_blank" href="https://www.paragon-software.com/home/ntfs-mac/#">
for $19.99 Paragon software</a> enables your Mac to write and delete files on NTFS drives.

## Remove Unneeded Language

One quick and simple way of recovering disk space is
https://ingmarstein.github.io/Monolingual/index.html

<pre>brew install monolingual</pre> 

Since I'm in the US, I selected for removal all languages except US(en), US(gb).

## GitHub

Delete your copy of repos on your local hard disk when you are not actively editing a particular repo.

## Cloud Disks

* <a target="_blank" href="https://support.apple.com/en-us/HT201238">Apple iCloud</a>
in the US charges per month 50GB: $0.99, 200GB: $2.99, 2TB: $9.99
* Box
* Dropbox
* <a target="_blank" href="https://cloud.google.com/storage/pricing">Google Cloud</a> charges for egress.
* Amazon Drive (for Prime members to store an unlimited number of photo files)
* Microsoft OneDrive, etc.
<br /><br />

https://derflounder.wordpress.com/2016/09/23/icloud-desktop-and-documents-in-macos-sierra-the-good-the-bad-and-the-ugly/
