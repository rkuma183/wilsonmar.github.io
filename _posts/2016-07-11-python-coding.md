---
layout: post
title: "Python Coding"
excerpt: "Tricks and tips"
tags: [python, coding]
shorturl: "https://goo.gl/"
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

Here are various coding tips I've seen while going through [Python programming classes](/python-tutorials/) after [installing Python](/python-install/) and [Juypter](/juypter/).

Also see [Python REST API programming](/python-api-flask/).
[Python Robot testing](/python-robot/).
[Running Python on Raspberry Pi IoT devices](/iot-raspberry-install/).


## List comprehension

<pre>
squares = [x * x for x in range(10)]
</pre>


[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

