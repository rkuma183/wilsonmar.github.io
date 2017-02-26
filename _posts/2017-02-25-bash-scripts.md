---
layout: post
title: "Bash Scripts"
excerpt: "Born Again to rule the world"
tags: [Mac, OS]
image:
# feature: pic green matrix hallway 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14623876/07afd066-0593-11e6-933a-2e596511ac67.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Bash scripts run to apply a small amount logic to invoke executables within Linux operating systems.

As with other programming source code,
bash script files can be scanned by <strong>SonarQube</strong> 
to identify whether each file violates rules defined.

Here are some rules:

0. Start each file with a description of its contents -
   a top-level comment including a brief overview of its contents. 
   
   A copyright notice and author information are optional.

0. Executables invoked should have no extension (instead of specifying a .sh file extension).

   If performance matters, use something other than shell.

0. Bash scripts that are more than 100 lines long
   or if arrays are needed, Python should be used instead. 

   Write scripts to avoid a time-consuming rewrite at a later date.

0. Use sudo to provide elevated access if you need it rather than using GUID.



There are variations between different flavors of Linux.

## Guides

https://google.github.io/styleguide/shell.xml
Shell Style Guide

https://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf
