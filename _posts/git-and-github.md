Here is what I call a "fearless" approach to understanding Git's workflow and commands
because I introduce topics a different sequence than most other tutorials.

I use a <strong>map</strong> of how key files and commands relate to each other.
It's the only one of its kind I've seen.

Let's begin with repositories in a cloud service, GitHub.com.
A repo that belongs to another organization is called an <strong>"upstream"</strong> location.
If we <strong>edit</strong> that repo, 
GitHub automatically <strong>forks</strong> it under our own account.
If we want to make changes, we would need to file a 
<strong>Pull Request</strong> from the repo under our account.

One to the main advantages of GitHub is it makes use of <strong>branches</strong>.
The default branch is named "master".
But many organizations use it for production 
and create a <strong>"developer"</strong> and other branchs to do work.

I can click the <strong>Download</strong> button to 
bring a zip file to my local Downloads folder,
which I then <strong>unzip</strong> to folder I created.

But that folder alone does not keep back versions.
For that we need a <strong>.git</strong> folder among the files,
which is done by a <strong>Git client</strong> 
installed on my local machine.

The git <strong>init</strong> command processed by the Git client
creates the git folder to hold the history of changes it recognizes.
The git <strong>clone</strong> command which creates a new folder
to download files from GitHub and in that new folder
also creates the .git folder to hold historical references.

If we run the SSH or Putty command to create keys,
the Git client can communicate securely with the cloud service.

We need to run <strong>config</strong> commands to 
configure the <strong>.gitconfig</strong> file
referenced by all Git repositories on our machine
to provide our default name and email address to repos.

We can clone from an upstream repo, 
but it's preferable that we first fork any repo if we ever want to
send a Pull Request.

If we do a <strong>remote -v</strong> command on a repo we cloned,
we see that <strong>origin</strong> is the location.
If we need to update our local repo with changes in the upstream repo,
we would <strong>remote add</strong> the upstream.

Git only tracks files involved in a git <strong>commit</strong> 
command. Git stores what has changed in the .git folder
and calculates a reference to each particular change.

The git <strong>log</strong> command lists the history of all commits made.
Most consider its default format takes up too many lines,
so many configure in the .gitconfig file an alias 
such as <strong>lol</strong> to format what gets displayed.

The git <strong>reflog</strong> command lists the history of all changes made.

commits made.

Each commit is shown 


<strong>reset</strong>

to see the history maintained in the .git folder.

These commands track files which have been committed

Git maintains

git reflog doesn't traverse HEAD's ancestry at all. The reflog is an ordered list of the commits that HEAD has pointed to: it's undo history for your repo. The reflog isn't part of the repo itself (it's stored separately to the commits themselves) and isn't included in pushes, fetches or clones; it's purely local.

Aside: understanding the reflog means you can't really lose data from your repo once it's been committed. If you accidentally reset to an older commit, or rebase wrongly, or any other operation that visually "removes" commits, you can use the reflog to see where you were before and git reset --hard back to that ref to restore your previous state. Remember, refs imply not just the commit but the entire history behind it.


git <strong>log</strong> shows the current HEAD and its ancestry. 
That is, it prints the commit HEAD points to, then its parent, its parent, and so on. 
It traverses back through the repo's ancestry, by recursively looking up each commit's parent.


Many tutorials talk about using the <strong>pull</strong> command
to obtain updates from the origin or upstream location.
But we prefer using the <strong>fetch</strong> command.

checkout a particular branch.


<strong>status</strong>
of 

Git makes use of a "shopping cart" called 
<strong>staging</strong> to hold candidates for the


