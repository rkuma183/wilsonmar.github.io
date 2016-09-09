---
layout: post
title: "Git Commands and Statuses"
excerpt: "The Visual Cheat Sheet"
modified:
tags: []
image:
#  feature: pic black entering stadium 1900X500.jpg
   feature: https://cloud.githubusercontent.com/assets/300046/14621833/d9af8f54-0582-11e6-9c88-7e8d1cead630.jpg 
   credit: 
   creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

For the last two years, I've scoured the internet to 
view every blog, video, and book about this subject.
So you don't have to.

I thank <a target="_blank" href="http://zeroturnaround.com/rebellabs/git-commands-and-best-practices-cheat-sheet/">
ZeroTurnaround</a> for a diagram which illustrates the basic commands.

<amp-img layout="responsive" alt="git-zero-turnaround-638x270-64kb.jpg" width="638" height="270" src="https://cloud.githubusercontent.com/assets/300046/18372794/6b128886-75fc-11e6-99de-b54f0f41faf6.jpg"></amp-img>

But I want to learn more Git commands such as for branches
because I need to use <strong>Git flow</strong> at my work.

I've worked hard to come up with a logical sequence with a succint commentary
so you can quickly grasp the nuance of commands involved with Git flow.

I've struggled to create this <a href="#MyMap">animated illustration</a>
which I call the "fearless" approach 
because I introduce Git in more depth and in a different sequence 
than other tutorials that have come before me.


## Playlist

You may prefer accessing the videos via this playlist:

> <a target="_blank" href="https://goo.gl/12C1BF">https://goo.gl/12C1BF</a>

A playlist link lists the latest versions because individual videos can be added or removed.

Direct links to individual YouTube videos can become stale when newer versions are downloaded.



<a name="MyMap"></a>

## My map #

<img layout="responsive" alt="git-commands-v05-650x296-221kb.jpg" width="650" height="296" src="https://cloud.githubusercontent.com/assets/300046/18370667/1d8d43c2-75ec-11e6-8d3e-46aabf3fae9d.jpg">

The diagram above is animated in PowerPoint and narrated with text below.

   PROTIP: You are encouraged to pull out a paper and hand-draw 
   the diagram as we go along. You'll remember this better.

> Please let me know if you can see a tweak to this sequence for better introduction of concepts.

Let's begin with repositories in a cloud service, GitHub.com.
There are other clouds, but GitHub is what we're using because it has the largest market share.

A repo that belongs to another organization is called an <strong>"upstream"</strong> location.
If we <strong>edit</strong> that repo, 
GitHub automatically <strong>forks</strong> it under our own account.
If we want to make changes, we would need to file a 
<strong>Pull Request</strong> from the repo under our account.

One of the main advantages of GitHub is it makes use of <strong>branches</strong>.
The default branch is named "master".
But many organizations protect it for production use,
and create a <strong>"development"</strong> or "dev" branch for developers to work with.

We can click the <strong>Download</strong> button to 
bring a zip file to my local Downloads folder,
then <strong>unzip</strong> to a folder I created.

But that folder alone does not keep back versions.
For that we need a <strong>.git</strong> folder among the files,
which is done by a <strong>Git client</strong> 
installed on my local machine.

The git <strong>init</strong> command processed by the Git client
creates the git folder which holds the history of changes.

The git <strong>clone</strong> command creates 
that .git folder inside a new folder from files downloaded GitHub.

If we run the SSH or Putty command to create keys,
the Git client can communicate securely with the cloud service.

We run <strong>config</strong> commands to 
configure the <strong>.gitconfig</strong> file
referenced by all Git repositories on our machine
to provide our default name and email address to repos.

We can clone from an upstream repo, 
but it's preferable that we first fork that repo so we can 
send a Pull Request upstream.

If we do a <strong>remote -v</strong> command on a repo we cloned,
we see that <strong>origin</strong> is its location.
If we need to update our local repo with changes in the upstream repo,
we would <strong>remote add</strong> the upstream repo.

Git only tracks files involved in a git <strong>commit</strong> 
command. Git stores what has changed in the .git folder
and calculates a reference to each particular change.

The git <strong>tag</strong> command allows a 
custom name of your choosing to be assigned to a commit.
Teams use this to specify release numbers and
specifications which Jenkins recognizes to invoke integration builds.

The git <strong>shortlog</strong> summarizes the history of commits made.

The git <strong>log</strong> command lists a 
<em>detailed</em> history of commits made.
Most consider its default format takes up too many lines,
so many configure in the .gitconfig file an alias 
such as <strong>lol</strong> to format what gets displayed.

BTW, <strong>"HEAD"</strong> refers to the most current commit,
listed at the top of a chain of its <em>descendants</em> from prior commits.
In other words, Git <strong>log</strong> shows the current HEAD and its ancestry
by traversing back through the repo's ancestry recursively looking up each commit's parent.

