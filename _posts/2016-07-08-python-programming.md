---
layout: post
title: "Python Programming Notes"
excerpt: "Confusion and errors from many alternatives and options"
tags: [python, apple, mac, setup]
image:
# pic white python logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622164/4230c848-0585-11e6-957b-be11147346e6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}


## Print time #

Print out the current time:

   <pre>
   import time
   time.ctime()
   </pre>

   The response:

   <tt>
   'Sat Jan 28 00:35:27 2017'
   </tt>


### Break time program

Pengal 
<a target="_blank" href="https://classroom.udacity.com/courses/ud036/">
Programming Foundations with Python course at Udacity</a>
consists of <a target="_blank" href="https://www.youtube.com/watch?v=U4MUG4dOepc&list=PLAwxTw4SYaPnYajEbZvqtcVWQ6XGhvtOW">
videos on YouTube</a> and forums.

<pre>
import time
import webbrowser

total_breaks = 3
break_count  = 0  

while( break_count < total_breaks ):
   time.sleep(10) # seconds
   webbrowser.open("https://www.youtube.com/playlist?list=PLAwxTw4SYaPnYajEbZvqtcVWQ6XGhvtOW")
</pre>


## Strings

The Unicode standard represents a large variety of characters beyond the roman alphabet 
(emojis, greek, russian, mathematical symbols, logograms from non-phonetic writing systems such as kanji, etc.)

Define a Unicode string with a prefix, then print a unicode string:

   <pre>
unicode_string = u"aaaàçççñññ"
encoded_string = unicode_string.encode('utf-8')
print encoded_string
   </pre>


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}

