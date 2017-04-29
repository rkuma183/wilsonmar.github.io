---
layout: post
title: "Git Custom Commands"
excerpt: "Less typing means less mistakes, and more time on social media"
tags: [git, commands, utilities]
shorturl: "https://goo.gl/kJvDoy"
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

Here is how you can define custom commands for Git to use.

I've stored several examples in a <strong>git-custom-commands</strong> folder within my repo.

   <pre>
   <a target="_blank" href="https://github.com/wilsonmar/git-utilities">https://github.com/wilsonmar/git-utilities</a>
   </pre>

0. Fork it so you can make changes and add more files of your own.

0. Get my repo onto your machine using a Git UI or in a Git command line:

   <pre><strong>
   git clone <a target="_blank" href="https://github.com/wilsonmar/git-utilities">https://github.com/wilsonmar/git-utilities</a>
   </strong></pre>

   On a Mac:

0. cd into the repo.

   <pre><strong>
   cd git-custom-commands
   </strong></pre>

   The contents of this folder needs to be within the path where the operating system searches for programs and scripts.

0. Optionally, create a folder on the operating system's path
   by copying the <strong>git-custom-commands</strong> folder from within the Git repository
   into a folder in your home directory.

   Creating your own folder enables you to add more files to that.

   <pre>
   cd $HOME
   mkdir git-custom-commands
   </pre>

   Linux people often use <tt>/opt/bin</tt>, but on a Mac that is a protected area requiring sudo access.

0. Switch to a text editor to edit file <strong>~/.bash_profile</strong>.
   For example, to use Sublime Text:

   <pre>
   subl ~/.bash_profile
   </pre>

0. At the bottom or wherever, ADD the path to your git-custom-command files.

   PROTIP: Git automatically make files available as a subcommand, just like regular executable scripts.

   An example of referencing where I cloned:

   <pre><strong>
export PATH="$HOME/gits/wilsonmar/git-utilities/git-custom-commands:$PATH"
   </strong></pre>

   This adds the folder to the front of the PATH.


0. View the PATH:

   <pre>
   echo $PATH
   </pre>

0. So the changes "take", exit terminal session windows or re-run Terminal initialization:

   <pre>
   source ~/.bash_profile
   </pre>

0. cd into the git-custom-commands folder.

0. Set permissions to execute each file:

   <pre><strong>
   chmod 555 *
   </strong></pre>

0. Try the git-echo command, created just so we can verify whether we have it working:

   <pre><strong>
   git echo "hello"
   </strong></pre>

   You should see response:

   <pre>
   hello
   </pre>

   Instead of "hello", you can type in any phrase.


### Python program

A cross-platform Python can be executed.


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

0. Save the file from a text editor into folder 

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

## Resources

* http://mfranc.com/tools/git-custom-command/

## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
