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

   <amp-img width="597" height="424" alt="github-secrets-v01 597x424"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15808748/f5163074-2b3c-11e6-869f-9ba50e00319d.jpg"></amp-img>

In our individual machines,
we use the `ssh-keygen` utility to create key pairs based on our email or other seed.
The public key we copy into each server so that we can access using `SSH` 
with the private side of the pair (instead of a password).

As we write functions within application source files, 
we commit changes into .git history.

Like SSH, functions that access data in servers may also need a certificate.

The conveninent thing to do is simply copy the private certificate among other files in the folder,
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

A better approach is instead of storing credentials in any folder that Git may reference,
we define a configuration file or 
<a href="#Symlink">symlink</a> 
to reference files in folders outside of Git repository.

PROTIP: In an enterprise setting where other members of your team may need to use your credentials
in case you're on vacation or something,
one approach is to store credentials in a secure <strong>Dropbox</strong>,
then have a script file retrieve private key values and load them into an 
<a href="#EnvVars">environment variables</a> within memory.
This works great for people who frequently move among machines.

But application functions would need to be <strong>programmed</strong> to retrieve enviornment variables.


## Security scans #

There are utilities that scan through all GitHub repos looking for exposed keys.

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


<a name="Symlink"></a>

## Symlink Configuration #

Example:

{% highlight text %}
cd YOUR_LOCAL_REPO
echo "source ~/app-root/data/.bash_profile" >> .app/action_hooks/pre_start_nodejs-0.6
git add .app/action_hooks/pre_start_nodejs-0.6
git commit -m 'importing bash profile during app init'
git push{% endhighlight %}

   NOTE: .app is replaced with the configuration file of your app.

<a name="EnvVars"></a>

## Enviornment variables #

{% highlight text %}
echo "export SECRET_PASS=12345678910" >> ~/app-root/data/.bash_profile{% endhighlight %}

Python programs reference `process.env.SECRET_PASS`.

PHP programs use `getenv('SECRET_PASS');`.

## Resources 

* https://gist.github.com/ryanj/4446113

