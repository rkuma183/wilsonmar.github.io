---
layout: post
title: "Git Rebase"
excerpt: "Make it appear that you only made one edit before pushing to the team repo"
shorturl: "https://goo.gl/CmSBbA"
modified:
tags: []
image:
# feature: pic blue black stars spin 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621973/fe6e21a6-0583-11e6-9a94-a969a51759b6.jpg
  credit: Jeremy Thomas
  creditlink: https://www.flickr.com/photos/132218932@N03/page2
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This is a hands-on tutorial on how to use Git rebase from the command line.

There are two major ways to rebase:

   1. Interactive
   2. Not interactive


## Interactive Rebase 

First, click on the video for a 2:29 minute prevew.
Then follow the step-by-step instructions to become a pro at making
comments a "first-class" citizen of what you put in GitHub.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PZdVLaiAAmY" frameborder="0" allowfullscreen> </iframe>

(Thanks to contato at RodolfoBandeira.com for the video. It would be a waste of time for me to duplicate the video he created Dec 2016. Thanks, Rodolfo!)

We start by doing a few prepatory steps not shown in the video:

0. Create an empty folder (whatever name you choose) and cd into it.

   <pre><strong>
   mkdir temp3
   cd temp3
   </strong></pre>

0. Initialize an empty Git repository for this exercise:

   <pre><strong>
   git init
   </strong></pre>

0. Create an empty file using the touch command:

   <pre><strong>
   touch 1.txt
   </strong></pre>

0. Add the file to Git Staging:

   <pre><strong>
   git add .
   </strong></pre>

0. Commit:

   <pre><strong>
   git commit -m 'add 1.txt'
   </strong></pre>

   Your response would have a different commit id than 785d03b:

   <pre>
[master (root-commit) 785d03b] add 1.txt
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 1.txt
   </pre>

   ### here's what the video shows:

0. List files:

   <pre><strong>
   ls
   </strong></pre>

0. Create and switch to a new branch:

   <pre><strong>
   git checkout -b feature/feature-1
   </strong></pre>

   <a name="Repeat"></a>

   Begin steps to create a file in Git repo:

0. Create an empty file using the touch command:

   <pre><strong>
   touch 2.txt
   </strong></pre>

   PROTIP: On a command-line terminal, press the cursor up key to retrive a prior command, then cursor left to edit it.

0. Add the file to Git Staging:

   <pre><strong>
   git add .
   </strong></pre>

0. Commit:

   <pre><strong>
   git commit -m 'add 2.txt'
   </strong></pre>

0. <a href="#Repeat">Repeat the above 3 steps</a> for 3.txt and 4.txt.

0. See a list of commits made:

   <pre><strong>
   git log
   </strong></pre>

   If a colon appears at the bottom of the screen, press q to quit.

0. Initiate Rebasing:

   <pre><strong>
   git rebase -i master
   </strong></pre>
   
   You should see a file displayed by your default editor. It should contain a list of commits made:

   <pre>
pick 07e03c2 add 2.txt
pick 5a71aa8 add 3.txt
pick d693749 add 4.txt
&nbsp;
# Rebase 785d03b..d693749 onto 785d03b (3 commands)
#
# Commands:
# p, pick = use commit
# r, reword = use commit, but edit the commit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like "squash", but discard this commit's log message
# x, exec = run command (the rest of the line) using shell
# d, drop = remove commit
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
   </pre>

   NOTE: Commit ids such as "07e03c2" are a stand-in for whatever commit id Git creates for each specific commit.

0. In all lines under the first line, double-click the "pick" to select it, then type "s".

   The comment in the file says such action specifies a <strong>squash</strong> that melds (combine)
   content into the commit above it.

   CAUTION: Do not change the commit message text. You can do that in the next screen.

0. Save the file using the keyboard action for the editor program you're using.

   Git comes up with another file:

   <pre>
# This is a combination of 3 commits.
# This is the 1st commit message:
add 2.txt
&nbsp;
# This is the commit message #2:
&nbsp;
add 3.txt
&nbsp;
# This is the commit message #3:
&nbsp;
add 4.txt
&nbsp;
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Tue Apr 25 06:50:34 2017 -0400
#
# interactive rebase in progress; onto 785d03b
# Last commands done (3 commands done):
#    s 5a71aa8 add 3.txt
#    s d693749 add 4.txt
# No commands remaining.
# You are currently editing a commit while rebasing branch 'feature/feature-1' on '785d03b'.
#
# Changes to be committed:
#	new file:   2.txt
#	new file:   3.txt
#	new file:   4.txt
#
   </pre>

0. Type a comment character <strong>#</strong> in front of commit comments we don't want to show to everyone:
   the "add 3.txt" and "add 4.txt".

0. Change the first commit's message to reflect the combination of commits:

   <pre><strong>
   add 2, 3, and 4.txt
   </strong></pre>

   (Sorry, I can't stand omission of the <a target="_blank" href="https://www.grammarly.com/blog/what-is-the-oxford-comma-and-why-do-people-care-so-much-about-it/">Oxford comma</a>)

0. Save and exit the file.

0. See a list of commits to confirm:

   <pre><strong>
   git log
   </strong></pre>

0. Retrieve files from master branch:

   <pre><strong>
   git checkout master
   </strong></pre>

0. Initiate Rebasing:

   <pre><strong>
   git rebase feature/feature-1
   </strong></pre>

   The response should be:

   <pre>
First, rewinding head to replay your work on top of it...
Fast-forwarded master to feature/feature-1.   
   </pre>

0. Delete the feature branch marker that has been used up. This is not in the video, but a good habit.

   <pre><strong>
   git branch -d feature/feature-1
   </strong></pre>


0. See the reference log:

   <pre><strong>
   git reflog
   </strong></pre>

   <pre>
daa8535 HEAD@{0}: rebase finished: returning to refs/heads/master
daa8535 HEAD@{1}: rebase: checkout feature/feature-1
785d03b HEAD@{2}: checkout: moving from feature/feature-1 to master
daa8535 HEAD@{3}: rebase -i (finish): returning to refs/heads/feature/feature-1
daa8535 HEAD@{4}: rebase -i (squash): add 2, 3, and 4.txt
d3b8645 HEAD@{5}: rebase -i (squash): # This is a combination of 2 commits.
07e03c2 HEAD@{6}: rebase -i (start): checkout master
d693749 HEAD@{7}: commit: add 4.txt
5a71aa8 HEAD@{8}: commit: add 3.txt
07e03c2 HEAD@{9}: commit: add 2.txt
785d03b HEAD@{10}: checkout: moving from master to feature/feature-1
785d03b HEAD@{11}: commit (initial): add 1.txt
   </pre>

## More on Git Rebase

https://www.youtube.com/watch?v=7IfkL8swmFw


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
