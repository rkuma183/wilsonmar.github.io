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

This page explains files in my <strong>git-utilities</strong> repo.

0. Get the repo onto your machine using a Git UI or in a Git command line:

   <pre>
   git clone https://github.com/wilsonmar/git-utilities
   </pre>

0. cd into the repo.

   The <strong>custom-commands</strong> folder contains several custom commands.

0. (If you don't have it already) create a folder on the operating system's path.

   Linux people often use <tt>/opt/bin</tt>, but on a Mac that is a protected area requiring sudo access.

   So on a Mac, create a folder under your $HOME folder and put that folder within the system path.

   $HOME/custom-commands

0. On a Mac, edit file <strong>~/.bash_profile</strong> so 
   the custom command files will be found when they are run on any folder.

   PROTIP: git automatically make files available as a subcommand, just like regular executable scripts.

0. cd into the folder

0. Set permissions to execute each file:

   <pre><strong>
   chmod 555 git-echo
   chmod 555 git-evaluate
   chmod a+x graph-dag
   </strong></pre>

0. Try the git-echo command 

   <pre><strong>
   git echo hello
   </strong></pre>

   You should see response 

   <pre>
   hello
   </pre>


### Graphviz


Seth House did several videos on Git and GitHub, in which he showed use of a utility to create a visualization
from the command line. He was nice enough to share it with me.

0. Install GraphViz using a package manager. On a Mac:

   <pre><strong>
   brew install graphviz
   </strong></pre>

   This installs dependencies libtiff, webp, gd

   * http://www.graphviz.org/Download_macos.php - graphviz-2.40.1.pkg
   * http://www.graphviz.org/Download_windows.php
   <br /><br />

0. Go to this URL:

   <pre><strong>
   https://github.com/whiteinge/presentations/blob/master/cars_2012-04-27_git/git-graph-dag
   </strong></pre>

   It's from:

   <pre><strong>
   https://git.wiki.kernel.org/index.php/ExampleScripts
   </strong></pre>

0. Copy the raw text and paste it in a text editor.

   Alternately, use a git client to clone the 

   <pre>
   git clone https://github.com/wilsonmar/git-utilities
   </pre>

0. Create a folder <tt>/opt/bin</tt> (if you don't have it already) 
   to hold git custom commands.

0. Edit your file <strong>~/.bash_profile</strong> so 
   the custom command files will be found when they are run on any folder.

   PROTIP: git automatically make files available as a subcommand.

0. cd to folder /opt/bin

0. Save the file from a text editor into folder /opt/bin

   Alternately, copy the file graph-dag into that folder from the cloned folder.

0. Set permissions to execute the file:

   <pre><strong>
   chmod a+x graph-dag
   </strong></pre>

0. Run the graph-dag that outputs a commit graph using the GraphViz "dot" tool:

   <pre><strong>
   git graph-dag HEAD~10.. | dot -Tpng > mygraph.png
   </strong></pre>

0. Additionally, look at the other utilities at:

   https://git.wiki.kernel.org/index.php/ExampleScripts

   * Sorting commits by commit message line count / changed lines ratio
   * Copying all changed files from the last N commits
   * Setting the timestamps of the files to the commit timestamp of the commit which last touched them


## Grep Utilities

My version of the Grep utility that filters what is piped into it:

   <tt><strong>grep --version</strong></tt>

   Response:

   <tt>grep (BSD grep) 2.5.1-FreeBSD</tt>

Grep filters what is piped into it.


<a id="Viz"></a>

## Visualization of branches

git log does a good job of illustrating branches,
but GitKraken provides this colorful branch graphics:

![git-utilities gitkraken dag 579x279](https://cloud.githubusercontent.com/assets/300046/25506378/46065ecc-2b74-11e7-9a89-dd68be4832a3.png)

   * The master branch is the light-blue line on the left.

   * The Bug fix branch is the darker-blue line to the right of that.

   * The develop branch is the purple line to the right of that.


### ASCII Art

Make some ASCII art from (part of your) history

   <pre>
A - B - C
  \       \
    D - E - F
   </pre>


## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
