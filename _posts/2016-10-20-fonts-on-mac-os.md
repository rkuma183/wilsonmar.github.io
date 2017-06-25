---
layout: post
title: "Fonts on Mac OSX"
excerpt: "From Mac OSX to mac OS X"
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

I had to install several fonts and throught you'd want to benefit from my experience.


## Cross-platform

Loading Open Sans on both Mac and Windows enable similar display.

0. https://www.fontsquirrel.com/fonts/open-sans


## Bitmap vs vector

There are two ways fonts are drawn - as bitmaps or as vectors. 

Vector fonts are better on my Apple monitors with 1080p HD and above
because they allow more efficient scaling.

When using old monitors with lower resolution below 720p,
bitmap fonts are better because they are generally more legible at smaller sizes on low-resolution screens.


## Mono-spaced Programming Fonts

I am not satisfied with standard fonts to display programming code. 

Characters should be clear, easy to read, in cases of clashing ones such as 1, l, i or O, o, 0 easily distinguishable, differences between different kinds of brackets, quotes and parentheses should be clear, punctuation should be emphasized and they shouldn't break up words or sentences due to uneven character widths.

My main criteria is a <strong>narrow</strong> font so more characters fit on a line.

* https://www.slant.co/topics/67/viewpoints/7/~programming-fonts~ubuntu-mono
   It has a weird "m".

* https://fonts.google.com/specimen/Source+Code+Pro
  described in https://en.wikipedia.org/wiki/Source_Code_Pro 

* Consolas is not proportional, so columns line up.

* https://damieng.com/blog/2008/05/26/envy-code-r-preview-7-coding-font-released
   Envy Code R

<hr />

### Vera Mono

This is the standard monospaced font in Fedora Linux.﻿

<a target="_blank" href="https://www.youtube.com/watch?v=61zHuzTSROQ">
Todd McLeod's Favorite IDE Font</a> video with install on Gogland.

From goo.gl/m51nNx for bitstream_vera_mono.zip

   * VeraMono.ttf 
   * VeraMoBI.ttf - bold italics
   * VeraMoIt.ttf - Italics

### Nunito

https://www.fontsquirrel.com/fonts/nunito

### Fira

https://github.com/tonsky/FiraCode

### Meslo LG Multi-Platform

Now one would think that Apple engineers are rather particular about fonts.

Since Snow Leopard, Menlo-Regular is the default font for Apple’s
developer tools and the Terminal.
(which is a customized Bitstream Vera Sans Mono).

But no.

One guy has nitpicky gripes with it:

   * The default vertical (line) spacing is just way too cramped 

   * The horizontal baseline alignment of the asterisk is off

So he created a customized version of Apple’s font.

   https://github.com/andreberg/Meslo-Font

His website has a "DZ" edition with dots inside zeros so no one can confuse them for upper case letter O.

   https://github.com/andreberg/Meslo-Font/blob/master/dist/v1.2.1/Meslo%20LG%20v1.2.1.zip

Thanks to his work, we now have a good fixed-sized font that works across Mac and Windows.

https://github.com/andreberg/Meslo-Font/wiki/Using-Meslo-LG-with-the-Windows-Console 


### GoLang fonts

The font family, called Go, includes proportional- and fixed-width faces in normal, bold, and italic renderings. 

https://blog.golang.org/go-fonts




### Hack Fonts from GitHub

There are two to try:

   https://github.com/andreberg/Meslo-Font

   https://github.com/chrissimpkins/Hack

0. Scroll down to click "Latest version", which for me was:
   
   https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip

0. Unzip file: Hack-v2_020-ttf.zip to Hack-v2_020-ttf

0. In Finder navigate to your user's Library folder.

0. Drag and drop the unzipped fonts 



## Dyslexie #

This is not only a casual, fun-looking font, but one that makes it easier to read for those with mild Dylexia.

0. https://www.dyslexiefont.com/

0. Click the Home Edition (or Education or Business)

0. The font file available when I did this was:

   Dyslexie Regular LP172832.ttf



<a id="FontBook"></a>

## Apple Font Book app

0. In Finder, choose Go > Applications. Scroll to Font Book and double-click to open it.

0. Click "User".

0. In Finder, drag the new font folder and drop it under the list of user fonts.

0. Delete the font folder and zip file.

This program is described at https://support.apple.com/en-us/HT201749



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
