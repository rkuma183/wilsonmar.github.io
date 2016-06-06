---
layout: post
title: "Data Security in GitHub"
excerpt: "How to keep secrets out of GitHub"
tags: [github, security]
image:
# pic secret finger over mouth 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15807549/645e9404-2b1e-11e6-8e19-2368c5578015.jpg
  credit: Forbes
  creditlink: http://blogs-images.forbes.com/ricksmith/files/2014/11/secret.png
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

   <amp-img width="600" height="419" alt="github-secrets-v01-600x418"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15812410/c5a7cafc-2b71-11e6-8859-904137d02f72.jpg"></amp-img>

In our individual machines, 
we use the `ssh-keygen` utility to generate key pairs based on our email or other seed.
The public key we copy into each server for use to <strong>`SSH`</strong>
with the private side of the pair (instead of a password).

As we write functions within application source files within a Git folder,
we commit changes into .git history.

Programmed functions also need to use private keys and other <strong>secrets</strong> 
to access data in web services such as Facebook, Google, etc.
also need to provide secrets that we don't want to be made public.

The conveninent thing to do is simply copy private certificates (among other files) in the Git folder,
so we can forget about it.
When files are pushed up to GitHub or other repository,
<strong>.gitignore</strong> settings should prevent the certificate from being uploaded and thus risk exposure.

PROTIP: It's not a good idea to keep secrets such as passwords and 
SSH private keys in a GitHub repository. Murphy's Law applies.

Rogue scanners scan through every GitHub repository looking for vulnerabilities.

We can use <a href="#BFG">the BFG utility to remove sensitive data</a>.

CAUTION: Even after sensitive data is removed from the <strong>current</strong> repository,
like the Padora's Box legend,
whatever was exposed can nevertheless live on in any zips, clones, or forks 
others have taken of the repository.

A more secure approach is to define a 
<a href="#ConfigScript">configuration script</a> that establishes a 
<a href="#Symlink">symlink</a> 
to reference secret files in folders outside of the Git repository.

PROTIP: In an enterprise setting where other members of your team may need to use your credentials
in case you're on vacation or something,
one approach is to store credentials in a <strong>cloud drive</strong>
(such as Dropbox, Box, Google Drive, or Microsoft OneDrive).
Key values then then be in <strong>profile scripts</strong> that load
<a href="#EnvVars">environment variables</a> within memory accessible by application programs.

SSH scripts and associate private keys can also be retrieved from a cloud drive 
for people who frequently move among machines.


## Dorking scans #

There are utilities (called "dorking") 
that scan through all GitHub repos looking for exposed keys.

   * http://www.securityweek.com/github-search-makes-easy-discovery-encryption-keys-passwords-source-code

   * http://www.itworld.com/article/2921135/security/add-github-dorking-to-list-of-security-concerns.html

<a name="BFG"></a>

## Get it out of there! #

What if you found out that your private data has been exposed?

First, if a file is deleted using `git rm` and a commit is made,
a vestige of that data can still exist in the repository's <strong>history</strong> (.git folder).

Two tool remove historical data:

   * Git's `git-filter-branch` command.

   * Utility program <a target="_blank" href="http://rtyley.github.io/bfg-repo-cleaner/">
   BFG Repo-Cleaner</a> 
   (bfg.jar) is faster due to it being written in Scala (a varient of Java).

<a target="_blank" href="https://help.github.com/articles/remove-sensitive-data/">
This webpage</a> explains commands such as replacing such as this to 
find known passwords and replace them with "***REMOVED***".

   <pre>
   java -jar bfg.jar --replace-text passwords.txt  my-repo.git
   </pre>

Git is designed such that every file and folder is represented only once (and given a unique SHA-1 hash-id).


<a name="ConfigScript"></a>

## Config Script #

You can tell Git to ignore changes to a file in the future:

   <pre><strong>
   git update-index --assume-unchanged
   </strong></pre>

   However, this works only on a single branch.
   On a change of branch, Git detects changes in the config file, and you'll have to either undo them, or check them in.

Another option is to use pre and post-commit hooks to automatically add/remove secret config values when checking in and out, using a Python program.

* http://www.codeproject.com/Articles/602146/Keeping-sensitive-config-settings-secret-with-Azur

<a name="Symlink"></a>

## Symlink Configuration #

On a Mac, this sample command is used to create a file named Classic pointing to /Volumes/Classic:

   ln -s /Volumes/Classic/ Classic

On Windows, a "Shortcut" is created to a file.

Example:

{% highlight text %}
cd YOUR_LOCAL_REPO
echo "source ~/app-root/data/.bash_profile" >> .app/action_hooks/pre_start_nodejs-0.6
git add .app/action_hooks/pre_start_nodejs-0.6
git commit -m 'importing bash profile during app init'
git push{% endhighlight %}

   NOTE: .app is replaced with the configuration file of your app.


<a name="CloudSync"></a>

## Sync from Dropbox #

<a target="_blank" href="http://www.technorange.com/cloudlinker-direct-link-generator-for-dropboxgoogle-driveone-drive-copy-com/">
This on-line tool</a> generates a direct link from a share link from
Dropbox, Google Drive, and Microsoft OneDrive.


<a name="EnvVars"></a>

## Enviornment variables #

To insert secret key in a Mac's .bash_profile script that the operating system executes
upon boot-up:

{% highlight text %}
echo "export SECRET_PASS=12345678910" >> ~/app-root/data/.bash_profile{% endhighlight %}

Programming to retrieve an enviornment variable into the program:

   * Python programs reference `process.env.SECRET_PASS`.

   * PHP programs use `getenv('SECRET_PASS');`.

   * C# programs use `System.Environment.GetEnvironmentVariable("SECRET_PASS", _<br />EnvironmentVariableTarget.Process)`.

NOTE: Internet browser sandboxing restricts JavaScript from accessing operating system
environment variables.


## Resources #

* http://stackoverflow.com/questions/1396617/committing-machine-specific-configuration-files/1397180#1397180

* http://stackoverflow.com/questions/1974886/how-to-version-control-config-files-pragmatically

* https://gist.github.com/ryanj/4446113

* http://programmers.stackexchange.com/questions/205606/strategy-for-keeping-secret-info-such-as-api-keys-out-of-source-control

* http://programmers.stackexchange.com/questions/141698/version-control-and-personal-configuration-file

* http://stackoverflow.com/questions/6009/how-do-you-deal-with-configuration-files-in-source-control

* http://www.codeproject.com/Articles/602146/Keeping-sensitive-config-settings-secret-with-Azur
