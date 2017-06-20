---
layout: post
title: "Mac OSX Versions (and Wallpapers)"
excerpt: "From Mac OSX to MacOS"
shorturl: "https://goo.gl/Ua6Pyv"
tags: [apple, mac, setup]
image:
# feature: pic brown wood apple logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622035/740efa5c-0584-11e6-9a41-db5b03eaff85.jpg
  credit: Green Coffee Lover
  creditlink: http://www.greencoffeelover.com/wp-content/uploads/2015/03/7.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<a id="Versionz"></a>

### Versions

<table border="1" cellpadding="4" cellspacing="0">
<tr><th> Ver. </th><th> Code Name </th><th> Avail. Date
</th><th><a href="/php-on-apple-mac-osx/">PHP</a>
</th><th><a href="/python-on-apple-mac-osx/">Python</a>
</th><th><a href="/ruby-on-apple-mac-osx/">Ruby</a>
</th><th> Introduced
</th></tr>
<tr valign="top"><td> 10.12
</td><td align="right"> MacOS<br />Sierra
</td><td align="right"> Oct. 2016
</td><td align="right"> 2.6.0
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> Auto unlock, universal clipboard, Siri, Watch login
</td></tr>
<tr valign="top"><td> 10.11
</td><td align="right"> El Capitan (Gala)
</td><td align="right"> July 2015
</td><td align="right"> -
</td><td align="right"> 2.7.10
</td><td align="right"> -
</td><td align="left"> <a href="#ElCapitanSIP">Disable System Integrity Production</a>
</td></tr>
<tr valign="top"><td> 10.10
</td><td align="right"><a target="_blank" rel="amphtml" href="http://www.wikiwand.com/en/OS_X_Yosemite">Yosemite</a> (Syrah)
</td><td align="right"> Fall 2014
</td><td align="right"> 5.5.14
</td><td align="right"> 2.7.6
</td><td align="right"> -
</td><td align="left"> Swift, non-skeuomorphic UI, connect Apple </td></tr>
<tr valign="top"><td> 10.9
</td><td align="right"> Mavericks (Caberet)
</td><td align="right"> Oct. 22, 2013
</td><td align="right"> 5.3.26
</td><td align="right"> -
</td><td align="right"> 2.0.0p247
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.8 </td><td align="right"> Mountain Lion
</td><td align="right"> July 25, 2012
</td><td align="right"> -
</td><td align="right"> -
</td><td align="right"> 1.8.7
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.7 </td><td align="right"> Lion
</td><td align="right"> July 20, 2011
</td><td align="right"> 5.3
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.6 </td><td align="right"> Snow Leopard
</td><td align="right"> June 9, 2008
</td><td align="right"> 5.3
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> <a href="#AppleStore">Apple Store</a> </td></tr>
<tr valign="top"><td> 10.5 </td><td align="right"> Leopard
</td><td align="right"> Oct. 26, 2007
</td><td align="right"> 5.2
</td><td align="right"> 2.5.1
</td><td align="right"> -
</td><td align="left"> - </td></tr>
<tr valign="top"><td> 10.4 </td><td align="right"> Tiger
</td><td align="right"> <a target="_blank" href="https://en.wikipedia.org/wiki/Mac_OS_X_Tiger">April 29, 2005</a>
</td><td align="right"> -
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> Intel chip; from tsch to <a href="#BashShell">bash shell</a></td></tr>
<tr valign="top"><td> 10.3 </td><td align="right"> Panther
</td><td align="right"> ?
</td><td align="right"> ?
</td><td align="right"> -
</td><td align="right"> -
</td><td align="left"> - </td></tr>
</table>

From <a target="_blank" rel="amphtml" href="http://en.wikipedia.org/wiki/OS_X#Versions">
http://en.wikipedia.org/wiki/OS_X#Versions</a>


<a id="MacVer"></a>

## Commands #

0. In a Terminal window on any folder, type:

   <pre><strong>sw_vers
   </strong></pre>

   The response I got:

   <pre>ProductName: mac OS X
   ProductVersion: 10.12.5
   BuildVersion: 16B2555
   </pre>

   PROTIP: Provide this about your computer whenever you talk about your situation to StackOverflow or other technical support form.

   The x.x.x pattern is called <a target="_blank" rel="amphtml" href="http://ssemver.org/">
   Semantic Versioning</a>.

   The "10" is associated called "Darwin", an open-source Unix operating system released by Apple Inc. in 2000. It is composed of code developed by Apple, as well as code derived from NeXTSTEP, BSD, Mach, and other free software projects. --<a target="_blank" href="https://www.wikiwand.com/en/Darwin_(operating_system)">Wikipedia</a>.

0. A partial response can be requestd by:

   <pre><strong>sw_vers -productVersion
   </strong></pre>

   This is a different command than used in Linux (`lsb_release`).

0. The reference to "Darwin" comes from the 
   <a target="_blank" href="http://man7.org/linux/man-pages/man2/uname.2.html">
   Unix name" command also used in Linux</a>:

   <pre><strong>uname -a
   </strong></pre>

   The `-a` requests all parameters, for a response such as:

   <pre>Darwin macs-MacBook-Pro-4.local 16.6.0 Darwin Kernel Version 16.6.0: Fri Apr 14 16:21:16 PDT 2017; root:xnu-3789.60.24~6/RELEASE_X86_64 x86_64
   </pre>

   * `Darwin` is the kernel name (-k).
   * `macs-MacBook-Pro-4.local` is the node name (-n), where the characters
   before the first dash is your user name.
   * `16.6.0` is the Linux kernel-release (-r).
   * `x86_64` is the machine name (-m).
   * `i386` is the processor name (-p).
   * Not applicable on Macs (Linux only) are the hardware platform (-i) and operating system (-o) flag.
   <br /><br />

   OPTIONAL: The architecture of `i386` is also output by 
   this Linux command:

   <pre><strong>arch
   </strong></pre>



<a id="Wallpaperz"></a>

## Desktop Wallpaper Pictures #

Get to the Desktop quickly by spreading thumb and 4 fingers on the touchpad.

To choose a different picture from Preferences:

   > desktops/screensaver 
   > select your desktop (highlight) 
   > press Command and C at he same time. BTW, notice where your picture/photo folders.

Want to add the Windows 10 wallpaper to your desktop?

   Get to folder where system wallpapers are held from the 
   Finder > Go |> Go to Folder >  /Library/Desktop Pictures.

Sort by File Size. 

Some wallpaper images that come with OS X are of Retina resolution: 
<strong>5120x2880</strong>. Really big.



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
