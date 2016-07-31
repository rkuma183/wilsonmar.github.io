---
layout: post
title: "Git Commits with a Tag and Signature"
excerpt: "As if you're an author at a book signing"
tags: [Git, setup]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This article describes how you can sign and tag commits in Git
and push them to GitHub -- the enterprise approach to using Git and GitHub.

Many teams request that commits be <strong>digitally signed</strong>
to provide "non-repudiation" (make "I didn't do it" not possible),
and <strong>tagged</strong> for unique reference in git commands
for traceability through the whole DevOps workflow.

{% include _intro.html %}

Typed git commands are currently shown here.
TODO: Actions to achieve the same results in GUI IDEs will be added.

## Summary #

To associate a
<a href="#GenerateKey">signing key you generate</a>
with your commits you push from git client to GitHub:

   * <a href="#GitAdd">git add</a>
   * <a href="#GitCommit">git commit</a> <br />
   * <a href="#GitTag">git tag</a> <br />
   * <a href="#GitPush">git push</a>

   Click on each to go directly to it.


<a name="GenerateKey"></a>

## Generate Signing Key #

First, install the tool used to generate signing keys.

### Install GPGTools #

On local Git:

0. On a Mac, install GPGTools Suite from
   <a target="_blank" href="https://github.com/caskroom/homebrew-cask/blob/master/Casks/gpgtools.rb">
   Homebrew specs</a>
   (rather than downloading from <a target="_blank" href="https://gpgtools.org/">
   https://www.gpgtools.org</a>):

   <tt><strong>
   brew cask install -g gpgtools
   </strong></tt>

   The response:

   <pre>
==> Caveats
Cask gpgtools installs files under "/usr/local".  The presence of such
files can cause warnings when running "brew doctor", which is considered
to be a bug in homebrew-cask.
&nbsp;
==> Downloading https://releases.gpgtools.org/GPG_Suite-2016.07_v2.dmg
######################################################
==> Verifying checksum for Cask gpgtools
==> Running installer for gpgtools; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are ignored.
Password:
   </pre>

0. Provide your password for the rest:

   <pre>
==> installer: Package name is GPG Suite
==> installer: Installing at base path /
==> installer: The install was successful.
2016-07-30 17:48:16: [fixGpgHome] started with arguments: mac /Users/mac/.gnupg
2016-07-30 17:48:16: Overwrite UID: mac
2016-07-30 17:48:16: Overwrite GNUPGHOME: /Users/mac/.gnupg
d2e82a39aaef128c61a91b1ca08d9931922d3327  /usr/local/MacGPG2/bin/gpg2
990cae62c6aaf4529c54e28b5c929ade0245f6ee  /usr/local/MacGPG2/bin/gpg-agent
2016-07-30 17:48:16: [fixGpgHome] Fixing '/Users/mac/.gnupg'...
gpg: WARNING: unsafe ownership on configuration file `/Users/mac/.gnupg/gpg.conf'
2016-07-30 17:48:16: [fixGpgHome] Fixing done
2016-07-30 17:48:16: [fixGpgHome] fixGPGAgent started
2016-07-30 17:48:16: [fixGpgHome] Fixing '/Users/mac/.gnupg/gpg-agent.conf'...
2016-07-30 17:48:16: [fixGpgHome] Found working pinentry at: /usr/local/MacGPG2/libexec/pinentry-mac.app/Contents/MacOS/pinentry-mac
2016-07-30 17:48:16: [fixGpgHome] Add new pinentry
2016-07-30 17:48:16: [fixGpgHome] Start gpg-agent.
2016-07-30 17:48:16: [fixGpgHome] UID = 0
2016-07-30 17:48:16: [fixGpgHome] Start gpg-agent using uid: 'mac'
gpg-agent[44407]: directory `/Users/mac/.gnupg/private-keys-v1.d' created
GPG_AGENT_INFO=/Users/mac/.gnupg/S.gpg-agent:44408:1; export GPG_AGENT_INFO;
gpg-agent[44408]: gpg-agent (GnuPG/MacGPG2) 2.0.30 started
2016-07-30 17:48:16: [fixGpgHome] fixGPGAgent done
2016-07-30 17:48:16: [fixGpgHome] done
🍺  gpgtools was successfully installed!
   </pre>

0. Validate install:

   <tt><strong>
   gpg \-\-list-keys
   </strong></tt>

   Sample response:

   <pre>
/Users/mac/.gnupg/pubring.gpg
-----------------------------
pub   2048D/00D026C4 2010-08-19 [expires: 2018-08-19]
uid       [ unknown] GPGTools Team <team@gpgtools.org>
uid       [ unknown] GPGMail Project Team (Official OpenPGP Key) <gpgmail-devel@lists.gpgmail.org>
uid       [ unknown] GPGTools Project Team (Official OpenPGP Key) <gpgtools-org@lists.gpgtools.org>
uid       [ unknown] [jpeg image of size 5871]
sub   2048g/DBCBE671 2010-08-19 [expires: 2018-08-19]
sub   4096R/0D9E43F5 2014-04-08 [expires: 2024-01-02]
   </pre>

0. On a Mac: Verify that installation added the folder and files:

   <tt><strong>
   ls ~/.gnupg
   </strong></tt>

   The response:

   <pre>
S.gpg-agent    gpg.conf    pubring.gpg    random_seed    trustdb.gpg
gpg-agent.conf    private-keys-v1.d pubring.gpg~      secring.gpg
   </pre>

   On Windows, if you use “msysGit”, it comes with gpg.
   In Cygwin, get gnupg in Cygwin setup.


   <a name="CreateKey"></a>

   ### Create GPG key #

0. Define git global user settings (if you haven't already):

   <pre><strong>
   git config --global user.name "Wilson Mar"
   git config --global user.email wilsonmar@gmail.com
   </strong></pre>

   NOTE: The gpg program uses this information. 

   This only needs to be done once since it's saved.

0. Verify:

   <tt><strong>
   git config \-\-global -l
   </strong></tt>

   Sample response:

   <pre>
user.name=Wilson Mar
user.email=wilsonmar@gmail.com
user.username=wilsonmar
   </pre>

0. Create a PGP key associated with your global:

   <tt><strong>
   gpg \-\-gen-key
   </strong></tt>

   The response:

   <pre>
gpg (GnuPG/MacGPG2) 2.0.30; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
&nbsp;
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   </pre>

0. Select RSA by typing 1 and pressing Enter. This appears:

   <pre>
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 
   </pre>

0. Press Enter to accept 2048. This appears:

   <pre>
Requested keysize is 2048 bits   
Please specify how long the key should be valid.
         0 = key does not expire
      &LT;n>  = key expires in n days
      &LT;n>w = key expires in n weeks
      &LT;n>m = key expires in n months
      &LT;n>y = key expires in n years
   </pre>

0. Press Enter to accept 0 for a key that lives forever.

   PROTIP: Most enterprises have a Security Standard that defines time frames
   when keys should be refreshed, which are getting shorter over time as computers get faster
   at breaking encryption.

   The response:

   <pre>
   Is this correct? (y/N) 
   </pre>

0. Press y to accept it. You'll then see:

   <pre>
GnuPG needs to construct a user ID to identify your key.
&nbsp;
Real name: 
   </pre>

0. Type your name, press Enter, type your email, press Enter, type a Comment, and press Enter. You'll then see:

   <pre>
Email address: wilsonmar@gmail.com
Comment: Hi                       
You selected this USER-ID:
    "Wilson Mar (Hi) <wilsonmar@gmail.com>"
&nbsp;
Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? 
   </pre>

0. Press O (capital o) to say OK. A pop-up dialog apprears with this message:

   <pre>
You need a Passphrase to protect your secret key.  
   </pre>

0. Open a text file and type your passphrase there,
   the copy the text and paste it in the dialog.

   PROTIP: Copying from a file ensures that typos won't be getting you locked out.

   PROTIP: Enterprises usually have a security standard for strong pass phrases
   such as at least 5 words and contain numbers or special characters.

0. Move your mouse immediately after clicking OK.

   <pre>
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
   </pre>

   Note the key ID:

   <pre>
gpg: key <strong>2E23C648</strong> marked as ultimately trusted
public and secret key created and signed.
&nbsp;
gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   2048R/2E23C648 2016-07-31
      Key fingerprint = 5D40 1E5F 0E5E 75EB 5F99  B96D 4E00 1337 2E23 C648
uid       [ultimate] Wilson Mar <wilsonmar@gmail.com>
sub   2048R/80E44BBF 2016-07-31
   </pre>

   NOTE: The key just created is not stored in your present working directory.

0. List the keys again for the physical location of gpg's keychain:

   <tt><strong>
   gpg \-\-list-keys
   </strong></tt>

   Snippet of a sample response:

   <pre>
/Users/mac/.gnupg/pubring.gpg
-----------------------------
...
pub   2048R/2E23C648 2016-07-31
uid       [ultimate] Wilson Mar <wilsonmar@gmail.com>
...
   </pre>


   ### Configure Git Signing Key #

0. Set a default signing key globally (replacing "2E23C648" with yours):

   <tt><strong>
   git config \-\-global user.signingkey 2E23C648
   </strong></tt>

   No response is returned. So:

0. Verify

   <tt><strong>
   git config \-\-global -l
   </strong></tt>

   Sample response contains:

   <pre>
user.signingkey=2E23C648
   </pre>

Again, all the above is done only once.


<a name="GitAdd"></a>

## Git Add #

0. Make a change to a file in the repo.

   REMEMBER NOTE: When a change is made to a file, that file is removed from Git's stage.

0. Get a list of what has changed:

   <tt><strong>
   git status
   </strong></tt>

0. Add files changed into Git's Stage to make it eligible for Git commit:

   <tt><strong>
   git add . -A
   </strong></tt>

   The `-A` also acts on files which need to be <strong>deleted</strong>,
   which the `-a` option of git commit does not do.


   <a name="GitCommit"></a>

   ## Git commit options #

0. Be aware of all the options to the commit command:

   <tt><strong>
   git commit -h
   </strong></tt>

   The response:

   <pre>
usage: git commit [&LT;options>] [--] &LT;pathspec>...
&nbsp;
    -q, --quiet           suppress summary after successful commit
    -v, --verbose         show diff in commit message template
&nbsp;
Commit message options
    -F, --file &LT;file>     read message from file
    --author &LT;author>     override author for commit
    --date &LT;date>         override date for commit
    -m, --message &LT;message>
                          commit message
    -c, --reedit-message &LT;commit>
                          reuse and edit message from specified commit
    -C, --reuse-message &LT;commit>
                          reuse message from specified commit
    --fixup &LT;commit>      use autosquash formatted message to fixup specified commit
    --squash &LT;commit>     use autosquash formatted message to squash specified commit
    --reset-author        the commit is authored by me now (used with -C/-c/--amend)
    -s, --signoff         add Signed-off-by:
    -t, --template &LT;file>
                          use specified template file
    -e, --edit            force edit of commit
    --cleanup &LT;default>   how to strip spaces and #comments from message
    --status              include status in commit message template
    -S, --gpg-sign[=&LT;key-id>]
                          GPG sign commit
&nbsp;
Commit contents options
    -a, --all             commit all changed files
    -i, --include         add specified files to index for commit
    --interactive         interactively add files
    -p, --patch           interactively add changes
    -o, --only            commit only specified files
    -n, --no-verify       bypass pre-commit hook
    --dry-run             show what would be committed
    --short               show status concisely
    --branch              show branch information
    --porcelain           machine-readable output
    --long                show status in long format (default)
    -z, --null            terminate entries with NUL
    --amend               amend previous commit
    --no-post-rewrite     bypass post-rewrite hook
    -u, --untracked-files[=&LT;mode>]
                          show untracked files, optional modes: all, normal, no. (Default: all)
   </pre>


   ### Sign a Commit #

0. PROTIP: If you're switching among several email/GitHub accounts, in your git command
   specify the signing key for the account being used:

   <pre><strong>
   git commit -a -m "Issue 234 signed" --gpg-sign=2E23C648
   </strong></pre>

   A dialog such as this pops up:
   <amp-img width="519" height="214" alt="git commit signing 20160730-519x214-i11.jpg"
   src="https://cloud.githubusercontent.com/assets/300046/17273912/e9b45d46-5684-11e6-9d61-7c59486bc8a7.jpg">
   </amp-img><br />

0. PROTIP: Check "Save in Keychain" so you don't have to paste in the passphrase every time you commit.

0. Validate the signature of a commit:

   <tt><strong>
   git log \-\-show-signature
   </strong></tt>

   Sample response:

   <pre>
commit 0d04dee2cfd85d5c53e16c6347884691b4b9fb8b
gpg: Signature made Sat Jul 30 18:36:10 2016 MDT using RSA key ID 2E23C648
gpg: Good signature from "Wilson Mar <wilsonmar@gmail.com>" [ultimate]
Author: Wilson Mar <wilsonmar@gmail.com>
Date:   Sat Jul 30 18:35:13 2016 -0600
   </pre>

0. Press q to quit the listing if it extends beyond one screen.


   <a name="GitTag"></a>

## Tag a specific Git commit #

   On local Git:

0. In Terminal, be in your repo's folder.
0. For more information, see <a target="_blank" href="https://git-scm.com/book/en/v2/Git-Basics-Tagging">
   Git docs</a>
   or get help (with one dash) associated with the tag command:

   <tt><strong>
   git tag -help
   </strong></tt>

   The response:

   <pre>
usage: git tag [-a | -s | -u &LT;key-id>] [-f] [-m &LT;msg> | -F &LT;file>] &LT;tagname> [&LT;head>]
   or: git tag -d &LT;tagname>...
   or: git tag -l [-n[&LT;num>]] [--contains &LT;commit>] [--points-at &LT;object>]
      [--format=&LT;format>] [--[no-]merged [&LT;commit>]] [&LT;pattern>...]
   or: git tag -v &LT;tagname>...

    -l, --list            list tag names
    -n[&LT;n>]               print &LT;n> lines of each tag message
    -d, --delete          delete tags
    -v, --verify          verify tags
&nbsp;
Tag creation options
    -a, --annotate        annotated tag, needs a message
    -m, --message &LT;message>
                          tag message
    -F, --file &LT;file>     read message from file
    -s, --sign            annotated and GPG-signed tag
    --cleanup &LT;mode>      how to strip spaces and #comments from message
    -u, --local-user &LT;key-id>
                          use another key to sign the tag
    -f, --force           replace the tag if exists
    --create-reflog       create a reflog
&nbsp;
Tag listing options
    --column[=&LT;style>]    show tag list in columns
    --contains &LT;commit>   print only tags that contain the commit
    --merged &LT;commit>     print only tags that are merged
    --no-merged &LT;commit>  print only tags that are not merged
    --sort &LT;key>          field name to sort on
    --points-at &LT;object>  print only tags of the object
    --format &LT;format>     format to use for the output
   </pre>

   This also appears if there is an error in the command entered.


   ### List commit hashes #

0. PROTIP: Get a list of commits over the last day so you can
   highlight and copy the hash code associated with the commit you want to tag:

   <pre><strong>
   git log --pretty=format:"%h %ad %s" --graph --since=1.days --date=relative
   </strong></pre>

   Sample response:

   <pre>
* 366121d 1 hours ago add git-commits
* 0d04dee 10 hours ago New feature #232
   </pre>

   PROTIP: Define a shell script rather than typing this every time.

0. Add an annotated signed tag to associate with the hash of a commit:

   <pre><strong>
   git tag -a v01.04 366121d -m "my version 01.04" -s -q
   </strong></pre>

   PROTIP: Come up with a standard on your team
   on whether to zero-pad leading zeroes for sorting.
   Git and GitHub are smart enough to sort what comes before and after dots separately.
   But other programs may not be that smart.
   
   The "-q" is added to quiet the summary signing response, such as this example:

   <pre>
You need a passphrase to unlock the secret key for
user: "Wilson Mar <wilsonmar@gmail.com>"
2048-bit RSA key, ID 2E23C648, created 2016-07-31
   </pre>

0. List tags (with the command in the singular):

   <tt><strong>
   git tag
   </strong></tt>


   ### Backup and Share Public key #

   In order for others to verify your signature:

0. Be at the same directory (as before).

0. Export your public key to the present working directory (a GitHub repository folder)
   as a sharable file (replacing the email address in this example):

   <tt><strong>
   gpg \-\-armor \-\-export wilsonmar@gmail.com > wilsonmar@gmail.com.pub
   </strong></tt>

0. Optionally, view the file (substituting your own file's name):

   <tt><strong>
   cat wilsonmar@gmail.com.pub
   </strong></tt>

   NOTE: The file contents begins with "-----BEGIN PGP PUBLIC KEY BLOCK-----".

   You can email or even post this on a public website.

0. Better yet, store the key as a <strong>Git object</strong> to hold key data.

   <tt><strong>
   git hash-object -w wilsonmar@gmail.com.pub
   </strong></tt>

0. Copy the response (a hash) and paste it at the end of this command:

   <tt><strong>
   git tag username-pub-rsa 7ed5bd7f134819ea5a3d90a1d5ec7f83a7545381
   </strong></tt>

0. Copy the response and paste it to the end of this command:

   <tt><strong>
   git tag wilsonmar@gmail.com.pub-rsa 7ed5bd7f134819ea5a3d90a1d5ec7f83a7545381
   </strong></tt>

   No response is returned.

0. Verify the tags now:

   <tt><strong>
   git tag 
   </strong></tt>



   <a name="GitPush"></a>

   ### Git Push code #

0. List locations to push:

   <tt><strong>
   git remote -v
   </strong></tt>

   Sample response:

   <pre>
origin   https://github.com/wilsonmar/wilsonmar.github.io.git (fetch)
origin   https://github.com/wilsonmar/wilsonmar.github.io.git (push)
   </pre>

0. Transfer all commits to the remote server that are not already there:

   <tt><strong>
   git push origin 
   </strong></tt>

   NOTE: "origin" does not need to be specified because it's the default.

   Sample response:

   <pre>
   </pre>

   ### Git Push tags #

   NOTE: A separate push command is needed to push tags up to GitHub.

0. Transfer all tags to the remote server (GitHub):

   <tt><strong>
   git push origin \-\-tags
   </strong></tt>

   CAUTION: A separate request is necessary to push tags than code.



## Extract and Verify tag #
   
After signed and tagged commits are pushed to GitHub,
someone can pull them locally.

0. Extract the key from a tag and 
   add it to their keyring for tag verification:

   <tt><strong>
   git cat-file blob username-pub-rsa | gpg \-\-import
   </strong>

0. To verify a tag:

   <tt><strong>
   git tag -v v01.04
   </strong>

   A sample response:

   <pre>
object 47337b453001a963b260df64848c8602cc61e304
type commit
tag v01.04
tagger Wilson Mar <wilsonmar@gmail.com> 1469956897 -0600
&nbsp;
my version 01.04
gpg: Signature made Sun Jul 31 03:21:38 2016 MDT using RSA key ID 2E23C648
gpg: Good signature from "Wilson Mar <wilsonmar@gmail.com>" [ultimate]
   </pre>


## Remove tags #

0. Optionally, to remove a tag object locally:

   <tt><strong>
   git tag -d wilsonmar@gmail.com.pub-rsa
   </strong></tt>

   Sample response:

   <pre>
   Deleted tag 'wilsonmar@gmail.com.pub-rsa' (was 7ed5bd7)
   </pre>

0. Optionally, to remove the tag on GitHub:

   <tt><strong>
   git push origin :refs/tags/wilsonmar@gmail.com.pub-rsa
   </strong></tt>


## More Resources #

Other blogs about this topic:

   * http://candidtim.github.io/git/2012/11/27/git-signed-tags.html
   * https://ssd.eff.org/en/module/how-use-pgp-mac-os-x
   * https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work
   * https://ariejan.net/2014/06/04/gpg-sign-your-git-commits/
   <br />
