---
layout: page
title: Search
modified: 2016-05-27
excerpt: "Look, surprise inside!"
image:
# feature: pic blue lake searching 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621985/1cdb6086-0584-11e6-9570-5cedb9f2385f.jpg
  credit: Braintree Books
  creditlink: http://www.braintreebooks.com/search.htm
comments: true
---

{% include _toc.html %}

## Microsoft Bing search:

<div class="searchbox">
  <form method="get" action="http://www.bing.com/search">
    <input id="searchinput" type="text" placeholder="Search..." name="q" value="" /> 
    <input type="hidden" name="q1" value="site:{{site.production_url}}" />
  </form>
</div>
Press enter/return to submit search term. Results will pop up in a new screen.

## Google search:

<form onSubmit="google_search()">
<input type="text" name="q" id="q" value="" />
<input type="submit" value="search" onClick="return google_search()" />
</form>


## Custom search:

<form onSubmit="google_search()">
<input type="text" name="q" id="q" value="" />
<input type="submit" value="search" onClick="return google_search()" />
</form>
Results are returned below.

## Results:



