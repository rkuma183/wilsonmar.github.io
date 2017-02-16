---
layout: post
title: "Python Robot"
excerpt: "A robot python mimics what human users do to entertain real developers"
tags: [Clouds, IoT]
shorturl: "https://goo.gl/qOoEVx"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

Developers and testers of UIs can be more efficient if they use a robot script
that flawlessly repeats a sequence of keystrokes and mouse clicks.

There are many products and frameworks which do that.
Selenium works on web browsers.
FitNesse, Cucumber, 
HP QTP ('Unified Functional Testing' or 'UFT').

The Robot Framework (RF)'s 
components are typical of most other test automation frameworks:

<div id="attachment_16929" style="width: 410px" class="wp-caption aligncenter"><a href="http://blog.xebia.com/wp-content/uploads/2015/08/2_medium.jpg"><img class="size-full wp-image-16929" src="http://blog.xebia.com/wp-content/uploads/2015/08/2_medium.jpg" alt="Robot Framework high-level design" width="400" height="492" /></a><p class="wp-caption-text">Robot Framework high-level design</p></div>

Green signifies framework components whereas grey refers to components or artefacts, such as test code and product code, that are to be created by the development organization. The numbers indicate the order in which a typical test execution run would flow. Obviously, this schema is a simplification of a real-life set-up, which would result in a more complex infrastructural model so as to account for topics such as:</p>

The Robot Framework (RF) 
is written in <a target="_blank" href="https://www.python.org/">
Python</a> language.
So it can be used on any OS that runs the Python interpreter: Windows, OS X, Linux.
Through a <em>Remote Library Interface</em>, RF can run (but slower) on 
<a target="_blank" href="http://ironpython.net/">IronPython</a> or
<a target="_blank" href="http://www.jython.org/">Jython</a> 
when automating on a Java application or implementing a custom RF test library in Java. 

Consequently, RF can be used with non-Python libraries such as the Java JDBC Database Library by running RF on Jython. The Jython interpreter not only compiles the RF Python code into Java bytecode for execution within a JVM, but also allows for the importing of Java classes (such as those of the Database Library) as (if they were) Python modules. See http://blog.xebia.com/the-robot-framework-remote-library-interface-using-the-remote-database-library-to-connect-to-ibm-db2/

The Robot Framework (RF) is open sourced at ???


generic, keyword- and data-driven test automation framework for acceptance test driven development (ATDD). 

   * http://blog.xebia.com/robot-framework-the-unsung-hero-of-test-automation/
   * http://blog.xebia.com/robot-framework-and-the-keyword-driven-approach-to-test-automation-part-1-of-3/
   * http://blog.xebia.com/robot-framework-and-the-keyword-driven-approach-to-test-automation-part-2-of-3/
   * http://blog.xebia.com/tag/robot-framework/
   by Michael Hallik

<hr />

## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
