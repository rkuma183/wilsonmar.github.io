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


https://www.atlassian.com/git/tutorials/undoing-changes


<a name="Fork"></a>

### Fork

If you didn't mean to fork a repository, but you did anyway,
<strong>erase the repo</strong>.

0. Click on Settings tab in GitHub.

0. Scroll down to the bottom of the page and click <strong>Delete this repository</strong>.

0. Type the name of the repo.

0. Click "I understand the consequences, delete this repository".

0. Provide your password if it's requested again.

0. For a list of your repos, click your avatar at the upper-right corner and
   select <strong>Your profile</strong>.
<br /><br />

   <a href="https://wilsonmar.github.io/git-flow#Fork">Return</a>


   <a name="GitConfig"></a>

   ### Git config

   If you find a mis-spelling in your attribution, 
   simply repeat the command with the information you want.

   On a Mac, git config commands create entries in the ~/.git/config file:

   <pre>
[user]
   email = wilsonmar@gmail.com
   name = Wilson Mar
   user = wilsonmar
   </pre>

   <a href="https://wilsonmar.github.io/git-flow#GitConfig">Return</a>


  
   <a name="Clone"></a>

   ### Clone in account folder

   If you mistyped, remove a folder and all its contents with a 
   <tt>rm -rf</tt> command. But be at the folder above the folder you want to remove.

   <pre><strong>pwd
   cd ..
   rm -rf gitclass
   </strong></pre>

   <a href="https://wilsonmar.github.io/git-flow#GitClone">Return</a>



   <a name="Checkout"></a>

   ### git checkout

   Checking out an old <strong>commit</strong> makes the entire working directory match that commit.

   Remember the "current" state of your project remains untouched in the master branch.

   However, checking out a <strong>file</strong> does affect the current state.
   That command serves as a way to revert back to an old version of an individual file.

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

   It doesn't matter how many times a file is changed and saved if that file is unmanaged.

   Use the <tt>git status</tt> command to see if it's managed.



   <a name="Status"></a>

   ### Status

   The <strong>git status</strong> command details the status of changes to the repo. 


   <a name="Add"></a>

   ### Add to Staging

   To remove a specified file from the staging area, 
   but leave the working directory unchanged:

   <pre><strong>git reset <em>[file]</em>
   </strong></pre>

   Alternately, the Staging area is also called <strong>cache</strong> 
   because the command to 
   <strong>remove</strong> a file in Staging:

   <pre><strong>git rm --cached <em>[file]</em>
   </strong></pre>

   * Specifying git rm without --cached removes the file from both cached and working directory.
   <br /><br />

   <a href="https://wilsonmar.github.io/git-flow#Add">Return</a>


   <a name="Commit"></a>

   <a name="Revert"></a>

   ### Commit - Revert

   Changes can be made to specific commits as long as they have not been pushed to others
   in GitHub. The following applies to such commits.

   If the message text is all you want to undo, repeat the command with 
   `--amend` added.

   <pre><strong>git commit -m"Update again for show" --amend
   </strong></pre>

   The above would not retain the previous message.

   To change file with commits already pushed to others, a git revert command
   tells Git to figure out the opposite of all the change introduced by a particular commit.
   If the commit added some text, revert deletes that text.

   First figure out the specific commit using the git log command, 
   then supply that number in the command:

   <pre><strong>git revert <em>[commit-id]</em>
   </strong></pre>
   
   See <a target="_blank" href="https://www.atlassian.com/git/tutorials/undoing-changes#git-revert">this explanation</a>.


   <a href="https://wilsonmar.github.io/git-flow#Commit">Return</a>


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

   The `git push` command sends to a remote what has been committed for a specific branch. 
   
   However, a <a href="#Revert">revert command</a> can be issued, 
   as described <a href="#Revert">above</a>.

   <a href="https://wilsonmar.github.io/git-flow#Push">Return</a>


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

   <a href="https://wilsonmar.github.io/git-flow#DeleteBranch">Return</a>


   <a name="PullRequest"></a>

   ### Pull Request

   A pull request can be cancelled from GitHub.

   <a href="https://wilsonmar.github.io/git-flow#PullRequest">Return</a>


   <a name="Upstream"></a>

   ### Upstream Remote

   To remove a remote:

   <pre><strong>git remote remove upstream 
   </strong></pre>

   Verify:

   <pre><strong>git remote -v
   </strong></pre>

   <a href="https://wilsonmar.github.io/git-flow#Upstream">Return</a>



## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
