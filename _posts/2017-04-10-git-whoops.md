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

   ### git checkout file

   Mentioning a single [file] in the `git checkout` command
   overwrites whatever changes have been made to the file and
   replaces it with an old version of that file:

   <pre><strong>git checkout -- <em>[file]</em>
   </strong></pre>

   * As with several other git commands, two dashes goes before specification of a single file.
 
   * Git assumes you want to checkout HEAD, the last commit on the currently-checked-out branch.

   * Whatever exists are permanently gone because they were not committed.
    <br /><br />

   Checking out an old <strong>commit</strong> from .git repo history
   makes the entire working directory match that commit. 
   However, the "current" state of your project remains untouched in the master branch.


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

   Use the <a href="#Status">git status</a> command to see whether the file is managed.


   <a name="Cherry-pick"></a>

   ### git cherry-pick

   To replay changes specified in a specific commit onto files in the working directory:

   <pre><strong>git cherry-pick <em>[commit SHA1]</em>
   </strong></pre>



   <a name="Status"></a>

   ### Status

   The <strong>git status</strong> command details the status of changes to the repo. 


   <a name="LocalClean"></a>

   ### Local Clean

   If you are overwhelmed by too many <strong>untracked</strong> files in your working directory,
   first see what files will be cleared using one command, first use the -n flag:

   <pre><strong>git clean -n
   </strong></pre>

   Nuke files from the folder using the clean command:

   <pre><strong>git clean -fdx
   </strong></pre>

   * <strong>-f</strong> removes files untracked. It's required.
   * <strong>-d</strong> removes untracked directories.
   * <strong>-x</strong> removes files Git ignores due to mention in .gitignore.


   <a name="Add"></a>

   ### Un-Add from Staging

   To remove a specified [file] (such as README.md) just from the staging area, 
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

   ### Commit - Revert

   Changes can be made to specific commits as long as they have not been pushed to others
   in GitHub. The following applies to such commits.

   If the message text is all you want to undo, repeat the command with 
   `--amend` added.

   <pre><strong>git commit -m"Update again for show" --amend
   </strong></pre>

   The above would not retain the previous message.


   <a name="Revert"></a>

   ### Commit - Revert

   To change file with commits already pushed to others, a git revert command
   tells Git to figure out the opposite of all the change introduced by a particular commit.
   If the commit added some text, revert deletes that text.

   First figure out the specific commit id using the git log command (such as "5a34def"), 
   then supply that number in the command:

   <pre><strong>git revert <em>[commit-SHA]</em>
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



   <a name="LocalCommits"></a>

   ### Reset Local Commits

   To reset the .git repo history
   (the "hard" part) back the way it was 2 commits ago:

   <pre><strong>git reset --hard <em>HEAD~2</em>
   </strong></pre>

   * This should only be for commits which have not been pushed public.
   * There is companion command -- to clear out whatever files created are untracked:


   <a name="Push"></a>

   ### Public revert push

   The `git push` command sends to a remote what has been committed for a specific branch. 
   
   However, a <a href="#Revert">revert command</a> can be issued, 
   as described <a href="#Revert">above</a>.

   But do it for each commit pushed, in reverse order.

   <a href="https://wilsonmar.github.io/git-flow#Push">Return</a>


   <a name="Tags"></a>

   ### Un-Push tags

   To delete a tag in the origin repo (on GitHub or GitLab),

   <pre>git tag released/201706
   </pre>

   Remember the colon character to specify delete, followed by "refs/tags"
   as in:

   <pre><strong>git push origin :refs/tags/released/201706
   </strong></pre>


   <a href="https://wilsonmar.github.io/git-flow#Tags">Return</a>



   <a name="DeleteBranch"></a>

   ### Delete branch

0. Because branches are just markers within Git, once a feature branch is in GitHub, 
   that branch can be deleted from the local repo 

   <pre><strong>git branch -d <em>feat1</em>
   </strong></pre>

0. and from GitHub (by specifying that colon in front of the branch name). 

   <pre><strong>git push origin :feat1</strong></pre>

   NOTE: The colon is the secret special sauce. There is no "delete" command with this.

   <a href="https://wilsonmar.github.io/git-flow#DeleteBranch">Return</a>



   <a name="PullRequest"></a>

   ### Pull Request

   A pull request can be cancelled from GitHub.

   <a href="https://wilsonmar.github.io/git-flow#PullRequest">Return</a>


   <a name="Upstream"></a>

   ### Upstream Remove

   To remove a remote:

   <pre><strong>git remote remove upstream 
   </strong></pre>

   Verify:

   <pre><strong>git remote -v
   </strong></pre>

   <a href="https://wilsonmar.github.io/git-flow#Upstream">Return</a>

## Resources

https://github.com/blog/2019-how-to-undo-almost-anything-with-git


## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
