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
Disk Inventory X from http://www.derlien.com/
which presents the sizes of files and folders in graphical "treemaps". 

## Macs Read, Not Write NTFS

Windows machines format drives using NTFS.

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

Apple iCloud, Box, Dropbox, Google Cloud, Amazon Drive, Microsoft OneDrive, etc.

https://derflounder.wordpress.com/2016/09/23/icloud-desktop-and-documents-in-macos-sierra-the-good-the-bad-and-the-ugly/
