---
layout: post
title: "Git Whoops"
excerpt: "How to reverse mistakes in Git"
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

This presents ways to reverse or un-do common actions in Git.


<a name="Fork"></a>

### Fork

If you didn't mean to fork a repository, but you did anyway,
<strong>erase the repo</strong>.

0. Click on Settings tab.

0. Scroll down to the bottom of the page and click <strong>Delete this repository</strong>.

0. Type the name of the repo.

0. Click "I understand the consequences, delete this repository".

0. Provide your password if it's requested again.

0. For a list of your repos, click your avatar at the upper-right corner and
   select <strong>Your profile</strong>.


   <a name="GitConfig"></a>

   ### Git config

   If you find a mis-spelling in your attribution, simply repeat the command 
   with the information you want.

   On a Mac, git config commands create entries in the ~/.git/config file:

   <pre>
[user]
   email = wilsonmar@gmail.com
   name = Wilson Mar
   user = wilsonmar
   </pre>

   * There are other git configuration commands.

   <a href="https://wilsonmar.github.io/git-flow#GitConfig">Return</a>


   <a name="Terminal"></a>

   ### Terminal (vs GUI)

   Git commands are typed into a Terminal shell window on a Mac or a Run command window on Windows. 

   Most IDEs incorporate commonly used Git client functionality into their software. 

   * For example, in <strong>Eclipse</strong>, right-click on the project, then select 
   <strong>Team</strong> for the Git menu:<br />
   ![git eclipse menu 518x648](https://cloud.githubusercontent.com/assets/300046/25332307/ebf39f84-28b3-11e7-9d3b-5132a549cf13.png)

   * Eclipse "Switch To" = git checkout

   * Return to this picture after going through this course to see if you recognize what each GUI item does.

   <a name="Clone"></a>

   ### Clone in account folder

   PROTIP: I recommend that you create an account folder to hold all your various repositories. 

   <pre><strong>cd ~
   mkdir gits
   cd gits
   mkdir gitclass
   cd cigclass
   </strong></pre>

0. Be in that folder when you clone a repository from GitHub. 

   * Substitute your own account as your type:

   <pre><strong>cd ~
   git clone https://github.com/hotwilson/git-utilities
   </strong></pre>

   Git then creates that repo's folder and within it a folder named dot git to hold objects that track changes to the repository.

   During cloning, Git automatically extracts files from objects out to the repository's folder, 
   as if you typed a git checkout of the default branch. 

   * Add parameter <strong>--recursive</strong> to pull in sub-modules (repositories stored within the repository).

   * Add parameter <strong>--depth=1</strong> to only clone the latest version, to save disk space locally by
   not having previous version history on your machine.

   <a href="https://wilsonmar.github.io/git-flow#GitClone">Return</a>


0. Now we cd into the repository folder.

   <a name="BranchList"></a>

   ### Branch list

0. A <strong>git branch</strong> command shows us all the branches held in the repository. 

   <pre><strong>git branch -avv</strong></pre>

   * The <tt>-avv</tt> parameter provides more detail. Dash a specifies remote tracking branches to appear as well.

   * PROTIP: Create an operating-system alias "gb" by adding in .bash_profile <pre>alias gb='git branch -avv'</pre>
   then open up a new Terminal shell window to rerun the profile.

   PROTIP: Git defaults to the master branch. But many organizations protect that name for production use, and instead create a “development” or “dev” branch for developers to work with.

   <a name="Checkout"></a>

   ### git checkout

0. A git checkout command can be un-done?

   <a href="https://wilsonmar.github.io/git-flow#Checkout">Return</a>


   <a name="NewBranch"></a>

   ### New branch

   A branch can be deleted because they are just pointers to commits.

   <pre><strong>git branch -d <em>branch name</em>
   </strong></pre>

   <a href="https://wilsonmar.github.io/git-flow#NewBranch">Return</a>


   <a name="Editing"></a>

   ### Editing

   Now we can edit the file named README.md. The md designates markdown format. 
   Such a file GitHub creates with this specific name to describe each repository.

   We can use vim or another text editor (such as nano, atom, etc.) to change contents inside files. 
   Batch files would echo text to the bottom of the file.

   * If you use vim, press the I key to begin insertion and press Esc to end insertion mode.
   When out of insertion mode, type : to enter command mode, 
   then <strong>wq</strong> to write and quit the program or
   then <strong>q!</strong> to quit without changes.


   <a name="Status"></a>

   ### Status

   The <strong>git status</strong> command details the status of changes to the repo. 

   * This command is used so often that many create an operating system level alias such as "gs".

   <a name="Add"></a>

   ### Add to Staging

0. You can change several files, but only the files you add to <strong>Git's staging area</strong> 
   will be pushed to GitHub. 

   <tt><strong>git add . -A</strong></tt>

   * The Staging area is also called <strong>cache</strong> bacause the command to 
   <strong>remove</strong> a file in Staging:

   <pre><strong>git rm --cached [file]</strong></pre>

   * Specifying git rm without --cached removes the file from both cached and working directory.
   <br /><br />

   The dot selects all files changed. The dash capital A parameter specifies that deleted files be processed. But many prefer to specifically add individual files to go into each particular commit, which works on all files added to staging. 

   * Alternately, "git add -u" adds all the files modified (not new files created and untracked).

   * Some prefer using the single dash to avoid needing to press the Shift key to get the double quote.


   <a name="Commit"></a>

   ### Commit

0. The commit supplies a message describing changes, which applies to all files added. 

   <pre><strong>git commit -m"Update for show"</strong></pre>

   * A space is not needed between the m and the message.

   * If you don't specify the dash m, Git will display a file containing comments as a prompt.

   Any line beginning with the # comment character will be ignored and not be part of the comment.

   * If a user name prefixed by an at sign (such as "@wilsonmar") is specified in the message, 
   GitHub automatically sends an email.


   <a name="Log"></a>

   ### Log

0. The <strong>git log</strong> command provides a history of all commits. 
   It has lots of options, so to avoid typing all the parameters desired, 
   most people define an alias of the command in git's config file.

   <tt><strong>
git log --graph
   </strong></tt>

   * Add <strong>-3</strong> to display only the last 3 commits.

   * If a colon appears at the bottom of the screen, press q to quit.

   * To skip the colon, add <tt>--no-pager</tt>.

   * List a count of changes in each file in the commit (for example, abcdef1) with<br />
   <pre>git log --stat abcdef1</pre>. 

0. lists actions that have occurred on the local machine.

   <pre><strong>git reflog</strong></pre>

   * Each entry is pruned after 90 days.


   <a name="Rebasing"></a>

   ### Rebasing

   Before pushing to GitHub, some prefer to rebase to squash some commits so that only one commit message appears for several commits made. 

   * Rebasing cleans up intermediate commits that is unwanted noise to the rest of the team.
   The extra commits complicates the history, and makes back-out of code more difficult.

   * Yes, this changes history, which is why we do it. But it's only on your local version.

   * See <a target="_blank" href="http://wilsonmar.github.io/git-rebase">http://wilsonmar.github.io/git-rebase</a>
   for step-by-step instructions.


   <a name="Push"></a>

   ### Push

   The git push command sends to a remote what has been committed for a specific branch. 
   If you didn't paste your public key into GitHub, you would get an error now.

   <pre><strong>git push
   </strong></pre>


   <a name="Tags"></a>

   ### Push tags

0. When a commit is known good as the one to release, 
   most organizations tag that specific commit with <a target="_blank" href="http://semver.org/">
   semantic versioning</a> text.

   <pre>git tag v1.3.4</pre>

0. Tags require an additional git push command to be pushed to GitHub.

   <pre><strong>git push --tags</strong></pre>


   <a name="DeleteBranch"></a>

   ### Delete branch

0. Because branches are just markers within Git, once a feature branch is in GitHub, 
   that branch can be deleted from the local repo 

   <pre><strong>git branch -d feat1</strong></pre>

0. and from GitHub (by specifying that colon in front of the branch name). 

   <pre><strong>git push origin :feat1</strong></pre>

   NOTE: The colon is the secret special sauce. There is no "delete" command with this.


   <a name="PullRequest"></a>

   ### Pull Request

   Unless you have been designated a committer in the upstream repository, you can't push changes to it. But you can request their committers to pull changes from your forked repo. When a committer of that repo merges (or in other words, accepts) your PR, you'll get an email from GitHub.


   <a name="Upstream"></a>

   ### Upstream

   Next, let's look at what happens if, over time, changes occur in the upstream repo. 

   The git remote –verification command tells us that the origin remote was created, as usual, with the repo. 

0. To enable dowload by Git, we add the upstream remote. 

   <pre>
   git remote add upstream https://github.com/wilsonmar/git-utilities
   </pre>

   * The URL is the one owned by someone else.

   To obtain changes locally, many would rather NOT issue a git pull upstream command, which blindly fetches and automatically merges changes. Differences in the same line within the same file, Git is forced into automatic conflict resolution mode.

   * "Unintentional" merge commits are what some call "evil".

   <pre><strong>git pull --rebase</strong></pre>

   * To set it up so every branch you ever create on any repository is set to pull with rebase,
   set this global configuration:

   <pre><strong>git config --global pull.rebase true</strong></pre>

   Prior to version 1.7, it was:

   <pre><strong>git config --global branch.autosetuprebase always</strong></pre>


   <a name="Fetch"></a>

   ### Fetch

   So many prefer to take it one step at a time -- 

0. first a 

   <pre><strong>git fetch upstream
   </strong></pre> 

0. then a 

   <pre><strong>git checkout master</strong></pre>


   <a name="GitK"></a>

   ### gitk for diff

   Now we can use a utility such as <strong>gitk</strong> to see what changes came in. 

   * Click the commit listed at the top of the list, which is the most recent commit.

   * Alternately, there is also utilities vimdiff, meld, difftool, etc. 

   * For Linux: https://wiki.gnome.org/Apps/Gitg/

   * To see the difference between what is in last commit vs. what's in the working folder:<br />
   <pre>git difftool</pre>

   * To see the difference between what is in last commit vs. what's added in the index cache:<br />
   <pre>git difftool --cached</pre>

   * You can make a default command such as this to explicitly specify some file to compare:<br />
   <pre>git diff HEAD HEAD^ -- <em>file1</em></pre><br />
   

   <a name="Merge"></a>

   ### git merge

0. If they don't affect you, do a git merge. 

   Notice the slash separator. Use a cat or less command to verify file contents. 


   <a name="PushOrigin"></a>

   ### git push origin master

0. git push to update origin master on our forked repository.

   There are variations to these commands, but this is the typical workflow.


   <a name="Tag"></a>

   ### Tag

0. To make specific commits easier to find,
   add a tag to the latest commit so that it travels with that commit:

   <pre><strong>git tag -a v1.2.3</strong></pre>

   The example here is called a semantic tag described in the website 
   <a target="_blank" href="http://semver.org/">http://semver.org</a>

0. Tags are pushed using its own separate command:

   <pre><strong>git push --tags</strong></pre>


   ### File a pull request from git command line

0. Request the pull from the upstream repo: 

   <pre><strong>git request-pull v1.0 https://github.com/upstream/project Snapshot-for-1979
   </strong></pre>

   The URL must be specified (rathar than a remote designator such as "upstream").

   This feature is described at: <a target="_blank" href="http://git-scm.com/docs/git-request-pull">
   http://git-scm.com/docs/git-request-pull</a>



<a name="Recap"></a>

### Recap diagram

<a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/25991737/5921be7a-36d2-11e7-9e68-8b20c82012fb.png">
<img width="650" alt="git-flow-diagram 650x372.png" src="https://cloud.githubusercontent.com/assets/300046/25991737/5921be7a-36d2-11e7-9e68-8b20c82012fb.png"><br />(Click here for full screen and printing)</a>


### Other videos and articles

* <a target="_blank" href="https://www.youtube.com/watch?v=-zvHQXnBO6c">
  Syncing Your GitHub Fork</a> [4:26] May 3, 2014
  by Data School at jackiekazil using justmarkham

* <a target="_blank" href="https://www.youtube.com/watch?v=07hOKRl6Wiw">
   GitHub Fork and Sync repository</a>
   by Prem Aseem Jain at
   <a target="_blank" href="hhttps://premaseem.wordpress.com/2016/01/19/github-how-to-sync-from-forked-repoit/">
   premaseem.wordpress.com</a>

## Hub add-in

   <a target="_blank" href="https://x-team.com/blog/speed-up-your-github-workflow-with-hub/">
   This</a>
   describes installation and use of a simple wrapper around Git’s CLI so you can do it all from the command line rather than
   switching to GitHub’s web page:

   <a target="_blank" href="https://hub.github.com/">https://hub.github.com</a>

<hr />

<a name="GitFlowSoftware"></a>

## git-flow software

Those who DO have permissions to update can use 
an approach described in a popular blog, which identified different types of updates at:<br />
<a target="_blank" href="http://nvie.com/posts/a-successful-git-branching-model/">
http://nvie.com/posts/a-successful-git-branching-model</a>

Each of these are a different type of branch:

   * Hotfix (from master and back to master)
   * Bugfix
   * Release - for next release development
   * Feature
   * Support

These branches are used more in corporate rather than open source software.

<a target="_blank" href="https://www.youtube.com/watch?v=CHzL017R1e8">Video:</a><br />
<iframe width="560" height="315" src="https://www.youtube.com/embed/CHzL017R1e8" frameborder="0" allowfullscreen> </iframe>

0. [3:30] Install it on a Mac:

   <pre>brew install git-flow</pre>

   * http://github.com/nvie/gitflow/wiki/Mac-OS-X
   * http://github.com/nvie/gitflow/wiki/Windows
   * http://github.com/nvie/gitflow/wiki/Linux

0. Create content in a folder (such as "davebock_www") and [4:01] initialize Git:

   <pre><strong>git init
   </strong></pre>

0. Customize .gitignore file:

   <pre><strong>git init</strong></pre>

0. Add to Git and commit (Git commit commands are still necessary):

   <pre><strong>git add .
   git commit -m"initial commit"</strong></pre>

0. Push to GitHub:

   <pre><strong>git remote add origin git@github.com:CodeSherpas/da...
   git push origin master</strong></pre>


0. View the branches:

   <pre>git branch -avv</pre>

   Atlassian presents their take on the different branches <a target="_blank" href="https://youtu.be/gLWSJXBbJuE">
   in this video</a>:

   <a target="_blank" href="https://cloud.githubusercontent.com/assets/300046/25337661/bd873a68-28ca-11e7-9c40-732e5c254f3d.png">
   <img alt="github branches atlassian 650x260" src="https://cloud.githubusercontent.com/assets/300046/25337661/bd873a68-28ca-11e7-9c40-732e5c254f3d.png"><br />(click for full screen and to print)</a>

0. Set the upstream tracking branch:

   <pre>git branch --set-upstream develop origin/master</pre>

0. Activate:

   <pre>git flow init -d</pre>

0. Answer the series of questions:

   <pre>
Which branch should be used for bringing forth production releases?
   - master
Branch name for production releases: [master] 
Branch name for "next release" development: [develop] 
&nbsp;
How to name your supporting branch prefixes?
Feature branches? [feature/] 
Release branches? [release/] 
Hotfix branches? [hotfix/] 
Support branches? [support/] 
Version tag prefix? [] 
   </pre>

0. View menu:

   <pre>git flow</pre>

   <pre>
usage: git flow <subcommand>
&nbsp;
Available subcommands are:
   init      Initialize a new git repo with support for the branching model.
   feature   Manage your feature branches.
   release   Manage your release branches.
   hotfix    Manage your hotfix branches.
   support   Manage your support branches.
   version   Shows version information.
&nbsp;
Try 'git flow &LT;subcommand> help' for details.
   </pre>

0. Instead of native git commands
   the "git flow" command is issued with a new branch name:

   * <tt>git flow hotfix start <em>branchx</em></tt>
   * <tt>git flow bugfix start <em>branchx</em></tt>
   * <tt>git flow release start <em>branchx</em></tt>
   * <tt>git flow feature start <em>branchx</em></tt>
   * <tt>git flow support start <em>branchx</em></tt>

   A sample of the response:

   <pre>
Switched to a new branch 'feature/controller'
&nbsp;
Summary of actions:
- A new branch 'feature/branchx' was created, based on 'develop'
- You are now on branch 'feature/branchx'
&nbsp;
Now, start committing on your feature. When done, use:
&nbsp;
     git flow feature finish branchx
   <pre>

0. Edit files (such as generate controller).

0. List branches:

   <pre><strong>git-flow feature</strong></pre>

0. Publish:

   <pre><strong>git flow feature publish branchx
   </strong></pre>

   The response:

   <pre>
Summary of actions:
- A new remote branch 'feature/branchx' was created
- The local branch 'feature/branchx' was configured to track the remote branch
- You are now on branch 'feature/branchx'   
   </pre>

0. Instead of native git commands
   the "git flow" command is issued with a git flow branch name 
   and whether you want to  finish (git merge):

   * <tt>git flow hotfix finish <em>branchx</em></tt>
   * <tt>git flow bugfix finish <em>branchx</em></tt>
   * <tt>git flow release finish <em>branchx</em></tt>
   * <tt>git flow feature finish <em>branchx</em></tt>
   * <tt>git flow support finish <em>branchx</em></tt>

   The response:

   <pre>
Switched to branch 'develop'
Already up-to-date.
Deleted branch feature/branchx (was 31a9657).
&nbsp;
Summary of actions:
- The feature branch 'feature/branchx' was merged into 'develop'
- Feature branch 'feature/branchx' has been removed
- You are now on branch 'develop'   
   </pre>

   ### To Master

0. List Git Flow commands available [12:14]:

   <pre><strong>git flow release start initial deploy</strong></pre>

0. You are automatically prompted for a tag message (because it's master).

   This also occurs with Hotfix.



### More Videos

<a target="_blank" href="https://www.youtube.com/watch?v=aJnFGMclhU8">
Video illustrations from GitHub Education</a>


https://github.com/zacksiri
<a target="_blank" href="https://twitter.com/zacksiri/">@zacksiri</a>

   0. <a target="_blank" href="https://www.youtube.com/watch?v=xgo60yhetZk&">
   Git Flow Introduction</a>
   0. <a target="_blank" href="https://www.youtube.com/watch?v=XbapC7nm49s&t=34s">
   Git Flow Feature Branch and Pushing to GitHub</a>
   [11:16] 6 Dec 2015
   0. <a target="_blank" href="https://www.youtube.com/watch?v=mcWsX_setW4">
   Git Flow and Github Pull Request</a> 
   [6:53] 1 Jan 2016


git-flow software is described by <a target="_blank" href="https://www.youtube.com/watch?v=SChuTnuBYMg">
this video</a> and <a target="_blank" href="http://mediacurrent.com/blog/webinar-git-intro">
blog</a> from 2013 by @KBasarab and at:

   * <a target="_blank" href="http://datasift.github.com/gitflow/">
   http://datasift.github.com/gitflow</a>


### Hubflow fork software

Datasift people created an upgrade to GitFlow to work with GitHub, which they call 
<a target="_blank" href="https://datasift.github.io/gitflow/TheHubFlowTools.html">
   HubFlow</a>

   <pre>
git clone https://github.com/datasift/gitflow
cd gitflow
sudo ./install.sh
sudo git hf upgrade
   </pre>

The flow of <strong>hf</strong> git commands are explained at:

    https://datasift.github.io/gitflow/GitFlowForGitHub.html


### Resources

https://www.youtube.com/watch?v=wKmmFQwGWBM

https://github.com/Kunena/Kunena-Forum/wiki/How-to-handle-conflicts-with-git

<a target="_blank" href="https://www.youtube.com/watch?v=enMumwvLAug">
Introduction to GitLab Workflow</a> [49:14] Mar 11, 2016


## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
