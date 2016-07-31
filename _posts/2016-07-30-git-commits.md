---
layout: post
title: "Git Commits with a Tag and Signature"
excerpt: "Kinda like at a book signing party"
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

This article describes how you can sign and tag commits in Git.

{% include _intro.html %}

<a name="SignCommits"></a>

## Setup for Signing #

Some teams request that commits for release be <strong>digitally signed</strong>
to provide "non-repudiation" (make "I didn't do it" not possible).


## Install GPGTools #

On local Git:

0. On a Mac, install GPGTools Suite from<br />
   <a target="_blank" href="https://gpgtools.org/">
   https://www.gpgtools.org</a> 

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
######################################################                    75.2%
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

   On Windows, if you use “msysGit”, it comes with gpg.
   In Cygwin, get gnupg in Cygwin setup.

   NOTE: Instructions are at 
   https://github.com/caskroom/homebrew-cask/blob/master/Casks/gpgtools.rb

0. Validate install:

   <tt><strong>
   gpg --list-keys
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


   ### Create GPG key #

0. Be at a folder where you've already defined git global user settings
   such as these:

   <tt><strong>
   git config --global user.name "Wilson Mar"<br />
   git config --global user.email wilsonmar@gmail.com
   </strong></tt>

   NOTE: GPG uses this information. 

0. Verify:

   <tt><strong>
   git config --global -l
   </strong></tt>

   Sample response:

   <pre>
user.name=Wilson Mar
user.email=wilsonmar@gmail.com
user.username=wilsonmar
   </pre>

0. Create your PGP key:

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

   PROTIP: Most enterprises have a Security Standard that defines such time frames.

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

   PROTIP: This ensures that you'll avoid typos.

   PROTIP: Here again, enterprises have a security standard for pass phrases
   such as at least 5 words and contain numbers

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

   ### Back up your PGP key #

   NOTE: The key just created is not stored in your present working directory.

0. List the keys again:

   <tt><strong>
   gpg --list-keys
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


   ### Configure Git #

0. Set a default signing key globally (replacing "2E23C648" with yours):

   <tt><strong>
   git config --global user.signingkey 2E23C648
   </strong></tt>

   No response is returned. So:

0. Verify

   <tt><strong>
   git config --global -l
   </strong></tt>

   Sample response contains:

   <pre>
user.signingkey=2E23C648
   </pre>


   ### Sign a Commit #

0. Commit with a signature using the default key:

   <tt><strong>
   git commit -a -m "Cool new feature" -s
   </strong></tt>

   Alternately, if you're switching among several email/GitHub accounts,
   specify the key for the account being used:

   <tt><strong>
   git commit -a -m "New feature signed" --gpg-sign=2E23C648
   </strong></tt>

   A dialog such as this pops up:
   <amp-img width="519" height="214" alt="git commit signing 20160730-519x214-i11.jpg"
   src="https://cloud.githubusercontent.com/assets/300046/17273912/e9b45d46-5684-11e6-9d61-7c59486bc8a7.jpg">
   </amp-img>
   <br /><br />

0. Check "Save in keychain" if you don't want to have to paste in the passphrase every time you commit.

0. Validate the signature of a commit:

   <tt><strong>
   git log --show-signature
   </strong></tt>

   Sample response:

   <pre>
commit 0d04dee2cfd85d5c53e16c6347884691b4b9fb8b
gpg: Signature made Sat Jul 30 18:36:10 2016 MDT using RSA key ID 2E23C648
gpg: Good signature from "Wilson Mar <wilsonmar@gmail.com>" [ultimate]
Author: Wilson Mar <wilsonmar@gmail.com>
Date:   Sat Jul 30 18:35:13 2016 -0600
   </pre>

   Press q to quit the listing if it extends beyond one screen.

   Blogs about this topic:

   * http://candidtim.github.io/git/2012/11/27/git-signed-tags.html
   * https://ssd.eff.org/en/module/how-use-pgp-mac-os-x
   * https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work
   * https://ariejan.net/2014/06/04/gpg-sign-your-git-commits/


<a name="TagInGitHub"></a>

## Tag a specific Git commit manually #

On local Git:

0. In Terminal, be in your repo's folder.
0. For more information, see https://git-scm.com/book/en/v2/Git-Basics-Tagging
0. List tags (in the singular):

   <tt><strong>
   git tag
   </strong></tt>

0. Add an annotated tag on the current commit:

   <tt><strong>
   git tag -s 1.2.3 -a v01.04 -m "my version 01.04"
   </strong></tt>

   PROTIP: Come up with a standard on your team
   on whether to zero-pad leading zeroes for sorting.
   Git and GitHub are smart enough to sort what comes before and after dots separately.
   But other programs may not be that smart.
   
   Alternately, add an annotated tag on a previous commit hash:

   <tt><strong>
   git tag -a v1.2 9fceb02
   </strong></tt>

   ## Commit with a tag AND a signature # 

   <tt><strong>
   git tag -a v1.2 9fceb02 -s
   </strong></tt>

0. View

   <tt><strong>
   git tag -v
   </strong></tt>


0. Transfer all of tags to the remote server that are not already there:

   <tt><strong>
   git push origin --tags
   </strong></tt>

   CAUTION: A separate request is necessary to push tags than code.


## Backup and Share Public key #

In order for others to verify your signature:

0. Change directory where you want to store your public key.

0. Export your public key to the present working directory (a GitHub repository folder)
   as a sharable file (replacing the email address in this example):

   <tt><strong>
   gpg --armor --export wilsonmar@gmail.com > wilsonmar@gmail.com.pub
   </strong></tt>

0. Optionally, view the file

   <tt><strong>
   cat wilsonmar@gmail.com.pub
   </strong></tt>

   NOTE: The file contents begins with "-----BEGIN PGP PUBLIC KEY BLOCK-----".

   You can email or even post this on a public website.

0. Better yet, store the key as a Git object, and share it on a remote. This object will only hold a key data, and not the file name, or a commit information.

   <tt><strong>
   git hash-object -w wilsonmar@gmail.com.pub
   </strong></tt>

0. Copy the response and paste it:

   <tt><strong>
   git tag username-pub-rsa 7ed5bd7f134819ea5a3d90a1d5ec7f83a7545381<br />
   git push --tags
   </strong></tt>

0. Copy the response and paste it to the end of this command:

   <tt><strong>
   git tag wilsonmar@gmail.com.pub-rsa 7ed5bd7f134819ea5a3d90a1d5ec7f83a7545381
   </strong></tt>

   No response is returned.

0. Verify the tags:

   <tt><strong>
   git tag 
   </strong></tt>

0. Anyone can extract the tag and add it to their keyring for use in tag verification:

   <tt><strong>
   git cat-file blob username-pub-rsa | gpg --import
   </strong>

0. To verify a tag:

   <tt><strong>
   git tag -v v2.5.1
   </strong>




## Remove tags #

0. Optionally, to remove the tag locally:

   <tt><strong>
   git tag -d wilsonmar@gmail.com.pub-rsa
   </strong></tt>

0. Optionally, to remove the tag on GitHub:

   <tt><strong>
   git push origin :refs/tags/wilsonmar@gmail.com.pub-rsa
   </strong></tt>


