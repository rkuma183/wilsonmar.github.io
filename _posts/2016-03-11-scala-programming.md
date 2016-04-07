---
layout: post
title: "Scala programming"
excerpt: "The language, not the opera house in Milan"
tags: [scala, programming, test]
image:
   feature: pic red curtains la scala 1900x500.jpg
   credit: Teatro alla Scala
   creditlink: http://www.connectingmx.net/wp-content/uploads/2015/04/fotina-340.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here are just my notes.

I will be organizing this into a hands-on approach to introduce the Scala programming language in a sequence for quick learning.


### Traits like an abstract class - 
A trait can be added to any Scala class.

Like interfaces with implementations or controlled multiple inheritance.

According to
https://en.wikipedia.org/wiki/Trait_%28computer_programming%29
"traits are a set of methods that can be used to extend the functionality of a class."

https://twitter.github.io/scala_school/basics.html
says "Traits are collections of fields and behaviors that you can extend or mixin to your classes." and offers this code example which extends traits using keywords:

   ```
   class BMW extends Car with Shiny {
   val brand = "BMW"
   val shineRefraction = 12
   }
   ```

The above is dependent upon these definitions:

   ```
   trait Car {
   val brand: String
   }

   trait Shiny {
   val shineRefraction: Int
   }

   class BMW extends Car {
   val brand = "BMW"
   }
   ```

* A class can extend only one class, but
* a class can extend several traits. 


## Case Classes

A case in front of a class definition makes it a factory method
which creates getter classes:

   ```
   case SomeClass(arg1:String)
   ```

   With Scala, a **companion object** is where static objects are defined.

## Pattern Matching



## Resources

* https://learnxinyminutes.com/docs/scala/

* http://bigdatauniversity.com/courses/scala-course/
  6-hour Introduction to Scala by Jamie Allen
  created by Typesafe

* http://bigdatauniversity.com/courses/scala-data-science/
  6 - 8 hours works with Apache Spark
  with built-in modules for streaming, SQL, machine learning and graph processing.

## YouTube videos

Scala Language Basics
by Mark Lewis

   <amp-youtube data-videoid="Ytfw8Bg86p4" layout="responsive" width="480" height="270"></amp-youtube>


https://www.youtube.com/watch?v=DzFt0YkZo8M
Scala Tutorial 
by Derek Banas of http://newthinktank.com
doesn't waste your time, so covers the topic thoroughly in a short time.
http://goo.gl/O1CuGM


Busy Java Developer's Guide to Scala: Thinking
by NewCircle Training

   <amp-youtube data-videoid="_qRYOayG9SM" layout="responsive" width="480" height="270"></amp-youtube>


Scala versus Java
by NewCircle Training

   <amp-youtube data-videoid="PKc5IwHG68k" layout="responsive" width="480" height="270"></amp-youtube>


Intro to Functional Programming in Scala
by Joe Barnes

   <amp-youtube data-videoid="2Ji5i0x2gJI" layout="responsive" width="480" height="270"></amp-youtube>


Videos gradually revealing each box as I talk can be seen in a YouTube playlist:
https://goo.gl/AKEFKj 
for the expanded URL:
https://www.youtube.com/playlist?list=PLsnl23XQgokHh5u2C4dbegMJdqfzY8K9k

The QR code is provided of the link is provided here in case you prefer to watch videos on your smartphone. 
