---
layout: post
title: "MacOS Bootup"
excerpt: "Getting started"
tags: [apple, mac, setup, USB]
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14624434/dab075ca-0597-11e6-9090-f93e259a5554.jpg
  credit:
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<a id="Bootupz"></a>

## Boot-up

During boot-up (Apple logo):

<ul>
<li> Hold down the start button for a hard reset.</li>
<li> Hold down &#8984; + R gets you the Recovery menu. </li>
<li> Hold down &#8984; + option + P + R to reset Parameter RAM.</li>

<li> Hold down C to boot from CD.</li>
<li> Hold down option key to select startup disk.</li>
<li> Hold down shift key to boot in Safe Mode.</li>
</ul>

After powering up the computer, 
a folder with a question mark means that a <a href="#MacBoot">boot folder (described below)</a> 
was not found on the hard disk.

If pressing the start button does not work:

<ol type="1">
<li> Unplug the magsafe power cable.</li>
<li> Hold down the power button for about 10 seconds and keeping pressing.</li>
<li> While still holding the power button down, insert the magsafe power cable 
and hold it for another 10 sec.</li>
<li> Release the power button and 
make a "normal" press as if you would normally turn on your computer.</li>
</ol>

If that doesn't work then try to remove one RAM memory and 
switch places before repeating the above.

During login:

<ul>
<li> Hold down shift key to prevent startup items from 
loading.</li>
</ul>


<a name="MacBoot"></a>

### Boot loader on Mac

MacOS does not use the boot loader other Linux machines store in the /boot folder.

MacOS machines boots from the <strong>boot.efi</strong> binary file within 
cd /System/Library/CoreServices.
This is for Intel Macs. Older PowerPC Macs (and an old enough version of OS X) boots from file BootX.

The MacOS kernel, as of Yosemite (version 10.10), is at<br />
`/System/Library/Kernels/kernel`,
   but was just /mach_kernel in older versions.

Apple-supplied loadable kernel modules (known as kernel extensions or kexts) are found in<br />
`/System/Library/Extensions/`

Third-party extensions are in<br />
`/Library/Extensions/`.

See <a target="_blank" href="https://developer.apple.com/library/content/documentation/Darwin/Conceptual/KernelProgramming/booting/booting.html">
this Apple article</a>.

## Bootable Installer

https://support.apple.com/en-us/HT201372
Create a bootable installer for macOS

Boot up with the installer Disc.


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
