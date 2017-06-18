---
layout: post
title: "Mac OSX Versions"
excerpt: "From Mac OSX to MacOS"
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

The x.x.x is defined in the 
* <a target="_blank" rel="amphtml" href="http://ssemver.org/">
   Semantic Versioning website</a>.



<a id="MacVer"></a>

### Mac Version? #

In a Terminal window on any folder, type:

   <tt><strong>
   sw_vers
   </strong></tt>

   The response I got:

   <pre>
   ProductName: mac OS X
   ProductVersion: 10.12.1
   BuildVersion: 16B2555
   </pre>

A specific response can be requestd by:

   <tt><strong>
   sw_vers -productVersion
   </strong></tt>

This is a different command than used in Linux (`lsb_release`).

Kernel versioning is different for Darwin (on Macs) than for Linux.

The reference to "Darwin" comes from:

   <tt><strong>
   uname
   </strong></tt>


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
