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

I don't want to repeat what others have already written.

My aim with this effort is a faster, easier way to 
show how to build a full application using Scala, 
not just to impress others about supposedly cool concepts.

So I will be organizing this into a hands-on approach to introduce the Scala programming language in a sequence for quick learning.

Compilation is covered in the Ecosystem page.

0. Functional programming
0. Applications


0. Data Types
0. Variables
0. Internationalization
0. Exceptions + try catch finally
0. Logging

0. Arrays

0. Integration
0. Classes
0. Singleton and Companion Objects

0. Traits

0. if/then/else
0. <a href='#MatchCase">Match (case) Expressions</a>

0. while
0. for


## Scala vs. Java

With Scala:

* Functions as objects.
* All types are objects.
* Immutable objects

* Type inference
* Domain specific language (DSL) support
* <a href="#Traits">Traits</a>
* Closures (vs Java 8)
* Concurrency support (inspired by Erlang


## Exception mechanism similar to Java's.

Scala has an exception mechanism similar to Java's.

Let's look at an I/O call:

{% highlight scala %}
def MeThrowsException() {
    throw new IllegalStateException("Exception thrown");
}

try{
    MeThrowsException();
    // println("this line is never executed");
} catch {
  case e: IllegalArgumentException => println("illegal arg. exception");
  case e: IllegalStateException    => println("illegal state exception");
  case e: IOException              => println("IO exception");
  case e: Exception => println("exception caught: " + e);
} finally {
    println("this code is always executed");
}

{% endhighlight %}


<a name="Traits"></a>

### Traits like an abstract class 

Scala offers traits instead of Java interfaces.

Traits in Scala are best described as “interfaces that can provide concrete members.” 
A class gets its concrete members for free
by mixing in a trait and implementing the abstract members.

https://www.safaribooksonline.com/blog/2013/05/30/traits-how-scala-tames-multiple-inheritance/

In addition to serving as pure interfaces, traits can also provide bundles of functionality like Java’s AbstractFoo (e.g. AbstractList, etc.) classes. A trait can have a few abstract methods and a number of concrete members implemented in terms of those abstract members. 
A trait can be added to any Scala class.

Like interfaces with implementations or controlled multiple inheritance.

According to
<a target="_blank" href="https://en.wikipedia.org/wiki/Trait_%28computer_programming%29">Wikipedia</a>,
"traits are a set of methods that can be used to extend the functionality of a class."

<a target="_blank" href="https://twitter.github.io/scala_school/basics.html">
Twitter</a> defines:
"Traits are collections of fields and behaviors that you can extend or mixin to your classes." and offers this code example which extends traits using keywords:

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


<a name="CaseClasses"></a>

## Methods as operators


   ```
   println(3 max 4) // => 4
   ``` 


<a name="CaseClasses"></a>

## Case Classes

A case in front of a class definition makes it a factory method
which creates getter classes:

   ```
   case SomeClass(arg1:String)
   ```

   With Scala, a **companion object** is where static objects are defined.



## Scala is a New Paradigm from Java

   ```
   m map { t ==> val (s, i) = t; (s, i+1) } 
   ```

with "Sytactic sugar" removed to Java map function:

   ```
   m.map({ t ==> val (s, i) = t; (s, i+1) })
   ```

A Tuple is a fixed list which can be typed differently and
can be a container f
or other data types.
Since Sashmi and Onigiri are instances of the same type Sushi:

   ```
   val bento:(Sushi, Sushi) = (new Sashimi, new Onigiri)
   ```

Arity of 22 

Scala thus is able to identify issues at compile time.

## Tests

```
package X

class X extends FlatSpec{

}
```

import org.salatest.FlatSpec

## Run Tests
The tilde prefix detects if code changed and runs:

   ```
   ~test
   ```


## Pattern Matching

## Read XML

{% highlight scala %}
import scala.xml._
import java.net._
import scala.io.Source
val theUrl = "https://www.google.com/#q=weather+forecast+san+francisco"
val newString = Source.fromURL(new URL(theUrl)).mkString
val xml = XML.loadString(newString)
val newcity1 = xml \\ "location" \\ "@city"
val newstate1 = xml \\ "location" \\ "@region"
val newtemperature1 = xml \\ "condition" \\ "@temp"
println(newcity1 + " " + newstate1 + " " + newtemperature1)
{% endhighlight %}

<a name="Arrays"></a>

## Arrays

Define an array containing 10 items (0-9):

   ```
   var myArray : Array[String] = new Array[String](10);
   ```


<a name="MatchCase"></a>

## Match case

Scala simplifies on Java's switch statement by 
not falling through cases until it hits a break operator.
Thus, Scala doesn't need a break operator.

Also, Scala's match can return a value (myResult):

```
var myVar = "theValue";

var myResult =
   myVar match {
      case "someValue"   => println(myVar + " 1");
      case "thisValue"   => println(myVar + " 2");
      case "theValue"    => println(myVar + " 3");
      case "doubleValue" => println(myVar + " 4");
   }
println(myResult);
   ```

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


Scala Tutorial 
by Derek Banas of http://newthinktank.com
doesn't waste your time, so covers the topic thoroughly in a short time.
http://goo.gl/O1CuGM

  <amp-youtube data-videoid="DzFt0YkZo8M" layout="responsive" width="480" height="270"></amp-youtube>

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
