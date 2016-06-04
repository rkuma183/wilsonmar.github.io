---
layout: post
title: "Jekyll templates"
excerpt: "The most popular"
tags: [website, builder, templates, jekyll]
image:
# feature: scr white jekyll static tools 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622170/48b1ceb0-0585-11e6-8b19-b9d09feebd6f.jpg
  credit:
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

One of the nice things about WordPress and other CMS is one doesn't need to start from scratch.

Same with Jekyll.

The structure of files in jekyll makes it easy (with only a few edits) 
to switch the site to use any number of 
other Jekyll themes.


### Jekyll Theme shops
To see responsive websites, get to it quicker on your mobile smartphone QR code is provided for you.

* <a target="_blank" href="http://jekyll.tips/templates/">jekyll.tips/templates</a>

Within the Jekyll repository on GitHub:

   * <a target="_blank" href="https://github.com/jekyll/jekyll/wiki/Themes">
    github.com/jekyll/jekyll/wiki/Themes</a>

   Premium (paid) themes so you get updates and support, for less than $30.

   * <a target="_blank" href="http://jekyllthemes.io">jekyllthemes.io</a>

     This is an affiliate for other sites offering the same themes for less.

   * <a target="_blank" href="http://jekyllthemes.org">jekyllthemes.org</a>

### Themes from Michael Rose

Content on this website was created by editing markdown text (index.md files)
stored on GitHub.com.
The HTML sent to your browser for display is generated from markdown using
Ruby running [Jekyll](http://jekyllrb.com/) 3.0 rendering modifications of the
<a target="_blank" href="https://github.com/mmistakes/minimal-mistakes/">
minimal-mistakes theme from GitHub</a> by Michael Rose.

Michael also created the
<a target="_blank" href="https://github.com/mmistakes/skinny-bones-jekyll">
skinny-bones-jekyll theme demo</a> forkable
<a target="_blank" href="https://mmistakes.github.io/skinny-bones-jekyll/">
from GitHub</a>.
It features more use of graphics, and allows for localization.

Micheal blogs about his themes at
https://mademistakes.com/articles/using-jekyll-2016/


## Features comparison #

| Feature          | HPSTR   | Minimal | Skinny | Simple |
|:-----------------|:-------:|--------:|-------:|-------:|
| External links   | YES     | -       | -      | -      |
| Floating menu    | YES     | -       | -      | -      |
| Gallery layout   | -       | -       | YES    | -      |
| Localization     | -       | -       | YES    | -      |
| Multiple authors | -       | YES     | -      | -      |
| Page TOC         | -       | YES     | -      | -      |
| Pages/Articles   | -       | *       | YES    | YES    |
| Posts            | YES     | YES     | YES    | YES    |
| Pagination       | YES     | -       | -      | -      |
| Rakefile.rb      | YES     | -       | -      | -      |
| Reading time     | YES     | -       | -      | -      |
| Tags list        | YES     | -       | -      | -      |
| Site search      | -       | -       | -      | YES    |
| Social icons only| -       | -       | -      | YES    |
| Social names     | YES     | -       | -      | -      |
| Timezones        | YES     | -       | -      | -      |

All the themes feature:

   * YAML front matter in index.md files processed by Jekyll
   * 404.md
   * feed.xml generation
   * Disqus support
   * Use of SASS
   * Theme setup page from the main menu / tab
   * Links to major social sites


## Installation and Generation #

Michael Rose presents a concise description of
<a target="_blank" href="https://mmistakes.github.io/minimal-mistakes/theme-setup/">
how to install the minimal-mistakes theme</a>.
This post augments and clarifies it.

Begin by making a folder and populating it on my local machine.

There is both a Master branch and a Develop branch.

I don't care about all the change history, so I click "Download ZIP"
and unzip it into that folder rather than:

    git clone https://github.com/mmistakes/minimal-mistakes.git

### Grunt tasks
After downloading, have Maven pull in dependencies based on the Gemfile:

   bundle install

This causes the list of dependencies in the Gemfile to be downloaded.

Behind the scenes is a running of the **Gruntfie.js** that comes with the theme.
It defines the parameters of various tasks that are downloaded:

* <a target="_blank" href="https://github.com/gruntjs/grunt-contrib-clean">clean</a>
clears files and folders.
* <a target="_blank" href="https://github.com/gruntjs/grunt-contrib-jshint">jshint</a>
validates files with JSHint, based on the **.jshintrc** configuration file at the root folder.
* <a target="_blank" href="https://github.com/gruntjs/grunt-contrib-uglify">uglify</a>
minfies files with UglifyJS.
* <a target="_blank" href="https://github.com/gruntjs/grunt-contrib-watch">watch</a>
runs tasks whenever watched files change.
* <a target="_blank" href="https://github.com/gruntjs/grunt-contrib-imagemin">imagemin</a>
minifies PNG graphics files.
* <a target="_blank" href="https://github.com/sindresorhus/grunt-svgmin">grunt-svgmin</a>
minifies SVG graphics files.

NOTE: File names beginning with a dot are hidden.


## Others #

* https://github.com/kriasoft/static-site-starter