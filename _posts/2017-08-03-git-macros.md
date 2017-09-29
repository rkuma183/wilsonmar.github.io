---
layout: post
title: "Git Macros"
excerpt: "A few swipes of your hand and it's done for you"
tags: [git, commands, utilities]
shorturl: "https://git.io/"
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

This is a hands-on tutorial on how you can save time working with Git and GitHub. The steps are intended for "newbies" new to the operating system.

## Default Terminal on MacOS

To open the Terminal program that comes with MacOS:

0. Click the blue Finder icon at the left side of the Launch bar at the bottom of the screen.
0. Click Go on the menu or press at the same time shift + command + A keys.
0. Scroll down to click the click the <strong>Utilities</strong> folder.

0. PROTIP: Drag the Terminal icon and drop it on the Launchbar so it's easier to find in the future.

0. Click the Terminal icon to open it.

0. Press command + N to open using the Basic (default) Terminal settings (white background).

   PROTIP: Alternately, enjoy different colors by clicking menu item <strong>Shell</strong> then <strong>New Window</strong> and selecting one of the options listed:

   ![macos-terminal-shells-688x443-63273](https://user-images.githubusercontent.com/300046/31025658-992d58f2-a500-11e7-82a5-878017f8f48f.jpg)

   * Grass (dark green) I cd to my public website posts that go to GitHub
   * Ocean (dark blue)  I cd to my private notes repository
   * Red Sands I cd to the code repository I'm working on
   * Homebrew (green font on black) I cd to the server I'm working on
   <br /><br />

## Alt Terminal on MacOS

PROTIP: Alternately, some prefer to use a 3rd-party Terminal program which has additional features.

1. Read about features not in the default program:

   <a target="_blank" href="https://www.iterm2.com/features.html">
   https://www.iterm2.com/features.html</a>

   To download and use it:

0. Open a Terminal (as shown above).
0. Install Homebrew.
0. Use Homebrew to download

   <tt><strong>
   brew install -g iterm2
   </strong></tt>

0. Open a Finder and Go to Applications. Scroll to click iTerm2.

0. PROTIP: Drag the Terminal2 icon and drop it on the Launchbar so it's easier to find in the future.

0. Read its documentation:

   <a target="_blank" href="https://www.iterm2.com/documentation.html">
   https://www.iterm2.com/documentation.html</a>


## Edit .bash_profile on Mac

0. Install a text editor you want to use.
0. Open a Terminal window.

0. If you have a new MacOS machine, create a file on your Home folder that MacOS executes before opening any Terminal window:

   <pre><strong>echo "#">>~/.bash_profile
   </strong></pre>

   * `~` designates the home folder for you account.
   * `"#">>` adds a comment (#) to the bottom of the file in case the file has already been created, rather than wiping out the file.
   * `.` in front of a file (in \*nix systems such as Mac) denotes a hidden file.

0. In a Terminal, open to edit. Different editors have different commands. In this example, the Nano text editor is being used because Nano is built into MacOS:

   <tt><strong>nano ~/.bash_profile
   </strong></tt>


   ### Git shortcuts on MacOS

   With the `~/.bash_profile` file in an editor:

0. Highlight these lines, then press command+C to copy it your machine's (invisible) Clipboard:

   <a name="Aliases"></a>

   <pre>
alias bp='subl ~/.bash_profile'
alias rs='exec -l $SHELL'
alias ll='ls -lri'
alias dir='ls -alr'
&nbsp;
alias gs='cd ~/gits/wilsonmar/wilsonmar.github.io;git status'
alias gf='cd ~/gits/wilsonmar/futures;git status'
&nbsp;
alias gb='git branch -avv'
alias gl='clear;git status;git log --pretty=format:"%h %s %ad" --graph --since=1.days --date=relative;git log --show-signature -n 1'
alias gbs='git status;git add . -A;git commit -m"Update";git push'
function gas() { git status ;  git add . -A ; git commit -m "$1" ; git push; }
alias bs='bundle exec jekyll serve --config _config.yml,_config_dev.yml'
&nbsp;
alias gcs='cd ~/.google-cloud-sdk'
alias myip="ifconfig en0 | grep inet | grep -v inet6 | cut -d ' ' -f2"
alias aih='iothub-explorer'
   </pre>

   ### Switch programs

0. Press command+Tab repeatedly until you see the icon for the text editor.

0. In the text editor, click your mouse at the bottom of the file.

0. Press command + V to paste from the Clipboard.

0. Save the file using the command expected by the editor you're using.

   For Nano, press <strong>control + W</strong>.


   ### Update Terminal

0. Open a new Terminal instance, which loads the new version of bash_profile.

   Alternately, if you want to stay in the same terminal but use a new bash_profile:

   <tt><strong>source ~/.bash_profile
   </strong></tt>
   

   ### Clone my repo

   Some of the <a href="#Aliases">aliases defined above</a> need a GitHub repository to work with. So you're welcome to my git-utilities repo, which has some commands you may like.

   PROTIP: Setup a container directory to house (group together) repositories you clone from GitHub. This is because cloning creates only the repository name and not the user. Although the author can be found with a `git remote -v` command, you may want a way to put several repos for the same folder together, or additional related files such as pdf's and website links.

0. In a Terminal window:
0. Create a folder to house your development projects:

   <tt><strong>mkdir ~/gits && cd gits
   </strong></tt>

   PROTIP: Instead of `gits`, some use `dev` or `Sites` or `Projects` to house related software development work, separate from other folders such as "Desktop" and "Document" under your MacOS user account folder.

   Here you can put various files related to Git, such as tutorial PDFs. However, some prefer to put such files in the `.git` folder that the Git client installer creates under your user home folder. That is a different folder than the .git folder created for each repository cloned.

0. PROTIP: Create a folder representing the GitHub account to house new websites to be created (substituting "wilsonmar" with your GitHub user name):

   <tt><strong>mkdir wilsonmar
   </strong></tt>

0. Set permissions for your MacOS user to write to the new folder. The $USER subsitute your own user name:

   <tt><strong>
   sudo chown -R $USER wilsonmar<br />
   sudo chmod -R +rwx wilsonmar
   </strong></tt>

0. Type in your password when prompted.

0. Navigate into the containing folder where a new directory will be automatically built by git clone commands:

   <tt><strong>cd ~/gits/wilsonmar
   </strong></tt>


   ### Fork and Clone git-utilities

0. Install a Git client if you have not already.
0. Open another Terminal instance.
0. Clone:

   <tt><strong>git clone https://github.com/wilsonmar/git-utilities \-\-depth=1
   </strong></tt>

   The `depth=1` argument specifies to obtain only the latest commits for each object, thus not obtaining prior history.

   Alternately, if you intend on making changes, on GitHub Fork the repo to your own account, then clone the repo under your own account.

0. Navigate into the new repo:

   <tt><strong>cd git-utilities
   </strong></tt>


   ### Try it

   Try the <a href="#Aliases">aliases defined above</a>.

   <a name="gs"></a>

0. Instead of typing out `git status`, type:

   <tt><strong>gs
   </strong></tt>

   This invokes the alias defined:

   <pre>
alias gs='git status'
   </pre>


   <a name="gs"></a>

0. Instead of typing out `git branch -avv`, type:

   <tt><strong>gb
   </strong></tt>

   This invokes the alias defined:

   <pre>
alias gb='git branch -avv'
   </pre>



   <a name="gl"></a>

0. Instead of typing out `git log`, type:

   <tt><strong>gl
   </strong></tt>

   This invokes the alias defined:

   <pre>
alias gl='clear;git status;git log --pretty=format:"%h %s %ad" --graph --since=1.days --date=relative;git log --show-signature -n 1'
   </pre>



   <a name="gbs"></a>

0. Instead of typing out `git add . -A;git commit -m"Update";git push`, type:

   <tt><strong>gbs
   </strong></tt>

   This invokes the alias defined:

   <pre>
alias gbs='git status;git add . -A;git commit -m"Update";git push'
   </pre>




   <a name="gas"></a>

0. Instead of typing out `git add` and `git commit` for a single commit, type:

   <tt><strong>gas "Closes JIRA #231"
   </strong></tt>

   This invokes the alias defined:

   <pre>
function gas() { git status ;  git add . -A ; git commit -m "$1" ; git push; }
   </pre>

   PROTIP: Time saved using this can be huge because this reduces the "friction" to make small incremental changes.



   ### Edit the aliases
   
   You can delete the aliases you want or add others, then save the file again.

0. Switch back and forth between the text editor and
0. Remember to source the file or open a new window.

   <a name="gas"></a>

0. Instead of typing out `source ~/.bash_profile`, type:

   <tt><strong>bp
   </strong></tt>

   This invokes the alias defined:

   <pre>
alias bs='source ~/.bash_profile'
   </pre>


   ### Backup!

0. When you're done, save the file again and exit the program using the command expected by the editor you're using.

   For Nano, press <strong>control + X</strong> to exit the program.

0. PROTIP: So that you can recover quickly in case your laptop is no longer available, copy the `~/.bash_profile` file to an off-site backup location such as drive.google.com, in a folder called "mac-setup" or whatever you prefer.


## on Windows

See https://superuser.com/questions/560519/how-to-set-an-alias-in-windows-command-line

https://technet.microsoft.com/en-us/library/bb490894.aspx

doskey macroName=macroDefinition

Windows Macro parameters are referenced in the definition via $ prefixed positions: $1 through $9 and $* for all.

   <tt><strong>set "cdMe=cd a_very_long_path"
   </strong></tt>

Usage (from command line or script)

   <tt><strong>%cdMe%
   </strong></tt>


## More #

This is one of a series on Git and GitHub:

{% include git_links.html %}
