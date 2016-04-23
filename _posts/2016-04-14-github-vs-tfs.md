---
layout: post
title: "Microsoft TFS and Git"
excerpt: "What ya gonna do with it?"
tags: [devops, git, TFS]
image:
# feature: fig-white-black-malika-favre-vertical-bars
  feature: https://cloud.githubusercontent.com/assets/300046/14751598/d1bcc4c6-0887-11e6-8c3e-9714f871101a.jpg
  credit: Malika Favre
  creditlink: http://create.adobe.com/2016/4/1/the_bold_cheeky_and_frequently_nsfw_art_of_malika_favre.html
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

## What is TFS?

TFS (Team Foundation Server) is licensed from Microsoft.

TFS is available to subscribers of <a target="_blank" href="http://msdn.com/">
MSDN</a>

TFS served as the server behind Visual Studio IDE.

## Git is King

When the internet and its developers began to adopt Git and GitHub,
Visual Studio 2015 provides support for both GitHub and TFS.

## git-tfs bridge

As http://git-tfs.com/
describes, use Chocolately on a Windows machine:

   ```
   cinst GitTfs
   ```

The above is equivalent to:

   ```
   choco insttall Git-tf -y
   ```

Alternately, follow manual instructions at 
https://gittf.codeplex.com/

This installs the contents of
https://github.com/git-tfs/git-tfs

Clone using the `git-tfs` command rather than `git` command:

   ```
   <strong>git-tfs</strong> clone http://github.com/etc.
   ```

## Remove TFC bindings

TFS source control bindings (*.vssscc files) are unique to TFS.
So remove it.
This can be done from within Visual Studio.

Edit your .sln file to remove the 

   <pre>
   GlobalSection(TeamFoundationVersionControl) ... 
   EndGlobalSection
   </pre>

## README.md Markdown File

One artifact unique to GitHub is the README.md file 
(where .md means markdown or text). 

It's optional but most GitHub repos have one.


## Keeping history

The issue is keeping history

## Resources

* https://www.microsoft.com/en-gb/developers/articles/week02mar2014/migrating-a-tfs-tfvc-based-team-project-to-a-git-team-project-retaining-as-much-source-and-work-item-history-as-possible/

* http://chriskirby.net/blog/migrate-an-existing-project-from-tfs-to-github-with-changeset-history-intact




