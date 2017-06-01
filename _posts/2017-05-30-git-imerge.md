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
although superior to others, is rather cumbersome and scary.
   Merging is **all-or-nothing**.  
   There is **no way to save** a partly-done merge, so

   * You can't record your progress.

   * You can't switch to another branch temporarily.

   * There is **no way to test** a partly-done merge.

   * If you make a mistake, you can't go back.

   * If you cannot resolve the **whole** conflict, there is nothing to
   do but to abort and start over.

## A Better Way: interactive merge

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

> "This really removes the pain of merge.
It figures out where conflicts occurred."

   The helper was actually created in May 2013.
   It was described 
   <a target="_blank" href="https://www.youtube.com/watch?v=FMZ2_-Ny_zc">
   in this video from the GitMerge 2013 conference</a>
   by its author, Michael Haggerty (mhagger@alum.mit.edu), a GitHub Core committer
   and "theoretical physicist turned software developer".
   He discussed the approach in
   <a target="_blank" href="https://softwareswirl.blogspot.com/2013/05/git-imerge-practical-introduction.html">
   his May 2013 blog post</a>.

   This article combines all the above into a step-by-step tutorial so "newbies"
   can easily benefit from this "game changing" technology.


## Installation

1. Install Python.
0. Install Ruby (make).
0. Install Git.

   On Windows, install Chocolatey.org and in a Run command window, 
   `choco install msysgit`.

0. If you are running Windows, be in <strong>Git Bash</strong> to run.


   ### Install test modules

0. Create and cd to a folder where you will clone a repository containing scripts:

   <pre><strong>cd ~
   mkdir git-imerge-test
   cd git-imerge-test
   </strong></pre>

0. Clone a repo containing scripts that creates test repos containing sample conflicts:

   <pre><strong>git clone <a target="_blank" href="https://github.com/wilsonmar/git-utilities">
   https://github.com/wilsonmar/git-utilities</a>
   cd git-utilities
   </strong></pre>

0. Create a folder where you want the test repo created.
0. Copy the two scripts to that new folder.

   * git-imerge-test-create.sh
   * git-imerge-test-run.sh
   <br /><br />

0. Give run permissions to the scripts:

   On Mac and Linux:

   <pre><strong>chmod 555 git-imerge-test-create.sh
   chmod 555 git-imerge-test-run.sh
   </strong></pre>

   The above only needs to be done once.




   ### View git-imerge

0. Clone the git-imerge module onto your computer:

   <pre><strong>git clone <a target="_blank" href="https://github.com/mhagger/git-imerge">https://github.com/mhagger/git-imerge</a>
   cd git-imerge
   </strong></pre>

   The "active ingredient" is the `git-imerge` file.
   The file has no file extension because it's a [Git custom command](/git-custom-command/).

0. View the git-imerge file

   <pre><strong>cat git-imerge | more
   </strong></pre>

   Notice from the top line that it's run by a Python interpreter.

   The part that starts with `r"""` is what is displayed by the 
   <a href="#ManPage">`git imerge -h` command</a>.

0. Press q to escape the display or press Spacebar key for next page.


   ### Option A: Homebrew install

0. If you have a Mac, view git-imerge specifications for Homebrew:

   <a target="_blank" href="https://github.com/Homebrew/homebrew-core/blob/master/Formula/git-imerge.rb">
   https://github.com/Homebrew/homebrew-core/blob/master/Formula/git-imerge.rb</a>

   PROTIP: The advantage of using Homebrew instead of manually installing is that
   it handles upgrades automatically.
   So before you upgrade MacOS again, check to see if there is an entry for that new version,
   then do a `brew upgrade`. The other advantage is that executing ``brew uninstall git-imerge``
   is easier than hunting down files to delete.

   The Ruby-language code has a work-around for the make installation path.

   It installs to the ``/bin`` folder.

   If you are OK with the above, install git-imerge:

   <pre><strong>brew install git-imerge
   </strong></pre>

   The response I got:

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/git-imerge-1.0.0.sierra.bot
######################################################################## 100.0%
==> Pouring git-imerge-1.0.0.sierra.bottle.tar.gz
==> Using the sandbox
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/git-imerge/1.0.0: 6 files, 168.1KB
   </pre>

   Notice the brew formula takes care of installing the bash_completion 
   where other daemons are also installed (`/usr/local/etc/`) and
   automatically invoked without you needing to manually add it in your bash_profile.

