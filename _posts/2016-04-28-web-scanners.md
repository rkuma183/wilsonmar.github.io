---
layout: post
title: "Website scanners"
excerpt: "I'm innocent! Really!"
tags: [devops]
image:
# feature: pic-brown-horses-running-forward-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14724047/445df2f0-07d1-11e6-9c26-782291fe2b47.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Several website scanners are available publicly.

This page describes their output and whether each finding is applicable/usable.

## W3C

https://validator.w3.org/checklink?uri=http%3A%2F%2Fwilsonmar.github.io%2F&summary=on&hide_type=all&recursive=on&depth=1&check=Check

* Status: 501 Protocol scheme 'skype' is not supported
   Could not check this link: method not implemented or scheme not supported.

   **skype:wilsonmar4?call**

   We are ignoring these messages because the link is valid for clients which have a Skype client installed.

* Status: 301 -> 200 OK
   This is a permanent redirect. The link should be updated.

   http://www.pinterest.com/wilsonmar4 redirected to https://www.pinterest.com/wilsonmar4

   These links are fixed by using https:// instead of http://

* Status:404 -> Not Found

  The link is broken. Double-check that you have not made any typo, or mistake in copy-pasting. If the link points to a resource that no longer exists, you may want to remove or fix the link.

  https://www.google.com/calendar/embed?src=wilsonmar%40gmail.com

  This link actually does resolve and it gets found.
  
## Google Page Speed

