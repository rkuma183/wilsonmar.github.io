---
layout: post
title: "Mac OSX Hardware"
excerpt: "It's stylish because it's expensive"
shorturl: "https://goo.gl/mMB7vZ"
tags: [apple, mac, setup]
image:
# feature: pic gray apple logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622417/0edc21ac-0587-11e6-9f30-ccf9560ce462.jpg
  credit: Wonderful Engineering
  creditlink: http://cdn.wonderfulengineering.com/wp-content/uploads/2013/11/apple-wallpaper-3.jpg
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

<a id="Register"></a>

## Register it. Now.

<a target="_blank" href="https://support.apple.com/en-us/HT204308">
Find your serial number</a>
and enter it in
<a target="_blank" href="https://selfsolve.apple.com/agreementWarrantyDynamic.do">
Apple Online Service Assistant</a> to confirm your warranty and support status.

<a target="_blank" href="https://www.ifixit.com/info/ID-your-Mac">
Identify your Mac</a> for 
<a target="_blank" href="https://www.ifixit.com/Teardown/Retina+Macbook+2015+Teardown/39841">
tear-down instructions such as for MacBook Pro A1398 (Retina, 15-inch,Early 2015)</a>.


<a id="Hardware"></a>

### Peripherals

The squarish holes are <strong>thunderbolt</strong> ports,
which connect devices such as hard drives, monitors, etc.
Apple sells adapters for connecting to DVI, HDMI, and VGA monitors as well as LN45 Ethernet.
The MiniDisplay Port is compatible only with Display Port compatible devices, 
such as an external monitor. 

There are 2 squarish miniports so they can chain up to 10 thunderbolt devices.

PROTIP: A display that isn't compatible with Thunderbolt must be the last one in the chain.

Thunderbolt can transfer at speeds up to 20Gbps. 
Higher speeds than USB.

#### USB drives

BLAH: Apple's DVD drives don't play Bluray.

To watch Bluray disks, get a Samsung external drive and software.

To list USB ports, use this Linux command:

   <pre><strong>lsusb
   </strong></pre>

   An example response for my machine:

   <pre>
Bus 026 Device 001: ID 8087:0024 Intel Corporation Hub 
Bus 026 Device 003: ID 05ac:8510 Apple Inc. FaceTime HD Camera (Built-in)  Serial: CC2F8K0G1JDN9KE0
Bus 029 Device 001: ID 8087:0024 Intel Corporation Hub 
Bus 029 Device 002: ID 0424:2512 SMSC Hub 
Bus 029 Device 004: ID 05ac:0262 Apple Inc. Apple Internal Keyboard / Trackpad 
Bus 029 Device 003: ID 0a5c:4500 Broadcom Corp. BRCM20702 Hub 
Bus 029 Device 005: ID 05ac:8286 Apple Inc. Bluetooth USB Host Controller 
Bus 020 Device 012: ID 045e:0040 Microsoft Corporation Microsoft 3-Button Mouse with IntelliEye(TM) 
Bus 000 Device 001: ID 1d6b:IPCI Linux Foundation USB 2.0 Bus 
Bus 000 Device 001: ID 1d6b:IPCI Linux Foundation USB 2.0 Bus 
Bus 000 Device 001: ID 1d6b:IPPT Linux Foundation USB 3.0 Bus 
   </pre>

#### USB-C ports

2015 Macbooks 
don't come with regular USB ports so one has to buy 
<a target="_blank" href="http://store.apple.com/us/product/MJ1M2AM/A/usb-c-to-usb-adapter">
$19 Apple proprietary adapter cables</a>.

Another power plug runs 
<a target="_blank" href="http://store.apple.com/us/product/MJ262LL/A/apple-29w-usb-c-power-adapter?fnode=51">
$49</a>

2015 Macbooks combine power and communication (Ethernet) into a single
proprietary oblong rounded USB-C connector.
USB-C connectors can be inserted on either side (unlike earlier USB plugs).
It follows the USB 3.1 standard, which has a theoretical
maximum speed of up to 10Gbps (gigabits per second)
-- two times faster than USB 3.0. But the Macbook is at 5Gbps for now.

3.1 support is used by <a target="_blank" href="http://store.apple.com/us/product/MJ1K2AM/A/usb-c-digital-av-multiport-adapter"> Apple's $79 HDMI/VGA connector</a>
and by upcoming MHL (Mobile High-definition Link) 3 devices to 
stream 4K video from mobile devices to TV sets.

Get a USB-C to USB-B cable.
Plug it into a battery pack and you can charge the laptop.

* https://www.ifixit.com/Device/MacBook_Pro_15%22_Core_2_Duo_Models_A1226_and_A1260


<a id="Coolingz"></a>

### Cooling

The Macbook Pro has always had a history of running hot. 

if you're only using power when plugging into the Mac's USB hub connector,
use an external USB power plug straight into the wall outlet.


<a id="WristRest"></a>

### Wrist Rest Cushion

I like some cushioning for where my palm
touches the cold hard keyboard and 
on sharp edges of the Mac Pro Retina laptop.

In https://support.apple.com/en-us/HT203671
Apple recommends against use of palm pads,
as the pads puts uneven pressure on the display glass.

The pads also cause a line of dust on the screen.

Unlike the much better looking leather
<a target="_blank" href="https://www.twelvesouth.com/product/surfacepad-for-macbook"> $29 TwelveSouth</a>,
the <a target="_blank" href="
http://www.amazon.com/GRIFITI-Notebook-Silicone-Reposition-Travelling/dp/B00897D3OQ/ref=wilsonslifenotes">
$9.99 GRIFITI Palm Pads</a>
is removeable (rests on rather than glued on the keyboard), so
it can be taken off before closing the cover.

## Case

Dropping a Macbook can crack the screen.

But a protective case adds to the weight.



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