The git <strong>reflog</strong> command lists the history of 
<em>all</em> changes made in the sequence they occurred,
like an undo history of the repo. 
It's stored separately from the commits themselves
and isn't included in pushes, fetches or clones
because it's purely for local use. 
If it seems like a commit has been lost,
chances are the reflog will show it and allow you to restore it.


The git <strong>show</strong> command lists fine-grained internal
<em>objects</em> in the repository, such as blobs and trees associated
with tags and commits. 

<hr />

The git <strong>branch</strong> command lists what branches 
are in the local repository because only a specific branch
may be cloned locally.

A git <strong>checkout</strong> command can specify a
specific branch or commit version to be brought into the working folder,
such as a feature branch used in Git flow.

The -b parameter in the checkout command specifies the creation of a new branch.

This will put you in what Git calls a "detached HEAD" state.

<hr />

Bash command <strong>touch</strong> and <strong>echo</strong> 
can create and change files,
but in order for them to be committed for tracking by git,
they first must be specified in a git <strong>add</strong> 
command which puts changes in a sort of "shopping cart" called the 
<strong>staging</strong>, which is also called <strong>Index</strong>
because it holds an index of files which the
next git commit command would track.

The git <strong>status</strong> command shows
which files have been <strong>staged</strong>
or remain <strong>untracked</strong>.

When Git detects a staged file has been 
<strong>edited</strong> by a text editor,
Git automatically takes that file out of staging
and assigns it the status of <strong>modified</strong>.

<hr />

Git provides a way to stash the state of files in the working directory and index
so they are not lost forever when you have to 
suddenly switch back to what's in the HEAD commit.

The <a target="_blank" href="https://git-scm.com/docs/git-stash">
git <strong>stash</strong></a> command (with implicit save)
puts all files from the working directory
into a local stash area separate from Staging or the Git repository.

To retrieve the last stash, use git <strong>stash pop</strong>

Modifications stashed can be listed with git <strong>stash list</strong>, 
inspected with git <strong>stash show</strong>, 
and restored (potentially on top of a different commit) 
with git <strong>stash apply</strong>. 

To get rid of everything in the stash, do a git <strong>stash drop</strong>.

<hr />

To remove files from staging,
Git command <strong>reset HEAD --</strong> can be used 
followed by a file specification, which can be a dot to specify all files.

To remove all files in the <em>working directory</em>
which are NOT under version control, using the
git <strong>clean</strong> command, which works 
<em>recursively</em> down the various sub-folders.

To wipe out all uncommitted changes in staging and 
replace the working tree with the commit HEAD specified, use
Git command <strong>reset --hard HEAD^</strong>.

<hr />

Files <strong>deleted</strong> after being committed would 
appear with a status of "deleted".
Such a file can be retrieved using the
git <strong>checkout</strong> from repository history.

After a commit, the status command would show no files.

If the <em>description</em> of the <em>most recent</em> 
local commit needs to be changed,
<a target="_blank" href="https://help.github.com/articles/changing-a-commit-message/">
it can be done</a> using a <strong>commit --amend</strong> parameter.

To change the content of the most recent commit,
a <strong>revert</strong> command can be used to
create another commit which does the opposite of what is being reverted.

Changing previous commits would require a git "push --force" command,
which is not allowed in most organizations because it requires
others who have cloned the repo to make manual changes.

But while you're still working on a local branch, you can use
git <strong>rebase</strong> to reword commit messages or
<em>squash</em> several commits into one.
This is desirable especially for commits that only fix typos in the local repo
which other do not really want to know about.

<hr />

When working as a team, changes may have occcurred while you're 
working with an older version.

Many tutorials talk about using the <strong>pull</strong> command
to obtain updates from the origin or upstream location.

But we prefer using the <strong>fetch</strong> command which,
unlike pull, does not automatically do a 
<strong>merge</strong>.

The <strong>diff-tree</strong> has a similar command set
as the git show command.

We want to use a git <strong>diff</strong> command or use a 
<strong>diff-tool</strong> to examine what has changed,
then run merge manually or using a
<strong>merge-tool</strong>.

We then know it's OK to do a
git <strong>push</strong> of local commits to the team repository in the cloud.

<img layout="responsive" alt="git-commands-v05-650x296-221kb.jpg" width="650" height="296" src="https://cloud.githubusercontent.com/assets/300046/18370667/1d8d43c2-75ec-11e6-8d3e-46aabf3fae9d.jpg">


## Confirmation #

Now that you've seen mine, let's recap with the flowchart from the<br />
<a target="_blank" href="http://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#Removing-Files">
book at Git-SCM.com</a>

<amp-img layout="responsive" alt="git-scm-book 650x298-51kb.jpg" width="650" height="298" src="https://cloud.githubusercontent.com/assets/300046/18372914/33dcbee4-75fd-11e6-82f1-fe95cfb79274.jpg"></amp-img>


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
