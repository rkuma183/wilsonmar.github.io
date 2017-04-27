---
layout: post
title: "Git Utilities"
excerpt: "Helps you do your job"
tags: [git, commands, utilities]
shorturl: "https://git.io/v1Cyv"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<a id="Grepz"></a>

## Visualization of branches

git log does a good job of illustrating branches,
and GitKraken provides a beautiful branch graphics:

![git-utilities gitkraken dag 579x279](https://cloud.githubusercontent.com/assets/300046/25506378/46065ecc-2b74-11e7-9a89-dd68be4832a3.png)

### ASCII Art

Make some ASCII art from (part of your) history

   <pre>
A - B - C
  \       \
    D - E - F
   </pre>


### Seth House

Seth House did several videos on Git and GitHub, in which he showed use of a utility to create a visualization
from the command line. He was nice enough to share it with me.

0. Install GraphViz using a package manager, on a Mac:

   <pre><strong>
   brew install graphviz
   </strong></pre>

   This installs dependencies libtiff, webp, gd

   * http://www.graphviz.org/Download_macos.php - graphviz-2.40.1.pkg
   * http://www.graphviz.org/Download_windows.php

0. Go to this URL:

   <pre><strong>
   https://github.com/whiteinge/presentations/blob/master/cars_2012-04-27_git/git-graph-dag
   </strong></pre>

0. Get the raw text and paste in your

0. Run the command:

   <pre><strong>
   git graph-dag HEAD~10.. | dot -Tpng > mygraph.png
   </strong></pre>

0. Look at the other utilities at:

   https://git.wiki.kernel.org/index.php/ExampleScripts

   * Sorting commits by commit message line count / changed lines ratio
   * Copying all changed files from the last N commits
   * Setting the timestamps of the files to the commit timestamp of the commit which last touched them
   * Output a commit graph with GraphViz' "dot" tool



## Grep Utilities

My version of the Grep utility that filters what is piped into it:

   <tt><strong>grep --version</strong></tt>

   Response:

   <tt>grep (BSD grep) 2.5.1-FreeBSD</tt>

Grep filters what is piped into it.



## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