0. Skip to <a href="#Verify">verify</a>.


   ### Option B: Windows and Linux install

   Sorry, instructions for Mac and Linux will be coming.


   ### Option C: Manual install on Mac

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

   Add near other Python settings:

   <pre>if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
   </pre>

   CAUTION: The above needs to be confirmed.

0. Re-start the Terminal to take the changes:

   <pre><strong>source ~/.bash_profile
   </strong></pre>


   <a name="Verify"></a>

   ### Get menu to verify

   Regardless of how it was installed:

0. Verify by obtaining the list of commands:

   If you want just a reminder of the keywords:
   
   <pre><strong>git imerge
   </strong></pre>

   The response should be this (error message):

   <pre>
usage: git-imerge [-h]
                  {start,merge,rebase,drop,revert,continue,finish,diagram,list,init,record,autofill,simplify,remove,reparent}
                  ...
git-imerge: error: too few arguments
   </pre>

   (ignore the "too few arguments")


   <a name="ManPage"></a>

   Alternately, for a whole "man page" as well:

   <pre><strong>git imerge -h
   </strong></pre>

   The response adds to the above:

   <pre>
Git incremental merge
&nbsp;
Perform the merge between two branches incrementally.  If conflicts
are encountered, figure out exactly which pairs of commits conflict,
and present the user with one pairwise conflict at a time for
resolution.
&nbsp;
Multiple incremental merges can be in progress at the same time.  Each
incremental merge has a name, and its progress is recorded in the Git
repository as references under 'refs/imerge/NAME'.
&nbsp;
An incremental merge can be interrupted and resumed arbitrarily, or
even pushed to a server to allow somebody else to work on it.
&nbsp;
Instructions:
&nbsp;
To start an incremental merge or rebase, use one of the following
commands:
&nbsp;
    git-imerge merge BRANCH
        Analogous to "git merge BRANCH"
&nbsp;
    git-imerge rebase BRANCH
        Analogous to "git rebase BRANCH"
&nbsp;
    git-imerge drop [commit | commit1..commit2]
        Drop the specified commit(s) from the current branch
&nbsp;
    git-imerge revert [commit | commit1..commit2]
        Revert the specified commits by adding new commits that
        reverse their effects
&nbsp;
    git-imerge start --name=NAME --goal=GOAL BRANCH
        Start a general imerge
&nbsp;
Then the tool will present conflicts to you one at a time, similar to
"git rebase --incremental".  Resolve each conflict, and then
&nbsp;
    git add FILE...
    git-imerge continue
&nbsp;
You can view your progress at any time with
&nbsp;
    git-imerge diagram
&nbsp;
When you have resolved all of the conflicts, simplify and record the
result by typing
&nbsp;
    git-imerge finish
&nbsp;
To get more help about any git-imerge subcommand, type
&nbsp;
    git-imerge SUBCOMMAND --help
&nbsp;
positional arguments:
  {start,merge,rebase,drop,revert,continue,finish,diagram,list,init,record,autofill,simplify,remove,reparent}
                        sub-command
    start               start a new incremental merge (equivalent to "init"
                        followed by "continue")
    merge               start a simple merge via incremental merge
    rebase              start a simple rebase via incremental merge
    drop                drop one or more commits via incremental merge
    revert              revert one or more commits via incremental merge
    continue            record the merge at branch imerge/NAME and start the
                        next step of the merge (equivalent to "record"
                        followed by "autofill" and then sets up the working
                        copy with the next conflict that has to be resolved
                        manually)
    finish              simplify then remove a completed incremental merge
                        (equivalent to "simplify" followed by "remove")
    diagram             display a diagram of the current state of a merge
    list                list the names of incremental merges that are
                        currently in progress. The active merge is shown with
                        an asterisk next to it.
    init                initialize a new incremental merge
    record              record the merge at branch imerge/NAME
    autofill            autofill non-conflicting merges
    simplify            simplify a completed incremental merge by discarding
                        unneeded intermediate merges and cleaning up the
                        ancestry of the commits that are retained
    remove              irrevocably remove an incremental merge
    reparent            change the parents of the HEAD commit
