---
layout: post
title: "Fonts on Mac OSX"
excerpt: "You are what font you use"
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

<a name="Brew"></a>

## Easy install via Homebrew Fonts

The easiest way to install free fonts is to use <a target="_blank" href="https://caskroom.github.io">Homebrew Caskroom</a>.

1. First, do this command one time to configure:

   <tt><strong>
   brew tap caskroom/fonts
   </strong></tt>

   The response at time of writing:

   <pre>
==> Tapping caskroom/fonts
Cloning into '/usr/local/Homebrew/Library/Taps/caskroom/homebrew-fonts'...
remote: Counting objects: 1140, done.
remote: Compressing objects: 100% (677/677), done.
remote: Total 1140 (delta 769), reused 527 (delta 459), pack-reused 0
Receiving objects: 100% (1140/1140), 210.54 KiB | 795.00 KiB/s, done.
Resolving deltas: 100% (769/769), done.
Tapped 0 formulae (1,156 files, 945.1KB)
   </pre>

2. See the list of fonts at:

   <a target="_blank" href="https://github.com/caskroom/homebrew-fonts/tree/master/Casks">
   https://github.com/caskroom/homebrew-fonts/tree/master/Casks</a>

3. For each font you want installed. The most popular are:

   <tt><strong>
   brew cask install font-open-sans
   </strong></tt>

   PROTIP: This draws from font-open-sans.rb at
   https://github.com/caskroom/homebrew-fonts/blob/master/Casks/font-open-sans.rb

   Note in the response that all the variants are installed:

   <pre>
==> Satisfying dependencies
==> Checking out https://github.com/google/fonts/trunk/apache/opensans
==> No checksum defined for Cask font-open-sans, skipping verification
==> Installing Cask font-open-sans
==> Moving Font 'OpenSans-Bold.ttf' to '/Users/wilsonmar/Library/Fonts/OpenSans-
==> Moving Font 'OpenSans-BoldItalic.ttf' to '/Users/wilsonmar/Library/Fonts/Ope
==> Moving Font 'OpenSans-ExtraBold.ttf' to '/Users/wilsonmar/Library/Fonts/Open
==> Moving Font 'OpenSans-ExtraBoldItalic.ttf' to '/Users/wilsonmar/Library/Font
==> Moving Font 'OpenSans-Italic.ttf' to '/Users/wilsonmar/Library/Fonts/OpenSan
==> Moving Font 'OpenSans-Light.ttf' to '/Users/wilsonmar/Library/Fonts/OpenSans
==> Moving Font 'OpenSans-LightItalic.ttf' to '/Users/wilsonmar/Library/Fonts/Op
==> Moving Font 'OpenSans-Regular.ttf' to '/Users/wilsonmar/Library/Fonts/OpenSa
==> Moving Font 'OpenSans-Semibold.ttf' to '/Users/wilsonmar/Library/Fonts/OpenS
==> Moving Font 'OpenSans-SemiboldItalic.ttf' to '/Users/wilsonmar/Library/Fonts
🍺  font-open-sans was successfully installed!
   </pre>


## Popular

According to a research study done by Hongkiat, the top 10 free and paid fonts mentioned by web and graphic designers were:

* Myriad Pro (Free)
* Bebas Neue (Free)
* Ubuntu (Free)
* PT Serif (Free)
* Futura (Paid)
* Helvetica (Paid)
* Fedra Sans (Paid)
<br /><br />

http://www.aumcore.com/


<a id="FontBook"></a>

## Apple Font Book app

0. In Finder, choose Go > Applications. Scroll to Font Book and double-click to open it.

0. Click "User".

0. In Finder, drag the new font folder and drop it under the list of user fonts.

0. Delete the font folder and zip file.

This program is described at https://support.apple.com/en-us/HT201749


## Cross-platform Fonts

Loading Open Sans on both Mac and Windows enable similar display.

0. https://www.fontsquirrel.com/fonts/open-sans


## Bitmap vs vector

There are two ways fonts are drawn - as bitmaps dots or as vectors by a program. 

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

### Operator

For $99 per year for up to 250,000 page views per month,<br />
https://www.typography.com/cloud/welcome/<br />
is delivered via Akamai to provide each browser with exactly the right type of webfonts it needs. 

For $299 just to use it on web pages or<br />
For $599 to use on a single computer,<br />
<a target="_blank" href="https://www.typography.com/fonts/operator/overview/">
H&Co's Operator font</a> is the new status symbol for developers, like having a Tesla.

Mono ScreenSmart render down to 9 pixels.

See the video about fixed width font design at<br />
https://www.typography.com/blog/introducing-operator


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


## Anti-OCR fonts

pdf ocrx extract text from PDF files.

http://videos.komando.com/watch/4124/kims-picks-new-nsa-proof-font

ZXX fonts by Sang Mun, former NSA contractor, has 6 styles
* Sans 
* Bold
* Camo has camoflouge 
* False puts the real letter inside larger false letters
* Noise has dots
* XCD puts a cross over letters. It’s the most successful.


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
