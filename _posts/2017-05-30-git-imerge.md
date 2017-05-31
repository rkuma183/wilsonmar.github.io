---
layout: post
title: "Git merge"
excerpt: "This is how the cool kids are merging. It needs to be setup, but you'll love it."
shorturl: "https://goo.gl/"
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

The standard `git merge` and `git rebase` that comes with Git, 
although superior to others, is rather cumbersome.

Resolving big conflicts is unnecessarily hard.
   Merging is **all-or-nothing**.  
   There is **no way to save** a partly-done merge, so

   * You can't record your progress.

   * You can't switch to another branch temporarily.

   * There is **no way to test** a partly-done merge.

   * If you make a mistake, you can't go back.

   * If you cannot resolve the **whole** conflict, there is nothing to
   do but start over.

## A Better Way

   The favored approach to merging two branches together (safely) is 
   <strong>incrementally</strong> in steps that allows for manual fixing.
   Some call this "rebase with history" because the technique creates new commits
   based on previous commits like rebase, but retains the previous commit history
   (which rebase currently does not do).

   The helper module that does this   
   runs using Python (either version 2 or 3).

   It was mentioned by GitHub Data Scientist Patrick McKenna in 
   <a target="_blank" href="https://www.youtube.com/watch?v=2UKd0YMuc-M&t=32m3s">
   a YouTube video</a> "Greatest Hits of the Git Maintainers Room - Git Merge 2017" at his talk 
   during the GitMerge May 2017 conference.

> This really removes the pain of merge.
It figures out where conflicts occurred.

   The helper was actually created in May 2013.
   It was described 
   <a target="_blank" href="https://www.youtube.com/watch?v=FMZ2_-Ny_zc">
   in this video from the GitMerge 2013 conference</a>
   by it's author, Michael Haggerty (mhagger@alum.mit.edu), a GitHub Core committer
   and "theoretical physicist turned software developer".
   He discussed the approach in
   <a target="_blank" href="https://softwareswirl.blogspot.com/2013/05/git-imerge-practical-introduction.html">
   his May 2013 blog post</a>.

   This article combines all the above into a step-by-step tutorial so "newbies"
   can easily benefit from this "game changing" technology.


## Installation

1. Install Python.

0. Install Git.

   On a Mac:

   <pre><strong>brew install git
   </strong></pre>

   (Instructions for Mac and Linux will be coming).

0. Re-start the Terminal to take the changes:

   <pre><strong>source ~/.bash_profile
   </strong></pre>

0. Create a folder where you will add two repositories: 
   the git-imerge repo and 
   the git-imerge-test repo.

0. Clone the helper module onto your computer:

   <pre><strong>git clone <a target="_blank" href="https://github.com/mhagger/git-imerge">https://github.com/mhagger/git-imerge</a> --depth=1
   cd git-imerge
   </strong></pre>

0. Put the 

   <pre><strong>git clone <a target="_blank" href="https://github.com/mhagger/git-imerge">https://github.com/mhagger/git-imerge</a> --depth=1
   cd git-imerge
   </strong></pre>

0. Clone a repo containing scripts that creates test repos containing sample conflicts:

   <pre><strong>git clone <a target="_blank" href="https://github.com/wilsonmar/git-imerge-test">
   https://github.com/wilsonmar/git-imerge-test</a> --depth=1
   cd git-imerge-test
   </strong></pre>

0. Use Make to run Makefile to install Bash completions:

   On a Mac:

   <pre><strong>make
   </strong></pre>

   This copies file `<strong>git-imerge.bashcomplete</strong>` to 
   $(DESTDIR)/etc/bash_completion.d/git-imerge

   PRPTIP: In Make files, tabs should be used instead of spaces to indent items.

   See: 
   https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

0. Make Bash completion occur at Terminal start-up:

   On a Mac:

   <pre><strong>vim ~/.bash_profile
   </strong></pre>

   <pre>if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
   </pre>

   PROTIP: Put this near other Python settings.


   ### Create Test Repos

0. On a Mac, give run permissions to the scripts:

   <pre><strong>chmod 555 git-imerge-test-create.sh
   chmod 555 git-imerge-test-run.sh
   </strong></pre>

   This only needs to be done once.


   ### Run Merge on Test repos

0. Run the script to perform a merge using git-imerge-test repos:

   <pre><strong>./git-imerge-test-run.sh
   </strong></pre>

   This was created for testing the test.

   You may want to later adapt this to run on your own repos.

   Essentially, we want to end up with this in GitHub's Network Diagram:
   <a target="_blank" href="http://softwareswirl.blogspot.com/2012/12/mapping-merge-conflict-frontier.html">*</a>

   <pre>
o - 0 - 1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11 - I11'  ← master
     \                                               /
      A -- B -- C --- D --- E --- F --- G --- H --- I       ← branch
   </pre>

0. The script first invokes the script to create a new repo with two branches containing conflicts:

   <pre><strong>./git-imerge-test-create.sh
   </strong></pre>

   The repo created contains two branches. Just for fun, we've named them
   frobnicator and floobifier.
   Branch frobnicator is merged into floobifier.