&nbsp;
optional arguments:
  -h, --help            show this help message and exit
   </pre>


   ### Run Merge on Test repos

0. Run the script to perform a merge using git-imerge-test repos:

   <pre><strong>./git-imerge-test-run.sh
   </strong></pre>

   This was created for testing the test.

   (You may want to later adapt this to run on your own repos.)


   ### Create test repo

0. The script invokes a script to create a new repo containing conflicts:

   <pre><strong>./git-imerge-test-create.sh
   </strong></pre>

   #### How the test repo is created

   To avoid problems, the script aims to be "idempotent" in that each time it's run,
   the same result is produced. To achieve this, the script creates entries
   in two branches.
   In subsequent runs the repo (.git folder) is deleted before starting over.

   In the repo, two branches are created with names
   frob and floob.
   Branch frob is merged into floob.

   Essentially, we want to end up with this in a Git Network Diagram:
   <a target="_blank" href="http://softwareswirl.blogspot.com/2012/12/mapping-merge-conflict-frontier.html">*</a>

   <pre>
o - 0 - 1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11 - I11'  ← master/floob
     \                                               /
      A -- B -- C --- D --- E --- F --- G --- H --- I       ← branch frob
   </pre>

   Each branch contains a single file named <strong>somefile.md</strong>.

   A "for" loop in the script alternates between the two branches 
   to add a line at the bottom of the file, 
   then makes another commit. Here are the message text of commits:

   <pre>
A1
B2 conflict
C3
D4
E5
F6 
G7 conflict
H8
I9 conflict
10
11
   </pre>

   To make conflicting lines, each conflict line contain its own branch name
   (master or feature1).

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


0. Begin much like with git merge: check out the <strong>destination</strong> branch 

   <pre><strong>git checkout master
   </strong></pre>

   This is referenced as "ORIGINAL_BRANCH" in steps to follow.

0. Then tell git imerge what branch you want to merge into it:

   <pre><strong>git imerge start --name=frob --first-parent feature1
   </strong></pre>


   ### Intermediate state handling

0. When imerge processing stops due to a conflict,
   notice you are at branch "imerge/NAME" automatically created.

   <pre><strong>git branch -avv
   </strong></pre>

   The response:

   <pre>
  feature1    2fe920d I
* imerge/NAME b9a54e5 imerge 'NAME': automatic merge 2-1
  master      7b85c5f 9
   </pre>

   Below are internals information you may not care about:

   The tool uses `git bisect` to find pairwise merges that conflict.
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


   <a name="CycleFixes"></a>

   ### Cycle of fixes

0. Resolve the first conflict by editing somefile.md :

   <pre>
A1
<<<<<<< HEAD
B2 feature1
=======
B2 master
>>>>>>> 1905858068225d58f2f36fdce243bc2a663ced36
   </pre>

0. Remove lines added to end up with:

   <pre>
A1
B2 master
   </pre>

0. Add the commit the change:

   <pre><strong>git add . && git commit -m"Fix B2"
   </strong></pre>

0. Resume:

   <pre><strong>git imerge continue
   </strong></pre>

   <a href="#CycleFixes">Repeat this cycle of fixes</a> until you see:

   <pre>
Merge is complete!
   <pre>


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
   git checkout floob
   </strong></pre>

   floob is the ORIGINAL_BRANCH.

   Unlike regular git merge, abort with git merge does not abandon all previous changes.

   Git-merge records each of the intermediate merges
   so they can be tested by the test suite.


   ### Manual resolution

   Resolve each conflict the same as before:

0. Perform a diff to identify differences.
0. Edit the file.
0. Add the file
0. Commit the change.

   ### Continue

0. When you are ready to resume the incremental merge:

   <pre><strong>git imerge continue
   </strong></pre>


   ### Abort

0. If you need to completely abort an in-progress incremental merge,
   first remove the temporary branches ``git-imerge`` created,
   then checkout the branch you were in before you started the incremental merge:

   <pre><strong>git imerge remove
   git checkout floob
   </strong></pre>

   floob is the "ORIGINAL_BRANCH". It would be different during productive use.


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
    Merge frob into floob.
   </pre>



## More #

This is one of a series on Git, GitHub, and GitLab:

{% include git_links.html %}