0. Begin much like with git merge: check out the <strong>destination</strong> branch 

   <pre><strong>git checkout floobifier
   </strong></pre>

   This is referenced as "ORIGINAL_BRANCH" in steps to follow.

0. Then tell git imerge what branch you want to merge into it:

   <pre><strong>git imerge start --name=frobnicator --first-parent branch
   </strong></pre>


   ### Intermediate state handling

   The tool uses git bisect to find pairwise merges that conflict.
   When it hits a conflict, it asks for help.

   When ``git-imerge`` needs to ask the user to do a merge manually, it
   creates a temporary branch ``refs/heads/imerge/NAME`` to hold the result. 

   During an incremental merge, intermediate results are stored directly in your repository as special references:

   ``refs/imerge/NAME/state`` -
   A blob containing a little bit of metadata.

   ``refs/imerge/NAME/manual/M-N`` - 
   Manual merge including all of the changes through commits M on master and N on branch.

   ``refs/imerge/NAME/auto/M-N`` -
   Automatic merge including all of the changes through commits M on master and N on branch.

   ``refs/heads/imerge/NAME`` -
   Temporary branch used when resolving merge conflicts.

   ``refs/heads/NAME`` -
   Default reference name for storing final results.


   The script creates in both branches
   a single file named <strong>subject.md</strong>
   containing a row for each combination that will be merged:

   <pre>
A1
B2 floobifier
C3
D4
E5
F6 
G7 floobifier
I8
J9 floobifier
10
11
   </pre>

   Each commit adds another line.

   Conflict in the file are commits named F2, C7, and B9.
   To make conflicting lines, each conflict lines contain its own branch name
   (floobifier or frobnicator).

   This is illustrated by an "X" in the diagram below. 

   <pre>
o - 0 - 1  - 2  - 3  - 4  - 5  - 6  - 7  - 8  - 9  - 10  - 11    ← master
    |   |    |    |    |    |    |    |    |    |     |     |
    A -   --   --   --   --   -- A6 -   -- A8 - A9 - A10 - A11
    |   |    |    |    |    |    |    |    |
    B -   --   --   --   --   -- B6 - B7 - B8   X
    |   |    |    |    |    |    |
    C -   --   --   --   --   -- C6   X
    |   |    |    |    |    |    |
    D -   --   --   --   --   -- D6
    |   |    |    |    |    |    |
    E - E1 - E2 - E3 - E4 - E5 - E6
    |   |
    F - F1   X
    |   |
    G - G1
    |   |
    H - H1
    |   |
    I - I1
&nbsp;
    ↑
  branch
   </pre>


   ### Diagram

0. Obtain a diagram to visualize:

   <pre><strong>git imerge diagram
   </strong></pre>

   An example of the output:

   <pre>
**********
*??|?????|
*--+-----+
*??|#?????
*??|??????
*??|??????
*--+??????
&nbsp;
Key:
  |,-,+ = rectangles forming current merge frontier
  * = merge done manually
  . = merge done automatically
  # = conflict that is currently blocking progress
  @ = merge was blocked but has been resolved
  ? = no merge recorded
   </pre>


   ### Suspend abort

0. To suspend an incremental merge to do something else before continuing, 
   abort any pending merge and switch to your other branch.

   <pre><strong>git merge --abort
   git checkout floobifier
   </strong></pre>

   floobifier is the ORIGINAL_BRANCH.

   Unlike regular git merge, abort with git merge does not abandon all previous changes.

   Git-merge records each of the intermediate merges
   so they can be tested by the test suite.


   ### Manual resolution

   Resolve each conflict the same as before:

0. Perform a diff

   ???

0. Edit the file.

   ???

   ### Continue

0. When you are ready to resume the incremental merge:

   <pre><strong>git imerge continue
   </strong></pre>


   ### Abort

0. If you need to completely abort an in-progress incremental merge,
   first remove the temporary branches ``git-imerge`` created,
   then checkout the branch you were in before you started the incremental merge:

   <pre><strong>git imerge remove
   git checkout 
   </strong></pre>

   ORIGINAL_BRANCH

   <a name="FinalMerge"></a>

   ### Final Merge

0. In the final merge to be simplified for the permanent record, 
   omit the intermediate results.

   <pre><strong>git imerge finish --goal=merge
   </strong></pre>

   ### Verify

   By default, the process above creates a new branch NAME that points at the result, 
   and checks out that branch.

0. See the final commit created by git-imerge:

   <pre><strong>git log -1 --decorate
   </strong></pre>
   
   A sample:

   <pre>
commit 79afd870a52e216114596b52c800e45139badf74 (HEAD, merge-branch)
Merge: 8453321 993a8a9
Author: Lou User &LT;luser@example.com>
Date:   Wed May 8 10:08:07 2013 +0200
&nbsp;   
    Merge frobnicator into floobifier.
   </pre>



## More #

This is one of a series on Git, GitHub, and GitLab:

{% include git_links.html %}
